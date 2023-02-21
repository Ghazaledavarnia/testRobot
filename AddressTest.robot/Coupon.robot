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


*** Test Cases ***
Add_Coupon_To_Cart
    ${headers}=    Create Dictionary
    ...    access=${ACCESS}
    ...    refresh=${REFRESH}
    ...    Content-Type=${CONTENT_TYPE}

    ${body}=    Create Dictionary
    ...    token=STRING-BEA5

    Create Session    addCoupon    ${base_url}
    ${response}=    Post Request    addCoupon    /coupon/add    data=${body}    headers=${headers}
    Status Should Be    200    ${response.status_code}
