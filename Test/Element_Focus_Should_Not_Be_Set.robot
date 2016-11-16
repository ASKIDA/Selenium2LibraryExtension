*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Focus is not Set
    Element Focus Should Not Be Set    id=input_01
    Element Focus Should Not Be Set    id=input_02
    Element Focus Should Not Be Set    id=input_03

Focus is Set
    Set Element Focus    id=input_01
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Focus Should Not Be Set    id=input_01
    Should Contain    ${ErrorMsg}    Element 'id=input_01' had focus while it shouldn't have
