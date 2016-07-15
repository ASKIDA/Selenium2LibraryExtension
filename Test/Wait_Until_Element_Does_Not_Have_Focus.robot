*** Settings ***
Documentation     Unit tests for the keyword *Wait Until Element Does Not Have Focus*
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Does Not Have Focus
    [Documentation]    Ce test s'assure que le keyword Wait Until Element Does Not Have Focus attend que l'élément identifié n'ait plus le focus.
    Wait Until Element Does Not Have Focus    id=input_01

Has Focus
    [Documentation]    Ce test vérifie que le test reçoit un message d'erreur dans le cas où l'élément demandé reçoit le focus alors qu'il ne devrait pas et valide que c'est le bon message d'erreur.
    Set Element Focus    id=input_01
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Wait Until Element Does Not Have Focus    id=input_01    3s
    Should Contain    ${ErrorMsg}    Element 'id=input_01' still had focus after 3 seconds while it shouldn't have
