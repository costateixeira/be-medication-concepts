
Instance: questionnaire-response-vmp
InstanceOf: QuestionnaireResponse
Description: "Questionnaire Response example for adding a drug level of VMP to a FHIR server"
Title: "VMP Questionnaire Response Example 1"


* status = #in-progress
* authored = "2022-01-26T02:00:00Z"

* item[+].linkId = "ingredient"

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].answer.valueCoding = beingredient-cs#000002 "insuline lispro"

* item[=].item[+].linkId = "strength"
* item[=].item[=].answer.valueQuantity.value = 100
* item[=].item[=].answer.valueQuantity.unit = "U"


* item[=].item[+].linkId = "role"
* item[=].item[=].answer.valueCoding = be-rolemed-cs#AP "Active Principle"


* item[+].linkId = "doseform"
* item[=].answer.valueCoding = http://snomed.info/sct#385219001 "Injection solution"


* item[+].linkId = "route"
* item[=].answer[+].valueCoding = http://snomed.info/sct#47625008 "Intravenous Use"
* item[=].answer[+].valueCoding = http://snomed.info/sct#34206005 "SC Use"
* item[=].answer[+].valueCoding = http://snomed.info/sct#78421000 "Intramuscular Use"



Instance: questionnaire-response-vmp2
InstanceOf: QuestionnaireResponse
Description: "Questionnaire Response example 2 for adding a drug level of VMP to a FHIR server"
Title: "VMP Questionnaire Response Example 2"

* status = #in-progress
* authored = "2022-01-26T02:00:00Z"

* item[+].linkId = "ingredient"

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].answer[+].valueCoding = beingredient-cs#000003 "Tramadol"

* item[=].item[+].linkId = "strength"
* item[=].item[=].answer.valueQuantity.value = 37.5
* item[=].item[=].answer.valueQuantity.unit = "mg"


* item[=].item[+].linkId = "role"
* item[=].item[=].answer.valueCoding = be-rolemed-cs#AP "Active Principle"

* item[+].linkId = "ingredient"

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].answer[+].valueCoding = beingredient-cs#000001 "Acetaminophen"

* item[=].item[+].linkId = "strength"
* item[=].item[=].answer.valueQuantity.value = 325
* item[=].item[=].answer.valueQuantity.unit = "mg"


* item[=].item[+].linkId = "role"
* item[=].item[=].answer.valueCoding = be-rolemed-cs#AP "Active Principle"



* item[+].linkId = "doseform"
* item[=].answer.valueCoding = http://snomed.info/sct#385055001 "Tablet"


* item[+].linkId = "route"
* item[=].answer[+].valueCoding = http://snomed.info/sct#26643006  "Oral Use"



Instance: questionnaire-response-amp
InstanceOf: QuestionnaireResponse
Description: "Questionnaire Response example for adding a drug level of AMP to a FHIR server"
Title: "AMP Questionnaire Response Example"

* status = #in-progress
* authored = "2022-01-26T02:00:00Z"

* item[+].linkId = "ingredient"

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].answer[+].valueCoding = beingredient-cs#000004 "Rosuvastatin"

* item[=].item[+].linkId = "strength"
* item[=].item[=].answer.valueQuantity.value = 40
* item[=].item[=].answer.valueQuantity.unit = "mg"


* item[=].item[+].linkId = "role"
* item[=].item[=].answer.valueCoding = be-rolemed-cs#AP "Active Principle"


* item[+].linkId = "doseform"
* item[=].answer.valueCoding = http://snomed.info/sct#385055001 "Tablet"


* item[+].linkId = "route"
* item[=].answer[+].valueCoding = http://snomed.info/sct#26643006  "Oral Use"

* item[+].linkId = "marketingauhtorization"
* item[=].answer[+].valueCoding = BeMACS#000001 "ABCD0123"


* item[+].linkId = "marketingholder"
* item[=].answer[+].valueCoding = BeMAHolderCS#000001 "AstraZeneca"

* item[+].linkId = "brandname"
* item[=].answer[+].valueString = "Crestor 40 mg filmomh. tabl."


Instance: questionnaire-response-ampp
InstanceOf: QuestionnaireResponse
Description: "Questionnaire Response example for adding a drug level of AMPP to a FHIR server"
Title: "AMPP Questionnaire Response Example"

* status = #in-progress
* authored = "2022-01-26T02:00:00Z"

* item[+].linkId = "ingredient"

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].answer[+].valueCoding = beingredient-cs#000004 "Rosuvastatin"

* item[=].item[+].linkId = "strength"
* item[=].item[=].answer.valueQuantity.value = 40
* item[=].item[=].answer.valueQuantity.unit = "mg"


* item[=].item[+].linkId = "role"
* item[=].item[=].answer.valueCoding = be-rolemed-cs#AP "Active Principle"


* item[+].linkId = "doseform"
* item[=].answer.valueCoding = http://snomed.info/sct#385055001 "Tablet"


* item[+].linkId = "route"
* item[=].answer[+].valueCoding = http://snomed.info/sct#26643006  "Oral Use"

* item[+].linkId = "marketingauhtorization"
* item[=].answer[+].valueCoding = BeMACS#000001 "ABCD0123"


* item[+].linkId = "marketingholder"
* item[=].answer[+].valueCoding = BeMAHolderCS#000001 "AstraZeneca"

* item[+].linkId = "brandname"
* item[=].answer[+].valueString = "Crestor 40 mg filmomh. tabl."

* item[+].linkId = "packaging"


* item[=].item[+].linkId = "packsize"
* item[=].item[=].answer.valueQuantity.value = 98
* item[=].item[=].answer.valueQuantity.unit = "units"


* item[=].item[+].linkId = "packtype"
* item[=].item[=].answer[+].valueCoding = http://terminology.hl7.org/CodeSystem/medicationknowledge-package-type#blstrpk "Blister Pack"

