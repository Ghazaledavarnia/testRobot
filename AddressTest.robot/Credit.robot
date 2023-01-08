*** Settings ***
Library     RequestsLibrary
Library    OperatingSystem

*** Variables ***

${base_url}    https://devapi.aasood.com/credit/api/v1/

*** Test Cases ***
Create credit 
    Create Session    session    ${base_url}
   ${response}=    Post Request    session    /create_credit
   ${header}=   Create Dictionary      access=    refresh=    Content-Type=application-json 
   #${body}=    Create Directory   detail
   Log to Console    ${response.content}
   Log to Console    ${response.status_code}
   Log to console    ${response.headers}

   #Vallidation
   
