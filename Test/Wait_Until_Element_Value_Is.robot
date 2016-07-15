*** Settings ***
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Element Value Is
    [Documentation]    Ce test s'assure que le keyword Wait Until Element Value Is demande d'attendre que l'élément identifié ait la valeur demandée avant d'exécuter l'action suivante (dans ce cas-ci: Close Browser du setup teardown)
    Wait Until Element Value Is    input_01    Hello World
    Wait Until Element Value Is    input_02    Hello New World

Element Value Is Not
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où la valeur de l'élément n'est pas la bonne et valide que c'est le bon message d'erreur.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Value Is    id=input_01    Potato    2s
    Should Contain    ${ErrorMsg}    Element 'id=input_01' value was not Potato after 10 seconds
