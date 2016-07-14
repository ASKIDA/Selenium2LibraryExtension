*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Expected Color
    [Documentation]    Ce test valide le keyword Element Background Color Should be en vérifiant la couleur de fond d'un des éléments de la page.
    Element Background Color Should Be    id=div_01    rgba(255, 0, 0, 1)

Unexpected Color
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas ou la couleur désirée n'est pas la bonne et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Background Color Should Be    id=div_01    rgba(255, 255, 255, 1)
    Should Contain    ${ErrorMsg}    Element locator 'id=div_01' css property 'background-color' had a value of 'rgba(255, 0, 0, 1)' while it should have been 'rgba(255, 255, 255, 1)'
