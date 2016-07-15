*** Settings ***
Documentation     Unit tests for the new *locators*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
input
    [Documentation]    Ce test vérifie que le nouveau locateur 'input=current' fonctionne
    Set Element Focus    id=input_01
    ${value}=    Get Value    input=current
    Should Contain    ${value}    Hello World

meta_name
    [Documentation]    Ce test vérifie que le nouveau locateur 'meta' fonctionne
    Wait Until Page Contains Element    meta_name=language    3s

first_tag
    [Documentation]    Ce test vérifie que le nouveau locateur 'first_tag' fonctionne
    ${value}=    Get Text    first_tag=p
    Should Contain    ${value}    Hello! I'm the first paragraph

last_tag
    [Documentation]    Ce test vérifie que le nouveau locateur 'last_tag' fonctionne
    ${value}=    Get Text    last_tag=p
    Should Contain    ${value}    Hello! I'm the last paragraph
