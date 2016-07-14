*** Settings ***
Test Setup        Open Browser    https://dl.dropboxusercontent.com/u/74099577/Axon/S2LExp/index.html    gc
Test Teardown     Close Browser
Library           ../Library/S2LExp.py
Resource          res/vars.robot

*** Test Cases ***
Method 0
    [Documentation]    Ce test utilise sa méthode 0 et vide le champs identifié par input_01. Il vérifie par la suite que ce que contient le champs équivaut à une donnée vide. Cette méthode (0) utilise element.clear de Selenium.
    [Tags]    Clear Input Field
    Clear Input Field    id=input_01    0
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Method 1
    [Documentation]    Ce test utilise sa méthode 1 et vide le champs identifié par input_01. Il vérifie par la suite que ce que contient le champs équivaut à une donnée vide. Cette méthode (1) s'assure de vider le champs en mettant tout d'abord le focus puis en pesant ensuite CTRL + A puis la touche Supprimer.
    Clear Input Field    id=input_01    1
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Method 2
    [Documentation]    Ce test utilise sa méthode 2 et vide le champs identifié par input_01. Il vérifie par la suite que ce que contient le champs équivaut à une donnée vide Cette méthode (2) supprime en pesant de manière répétitive sur la touche Supprimer jusqu'à ce que le champ soit vide.
    Set Element Focus    id=input_01
    Tap Key    ${VK_UP}    ${VK_CTRL}
    Clear Input Field    id=input_01    2
    ${value}=    Get Value    id=input_01
    Should Be Equal As Strings    ${value}    ${EMPTY}

Clear Invalid Element
    [Documentation]    Ce test s'assure que le keyword lance un message d'erreur si le champ à vider n'est pas valide.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Clear Input Field    id=div_01
    Should Contain    ${ErrorMsg}    InvalidElementStateException

Clear Read Only Field
    [Documentation]    Ce test s'assure que le keyword lance un message d'erreur si le champ à vider n'est pas un champ.
    ${ErrorMsg}=    Run Keyword And Expect Error    *    Clear Input Field    id=input_03
    Should Contain    ${ErrorMsg}    InvalidElementStateException
