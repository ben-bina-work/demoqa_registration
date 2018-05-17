*** Settings ***
Resource          ../Settings/Libraries.robot

*** Keywords ***

Get Row    
    [Arguments]         ${r}
    ${rowValue}=      Get Row Values   Sheet1   ${r}    #includeEmptyCells=False
    #Log To Console      ${rowValue}
    ${name}=    Get Value from Column   ${rowValue}     0
    ${role}=    Get Value from Column   ${rowValue}     1
    ${dob}=     Get Value from Column   ${rowValue}     2
    ${salary}=  Get Value from Column   ${rowValue}     3 
    Log To Console      | Name: ${name} | Role: ${role} | DOB: ${dob} | Salary: ${salary}

###     Methods   

Get Value from Column
    [Arguments]     ${rowValue}     ${colValue}
    ${objLblValue} =	Get From List	${rowValue}	${colValue}
    ${value}=       Get From List   ${objLblValue}    1
    [Return]     ${value}


Read Users From API
    ${result}=      Get     ${rest_url}/users
    Should Be Equal  ${result.status_code}  ${200}
    Log     Status Code: ${result.status_code}
    Log To Console  Status Code: ${result.status_code}   
    ${json_string} =  Set Variable   ${result.json()}
    Close Browser
    #Log To Console  ${json_string}
    ${item_count}=  Get Length	${json_string}
    Log To Console      %% Count: ${item_count}
    Should Be Equal     ${item_count}   ${10}

    ${json}=    evaluate    json.dumps(${json_string})    json
    Write json result to a file     ${json}   
    
    :FOR  ${i}  IN RANGE  0  ${item_count}
    \   ${item}=    Get From List   ${json_string}      ${i}
    \   ${username} =  Get From Dictionary  ${item}  username
    \   ${name} =  Get From Dictionary  ${item}  name
    \   ${email} =  Get From Dictionary  ${item}  email
    #\   Log                      Name: ${name} - email: ${email} - username:  ${username} 
    \   Log To Console          | Name: ${name} | email: ${email} | username:  ${username} |


Write json result to a file
    [Arguments]     ${json_string}
    Create File  ${EXECDIR}/file_with_variable.json  ${json_string}

Read Posts
    ${posts}=   Get Binary File    ${EXECDIR}/Test Cases/Utillity/posts.json   
    ${object}=  Evaluate  json.loads('''${posts}''',strict=False)   json
    ${item}=    Get From List   ${object}      ${0}
    ${title} =  Get From Dictionary  ${item}  title
    Log To Console      ${title}
Read Photos
    ${posts}=   Get Binary File    ${EXECDIR}/Test Cases/Utillity/photos.json   
    ${object}=  Evaluate  json.loads('''${posts}''',strict=False)   json
    ${item}=    Get From List   ${object}      ${0}
    ${title} =  Get From Dictionary  ${item}  url
    Log To Console      ${title}

Open API Endpoint
    Open Browser    about:blank    chrome
    Maximize Browser Window
    Go To    ${rest_url}
Send Request
    ${result}=      get     ${rest_url}
    Should Be Equal  ${result.status_code}  ${200}
    Log     Status Code: ${result.status_code}
    Log To Console  Status Code: ${result.status_code}    
    Close Browser
    ${json_string} =  Set Variable   ${result.json()}
    
   Write json result to a file     ${json_string}     

   
Show Status
    [Arguments]     ${role}
    Log To Console      Role Selection Test Case
    ${Status}=    Run Keyword If    '${role}'== 'Admin'    Set Variable    <Yes>  ELSE  Set Variable  <No>

    [Return]        ${Status}
