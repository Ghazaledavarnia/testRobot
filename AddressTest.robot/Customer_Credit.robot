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
    ${response}=    Post Request    session    /product_credit    json=${body}

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
    ${response}=    POST Request    session    /request_credit    json=${body}

Accept Credit
    Create Session    session    ${base_url}
    ${body}=    Create Dictionary    referralNumber="12"    status="accept"
    ${response}=    Post Request    session    /accept_credit    json=${body}

Create sell request
#    /**درخواست کالا/
    Create Session    session    ${base_url}
    ${body}=    Create Dictionary
    ...    dealershiprId=11
    ...    dealershipPhoneNumber=
    ...    string
    ...    customerId=0
    ...    customerPhoneNumber=string
    ...    status=initial
    ...    systemCode=string
    ...    storageId=string
    ...    price=0
    ...    totalPrice=0
    ...    count=0
    ...    model=string
    ...    name=string
    ...    brand={}
    ...    color={}
    ...    guarantee={}
    ...    seller={}
    ...    category={}    imeis=[]
    ${response}=    Put Request    session    /create_sell_request    json=${body}
    #Validations

change request goods status
#    تایید کالا
    Create Session    session    ${base_url}
    ${body}=    Create Dictionary
    ...    referralNumber=string
    ...    customerId=string
    ...    systemCode=string
    ...    storageId=string
    ...    count=0
    ...    name=string    shipment={}    storageId=string
    ${response}=    Put Request    session    /submit_request_form    json=${body}

 supply goods if there aren't in warehouse
    Create Session    session    ${base_url}
    ${body}=    create Dictionary    referralNumber=string    storageId=string    systemCode=string    imei=string
     ${response}=    Put Request    session    /add_imei_to_form    json=${body}
