*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_url}         https://devapi.aasood.com/coupon/api/v1

#HEADERS
${ACCESS}
...                 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzY4OTA3MDksImlhdCI6MTY3Njg4OTUwOSwic3ViIjp7InVzZXJfaWQiOjIwNzg2LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTEyNDk4ODQzMCJ9LCJzY29wZSI6ImFjY2VzcyIsImV4cGlyZWQiOmZhbHNlfQ.E0bNQZWrEz3OMHk692t8ezNSgiw8G-HGMDZW7TNi70k

${REFRESH}
...                 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Nzg2MTc1MDksImlhdCI6MTY3Njg4OTUwOSwic3ViIjp7InVzZXJfaWQiOjIwNzg2LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTEyNDk4ODQzMCJ9LCJzY29wZSI6InJlZnJlc2giLCJleHBpcmVkIjpmYWxzZX0.wSurxqw1YBO8bILEu4-ViBLEmmMsifrBq3Ylw_3Jta4

${CONTENT_TYPE}     application/json

${HEADERS}          Create Dictionary    Content-Type=${CONTENT_TYPE}    access=${ACCESS}    refresh=${REFRESH}


*** Test Cases ***
Add_Coupon_To_Cart
    Create Session    coupon    ${base_url}    headers=${HEADERS}
    ${body}=    Create Dictionary    token=aasood
    ${response}=    POST On Session    coupon    /coupon/add    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200

    #VALIDATIONS
    ${response_content}=    Convert To String    ${response.Content}
    Log To Console    message
