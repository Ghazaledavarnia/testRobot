*** Settings ***
Library     RequestsLibrary
Library    Collections


*** Variables ***
${base_url}     https://devpapi.aasood.com/staff/api/v1


*** Test Cases ***
Get_all_staffs
    Create Session    my    ${base_url}
    ${response}=    Get Request    my    /get_all_staffs

    log to console    ${response.status_code}
    log to console    ${response.content}
    log to console    ${response.headers}

    #VALIDATIONS
    ${status_code}=    convert to string    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${body}=    Convert To Bytes    ${response.content}
    Should Contain    ${body}    admin
    ${ContentTypeValue}=    Get From Dictionary    ${response.content}    Content-Type
    should be equal ${ContentTypeValue}   application/json

