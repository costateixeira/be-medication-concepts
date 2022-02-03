// Define a local code system
CodeSystem: BeMedicineCodeSystem
Id:         beMedCS
Title: "Drug Code System"
Description: "Codes for belgian medicine level "
// You can choose any url, or use the default, but in this case we want the URL to be in the HL7 namespace
// Spacing layout over three lines per term is optional, for clarity
// The definition (second text string) is optional
* #VMPP
    "Virtual Medicinal Packaged Product"
* #VMP
    "Virtual Medicinal Product"
* #VMPG
    "Virtual Medicinal Product Group"
* #AMPP
    "Actual Medicine Packaged Product"
* #AMP
    "Actual Medicinal Product"

Alias: medCS = http://hl7.org/fhir/us/example/CodeSystem/mediCS


// Define a local code system
CodeSystem: BeRoleIngredinentCS
Id:         be-rolemed-cs
Title: "Role Code System"
Description: "Codes for role in ingredient level "

* #AP
    "Active Principle"
* #NAP
    "Non-Active"
* #EXP
    "Excipient"


Alias: roleCS = http://hl7.org/fhir/us/example/CodeSystem/be-rolemed-cs


ValueSet: BeRoleMedicationVS
Id: be-role-medication-vs
Title: "Ingredient role Value Set"
Description: "Indicates the role that an ingredient takes into a product"
* include codes from system BeRoleIngredinentCS

Alias: rolevs = http://hl7.org/fhir/us/example/ValueSet/be-role-medication-vs


// Define a local code system
CodeSystem: BeIngredientCS
Id:         beingredient-cs
Title: "Ingredient Code System"
Description: "Codes for ingredient"

* #000001 
    "Paracetamol"

* #000002 
    "Insuline lispro"

* #000003 
    "Tramadol"

* #000004 
    "Rosuvastatin"   

Alias: ingredientCS = http://hl7.org/fhir/us/example/CodeSystem/beingredient-cs


ValueSet: BeMedicationVS
Id: medication-vs
Title: "Ingredient  Value Set"
Description: "Indicates the ingredient inside a product"
* include codes from system BeIngredientCS

Alias: ingredientVS = http://hl7.org/fhir/us/example/ValueSet/medication-vs


// Define a local code system
CodeSystem: BeMACS
Id:         be-marketingauthorization-cs
Title: "Marketing Authorization Code System"
Description: "Codes for Marketing Authorization"

* #000001 
    "ABCD0123"
* #000002
    "XDFG9876"  

Alias: MACS = http://hl7.org/fhir/us/example/CodeSystem/be-marketingauthorization-cs



ValueSet: BeMAVS
Id: be-marketingauthorization-vs
Title: "Marketing Authorization Value Set"
Description: "Indicates the Marketing Authorization for a product"
* include codes from system be-marketingauthorization-cs

Alias: MAVS = http://hl7.org/fhir/us/example/ValueSet/be-marketingauthorization-vs


// Define a local code system
CodeSystem: BeMAHolderCS
Id:         be-marketingauthorization-holder-cs
Title: "Marketing Authorization Holder Code System"
Description: "Codes for Marketing Authorization Holder"

* #000001 
    "AstraZeneca"

* #000002
    "Pfizer"

* #000003 
    "Bayer"

Alias: MAHCS = http://hl7.org/fhir/us/example/CodeSystem/be-marketingauthorization-holder-cs


ValueSet: BeMAHolderVS
Id: be-marketingauthorization-holder-vs
Title: "Marketing Authorization Holder Value Set"
Description: "Indicates the Marketing Authorization Holder of a product"
* include codes from system be-marketingauthorization-holder-cs

Alias: MAHVS = http://hl7.org/fhir/us/example/ValueSet/be-marketingauthorization-holder-vs

