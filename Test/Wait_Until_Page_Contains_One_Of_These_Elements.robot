*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Contains One of These Elements
    [Documentation]    Ce test s'assure que le keyword Wait Until Page Contains One Of These Elements demande d'attendre que la page contienne un des éléments identifiés avant d'exécuter l'action suivante (dans ce cas-ci: Close Browser du setup teardown)
    Wait Until Page Contains One Of These Elements    2s    input_04    input_02

Does Not Contain One Of These Elements
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la page ne contient pas un ou plusieurs des éléments demandés et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Page Contains One Of These Elements    input_08
    Should Contain    ${ErrorMsg}    ValueError: Invalid time string 'input_08'.
