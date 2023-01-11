*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem


*** Variables ***
${base_url}
...             https://devapi.aasood.com/credit/api/v1
${access}
...    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzM0NDQzNjYsImlhdCI6MTY3MzQ0MzE2Niwic3ViIjp7InVzZXJfaWQiOjIwMDA4LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTMwMjgyODgwMSJ9LCJzY29wZSI6ImFjY2VzcyIsImV4cGlyZWQiOmZhbHNlfQ.iP7tLJ2smK7BoIVY8Zfs9vdv_reOdLFew-1SR42DATo
${refresh}
...    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzUxNzExNjYsImlhdCI6MTY3MzQ0MzE2Niwic3ViIjp7InVzZXJfaWQiOjIwMDA4LCJjdXN0b21lcl90eXBlIjpbIkIyQiJdLCJwaG9uZV9udW1iZXIiOiIwOTMwMjgyODgwMSJ9LCJzY29wZSI6InJlZnJlc2giLCJleHBpcmVkIjpmYWxzZX0.5ZR2U4wHvuFtNjElP3Qam4WFxU3T3dNBk6ZfrmUAaKw


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

    ${body}=    Create Dictionary
    ...    amount=10000000
    ...    paymentType="cheque"
    ...    description= "string"
    ...    accepted= "pending"
    ${response}=    Post Request    session    /request_credit    data=${body}    headers=${headers}
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}

    #Vallidation
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}    200

get remaining credit
    Create Session    session    ${base_url}
    ${headers}=    Create Dictionary    access=${access}    refresh=${refresh}    content-Type=application/json
    ${response}=    Get Request    session    /get_remaining_credit
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

get credit return List
    Create Session    session    ${base_url}
    ${headers}=    Create Dictionary    access=${access}    refresh=${refresh}    content-Type=application/json
    ${body}=    Create Dictionary    customerId =0    page =1    perPage =1
    ...    orderNumber= 0
    ...    paymentStatus =true
    ...    customerName =string
    ...    customerName =string
    ...    customerName =string
    ...    customerName =string
    ...    dateFrom=string
    ...    dateTo =string status= string

    ${response}=    Post Request    session    /get_credit_return_list    data=${body}    headers=${headers}
