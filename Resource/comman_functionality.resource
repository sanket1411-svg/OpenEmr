*** Settings ***
Documentation    Thos file contains browser activity keywords
...    and screenshot directory
Library    OperatingSystem    
Library    SeleniumLibrary    screenshot_root_directory=Screenshot    #screenshots on failure is saved in Screenshot folder      

*** Variables ***
${BROWSER_NAME}    chrome        #global var upper case BROWSER_NAME
${URL}    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default

*** Keywords ***
Launch Browser
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=${URL}    
    
End Browser
    #Capture Page Screenshot    
    Close Browser