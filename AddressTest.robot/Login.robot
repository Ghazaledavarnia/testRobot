*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem



*** Variables ***
${base_url}      https://devapi.aasood.com/customer/api/v1/

*** Test Cases ***
Checking Login Password
   ${auth}=    Create List    09302828801  Zahra100%
   Create Session    session    ${base_url} 

   ${response}=  Post Request    session    /auth/login/password 
   Log To Console    {response.content}
   