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
    #${valid}=    Run Keyword And Return    Page Should Contain Element    ${requiredValidationMessage}
    #Log    ${valid}
    #Run Keyword If    '${valid}'=='PASS'    Input Text    ${txtLastName}    tmp
    Click Element    ${txtLastName}
    Input Text    ${txtLastName}    ${lastName}
