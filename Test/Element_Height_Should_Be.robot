*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Expected Height
    Element Height Should Be    id=div_01    254

Unexpected Height
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Height Should Be    id=div_01    666
    Should Contain    ${ErrorMsg}    The height of element 'id=div_01' should have been '666' but in fact it was '254'
