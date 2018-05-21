*** Test Cases ***
All test cases
    [Template]    Test System
    3     4    7    # Test Case 1
    45    55   100    # Test Case 2
    34    6    40    # Test Case 3
    5     5    10    # Test Case 4

Templated test case
    [Template]      Example keyword
    "First Agument"       "Second Argument"    
 

*** Keywords ***
Test System
    [Arguments]    ${input_1}    ${input_2}    ${expected}
    ${result} =  Evaluate    (${input_1}+${input_2})
    ${expected} =  Convert To Number  ${expected}
    Should Be Equal	${result}	 ${expected}	"|Sum Should be ${expected} but is ${result} n1:${input_1} n2:${input_2}|"

Example keyword
        [Arguments]     ${a}        ${b}
        Log To Console      ${a}-${b}
