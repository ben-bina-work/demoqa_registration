*** Settings ***
Resource          ../Actions/Registrations_Actions.robot

*** Test Cases ***
Join DemoQA
    Given user opens the website
    When user enters details
    #Then join successful
