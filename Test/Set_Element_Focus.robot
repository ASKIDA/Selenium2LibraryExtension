*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Expected Focus
    [Documentation]    Ce test s'assure que le keyword Set Element Focus met le focus sur l'élément demandé.
    Set Element Focus    input_01
    Wait Until Element Has Focus    input_01

Unexpected Focus
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la le focus n'est pas sur le bon élément et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Set Element Focus    id=div_01
    Should Contain    ${ErrorMsg}    cannot focus element
