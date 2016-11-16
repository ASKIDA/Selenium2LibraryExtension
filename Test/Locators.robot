*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           Selenium2LibraryExtension
Resource          res/vars.robot

*** Test Cases ***
input
    Set Element Focus    id=input_01
    ${value}=    Get Value    input=current
    Should Contain    ${value}    Hello World

meta_name
    Wait Until Page Contains Element    meta_name=language    3s

first_tag
    ${value}=    Get Text    first_tag=p
    Should Contain    ${value}    Hello! I'm the first paragraph

last_tag
    ${value}=    Get Text    last_tag=p
    Should Contain    ${value}    Hello! I'm the last paragraph
