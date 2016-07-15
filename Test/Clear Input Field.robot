*** Settings ***
Documentation     Unit tests for the keyword *Clear Input Field*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Method 0
    [Documentation]    This test uses the method 0 of Clear Input Field to clear the input field input_01. It then ensures it's empty using Get Value
    [Tags]    Clear Input Field
    Clear Input Field    id=input_01    0
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Method 1
    [Documentation]    This test uses the method 1 of Clear Input Field to clear the input field input_01. It then ensures it's empty using Get Value
    Clear Input Field    id=input_01    1
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Method 2
    [Documentation]    This test uses the method 2 of Clear Input Field to clear the input field input_01. It then ensures it's empty using Get Value
    Clear Input Field    id=input_01    2
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Clear Invalid Element
    [Documentation]    This test attempts to clear an invalid element and ensures an error is thrown
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Clear Input Field    id=div_01
    Should Contain    ${ErrorMsg}    InvalidElementStateException

Clear Read Only Field
    [Documentation]    This test attempts to clear a read-only input field and ensures it throws an error
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Clear Input Field    id=input_03
    Should Contain    ${ErrorMsg}    InvalidElementStateException
