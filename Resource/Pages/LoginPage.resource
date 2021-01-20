*** Settings ***
Documentation    This file will handle all the operation related to login page


Resource    ../comman_functionality.resource    

*** Variables ***
${USERNAME_LOCATOR}    id=authUser
${PASSWORD_LOCATOR}    id=clearPass
${LANGUAGE_LOCATOR}    name=languageChoice
${LOGIN_LOCATOR}    xpath=//button[@type='submit']
${ERRORMESSAGE_LOCATOR}    //*[contains(text(),"Invalid ")]    

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_LOCATOR}    ${username}
    
Enter Password
    [Arguments]    ${password}
    Input Password    ${PASSWORD_LOCATOR}    ${password}
    
Select Language
    [Arguments]    ${language}
    Select From List By Label    ${LANGUAGE_LOCATOR}    ${language}    
    
Click login
    Click Element    ${LOGIN_LOCATOR}            
    
Verify Error Message
    [Arguments]    ${error_message}
    Element Should Contain    ${ERRORMESSAGE_LOCATOR}    ${error_message}          