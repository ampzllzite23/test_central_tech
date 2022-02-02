*** Settings ***
Library     Selenium2Library
Library     RequestsLibrary
Library     String
Library     JSONLibrary
Library     BuiltIn
Resource    ../resources/common_variables.robot
Variables    ../resources/search_api_testdata.yaml

*** Keywords ***
Set Test Variables '${data}'
    Set Test Variable  ${x-newrelic-id}  ${${data}.x_newrelic_id}
    Set Test Variable  ${x-store-code}  ${${data}.x_store_code}
    Set Test Variable  ${searchQuery}  ${${data}.searchQuery}
    Set Test Variable  ${limit}  ${${data}.limit}
    Set Test Variable  ${page}  ${${data}.page}
    Set Test Variable  ${https_status}  ${${data}.https_status}

Call Get Search Product List
    ${param}=      Create Dictionary    searchQuery=${searchQuery}    limit=${limit}    page=${page}
    ${header}=    Create Dictionary   x-newrelic-id=${x-newrelic-id}  x-store-code=${x-store-code}
    ${resp}=   GET      ${endpoint}    ${param}  headers=${header}  expected_status=${https_status}
    Should Be Equal As Integers     ${resp.status_code}     ${https_status}
    Set Test Variable   ${json}    ${resp.json()}

Check Data In Json
    ${respone_name}     Convert To Upper Case   ${json["products"]["products"][3]["name"]}
    ${search_input}     Convert To Upper Case     ${searchQuery}
    Should Contain  ${respone_name}  ${search_input}

Call Post Search Product List
    ${param}=      Create Dictionary    searchQuery=${searchQuery}    limit=${limit}    page=${page}
    ${header}=    Create Dictionary   x-newrelic-id=${x-newrelic-id}  x-store-code=${x-store-code}
    ${resp}=   POST      ${endpoint}    ${param}  headers=${header}     expected_status=${https_status}
    Should Be Equal As Integers     ${resp.status_code}     ${https_status}
