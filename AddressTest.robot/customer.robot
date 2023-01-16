*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}     https://devpapi.aasood.com/customer/api/v1
${access}
${refresh}


*** Test Cases ***
Convert To Dealership
    Create Session    session    ${base_url}
    ${header}=    Create Dictionary    access=${access}    refresh=${refresh}
    ${body}=    Create Dictionary    customerPhoneNumber= stringstrin    customerFirstName= string
    ...    customerLastName= string
    ...    customerNationalID= stringstri
    ...    customerRegionCode= strin
    ...    customerCity= string
    ...    customerCityID= stri
    ...    customerProvince= string
    ...    customerProvinceID= stri
    ...    customerAddressCity= string
    ...    customerAddressCityID= stri
    ...    customerAddressProvince= string
    ...    customerAddressProvinceID= stri
    ...    customerPostalCode= stringstri
    ...    customerStreet= stringst
    ...    customerAlley= stringst
    ...    customerPlaque= stringst
    ...    customerPassword= stringst
    ...    customerVerifyPassword= stringst
    ...    customerUnit= stringst
    ...    customerTelephone= stringst
    ...    customerOfoghCode= string
    ...    nbName= string
    ...    nbId= string
    ...    customerDocumentStatus= stringst
    ${response}=    Post Request    session    /product_credit
     