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