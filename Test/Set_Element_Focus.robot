*** Settings ***
Documentation     Unit tests for the keyword *Set Element Focus*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Expected Focus
    [Documentation]    Ce test s'assure que le keyword Set Element Focus met le focus sur l'élément demandé.
    Set Element Focus    id=input_01
    Wait Until Element Has Focus    id=input_01

Unexpected Focus
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la le focus n'est pas sur le bon élément et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Set Element Focus    id=div_01
    Should Contain    ${ErrorMsg}    cannot focus element
