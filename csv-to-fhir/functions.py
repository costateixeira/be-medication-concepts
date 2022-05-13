import pandas as pd
import yaml
import json
import os
import subprocess
import os
import requests
import hashlib
import logging
from static_functions import *
from functions import *
from fhir.resources.medicationknowledge import MedicationKnowledge

logging.basicConfig(
    filename="app.log", filemode="w", format="%(asctime)s: %(levelname)s - %(message)s"
)
logging.warning("This will get logged to a file")


def create_substance(x):
    sbs = {"resourceType": "MedicationKnowledge"}

    # sbs["identifier"]=[]
    # sbs["identifier"].append({"system":"http://www.belgium.be/susbtance","value":int(x["ntlidentifier"])})
    sbs["status"] = "active"
    sbs["domain"] = "human"
    sbs["name"] = {}
    sbs["name"]["productName"] = x["basis"]
    sbs["name"]["type"] = "generic"
    sbs["granularity"] = "susbtance"

    # sbs["drugType"]= molecule_type if "molecule_type" in locals() else None
    if not pd.isna(x["atc"]):
        sbs["classification"] = []
        sbs["classification"].append(
            {"system": "http://who.org/ATC", "value": x["atc"]}
        )
    # if "indication" in locals() and indication is not None:
    #     sbs["classification"].append({"system":"http://who.org/indication","value":indication})

    # time.sleep(0.1)
    print(sbs)
    return sbs


def validate_artifact(art, ig=None):
    """
    for all ok:
        grep this 'Success: 0 errors, 0 warnings, 1 notes
                        Information: All OK'
    for errors:
        the output goes to expcetion and returns similar to:
        *FAILURE*: 1 errors, 1 warnings, 1 notes\n
        Error @ MedicationKnowledge.intendedRoute[0].coding[0].code (line 1, col550):
        Error parsing JSON: the primitive value must be a string\n  Information @ MedicationKnowledge.meta.profile[0] (line 1, col137):
        Canonical URL 'http://hl7.org/fhir/us/example/StructureDefinition/PharmaceuticalProduct' does not resolve\n  Warning @ MedicationKnowledge.meta.profile[0] (line 1, col2): Profile reference 'http://hl7.org/fhir/us/example/StructureDefinition/PharmaceuticalProduct' has not been checked because it is unknown, and fetching it resulted in the error org.hl7.fhir.r4.utils.client.EFhirClientException: Error parsing response message: This does not appear to be a FHIR resource (wrong namespace 'http://www.w3.org/1999/xhtml') (@ /)\n"
    """
    result = {}
    command = [
        "java",
        "-jar",
        "/Users/joaoalmeida/Desktop/transformaçao-meds-be/validator_cli.jar",
        "/Users/joaoalmeida/Desktop/transformaçao-meds-be/" + art,
    ]
    if ig:
        command = [
            "java",
            "-jar",
            "/Users/joaoalmeida/Desktop/transformaçao-meds-be/validator_cli.jar",
            "/Users/joaoalmeida/Desktop/transformaçao-meds-be/" + art,
            "-ig",
            ig,
        ]
    print(command)
    try:
        output = subprocess.check_output(command, stderr=subprocess.PIPE)
        nopt = output.decode("UTF-8")
        #   print(nopt)
        result["status"] = "OK"

        result["message"] = nopt.split("Success: ")[-1]
    except subprocess.CalledProcessError as e:
        # print("command '{}' return with error (code {}): {}".format(e.cmd, e.returncode, e.output))
        nopt = e.output.decode("UTF-8").split("FAILURE*: ")[-1]
        # print(e.output.decode("UTF-8"))
        result["status"] = "NOK"
        result["message"] = nopt
    # print(e.output)
    return result


def create_pharmprod(data, folder=None, validation=False, save_to_file=True):
    # print(data)
    artifact = {}
    artifact["resourceType"] = "MedicationKnowledge"

    artifact["status"] = "active"
    artifact["synonym"] = [data["vmp_name"]]

    artifact["ingredient"] = []
    denominator = {"value": 1}  # must have 1 for ratio...
    ingredient = {}

    ingredient["itemCodeableConcept"] = {
        "coding": [{"display": data["basis_substance"]}]
    }
    ingredient["isActive"] = True
    # print(data["strenght_nominator_value_low_limit"],data["strength_nominator_unit"])
    numerator = {
        "value": data["strenght_nominator_value_low_limit"],
        "unit": data["strength_nominator_unit"],
    }
    strength = {"numerator": numerator}

    if data["strenght_denominator_value_low_limit"] == "":
        # print(data["strenght_denominator_value_low_limit"])
        denominator = {
            "value": int(data["strenght_denominator_value_low_limit"]),
            "unit": data["strength_denominator_unit"],
        }
    strength["denominator"] = denominator
    ingredient["strength"] = strength
    artifact["ingredient"].append(ingredient)

    artifact["doseForm"] = {  ##create link with snomed or idmp
        "coding": [
            {
                "code": str(data["edqmid"]),
                "system": "http://standardterms.edqm.eu",
                "display": data["edqmform"],
            }
        ]
    }
    route = []

    route.append(
        {
            "coding": [
                {
                    "code": str(data["edqm_roa_id"]),
                    "system": "http://standardterms.edqm.eu",
                    "display": data["roa_en"],
                }
            ]
        }
    )
    artifact["intendedRoute"] = route
    file_name = (
        str(data["vmp_name"])
        .replace("/", ".")
        .replace(".", "")
        .replace("(", "")
        .replace(")", "")
        .replace(" ", "_")
        + ".json"
    )

    outcome = save_files(
        folder, file_name, validation, artifact, save_to_file=save_to_file
    )
    if outcome:
        return outcome["status"], outcome["message"]

    return artifact


def create_medicinal_product(data, folder=None, validation=False, save_to_file=True):
    artifact = create_pharmprod(data, save_to_file=False)
    artifact["synonym"] = [data["medicinal_product_name"]]
    artifact["code"] = {
        "coding": [
            {
                "code": str(data["samv2_amp_id"]),
                "system": "http://www.belgium.be/medicinalproduct",
            }
        ]
    }
    file_name = (
        str(data["medicinal_product_name"])
        .replace("/", ".")
        .replace(".", "")
        .replace("(", "")
        .replace(")", "")
        .replace(" ", "_")
        + ".json"
    )
    outcome = save_files(
        folder, file_name, validation, artifact, save_to_file=save_to_file
    )
    if outcome:
        return outcome["status"], outcome["message"]

    return artifact


def create_packaged_medicinal_product(
    data, folder=None, validation=False, save_to_file=True
):
    artifact = create_medicinal_product(data, save_to_file=False)
    artifact["synonym"] = [data["amppname"]]
    artifact["code"] = {
        "coding": [
            {
                "code": str(data["cnk_pub"]),
                "system": "http://www.belgium.be/packagedmedicinalproduct",
            }
        ]
    }
    file_name = (
        str(data["amppname"])
        .replace("/", ".")
        .replace(".", "")
        .replace("(", "")
        .replace(")", "")
        .replace(" ", "_")
        + ".json"
    )
    outcome = save_files(
        folder, file_name, validation, artifact, save_to_file=save_to_file
    )
    print(outcome)
    if outcome:
        return outcome["status"], outcome["message"]
    return artifact


def create_pharmprod_profile(
    data,
    folder=None,
    validation=False,
    ig=None,
    profile="https://costateixeira.github.io/be-medication-concepts/StructureDefinition/PharmaceuticalProduct",
    save_to_file=True,
):
    # print(data)
    artifact = {}
    artifact["resourceType"] = "MedicationKnowledge"
    artifact["meta"] = {"profile": [profile]}
    artifact["code"] = {"coding": [], "text": data["vmp_name"]}
    artifact["code"]["coding"].append(
        {"code": str(1200), "system": "http://www.belgium.be/pharmaceutical-ids"}
    )
    artifact["code"]["coding"].append(
        {
            "code": str(1300),
            "system": "http://www.edqm.eu/pharmaceutical-product-identifier-type",
        }
    )

    artifact["status"] = "active"

    artifact["synonym"] = [data["vmp_name"]]
    artifact["productType"] = [
        {
            "coding": [
                {
                    "system": "https://fhirbender.github.io/mpd-box/CodeSystem/prod-type-cs",
                    "code": "BE_VMP",
                }
            ]
        }
    ]
    artifact["ingredient"] = []
    denominator = {"value": 1}  # must have 1 for ratio...
    ingredient = {}

    ingredient["itemCodeableConcept"] = {
        "coding": [{"display": data["basis_substance"]}]
    }
    ingredient["isActive"] = True
    # print(data["strenght_nominator_value_low_limit"],data["strength_nominator_unit"])
    numerator = {
        "value": data["strenght_nominator_value_low_limit"],
        "unit": data["strength_nominator_unit"],
    }
    strength = {"numerator": numerator}

    if data["strenght_denominator_value_low_limit"] == "":
        # print(data["strenght_denominator_value_low_limit"])
        denominator = {
            "value": int(data["strenght_denominator_value_low_limit"]),
            "unit": data["strength_denominator_unit"],
        }
    strength["denominator"] = denominator
    ingredient["strength"] = strength
    artifact["ingredient"].append(ingredient)

    artifact["doseForm"] = {"coding": []}  ##create link with snomed or idmp

    artifact["doseForm"]["coding"].append(
        {
            "code": str(data["edqmid"]),
            "system": "http://www.edqm.eu/dose-forms",
            "display": data["edqmform"],
        }
    )

    artifact["doseForm"]["coding"].append(
        {
            "code": "BEXXXXX",
            "system": "http://www.belgium.be/dose-forms",
            "display": data["formname"],
        }
    )
    route = []

    route.append(
        {
            "coding": [
                {
                    "code": str(data["edqm_roa_id"]),
                    "system": "http://www.edqm.eu/routes",
                    "display": data["roa_en"],
                }
            ]
        }
    )
    route.append(
        {
            "coding": [
                {
                    "code": "BEROUTEXXXX",
                    "system": "http://www.belgium.be/routes",
                    "display": data["edqm_roa_nl"],
                }
            ]
        }
    )

    artifact["intendedRoute"] = route
    file_name = (
        str(data["vmp_name"])
        .replace("/", ".")
        .replace(".", "")
        .replace("(", "")
        .replace(")", "")
        .replace(" ", "_")
        + ".json"
    )
    try:
        fhirres = MedicationKnowledge.parse_obj(artifact)
        return {"status": "ok", "message": "no issue"}
    except Exception as err:
        logging.warning(
            file_name + ": ERROR on creating resource basis:" + " " + str(err)
        )
        return {"status": "error", "message": str(err)}
    outcome = save_files(
        folder, file_name, validation, artifact, ig=ig, save_to_file=save_to_file
    )

    if outcome:
        # print(outcome)
        return outcome["status"], outcome["message"]

    return artifact


def send_to_server(HOST, d):
    headers = {"Content-type": "application/fhir+json"}

    for path in os.listdir(d):
        full_path = os.path.join(d, path)
        if os.path.isfile(full_path):
            with open(full_path, "r") as f:
                #   print(full_path)
                data = json.loads(f.read())
                # print(data)
                id_ = data["synonym"][0]
                # Hash a single string with hashlib.sha256

                try:
                    hashed_string = hashlib.sha256(id_.encode("utf-8")).hexdigest()
                except:
                    logging.warning(
                        full_path + ": ERROR on creating hash string:" + " " + str(id_)
                    )

                data["id"] = hashed_string

                try:
                    r = requests.put(
                        HOST + "MedicationKnowledge" + "/" + str(hashed_string),
                        json=data,
                        headers=headers,
                    )
                    logging.info(full_path + ": Ok")
                #  print(r.status_code, r.reason)
                # print(r.text)
                except Exception as Err:
                    logging.warning(
                        full_path + ": ERROR on sending to server :" + " " + str(Err)
                    )
    return "ok"
