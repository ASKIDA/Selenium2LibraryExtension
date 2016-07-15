*** Settings ***
Documentation     Unit tests for the keyword *Wait Until Element Value Contains*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Value Contains
    [Documentation]    Ce test s'assure que le keyword Wait Until Element Value Contains demande d'attendre que la valeur de l'élément contienne ce qui est demandé avant d'exécuter l'action suivante (dans ce cas-ci: Close Browser du setup teardown)
    Wait Until Element Value Contains    input_01    Hello

Value Does Not Contain
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où l'élément ne contient pas la valeur demandée et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Value Contains    id=input_01    Potato    2s
    Should Contain    ${ErrorMsg}    Value 'Potato' did not appear in 2 seconds to element 'id=input_01'. It's value was 'Hello World'
