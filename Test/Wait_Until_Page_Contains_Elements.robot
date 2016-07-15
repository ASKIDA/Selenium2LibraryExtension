*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Page Contains Elements
    [Documentation]    Ce test s'assure que le keyword Wait Until Page Contains Elements demande d'attendre que la page contienne l'élément identifié avant d'exécuter l'action suivante (dans ce cas-ci: Close Browser du setup teardown)
    Wait Until Page Contains Elements    2s    id=input_01

Page Does Not Contain Elements
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la page ne contient pas l'élément demandé et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Page Contains Elements    id=input_01
    Should Contain    ${ErrorMsg}    ValueError: Invalid time string 'id=input_01'.
