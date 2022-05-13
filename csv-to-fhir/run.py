import pandas as pd
import yaml
import json
import os
import subprocess
import os
import requests
import hashlib
from static_functions import *
from functions import *
from fhir.resources.medicationknowledge import MedicationKnowledge

DATA_FILE = "export_basis_AMPs_aangepast_20220425.xlsx"
OUT_FOLDER_VMP = "output-vmp"
OUT_FOLDER_MP = "output-MP"
OUT_FOLDER_PMP = "output-PMP"
OUT_FOLDER_VMP_PROFILE = "output-vmp-profile"
DATA_FILE2 = "export_basis_AMPPs_aangepast_20220425.xlsx"
REPORT_FILE = "example-report-ampp.csv"
HOST = "http://185.11.167.36:8080/matchbox/fhir/"
profile = "https://costateixeira.github.io/be-medication-concepts/StructureDefinition/PharmaceuticalProduct"
ig = "https://build.fhir.org/ig/costateixeira/be-medication-concepts"


data = pd.read_excel(io=DATA_FILE, sheet_name="Blad1")
data2 = pd.read_excel(io=DATA_FILE2, sheet_name="Blad1")

# Create folder if they do not exist
if not os.path.exists(OUT_FOLDER_VMP):
    os.makedirs(OUT_FOLDER_VMP)
if not os.path.exists(OUT_FOLDER_MP):
    os.makedirs(OUT_FOLDER_MP)
if not os.path.exists(OUT_FOLDER_PMP):
    os.makedirs(OUT_FOLDER_PMP)
if not os.path.exists(OUT_FOLDER_VMP_PROFILE):
    os.makedirs(OUT_FOLDER_VMP_PROFILE)

# DEV applies function create_pharm_prod_profile from functions.py to the all data object (dataframe)
data.apply(
    create_pharmprod_profile,
    axis=1,
    folder=OUT_FOLDER_VMP_PROFILE,
    validation=False,
    ig=ig,
    profile=profile,
)

data[["validation_status", "validation_message"]] = data.apply(
    create_pharmprod_profile,
    axis=1,
    folder=OUT_FOLDER_VMP_PROFILE,
    validation=False,
    ig=ig,
    profile=profile,
    result_type="expand",
)
data.to_csv("result_of_validation.csv")

# DEV: then goes to the folder and sends all the files to a server.
send_to_server(HOST, OUT_FOLDER_VMP_PROFILE)
