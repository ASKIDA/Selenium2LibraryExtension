*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Value Does Not Contain
    [Documentation]    Ce test s'assure que le keyword Element Value Should Not Contain s'assure la valeur de l'élément ne contient pas la valeur inscrite. Il vérifie pour 3 éléments.
    Element Value Should Not Contain    input_01    Potato
    Element Value Should Not Contain    input_02    Banana
    Element Value Should Not Contain    input_03    PineApple

Value Contains
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la valeur contenue dans l'élément est celle qu'il ne faudrait pas et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    element value should not contain    id=input_01    Hello
    Should Contain    ${ErrorMsg}    Value 'Hello' was found in element 'id=input_01' while it shouldn't have
