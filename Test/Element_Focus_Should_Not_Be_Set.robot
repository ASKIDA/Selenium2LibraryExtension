*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Focus is not Set
    [Documentation]    Ce test s'assure que le keyword Focus Is Not Set valide que le focus n'est pas tel que demandé.
    Element Focus Should Not Be Set    id=input_01
    Element Focus Should Not Be Set    id=input_02
    Element Focus Should Not Be Set    id=input_03

Focus is Set
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où le focus est fait (alors qu'il ne devrait pas) et valide que c'est le bon message d'erreur.
    Set Element Focus    id=input_01
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Focus Should Not Be Set    id=input_01
    Should Contain    ${ErrorMsg}    Element 'id=input_01' had focus while it shouldn't have
