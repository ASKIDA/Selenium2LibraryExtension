*** Settings ***
Documentation     Unit tests for the keyword *Element Value Should Contain*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Excepted Value
    [Documentation]    Ce test s'assure que le keyword Element Value Should Contain valide que la valeur de l'élément contient bien ce qui est demandé.
    Element Value Should Contain    id=input_01    Hello
    Element Value Should Contain    id=input_02    Hello New
    Element Value Should Contain    id=input_03    Hello Brand

Unexpected Value
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la valeur de l'élément n'est pas la bonne et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    element value should contain    id=input_01    Hellllllo
    Should Contain    ${ErrorMsg}    Value 'Hellllllo' did not appear in element 'id=input_01'. It's value was 'Hello World'
