*** Settings ***
Library     RequestsLibrary


*** Variables ***
#ENDPOINTS
${BASE_URL}         https://devpapi.aasood.com/customer/api/v1
${CUSTOMER}         /profile/customer
#HEADERS
${ACCESS}
...                 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzQ2NTIxOTAsImlhdCI6MTY3NDY1MDk5MCwic3ViIjp7InVzZXJfaWQiOjIwNzg2LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTEyNDk4ODQzMCJ9LCJzY29wZSI6ImFjY2VzcyIsImV4cGlyZWQiOmZhbHNlfQ.jTEeRzMqp3lPvFFIbgSdUgRWf4mfUztGjIZPAqQOST8
${REFRESH}
...                 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzYzNzg5OTAsImlhdCI6MTY3NDY1MDk5MCwic3ViIjp7InVzZXJfaWQiOjIwNzg2LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTEyNDk4ODQzMCJ9LCJzY29wZSI6InJlZnJlc2giLCJleHBpcmVkIjpmYWxzZX0.CzstozqIhes8aNAb0DqZnGbZDWmD2G9Ro0uHyZxg_EI
${CONTENT_TYPE}     application/json
#CUSTOMR DETAILS
${MOBILE_NUMBER}    09124988430


*** Test Cases ***
Get Customer Profile
    ${HEADERS}=    Create Dictionary
    ...    access=${ACCESS}
    ...    refresh=${REFRESH}
    ...    Content-Type=${CONTENT_TYPE}

    Create Session    Get profile    ${base_url}
    ${response}=    Get Request
    ...    Get profile
    ...    uri=${CUSTOMER}?customerMobileNumber=${MOBILE_NUMBER}
    ...    headers=${HEADERS}
    Should Be Equal As Strings    ${response.status_code}    200
