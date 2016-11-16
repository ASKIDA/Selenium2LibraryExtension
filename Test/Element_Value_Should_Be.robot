*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Expected Value
    element value should be    id=input_01    Hello World

Unexpected Value
    ${ErrorMsg}=    Run Keyword And Expect Error    *    element value should be    id=input_01    Hello Worldzzz
    Should Contain    ${ErrorMsg}    Element 'id=input_01' value was not 'Hello Worldzzz', it was 'Hello World'
