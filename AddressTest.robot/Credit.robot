*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem


*** Variables ***
${base_url}     https://devapi.aasood.com/credit/api/v1/
${access}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzMyNTcwMTYsImlhdCI6MTY3MzI1NTgxNiwic3ViIjp7InVzZXJfaWQiOjIwMDA4LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTMwMjgyODgwMSJ9LCJzY29wZSI6ImFjY2VzcyIsImV4cGlyZWQiOmZhbHNlfQ.DCBrvl014s7QKYYSeM4xruU60RoQ-7aWMLOExejEhIU
${refresh}   eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzQ5ODM4MTYsImlhdCI6MTY3MzI1NTgxNiwic3ViIjp7InVzZXJfaWQiOjIwMDA4LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTMwMjgyODgwMSJ9LCJzY29wZSI6InJlZnJlc2giLCJleHBpcmVkIjpmYWxzZX0.e7Bnesy4R8tjuwk9T15xYDELdMUQ8w6AN7T62paNlug


*** Test Cases ***
Create credit
    Create Session    session    ${base_url}
    ${response}=    Post Request    session    /create_credit
    ${header}=    Create Dictionary    access=    refresh=    Content-Type=application-json
    #${body}=    Create Directory    detail
    Log to Console    ${response.content}
    Log to Console    ${response.status_code}
    Log to console    ${response.headers}

    #Vallidation

request credit
    Create Session    Session    ${base_url}
    ${headers}=    Create Dictionary    access=${access}
    ...    refresh=${refresh}
    ...    Content-Type=application/json

    ${body}=    Create Dictionary    amount=0    paymentType="pose"    description= "string"    accepted= "pending"
    ${response}=    Post Request    session    /request_credit    data=${body}    headers=${headers}
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}

    #Vallidation
    ${status_code}=     convert to string  ${response.status_code}
    should be equal    ${status_code}   200
    