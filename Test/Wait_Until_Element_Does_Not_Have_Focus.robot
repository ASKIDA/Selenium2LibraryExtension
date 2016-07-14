*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Does Not Have Focus
    [Documentation]    Ce test s'assure que le keyword Wait Until Element Does Not Have Focus attend que l'élément identifié n'ait plus le focus.
    Wait Until Element Does Not Have Focus    input_01

Has Focus
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où l'élément demandé reçoit le focus alors qu'il ne devrait pas et valide que c'est le bon message d'erreur.
    Tap Key    \ue004
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Does Not Have Focus    id=input_01    Hello
    Should Contain    ${ErrorMsg}    ${ErrorMsg}
