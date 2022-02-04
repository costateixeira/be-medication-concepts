Instance: questionnaire-vmpg
InstanceOf: Questionnaire
Description: "Questionnaire for adding a drug level of VMP Group to a FHIR server"
Title: "VMP Group Questionnaire"

* identifier[0].system = "http://hl7belgium.org"
* identifier[0].value = "questionnaire-vmp"

* extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension.valueCanonical = "http://website.be/transformtovmp/"

* name = "questionnaire-vmp"
* title = "Questionnaire for adding VMP"
* status = #active
* item[+].linkId = "code"
* item[=].type = #integer
* item[=].required = false
* item[=].text = "Code for the product"

* item[+].linkId = "ingredient"
* item[=].type = #group
* item[=].required = true
* item[=].text = "Ingredient"
* item[=].repeats = true

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].type = #open-choice
* item[=].item[=].answerValueSet = ingredientVS
* item[=].item[=].required = true
* item[=].item[=].text = "Ingredient for the product"

* item[=].item[+].linkId = "strength"
* item[=].item[=].type = #quantity
* item[=].item[=].required = true
* item[=].item[=].text = "Strength of the ingredient of the product"

* item[=].item[+].linkId = "role"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = rolevs
* item[=].item[=].required = true
* item[=].item[=].text = "Roles of the ingredient of the product"

* item[+].linkId = "route"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/route-codes"
* item[=].text = "Route of administration"
* item[=].repeats = true

Instance: questionnaire-vmp
InstanceOf: Questionnaire
Description: "Questionnaire for adding a drug level of VMP to a FHIR server"
Title: "VMP Questionnaire"

* identifier[0].system = "http://hl7belgium.org"
* identifier[0].value = "questionnaire-vmp"

* extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension.valueCanonical = "http://website.be/transformtovmp/"

* name = "questionnaire-vmp"
* title = "Questionnaire for adding VMP"
* status = #active
* item[+].linkId = "code"
* item[=].type = #integer
* item[=].required = false
* item[=].text = "Code for the product"

* item[+].linkId = "ingredient"
* item[=].type = #group
* item[=].required = true
* item[=].text = "Ingredient"
* item[=].repeats = true

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].type = #open-choice
* item[=].item[=].answerValueSet = ingredientVS
* item[=].item[=].required = true
* item[=].item[=].text = "Ingredient for the product"

* item[=].item[+].linkId = "strength"
* item[=].item[=].type = #quantity
* item[=].item[=].required = true
* item[=].item[=].text = "Strength of the ingredient of the product"

* item[=].item[+].linkId = "role"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = rolevs
* item[=].item[=].required = true
* item[=].item[=].text = "Roles of the ingredient of the product"


* item[+].linkId = "doseform"
* item[=].type = #choice
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/medication-form-codes"
* item[=].required = true
* item[=].text = "Dose Form of the product"

* item[+].linkId = "route"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/route-codes"
* item[=].text = "Route of administration"
* item[=].repeats = true


Instance: questionnaire-amp
InstanceOf: Questionnaire
Description: "Questionnaire for adding a drug level of AMP to a FHIR server"
Title: "AMP Questionnaire"

* identifier[0].system = "http://hl7belgium.org"
* identifier[0].value = "questionnaire-amp"

* extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension.valueCanonical = "http://website.be/transformtoamp/"


* name = "questionnaire-amp"
* title = "Questionnaire for adding AMP"
* status = #active
* item[+].linkId = "code"
* item[=].type = #integer
* item[=].required = false
* item[=].text = "Code for the product"

* item[+].linkId = "ingredient"
* item[=].type = #group
* item[=].required = true
* item[=].text = "Ingredient"
* item[=].repeats = true

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].type = #open-choice
* item[=].item[=].answerValueSet = ingredientVS
* item[=].item[=].required = true
* item[=].item[=].text = "Ingredient for the product"

* item[=].item[+].linkId = "strength"
* item[=].item[=].type = #quantity
* item[=].item[=].required = true
* item[=].item[=].text = "Strength of the ingredient of the product"

* item[=].item[+].linkId = "role"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = rolevs
* item[=].item[=].required = true
* item[=].item[=].text = "Roles of the ingredient of the product"


* item[+].linkId = "doseform"
* item[=].type = #choice
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/medication-form-codes"
* item[=].required = true
* item[=].text = "Dose Form of the product"

* item[+].linkId = "route"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/route-codes"
* item[=].text = "Route of administration"
* item[=].repeats = true

* item[+].linkId = "marketingauhtorization"
* item[=].type = #open-choice
* item[=].answerValueSet = MAVS
* item[=].required = true
* item[=].text = "Marketing Authorization Number for the product"

* item[+].linkId = "marketingholder"
* item[=].type = #open-choice
* item[=].required = true
* item[=].answerValueSet = MAHVS
* item[=].text = "Marketing Auhtorization Holder"

* item[+].linkId = "brandname"
* item[=].type = #string
* item[=].required = true
* item[=].text = "Brand Name"


Instance: questionnaire-ampp
InstanceOf: Questionnaire
Description: "Questionnaire for adding a drug level of AMPP to a FHIR server"
Title: "AMPP Questionnaire"

* identifier[0].system = "http://hl7belgium.org"
* identifier[0].value = "questionnaire-ampp"

* extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap"
* extension.valueCanonical = "http://website.be/transformtoampp/"

* name = "questionnaire-ampp"
* title = "Questionnaire for adding AMPP"
* status = #active
* item[+].linkId = "code"
* item[=].type = #integer
* item[=].required = false
* item[=].text = "Code for the product"

* item[+].linkId = "ingredient"
* item[=].type = #group
* item[=].required = true
* item[=].text = "Ingredient"
* item[=].repeats = true

* item[=].item[+].linkId = "ingredient-element"
* item[=].item[=].type = #open-choice
* item[=].item[=].answerValueSet = ingredientVS
* item[=].item[=].required = true
* item[=].item[=].text = "Ingredient for the product"

* item[=].item[+].linkId = "strength"
* item[=].item[=].type = #quantity
* item[=].item[=].required = true
* item[=].item[=].text = "Strength of the ingredient of the product"

* item[=].item[+].linkId = "role"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = rolevs
* item[=].item[=].required = true
* item[=].item[=].text = "Roles of the ingredient of the product"


* item[+].linkId = "doseform"
* item[=].type = #choice
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/medication-form-codes"
* item[=].required = true
* item[=].text = "Dose Form of the product"

* item[+].linkId = "route"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/route-codes"
* item[=].text = "Route of administration"
* item[=].repeats = true

* item[+].linkId = "marketingauhtorization"
* item[=].type = #open-choice
* item[=].answerValueSet = MAVS
* item[=].required = true
* item[=].text = "Marketing Authorization Number for the product"

* item[+].linkId = "marketingholder"
* item[=].type = #open-choice
* item[=].required = true
* item[=].answerValueSet = MAHVS
* item[=].text = "Marketing Auhtorization Holder"

* item[+].linkId = "brandname"
* item[=].type = #string
* item[=].required = true
* item[=].text = "Brand Name"

* item[=].linkId = "packaging"
* item[=].type = #group
* item[=].required = true
* item[=].text = "Packaging"

* item[=].item[+].linkId = "packsize"
* item[=].item[=].type = #quantity
* item[=].item[=].required = true
* item[=].item[=].text = "Package Size"

* item[=].item[+].linkId = "packtype"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/medicationknowledge-package-type"
* item[=].item[=].text = "Packaging Type"
