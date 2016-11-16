*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Contains One of These Elements
    Wait Until Page Contains One Of These Elements    2s    id=input_04    id=input_02

Does Not Contain One Of These Elements
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Page Contains One Of These Elements    3s    id=input_08    id=input_09
    Should Contain    ${ErrorMsg}    Couldn't find any of the expected elements from '('id=input_08', 'id=input_09')'
