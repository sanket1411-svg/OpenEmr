*** Settings ***

Documentation    This file test the valid credential detail 

Resource    ../comman_functionality.resource

*** Variables ***
${Name_LOCATOR}    xpath=//span[@data-bind="text:lname"]
${LOGOUT_LOCATOR}    xpath=//li[text()='Logout'] 

*** Keywords ***
Dashboard Page Should Contain
    [Arguments]    ${pagetext}
    Page Should Contain    ${pagetext}    
    
MouseOver On Name
    Mouse Over    ${Name_LOCATOR}    
    
Click Logout
    Click Element    ${LOGOUT_LOCATOR}