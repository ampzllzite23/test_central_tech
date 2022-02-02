*** Setting ***
Resource    ../keywords/search_api_keywords.robot
Variables   ../resources/search_api_testdata.yaml

*** Test Cases ***
SEARCH_API_TC01
   [Tags]  success
   [Documentation]  To ensure search product is success with all valid values and searchQuery in Thai language
    GIVEN Set Test Variables '${TEST_NAME}'
    AND Call Get Search Product List
    THEN Check Data In Json

SEARCH_API_TC02
   [Tags]  success
   [Documentation]  To ensure search product is success with all valid values and searchQuery in English language
    GIVEN Set Test Variables '${TEST_NAME}'
    AND Call Get Search Product List
    THEN Check Data In Json

SEARCH_API_TC04
   [Tags]  success
   [Documentation]  To ensure search product is fail with searchQuery is product is not in list
    GIVEN Set Test Variables '${TEST_NAME}'
    AND Call Get Search Product List

SEARCH_API_TC05
   [Tags]  success
   [Documentation]  To ensure search product is fail with limit is invalid
    GIVEN Set Test Variables '${TEST_NAME}'
    AND Call Get Search Product List

SEARCH_API_TC11
   [Tags]  success
   [Documentation]  To ensure search product api can search with all valid values using POST method
    GIVEN Set Test Variables '${TEST_NAME}'
    AND Call Post Search Product List