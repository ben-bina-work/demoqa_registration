*** Settings ***

*** Variable ***
# Using List Variables
@{My_VARIABLE} =  Hello There  Second  Third

*** Test Case ***
Test List Variable
    Variable Should Exist   @{My_VARIABLE}
    Log To Console      @{My_VARIABLE}[1]

Test List Variable Declared in Test Case
    @{user_names} =  Set Variable   Ben  Jason  Robert  King  Tony
    Log To Console      @{user_names}[4]

Creating List of variables
    @{pwd} =  Create List  bina  "teasd"  "#$"  1234
    Log To Console  @{pwd}[2]
    Log To Console  @{pwd}[1]

 






