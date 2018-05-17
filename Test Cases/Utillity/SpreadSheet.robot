*** Settings ***
Resource    ../../Actions/Utility_actions.robot 

*** Test Cases ***
Read Data row by row
    Open Excel      Test Cases/Utillity/users.xls
    ${cols}=    Get Column Count    Sheet1
    ${rows}=    Get Row Count      Sheet1    
    :FOR  ${r}  IN RANGE    1   ${rows}
    \   Get Row     ${r}

