*** Settings ***
Documentation     Unit tests for the keyword *Wait Until Page Does Not Contain These Elements*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Does Not Contain These Elements
    [Documentation]    Ce test s'assure que le keyword Wait Until Page Does Not Contain demande d'attendre que la page ne contienne plus l'élément identifié avant d'exécuter l'action suivante (dans ce cas-ci: Close Browser du setup teardown)
    Wait Until Page Does Not Contain These Elements    3s    id=input_08    id=input_09

Does Contains These Elements
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la page contient \ un ou plusieurs des éléments demandés alors qu'il ne faudrait pas et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Page Does Not Contain These Elements    2s    id=input_01    id=input_68
    Should Contain    ${ErrorMsg}    Element 'id=input_01' shouldn't have been there
