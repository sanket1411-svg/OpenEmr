*** Settings ***

Library    DatabaseLibrary

Suite Setup    Connect To Database    pymysql    dbName=dbfree_db
...    dbUsername=dbfree_db    dbPassword=12345678    dbHost=db4free.net    dbPort=3306


Suite Teardown    Disconnect From Database


*** Test Cases ***
TC1_DB
    Check If Exists In Database    SELECT * FROM country WHERE name='aruba1'    
    
    ${rowcount}    Row Count    SELECT * FROM country     
    Log To Console    ${rowcount}
    
    Row Count Is 0    SELECT * FROM city
    Row Count Is Equal To X        SELECT * FROM country    239
    
TC2_Update
    Execute Sql String    update country set name='aurab2' where name='auraba5'    
    Check If Exists In Database    SELECT * FROM country WHERE name='aruba2'    
    
TC3_CheckData
    ${output}    Query    SELECT * FROM country    
    Log To Console    ${output}    
    Log To Console    ${output}[0]    
    Log To Console    ${output}[0][2]    

    