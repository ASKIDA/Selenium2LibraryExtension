*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Value Is Not
    [Documentation]    Ce test s'assure que le keyword Element Value Should Not Be s'assure que la valeur de l'élément n'est pas ce qui est demandé. Il vérifie pour 3 éléments différents.
    Element Value Should Not Be    input_01    Potato
    Element Value Should Not Be    input_02    Banana
    Element Value Should Not Be    input_03    PineApple

Value Is
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la valeur est celle qu'il ne faudrait pas et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    element value should not be    id=input_01    Hello World
    Should Contain    ${ErrorMsg}    Value was 'Hello World' for element 'id=input_01' while it shouldn't have
