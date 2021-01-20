*** Settings ***

Resource    ../Resource/comman_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/DashboardPage.resource    
Resource    ../Resource/Pages/PatientFinderPage.resource
Resource    ../Resource/Pages/SearchOrAdd_Patient.resource

Test Setup    Launch Browser
Test Teardown    End Browser

*** Test Cases ***
TC1_validcredential  
    Enter Username    admin
    Enter Password    pass
    Select Language    English (Indian)
    Click login
    Dashboard Page Should Contain    Flow Board
    
    MouseOver On Patient/Client
    Click On New/Search    
    
    Switch Frame (Add Patient) 
    Enter First Name    sanket    
    Enter Middle Name   s
    Enter Last Name    tambe
    Enter DOB   2021-01-19    
    Select Gender   Male
    Click Create Patient   
    Switch Out Frame(Add Patient)
    Switch To Confirm Create New Frame
    Click Confirm Create New Patient     
    Switch Out Confirm Create New Frame
    sleep    5s
    Validate and Handle Alert Message    New Due Clinical Reminders 
    Handle Happy Birthday Message       
    Switch Frame (Add Patient)
    Verify Add Patient Detail        Medical Record Dashboard - Sanket Tambe    
    Switch Out Frame(Add Patient)
    
    