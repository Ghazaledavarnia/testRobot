*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Library     RPA.JSON


*** Variables ***
${base_url}     https://devapi.aasood.com/customer/api/v1


*** Test Cases ***
Checking Login Password
    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ...    accept=application/json

    ${body}=    Create Dictionary
    ...    customerPhoneNumber=09302828801
    ...    customerPassword=Zahra100%
    ...    customerType=B2B

    Create Session    session    ${base_url}    headers=${headers}
    ${resp}=    POST On Session    session    /auth/login/password    json=${body}
    Status Should Be    OK    ${resp}

    ${value_accesstoken}=    Set Variable    ${resp.headers['accesstoken']}
    ${value_refreshtoken}=    Set Variable    ${resp.headers['refreshtoken']}
