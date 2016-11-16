*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Element Value Is
    Wait Until Element Value Is    input_01    Hello World
    Wait Until Element Value Is    input_02    Hello New World

Element Value Is Not
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Value Is    id=input_01    Potato    2s
    Should Contain    ${ErrorMsg}    Element 'id=input_01' value was not Potato after 10 seconds
