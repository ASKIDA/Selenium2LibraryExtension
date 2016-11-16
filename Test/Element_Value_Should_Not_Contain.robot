*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Value Does Not Contain
    Element Value Should Not Contain    id=input_01    Potato
    Element Value Should Not Contain    id=input_02    Banana
    Element Value Should Not Contain    id=input_03    PineApple

Value Contains
    ${ErrorMsg}=    Run Keyword And Expect Error    *    element value should not contain    id=input_01    Hello
    Should Contain    ${ErrorMsg}    Value 'Hello' was found in element 'id=input_01' while it shouldn't have
