*** Settings ***
Resource    ../Resource/comman_functionality.resource  # we added this path to add launch browser resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/DashboardPage.resource

Test Setup    Launch Browser
Test Teardown    End Browser 
Test Template    Verify_valid_credentials_template

*** Test Cases ***
TC_1    admin    pass    English (Indian)    Flow Board
TC_2    physician    physician    English (Indian)    Flow Board
TC_3    accountant    accountant    English (Indian)    Flow Board


*** Keywords ***
Verify_valid_credentials_template
    [Arguments]    ${username}    ${password}    ${language}    ${Expected_value}
    Enter Username    ${username}
    Enter Password    ${password}    
    Select Language    ${language}    
    Click login
    Dashboard Page Should Contain    ${Expected_value}
    MouseOver On Name
    Click Logout
    