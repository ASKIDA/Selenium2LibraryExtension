*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Expected Color
    [Documentation]    Ce test s'assure que le keyword Element Text Color Should Be valide que la couleur du texte est la bonne.
    Element Text Color Should Be    id=span_01    rgba(255, 255, 255, 1)
    Element Text Color Should Be    id=First_Paragraph    rgba(0, 0, 0, 1)

Unexpected Color
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la couleur attendue pour le texte n'est pas la bonne et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Text Color Should Be    id=span_01    rgba(0, 0, 0, 1)
    Should Contain    ${ErrorMsg}    Element locator 'id=span_01' css property 'color' had a value of 'rgba(255, 255, 255, 1)' while it should have been 'rgba(0, 0, 0, 1)'
