*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}     http://www.google.com


*** Test Cases ***
Get_Google
    Create Session    google    ${base_url}
    ${response}=    Get Request    google    /
    Status Should Be    200
