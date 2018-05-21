*** Test Case ***
Templated test case
    [Template]      Example keyword
    "First Agument"       "Second Argument"       

TDD Gherkin
    [Template]       I canot login with invalid credentials
    "Ben"           "Bina"
    "Mark"          "Anthony"
    

*** Keywords ***
Example keyword
        [Arguments]     ${a}        ${b}
        Log To Console      ${a}-${b}

I canot login with invalid credentials
        [Arguments]     ${userName}  ${password}
        Given I have userName  ${userName}
        And I have password  ${password}
        Then join unsuccessful

Given I have userName
         [Arguments]     ${userName}
         Log To Console  My User: ${userName}
And I have password
         [Arguments]     ${password}
         Log To Console  My password: ${password}
Then join unsuccessful
         Log To Console  unsuccessful