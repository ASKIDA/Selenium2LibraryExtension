*** Settings ***
Suite Setup
Test Setup        Open Browser    https://axon-id.github.io/Selenium2LibraryExtension/test.html    gc
Test Teardown     Close Browser
Library           ../Library/Selenium2LibraryExtension.py
Resource          res/vars.robot

*** Test Cases ***
Press F1
    [Documentation]    Ce test s'assure que le keyword Tap Key effectue le pressage de la touche demandé et valide ensuite que la réaction attendue suite au pressage de ce key.
    Tap Key    ${VK_F1}
    Wait Until Page Contains Element    div_02
