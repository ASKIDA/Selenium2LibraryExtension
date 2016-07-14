*** Settings ***
Suite Teardown
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Has Focus
    [Documentation]    Ce test s'assure que le keyword Wait Until Element Has Focus demande d'attendre que l'élément identifié ait le focus avant d'exécuter l'action suivante (dans ce cas-ci: Close Browser du setup teardown)
    Tap Key    \ue004
    Wait Until Element Has Focus    input_01
    Tap Key    \ue004
    Wait Until Element Has Focus    input_02
    Tap Key    \ue004
    Wait Until Element Has Focus    input_03

Doesn't Have Focus
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où l'élément n'a pas le focus demandé et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Has Focus    id=input_01
    Should Contain    ${ErrorMsg}    Element 'id=input_01' did not get focus after 10 seconds
