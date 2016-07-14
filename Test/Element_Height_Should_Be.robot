*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Expected Height
    [Documentation]    Ce test s'assure que le keyword Element Height Should Be valide que la hauteur de l'élément demandé est la bonne.
    Element Height Should Be    id=div_01    254

Unexpected Height
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la hauteur désirée n'est pas la bonne et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Height Should Be    id=div_01    666
    Should Contain    ${ErrorMsg}    The height of element 'id=div_01' should have been '666' but in fact it was '254'
