*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}
...                         https://devpapi.aasood.com/customer/api/v1
${base_url_credit}          https://devpapi.aasood.com/credit/api/v1
#ENDPOINTS
${CREATEDEALERSHIP}
...                         /product_credit
${ACCEPTDEALER}
...                         /product_credit
#HEADERS
${ACCESS_DEALER}
...                         eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzQ5ODMzNzgsImlhdCI6MTY3NDk4MjE3OCwic3ViIjp7ImN1c3RvbWVyIjp7ImNybV9nZXRfcHJvZmlsZSI6e30sImdldF9hbGxfaW5mb3JtYWxfcGVyc29ucyI6e30sImdldF9jdXN0b21lcnNfZ3JpZF9kYXRhX2FjY291bnRpbmciOnt9LCJnZXRfaW5mb3JtYWxfcGVyc29ucyI6e30sImdldF9kZWFsZXJzaGlwc19saXN0Ijp7fSwiZ2V0X2N1c3RvbWVyc19ncmlkX2RhdGEiOnt9LCJyZWdpc3Rlcl9kZWFsZXJzaGlwIjp7fX0sInByb2R1Y3QiOnsiZ2V0X2l0ZW1zIjp7fSwiYWRkX2F0dHJpYnV0ZXMiOnt9LCJhZGRfY3JlZGl0X2J5X2NhdGVnb3J5Ijp7fSwiY3JlYXRlX2N1c3RvbV9jYXRlZ29yeSI6e30sImNyZWF0ZV9jdXN0b21fa293c2FyX2NhdGVnb3J5Ijp7fSwiY3JlYXRlX2tvd3Nhcl9ncm91cCI6e30sImNyZWF0ZV9wcm9kdWN0Ijp7fSwiY3JlYXRlX3N5c3RlbV9jb2RlIjp7fSwiZGVsZXRlX2N1c3RvbV9jYXRlZ29yeSI6e30sImVkaXRfY3VzdG9tX2NhdGVnb3J5Ijp7fSwiZWRpdF9wcm9kdWN0Ijp7fSwiZ2V0X2FsbF9jYXRlZ29yaWVzIjp7fSwiZ2V0X2NhdGVnb3JpZXNfcHJvZHVjdHMiOnt9LCJnZXRfY3VzdG9tX2NhdGVnb3J5X2xpc3QiOnt9LCJnZXRfa293c2FyX2l0ZW1zIjp7fSwiZ2V0X2tvd3Nhcl9sb2dzIjp7fSwiZ2V0X2tvd3Nhcl9zeXN0ZW1fY29kZSI6e30sImdldF9tYWluX21hbnVfYmFubmVycyI6e30sImdldF9wcm9kdWN0X2F0dHJpYnV0ZXMiOnt9LCJnZXRfcHJvZHVjdF9iYWNrb2ZmaWNlIjp7fSwiZ2V0X3Byb2R1Y3RfbGlzdF9iYWNrX29mZmljZSI6e30sImdldF9wcm9kdWN0X3N0b2NrIjp7fSwia293c2FyX3JlZG8iOnt9LCJzZXRfbWFpbl9tZW51X2Jhbm5lcnMiOnt9LCJzZXRfcHJvZHVjdF9wcmljZSI6e30sInNldF9wcm9kdWN0X3F1YW50aXR5Ijp7fSwidXBkYXRlX3Byb2R1Y3RfcHJpY2UiOnt9LCJ1cGRhdGVfcHJvZHVjdF9xdWFudGl0eSI6e319fSwic2NvcGUiOiJhY2Nlc3MifQ.Fym7MebWIbkl0dFwtGIJ62u0LFIrPAuuSapnd-Si2Ak
${REFRESH_DEALER}
...                         eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzY3MTAxNzgsImlhdCI6MTY3NDk4MjE3OCwic3ViIjp7InN0YWZmX2lkIjo1NywidXNlcm5hbWUiOiJBYXNvb2QifSwic2NvcGUiOiJyZWZyZXNoIn0.QPEh0xi9tU38HEwJdqIcqBu2pUibkEjvLRGMcMlHeLY
...
${CONTENT_TYPE}
...                         application/json

${ACCESS_STAFF}
...                         eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzUxNzMzNTksImlhdCI6MTY3NTE3MjE1OSwic3ViIjp7ImN1c3RvbWVyIjp7ImNybV9nZXRfcHJvZmlsZSI6e30sImdldF9hbGxfaW5mb3JtYWxfcGVyc29ucyI6e30sImdldF9jdXN0b21lcnNfZ3JpZF9kYXRhX2FjY291bnRpbmciOnt9LCJnZXRfaW5mb3JtYWxfcGVyc29ucyI6e30sImdldF9kZWFsZXJzaGlwc19saXN0Ijp7fSwiZ2V0X2N1c3RvbWVyc19ncmlkX2RhdGEiOnt9LCJyZWdpc3Rlcl9kZWFsZXJzaGlwIjp7fX0sInByb2R1Y3QiOnsiZ2V0X2l0ZW1zIjp7fSwiYWRkX2F0dHJpYnV0ZXMiOnt9LCJhZGRfY3JlZGl0X2J5X2NhdGVnb3J5Ijp7fSwiY3JlYXRlX2N1c3RvbV9jYXRlZ29yeSI6e30sImNyZWF0ZV9jdXN0b21fa293c2FyX2NhdGVnb3J5Ijp7fSwiY3JlYXRlX2tvd3Nhcl9ncm91cCI6e30sImNyZWF0ZV9wcm9kdWN0Ijp7fSwiY3JlYXRlX3N5c3RlbV9jb2RlIjp7fSwiZGVsZXRlX2N1c3RvbV9jYXRlZ29yeSI6e30sImVkaXRfY3VzdG9tX2NhdGVnb3J5Ijp7fSwiZWRpdF9wcm9kdWN0Ijp7fSwiZ2V0X2FsbF9jYXRlZ29yaWVzIjp7fSwiZ2V0X2NhdGVnb3JpZXNfcHJvZHVjdHMiOnt9LCJnZXRfY3VzdG9tX2NhdGVnb3J5X2xpc3QiOnt9LCJnZXRfa293c2FyX2l0ZW1zIjp7fSwiZ2V0X2tvd3Nhcl9sb2dzIjp7fSwiZ2V0X2tvd3Nhcl9zeXN0ZW1fY29kZSI6e30sImdldF9tYWluX21hbnVfYmFubmVycyI6e30sImdldF9wcm9kdWN0X2F0dHJpYnV0ZXMiOnt9LCJnZXRfcHJvZHVjdF9iYWNrb2ZmaWNlIjp7fSwiZ2V0X3Byb2R1Y3RfbGlzdF9iYWNrX29mZmljZSI6e30sImdldF9wcm9kdWN0X3N0b2NrIjp7fSwia293c2FyX3JlZG8iOnt9LCJzZXRfbWFpbl9tZW51X2Jhbm5lcnMiOnt9LCJzZXRfcHJvZHVjdF9wcmljZSI6e30sInNldF9wcm9kdWN0X3F1YW50aXR5Ijp7fSwidXBkYXRlX3Byb2R1Y3RfcHJpY2UiOnt9LCJ1cGRhdGVfcHJvZHVjdF9xdWFudGl0eSI6e319fSwic2NvcGUiOiJhY2Nlc3MifQ.PLEQAHngBHUsJHeYQWaBYDHeI08g5UcD81wx2diXiEk
${REFRESH_STAFF}
...                         eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzY5MDAxNTksImlhdCI6MTY3NTE3MjE1OSwic3ViIjp7InN0YWZmX2lkIjo1NywidXNlcm5hbWUiOiJBYXNvb2QifSwic2NvcGUiOiJyZWZyZXNoIn0.491wWNCEdPQr_sBh9lXrZIe4ILU1adxABHCa_P10K4A
...                         eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzY3MjQ2NTAsImlhdCI6MTY3NDk5NjY1MCwic3ViIjp7InN0YWZmX2lkIjo1NywidXNlcm5hbWUiOiJBYXNvb2QifSwic2NvcGUiOiJyZWZyZXNoIn0.vj2hbn6Et22Uh82bGTzekn7qxhvXcmrF2zFfr6HOUTA

#VARIABLES
${CUSTOMERMOBILENUMBER}
...                         09126854728


*** Test Cases ***
Register Dealership
    ${HEADERS}=    Create Dictionary
    ...    access=${ACCESS_DEALER}
    ...    refresh=${REFRESH_DEALER}
    ...    Content-Type=${CONTENT_TYPE}

    Create Session    CREATEDEALERSHIP    ${base_url}    headers=${HEADERS}

    ${body}=    Create Dictionary    customerPhoneNumber= ${CUSTOMERMOBILENUMBER}    customerFirstName= قلی
    ...    customerLastName= قلی زاد
    ...    customerNationalID= 0921505140
    ...    customerRegionCode= 88
    ...    customerCity= تهران
    ...    customerCityID= 744
    ...    customerProvince= تهران
    ...    customerProvinceID= 05
    ...    customerAddressCity= خ سی متری
    ...    customerAddressCityID= 744
    ...    customerAddressProvince= تهران
    ...    customerAddressProvinceID= 05
    ...    customerPostalCode= stringstri
    ...    customerStreet= stringst
    ...    customerAlley= stringst
    ...    customerPlaque= stringst
    ...    customerPassword= 123456789
    ...    customerVerifyPassword= 123456789
    ...    customerUnit= 4
    ...    customerTelephone= 0921505140
    ...    customerOfoghCode= 555
    ...    nbName= string
    ...    nbId= string
    ...    customerDocumentStatus= stringst
    ${response}=    POST On Session    CREATEDEALERSHIP
    ...    ${CREATEDEALERSHIP}    headers=${HEADERS}    data=${body}
    Should Be Equal As Strings    ${response.status_code}    200

 Convert To Dealership
    ${HEADERS}=    Create Dictionary
    ...    access=${ACCESS_STAFF}
    ...    refresh=${REFRESH_STAFF}
    ...    Content-Type=${CONTENT_TYPE}
    Create Session    AcceptDealer    ${base_url}    headers=${HEADERS}
    ${body}=    Create Dictionary    customerMobileNumber=${CUSTOMERMOBILENUMBER}
    ${response}=    Put Request    AcceptDealer    ${ACCEPTDEALER}    headers=${HEADERS}    data=${body}
    Should Be Equal As Strings    ${response.status_code}    200

Request Dealership Credit
    Create Session    session    ${base_url_credit}
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
