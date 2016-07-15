*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Expected Value
    [Documentation]    Ce test s'assure que le keyword Element Value Should Be valide que la valeur de l'élément est la bonne.
    element value should be    id=input_01    Hello World

Unexpected Value
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la valeur de l'élement n'est pas la bonne et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    element value should be    id=input_01    Hello Worldzzz
    Should Contain    ${ErrorMsg}    Element 'id=input_01' value was not 'Hello Worldzzz', it was 'Hello World'
