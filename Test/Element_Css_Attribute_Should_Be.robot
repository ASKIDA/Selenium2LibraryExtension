*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Right Result
    [Documentation]    Ce test s'assure que le keyword "Element Css Attribute Should Be" valide que l'attribut CSS est le bon.
    Element Css Attribute Should Be    id=div_01    border-color    rgb(0, 0, 0)

Wrong Result
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas ou l'attribut CSS désiré n'est pas le bon et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Element Css Attribute Should Be    id=div_01    border-color    rgb(255, 255, 255)
    Should Contain    ${ErrorMsg}    Element locator 'id=div_01' css property 'border-color' had a value of 'rgb(0, 0, 0)' while it should have been 'rgb(255, 255, 255)'
