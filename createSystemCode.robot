*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem


*** Variables ***
${base_url}     https://devapi.aasood.com/product/api/v1


*** Test Cases ***
create_product_with_ExisyenceSystemcode
    Create Session    session    ${base_url}

    ${systemCodes_list}=    Create List    2000010010001001001100001
    ${body}=    create Dictionary
    ...    systemCodes=${systemCodes_list}
    ...    name=Mobile Samsung A01 Core (1GB 16GB 4G) Vietnam
    ...    urlName=string
    ${headers}=    Create Dictionary    content-Type=application/json

    ${response}=    Post Request    session    /product/create_product    data=${body}    headers=${headers}

    Log To Console    ${response.status_code}

    #VALIDATIONS
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    400

create_product_lessthan_minLenght
    Create Session    session    ${base_url}
    ${systemCodes_list}=    Create List   2000010010001002001017003 

    ${body}=    create Dictionary    systemCodes=${systemCodes_list}    name= mo    urlName=string

    ${headers}=    Create Dictionary    content-Type=application/json
    ${response}=    Post Request    session    /product/create_product    data=${body}    headers=${headers}

    #VALIDATION
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    400
    ${res_body}=    Convert To String    ${response.content}
     should contain    ${res_body}    name must be at least 3 characters
