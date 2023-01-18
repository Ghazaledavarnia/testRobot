*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}     https://devpapi.aasood.com/customer/api/v1
${access}
${refresh}
${headers}      Create Dictionary    access=${access}    refresh=${refresh}    Content-Type=application-json


*** Test Cases ***
Register Dealership
    Create Session    session    ${base_url}    headers=${headers}

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

Convert To Dealership
    Create Session    session    ${base_url}    headers=${headers}
    ${response}=    Put Request    session    /product_credit

Request Dealership Credit
    Create Session    session    ${base_url}    headers=${headers}
    ${body}=    Create Dictionary
    ...    customerId= 0
    ...    customerName= string
    ...    customerTelephone= string
    ...    amount= 0
    ...    paymentType= string
    ...    description= string
    ${response}=    POST Request    session    /request_credit
