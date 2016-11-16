*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Method 0
    [Tags]    Clear Input Field
    Clear Input Field    id=input_01    0
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Method 1
    Clear Input Field    id=input_01    1
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Method 2
    Clear Input Field    id=input_01    2
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Clear Invalid Element
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Clear Input Field    id=div_01
    Should Contain    ${ErrorMsg}    InvalidElementStateException

Clear Read Only Field
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Clear Input Field    id=input_03
    Should Contain    ${ErrorMsg}    InvalidElementStateException
