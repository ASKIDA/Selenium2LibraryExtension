*** Settings ***
Suite Setup
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Press F1
    Tap Key    ${VK_F1}
    Wait Until Page Contains Element    div_02
