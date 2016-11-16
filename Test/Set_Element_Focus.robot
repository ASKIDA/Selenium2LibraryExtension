*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Expected Focus
    Set Element Focus    id=input_01
    Wait Until Element Has Focus    id=input_01

Unexpected Focus
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Set Element Focus    id=div_01
    Should Contain    ${ErrorMsg}    cannot focus element
