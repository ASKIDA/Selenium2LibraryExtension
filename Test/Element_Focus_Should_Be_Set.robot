*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Focus is Set
    Set Element Focus    id=input_01
    Element Focus Should Be Set    id=input_01

Focus is not Set
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Focus Should Be Set    id=input_01
    Should Contain    ${ErrorMsg}    Element 'id=input_01' did not have focus while it should have
