*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Element Is Clickable
    [Documentation]    Ce test vérifie que le keyword Wait Until Element Is Clickable attend bien que l'élément soit clickable et clique dessus.
    Wait Until Element Is Clickable    id=button_01    8s
    Wait Until Page Contains Element    id=div_02

Element Is Not Clickable
    [Documentation]    Ce test vérifie que le keyword Wait Until Element Is Clickable lance bien une erreur lorsque son timeout est atteint et que l'élément visé n'a pas été cliqué.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Is Clickable    id=button_02    8s
    Should Contain    ${ErrorMsg}    Couldn't find the element 'id=button_02', click operation failed
