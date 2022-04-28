Logical: VMPGroupModel
Title: "VMP Group logical model"
Description: "VMP Group logical model"

* identifier 0..* Identifier "Business identifier for this medication" "Business identifier for this medication"
* ingredient 1..* BackboneElement "Ingredient(s) that are part of the product, with therapeutical usage or not" "Ingredient(s) that are part of the product, with therapeutical usage or not"
  * substance 1..1 CodeableConcept "Codification of the substance" "Codification of the substance"
  * role 1..1 CodeableConcept "Role the substance has in this product (active principle, excipient, ...)" "Role the substance has in this product (active principle, excipient, ...)"
  * strength 1..1 Quantity "Strength of the substance in this product" "Strength of the substance in this product"
* routeOfAdministration 1..* CodeableConcept "The approved route of administration" "The approved route of administration"


Logical: VMPModel
Title: "VMP logical model"
Description: "VMP logical model"

* identifier 0..* Identifier "Business identifier for this medication" "Business identifier for this medication"
* ingredient 1..* BackboneElement "Ingredient(s) that are part of the product, with therapeutical usage or not" "Ingredient(s) that are part of the product, with therapeutical usage or not"
  * substance 1..1 CodeableConcept "Codification of the substance" "Codification of the substance"
  * role 1..1 CodeableConcept "Role the substance has in this product (active principle, excipient, ...)" "Role the substance has in this product (active principle, excipient, ...)"
  * strength 1..1 Quantity "Strength of the substance in this product" "Strength of the substance in this product"
* routeOfAdministration 1..* CodeableConcept "The approved route of administration" "The approved route of administration"
* pharmaceuticalDoseForm 1..1  CodeableConcept "Dose form of the product - tablet, powder, solution..." "Dose form of the product - tablet, powder, solution..."


Logical: AMPModel
Title: "AMP logical model"
Description: "AMP logical model"

* identifier 0..* Identifier "Business identifier for this medication" "Business identifier for this medication"
* ingredient 1..* BackboneElement "Ingredient(s) that are part of the product, with therapeutical usage or not" "Ingredient(s) that are part of the product, with therapeutical usage or not"
  * substance 1..1 CodeableConcept "Codification of the substance" "Codification of the substance"
  * role 1..1 CodeableConcept "Role the substance has in this product (active principle, excipient, ...)" "Role the substance has in this product (active principle, excipient, ...)"
  * strength 1..1 Quantity "Strength of the substance in this product" "Strength of the substance in this product"
* routeOfAdministration 1..* CodeableConcept "The approved route of administration" "The approved route of administration"
* pharmaceuticalDoseForm 1..1  CodeableConcept "Dose form of the product - tablet, powder, solution..." "Dose form of the product - tablet, powder, solution..."
* brandName 1..1 string "Brand name of the product" "Brand name of the product"
* marketingAuthorizationHolder 1..1 CodeableConcept "Who has the marketing authorization for the market" "Who has the marketing authorization for the market"
* marketingAuthorizationNumber 1..1 CodeableConcept "License number for the marketing authorization" "License number for the marketing authorization"


Logical: AMPPModel
Title: "AMPP logical model"
Description: "AMPP logical model"

* identifier 0..* Identifier "Business identifier for this medication" "Business identifier for this medication"
* ingredient 1..* BackboneElement "Ingredient(s) that are part of the product, with therapeutical usage or not" "Ingredient(s) that are part of the product, with therapeutical usage or not"
  * substance 1..1 CodeableConcept "Codification of the substance" "Codification of the substance"
  * role 1..1 CodeableConcept "Role the substance has in this product (active principle, excipient, ...)" "Role the substance has in this product (active principle, excipient, ...)"
  * strength 1..1 Quantity "Strength of the substance in this product" "Strength of the substance in this product"
* routeOfAdministration 1..* CodeableConcept "The approved route of administration" "The approved route of administration"
* pharmaceuticalDoseForm 1..1  CodeableConcept "Dose form of the product - tablet, powder, solution..." "Dose form of the product - tablet, powder, solution..."
* brandName 1..1 string "Brand name of the product" "Brand name of the product"
* marketingAuthorizationHolder 1..1 CodeableConcept "Who has the marketing authorization for the market" "Who has the marketing authorization for the market"
* marketingAuthorizationNumber 1..1 CodeableConcept "License number for the marketing authorization" "License number for the marketing authorization"
* packaging 1..1 BackboneElement "Details about packaged medications" "Details about packaged medications" 
  * type 0..1 CodeableConcept "A code that defines the specific type of packaging that the medication can be found in" "A code that defines the specific type of packaging that the medication can be found in"
  * quantity 0..1 Quantity "The number of product units the package would contain if fully loaded" "The number of product units the package would contain if fully loaded"

Profile:     PharmaceuticalProduct
Id:          PharmaceuticalProduct
Parent:      MedicationKnowledge
Title:       "Pharmaceutical Product Profile"
Description: "Pharmaceutical Product Profile"


// Slice on the value of the identifier type code

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains
    PhPID 0..1 MS and
    Other 0..1 MS 
* code.coding[PhPID].system = "http://www.edqm.eu/pharmaceutical-product-identifier-type"
* code.coding[Other].system = "http://www.belgium.be/pharmaceutical-ids"


* doseForm.coding ^slicing.discriminator.type = #pattern
* doseForm.coding ^slicing.discriminator.path = "system"
* doseForm.coding ^slicing.rules = #open
* doseForm.coding contains
    EDQM 0..1 MS and
    Other 0..1 MS 
* doseForm.coding[EDQM].system = "http://www.edqm.eu/dose-forms"
* doseForm.coding[Other].system = "http://www.belgium.be/dose-forms"
* synonym 1..1 MS
* ingredient 1..* MS

* intendedRoute ^slicing.discriminator.type = #pattern
* intendedRoute ^slicing.discriminator.path = "system"
* intendedRoute ^slicing.rules = #open
* intendedRoute contains
    EDQM 0..1 MS and
    Other 0..1 MS 
* intendedRoute[EDQM].coding.system = "http://www.edqm.eu/routes"
* intendedRoute[Other].coding.system = "http://www.belgium.be/routes"
