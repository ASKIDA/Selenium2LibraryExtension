*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Expected Width
    [Documentation]    Ce test s'assure que le keyword Element Width Should Be valide quel la longueur de l'élément est le bon.
    Element Width Should Be    id=div_01    254

Unexpected Width
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la largeur demandée n'est pas la bonne et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Width Should Be    id=div_01    666
    Should Contain    ${ErrorMsg}    The width of element 'id=div_01' should have been '666' but in fact it was '254'
