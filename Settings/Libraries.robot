*** Settings ***
Library           ExtendedSelenium2Library
Library           HttpLibrary
Library           ExcelLibrary
Library           OperatingSystem
Library           String
Library           Collections
Library           DateTime
Library           Collections
Library           requests

*** Variables ***
${prod_url}       http://demoqa.com/registration/
${rest_url}       https://jsonplaceholder.typicode.com
