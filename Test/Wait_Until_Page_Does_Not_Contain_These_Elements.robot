*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Does Not Contain These Elements
    Wait Until Page Does Not Contain These Elements    3s    id=input_08    id=input_09

Does Contains These Elements
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Page Does Not Contain These Elements    2s    id=input_01    id=input_68
    Should Contain    ${ErrorMsg}    Element 'id=input_01' shouldn't have been there
