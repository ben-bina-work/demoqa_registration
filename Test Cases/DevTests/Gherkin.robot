*** Test Cases ***
Given I Put  Ben
Then I put  PWD


*** Keywords ***
Example
    [Arguments]  ${un}  ${pwd}
Given I Put  ${un}
    Log To Console  ${un}