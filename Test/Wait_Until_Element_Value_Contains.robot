*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Value Contains
    Wait Until Element Value Contains    input_01    Hello

Value Does Not Contain
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Value Contains    id=input_01    Potato    2s
    Should Contain    ${ErrorMsg}    Value 'Potato' did not appear in 2 seconds to element 'id=input_01'. It's value was 'Hello World'
