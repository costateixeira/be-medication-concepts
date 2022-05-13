import pandas as pd
import yaml
import json
import os
import subprocess
import os
import requests
import hashlib
import logging

logging.basicConfig(
    filename="app.log", filemode="w+", format="%(asctime)s: %(levelname)s - %(message)s"
)


def create_yaml(x):
    """
    create yaml file from dataframe (CSV)
    """
    doc = {"type": "Tree", "rows": [{"label": "CSV", "rows": []}]}

    for col in x.columns:
        l_id = col
        doc["rows"][0]["rows"].append({"label": col, "id": l_id})

    doc["rowHeight"] = 25
    doc["headerHeight"] = 50
    doc["headerText"] = DATA_FILE.split(".")[0]
    doc["id"] = DATA_FILE.split("/")[-1].split(".")[0].replace(" ", "_")
    color = "#34ebcf"
    doc["attrs"] = {"header": {"fill": color}}
    doc2 = [doc]
    file = DATA_FILE.split(".")
    ff2 = open(file[0] + ".yaml", "w+")
    ffjson = open(file[0] + ".json", "w+")
    json.dump(doc2, ffjson)
    yaml.dump(doc2, ff2, default_flow_style=False, sort_keys=False, indent=2)
    return "ok"


def save_files(folder, file_name, validation, artifact, ig=None, save_to_file=True):
    if validation not in ["resource", "fhirvalidator"]:
        raise ValueError("validation must be resource or fhirvalidator")
    if save_to_file:
        #  ffjson = open(file_name, "w+")
        with open(folder + "/" + file_name, "w+") as f:
            f.write(json.dumps(artifact, indent=4))
    # print( os.path.exists(file_name))
    if validation == "fhirvalidator":
        outcome = validate_artifact(folder + "/" + file_name, ig)
        return outcome
    if validation == "resource":
        try:
            fhirres = MedicationKnowledge.parse_obj(artifact)
            return {"status": "ok", "message": "no issue"}
        except Exception as err:
            logging.warning(
                file_name + ": ERROR on creating resource basis:" + " " + str(err)
            )
            return {"status": "error", "message": str(err)}
    return None
