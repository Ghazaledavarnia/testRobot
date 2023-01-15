*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}     https://devpapi.aasood.com/staff/api/v1


*** Test Cases ***
staff_login
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    username=Aasood    password=Aasood100%
    
    Create Session    session    ${base_url}    headers=${headers}
    ${resp}=    POST On Session    session    /staff_login    json=${body}
    
    ${value_accesstoken}=    Set Variable    ${resp.headers['accesstoken']}
    ${value_refreshtoken}=    Set Variable    ${resp.headers['refreshtoken']}
