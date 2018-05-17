*** Settings ***
Resource    ../../Actions/Utility_actions.robot 

*** Test Case ***
Read Rest API
    Read Users from API
Read Photos form file
    Read Photos
Read Posts form the file
    Read Posts
Condition Test
    ${status}=  Show Status     Admin
    Log To Console      ::::${status}
    ${status}=  Show Status     Customer
    Log To Console      ::::${status}