*** Settings ***
Documentation     Unit tests for the keyword *Element Focus Should Be Set*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Focus is Set
    [Documentation]    Ce test s'assure que le keyword Focus Is Set valide que le focus est sur le bon élément.
    Set Element Focus    id=input_01
    Element Focus Should Be Set    id=input_01

Focus is not Set
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où le focus ne se fait pas et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Focus Should Be Set    id=input_01
    Should Contain    ${ErrorMsg}    Element 'id=input_01' did not have focus while it should have
