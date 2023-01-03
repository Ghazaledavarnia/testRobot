*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem


*** Variables ***
${base_url}         https://devpapi.aasood.com/address/api/v1
${accesstoken}
...                 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzI0ODIzMDcsImlhdCI6MTY3MjQ4MTEwNywic3ViIjp7InN0YWZmX2lkIjo0NCwidXNlcm5hbWUiOiJwb3NodGliYW4ifSwic2NvcGUiOiJhY2Nlc3MifQ.ZC800Z2DqqJdDPOV9LFVCBFQbDOjnOobCgGz8vFNL2s
${refreshtoken}
...                 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzQyMDkxMDcsImlhdCI6MTY3MjQ4MTEwNywic3ViIjp7InN0YWZmX2lkIjo0NCwidXNlcm5hbWUiOiJwb3NodGliYW4ifSwic2NvcGUiOiJyZWZyZXNoIn0.vhz-9S8TNdHDLVBnxXxwFs6151UIkgavUVUBdni92rA


*** Test Cases ***
Create a new address (Post)
    create session    session    ${base_url}
    ${headers}=    Create Dictionary
    ...    access=${accesstoken}
    ...    refresh=${refreshtoken}
    ...    Content-Type=application/json

    ${body}=    Create Dictionary    stateName= "تهران"    stateId= "05"
    ...    cityId= "1771"
    ...    cityName= "تهران"
    ...    regionCode= "string"
    ...    nbName= "string"
    ...    nbId= "string"
    ...    street= "سی متری نیرو هوایی"
    ...    alley=""
    ...    plaque= "16"
    ...    unit= "8"    tel= "09124988430"    postalCode= "168994449"    isDefault= true

    ${response}=    Post Request    session    /create    data=${body}    headers=${headers}

    Log To Console    ${response.content}
    Log To Console    ${response.status_code}

    #validatioin
    #    ${status_code}=    convert to string    ${response.status_code}
    #    Should Be Equal    ${status_code}    200
    #    ${res_body}=    convert to string ${response.content}
    #    should contain    ${res_body}    "sssss"

Update Address
    create session    session    ${base_url}
    ${headers}=    Create Dictionary
    ...    access=${accesstoken}
    ...    refresh=${refreshtoken}
    ...    Content-Type=application/json

    ${body}=    Create Dictionary    stateName= "تهران"    stateId= "05"
    ...    cityId= "1771"
    ...    cityName= "تهران"
    ...    regionCode= "string"
    ...    nbName= "string"
    ...    nbId= "string"
    ...    street= "سی متری نیرو هوایی"
    ...    alley=""
    ...    plaque= "16"
    ...    unit= "8"    tel= "09124988430"    postalCode= "168994449"    isDefault= true

    ${response}=    Put Request    session    /update_fields/100    data=${body}    headers=${headers}

    Log To Console    ${response.content}
    Log To Console    ${response.status_code}

Get Customer Addressess
    create session    mysession    ${base_url}
     ${headers}=    Create Dictionary
    ...    access=${accesstoken}
    ...    refresh=${refreshtoken}
    ...    Content-Type=application/json
    ${response}=    Get Request    mysession    /customer_addresses   headers=${headers}

    Log To Console    ${response.content}
    Log To Console    ${response.status_code}

    #validatioin
    ${status_code}=    convert to string    ${response.status_code}
    Should Be Equal    ${status_code}    200
