*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
Right Result
    Element Css Attribute Should Be    id=div_01    border-color    rgb(0, 0, 0)

Wrong Result
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Css Attribute Should Be    id=div_01    border-color    rgb(255, 255, 255)
    Should Contain    ${ErrorMsg}    Element locator 'id=div_01' css property 'border-color' had a value of 'rgb(0, 0, 0)' while it should have been 'rgb(255, 255, 255)'
