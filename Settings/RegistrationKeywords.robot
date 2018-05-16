*** Settings ***
Resource          Libraries.robot
Resource          ../Locators/Registrattion_Locators.robot

*** Keywords ***
Send and Validate Name
    [Arguments]    ${firstName}    ${lastName}
    Element Should Not Be Visible    ${requiredValidationMessage}
    Click Element    ${txtFirstName}
    Click Element    ${txtLastName}
    Wait Until Page Contains Element    ${requiredValidationMessage}
    Input Text    ${txtFirstName}    ${firstName}
    Click Element    ${txtLastName}
    Click Element    ${txtFirstName}
    ${valid}=    Run Keyword And Return Status    Page Should Contain Element    ${requiredValidationMessage}
    Log    ${valid}
    Run Keyword If    ${valid}    Input Text    ${txtLastName}    ${lastName}
    Click Element    ${txtLastName}

Send and Validate Marital Status
    [Arguments]    ${text}    ${numberOfOptions}
    Log    ${optionValue}
    ${optionValue}=    Set Variable    ${text}
    Log    ${optionValue}
    ${radioCount}    Get Matching Xpath Count    ${radioButtons}
    Should Be True    ${radioCount}    ${numberOfOptions}
    Click Element    //input[@value='${optionValue}']
