*** Settings ***

Documentation    This file test the valid credential detail 

Resource    ../comman_functionality.resource

*** Variables ***
${PATIENT/CLIENT_LOCATOR}    xpath=//div[text()='Patient/Client']
${NEW/SEARCH_LOCATOR}    xpath=//div[text()='New/Search']

*** Keywords ***
MouseOver On Patient/Client
    Mouse Over    ${PATIENT/CLIENT_LOCATOR}
    
Click On New/Search
    Click Element    ${NEW/SEARCH_LOCATOR} 