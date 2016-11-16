*** Settings ***
Suite Teardown
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Has Focus
    Set Element Focus    id=input_01
    Wait Until Element Has Focus    id=input_01
    Set Element Focus    id=input_02
    Wait Until Element Has Focus    id=input_02
    Set Element Focus    id=input_03
    Wait Until Element Has Focus    id=input_03

Doesn't Have Focus
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Has Focus    id=input_01
    Should Contain    ${ErrorMsg}    Element 'id=input_01' did not get focus after 10 seconds
