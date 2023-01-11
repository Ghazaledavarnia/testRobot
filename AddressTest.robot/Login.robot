*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Library     RPA.JSON


*** Variables ***
${base_url}     https://devapi.aasood.com/customer/api/v1/


*** Test Cases ***
Checking Login Password
    ${auth}=    Create List    09302828801    Zahra100%
    Create Session    session    ${base_url}

    ${response}=    Post Request    session    /auth/login/password
    Log To Console    {response.content}
    Log To Console    {response.status_code}

    #validatioin
    ${res_header}=    to json    ${response.header}
    #    should contain    ${res_body}    ey
    Log To Console    ${res_header}

    ${value_accesstoken}=    Get value from JSON    ${res_header}    $.accesstoken
    ${value_refreshtoken}=    Get value from JSON    ${res_header}    $.refreshtoken
    Log To Console    ${value_accesstoken}
    Log To Console    ${value_refreshtoken}
