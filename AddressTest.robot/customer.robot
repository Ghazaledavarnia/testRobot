*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}
...    https://devpapi.aasood.com/customer/api/v1
${access}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzQ2NTIxOTAsImlhdCI6MTY3NDY1MDk5MCwic3ViIjp7InVzZXJfaWQiOjIwNzg2LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTEyNDk4ODQzMCJ9LCJzY29wZSI6ImFjY2VzcyIsImV4cGlyZWQiOmZhbHNlfQ.jTEeRzMqp3lPvFFIbgSdUgRWf4mfUztGjIZPAqQOST8
${refresh}   eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzYzNzg5OTAsImlhdCI6MTY3NDY1MDk5MCwic3ViIjp7InVzZXJfaWQiOjIwNzg2LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTEyNDk4ODQzMCJ9LCJzY29wZSI6InJlZnJlc2giLCJleHBpcmVkIjpmYWxzZX0.CzstozqIhes8aNAb0DqZnGbZDWmD2G9Ro0uHyZxg_EI
${header} =   Create Dictionary   access=${access}  refresh=${refresh}  Content-Type= application-json


*** Test Cases ***
Get Customer Profile
    Create Session    session    ${base_url}    headers=${header}
    # ${customerMobileNumber}=09124988430
    ${response}=    GET On Session    session    /profile/customer/09124988430
    Status Should Be    200    ${response}
