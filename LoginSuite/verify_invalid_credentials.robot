*** Settings ***
    
Resource    ../Resource/comman_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource

Library    DataDriver    file=../Test_Data/OpenEmr.xlsx    sheet_name=Verify_Invalid_Credentials_temp

Test Setup    Launch Browser
Test Teardown    End Browser
Test Template    Verify_Invalid_credentials_template

*** Test Cases ***
TC1

*** Keywords ***
Verify_Invalid_credentials_template
    [Arguments]    ${username}    ${password}    ${language}    ${Expected_value}      
    Enter Username    ${username}
    Enter Password    ${password}    
    Select Language     ${language}                
    Click login
    Verify Error Message    ${Expected_value}      #Invalid username or password123        
    
 
    

#when there are more than one test cases in suite each time launch browser
# and end browser is called so to happen like that we use test setup and test teardown