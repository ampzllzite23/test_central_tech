*** Settings ***
Library     Selenium2Library
Library     Dialogs
Library     String
Library     BuiltIn
Resource    ../resources/common_variables.robot
Variables    ../resources/search_ui_testdata.yaml

*** Keywords ***
Go To Officemate website
    ${opt}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${opt}    add_argument    --headless
    Call Method    ${opt}    add_argument    --disable-notifications
    Create Webdriver    Chrome    chrome_options=${opt}
    Go To   ${officemate_url}

Close Campaign Modal
    Wait Until Element Is Visible   ${modal_campaign}
    Select Frame    ${modal_campaign}
    Click Element   ${close_campaign}

Verify Search Textbox
    Close Campaign Modal
    Wait Until Element Is Visible   ${search_textinput}
    Wait Until Element Is Visible   ${search_button}

Input Search Text '${data}'
    Set Test Variable   ${search_input}     ${${data}.search_input}
    Input Text  ${search_textinput}     ${search_input}
    click element   ${search_button}

Verify Result After Search '${data}'
    ${is_element_visible}=  Run Keyword And Return Status    Wait Until Element Is Visible   ${search_notfound}
    Run Keyword If  '${is_element_visible}' == 'True'   Verify Result Product Is Not In List '${data}'    ELSE    Verify Result Product Is In List
#    Run Keyword If  ${is_element_visible}   ${search_result_product}    Verify Result Product Is In List
#    Run Keyword If  ${is_element_visible}   ${search_notfound}     Verify Result Product Is Not In List

Verify Result Product Is In List
    ${text_result}=    Get Text    ${search_result_product}
    ${result_product}   Convert To Upper Case   ${text_result}
    ${input_product}    Convert To Upper Case   ${search_input}
    Should Contain     ${result_product}   ${input_product}

Verify Result Product Is Not In List '${data}'
    Set Test Variable   ${text_notfound}     ${${data}.text_notfound}
    ${text_result}=    Get Text    ${search_notfound}
    ${result_product}   Convert To Upper Case   ${text_result}
    ${input_product}    Convert To Upper Case   ${search_input}
    Should Contain     ${result_product}   ${text_notfound}"${input_product}"