*** Settings ***
Library           ExcelLibrary
Library           String
Library           Collections
Library           DateTime

*** Test Cases ***
Read Data row by row
    Open Excel      users.xls
    ${cols}=    Get Column Count    Sheet1
    ${rows}=    Get Row Count      Sheet1    
    :FOR  ${r}  IN RANGE    1   ${rows}
    \   Get Row     ${r}
*** Keywords ***

Get Row    
    [Arguments]         ${r}
    ${rowValue}=      Get Row Values   Sheet1   ${r}    #includeEmptyCells=False
    #Log To Console      ${rowValue}
    ${name}=    Get Name From Row   ${rowValue}
    ${role}=    Get Role From Row   ${rowValue}
    ${dob}=     Get DOB From Row    ${rowValue}
    ${salary}=  Get Value from Column  ${rowValue}  3 
    Log To Console      | Name: ${name} | Role: ${role} | DOB: ${dob} | Salary: ${salary}

###     Methods   
Get Name From Row
    [Arguments]        ${rowValue}
    ${objLblValue} =	Get From List	${rowValue}	0
    ${value}=       Get From List   ${objLblValue}    1
    [Return]     ${value}

Get Role From Row
    [Arguments]        ${rowValue}
    ${objLblValue} =	Get From List	${rowValue}	1
    ${value}=       Get From List   ${objLblValue}    1
    [Return]     ${value}

Get DOB From Row
    [Arguments]        ${rowValue}
    ${objLblValue} =	Get From List	${rowValue}	2
    ${value}=       Get From List   ${objLblValue}    1     
    Log To Console      :::${value} 
    ${date}=        Convert Date	${value}    %Y-%m-%d 
    [Return]     ${date}

Get Value from Column
    [Arguments]     ${rowValue}     ${colValue}
    ${objLblValue} =	Get From List	${rowValue}	${colValue}
    ${value}=       Get From List   ${objLblValue}    1
    [Return]     ${value}