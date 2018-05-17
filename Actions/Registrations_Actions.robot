*** Settings ***
Resource          ../Settings/Libraries.robot
Resource          ../Locators/Registrattion_Locators.robot
Resource          ../Settings/RegistrationKeywords.robot

*** Keywords ***
user opens the website
    Open Browser    about:blank    chrome
    Maximize Browser Window
    Go To    ${prod_url}

When user enters details
    ${tmp}=    Generate Random String    8    [STRING]
    Send and Validate Name    Ben    ${tmp}
    Send and Validate Marital Status    married    3

Then join successful
    Log    To be Implemented
    Close Browser

