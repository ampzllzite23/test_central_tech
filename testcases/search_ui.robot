*** Setting ***
Resource    ../keywords/search_ui_keywords.robot
Test Teardown    Selenium2Library.Close Browser

*** Test Cases ***
SEARCH_UI_TC01
    [Tags]  success
    [Documentation]     To verify user can search product in thai language
    GIVEN Go To Officemate website
    AND Verify Search Textbox
    AND Input Search Text '${TEST_NAME}'
    THEN Verify Result After Search '${TEST_NAME}'

SEARCH_UI_TC03
    [Tags]  success
    [Documentation]     To verify user can search product in english language
    GIVEN Go To Officemate website
    AND Verify Search Textbox
    AND Input Search Text '${TEST_NAME}'
    THEN Verify Result After Search '${TEST_NAME}'

SEARCH_UI_TC05
    [Tags]  success
    [Documentation]     To verify user can search product in english language with uppercase character
    GIVEN Go To Officemate website
    AND Verify Search Textbox
    AND Input Search Text '${TEST_NAME}'
    THEN Verify Result After Search '${TEST_NAME}'

SEARCH_UI_TC08
    [Tags]  dev
    [Documentation]     To verify user can search product is not in product list
    GIVEN Go To Officemate website
    AND Verify Search Textbox
    AND Input Search Text '${TEST_NAME}'
    THEN Verify Result After Search '${TEST_NAME}'