*** Settings ***

Documentation    This file test the valid credential detail 

Resource    ../comman_functionality.resource

*** Variables ***
${FRAME_LOCATOR}    (//iframe[@data-bind="location: $data, iframeName: $data.name, "])[3]
${FIRST_NAME_LOCATOR}    name=form_fname
${MIDDLE_NAME_LOCATOR}    name=form_mname
${LAST_NAME_LOCATOR}    name=form_lname
${DOB_locator}    name=form_DOB
${GENDER_LOCATOR}    name=form_sex
${CREATE_PATIENT_LOCATOR}    name=create
${CONFIRM PATIENT FRAME_LOCATOR}    //iframe[@class="w-100 h-100 modalIframe"]
${CONFIRM_CREATE_NEW _PATIENT_LOCATOR}    //input[@value="Confirm Create New Patient"]
${HAPPY_BIRTHDAY_ALERT_LOCATOR}    //div[@class="closeDlgIframe"]
${VERIFY_PATIENT_DETAIL_LOCATOR}    //h2[contains(text(),'Medical Record Dashboard')]

*** Keywords ***
Switch Frame (Add Patient) 
    Select Frame    ${FRAME_LOCATOR}
    
Enter First Name
    [Arguments]    ${first_name}
    Input Text    ${FIRST_NAME_LOCATOR}    ${first_name}
    
Enter Middle Name
    [Arguments]    ${middle_name}
    Input Text    ${MIDDLE_NAME_LOCATOR}    ${middle_name}
    
Enter Last Name
    [Arguments]    ${last_name}
    Input Text    ${LAST_NAME_LOCATOR}    ${last_name}
    
Enter DOB
    [Arguments]    ${DOB}
    Input Text    ${DOB_locator}    ${DOB}    

Select Gender
    [Arguments]    ${gender}
    Select From List By Label    ${GENDER_LOCATOR}    ${gender}    
    
Click Create Patient 
    Click Element    ${CREATE_PATIENT_LOCATOR}    
    
Switch Out Frame(Add Patient)
    Unselect Frame

Switch To Confirm Create New Frame
    Select Frame    ${CONFIRM PATIENT FRAME_LOCATOR}

Click Confirm Create New Patient
    Click Element    ${CONFIRM_CREATE_NEW _PATIENT_LOCATOR}
        
Switch Out Confirm Create New Frame
    Unselect Frame
    
Validate and Handle Alert Message
    [Arguments]    ${alertText}    
    #Alert Should be present    ${alertText}    
    ${actual text}    Handle Alert    
    Should Contain    ${actual text}    ${alertText}
    

Handle Happy Birthday Message
    Run Keyword And Ignore Error     Click Element     ${HAPPY_BIRTHDAY_ALERT_LOCATOR}
    
Verify Add Patient Detail
    [Arguments]    ${patient name}
    Element Should Contain     ${VERIFY_PATIENT_DETAIL_LOCATOR}    ${patient name}
    

    

    





