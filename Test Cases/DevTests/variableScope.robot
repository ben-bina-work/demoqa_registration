*** Settings ***
#${MY_VARIABLE} = Some Information At Init
Resource            variableScopeKeywords.robot

*** Variable ***
${MY_VARIABLE} =  Set Variable  From Script Files

*** Test Case ***
Create and Log Variable
    Log To Console  ${MY_VARIABLE}
    