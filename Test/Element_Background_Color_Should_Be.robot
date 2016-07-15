*** Settings ***
Documentation     Unit tests for the keyword *Element Background Color Should Be*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Expected Color
    [Documentation]    This test validates the background color of div_01
    Element Background Color Should Be    id=div_01    rgba(255, 0, 0, 1)

Unexpected Color
    [Documentation]    This test attempts to validate the background color of div_01 using the incorrect color as parameter and ensures it throws an error
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Background Color Should Be    id=div_01    rgba(255, 255, 255, 1)
    Should Contain    ${ErrorMsg}    Element locator 'id=div_01' css property 'background-color' had a value of 'rgba(255, 0, 0, 1)' while it should have been 'rgba(255, 255, 255, 1)'
