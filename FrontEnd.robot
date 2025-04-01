*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${baseUrl}      https://automacao.qacoders-academy.com.br/home
${mail}         sysadmin@qacoders.com
${password}     1234@Test   

*** Test Cases ***
Pesquisar departamento
    Abrir site
    Realizar login
    Pesquisar departamento

Cadastro de centro de custo
    Abrir site
    Realizar login
    Cadastro de centro de custo

Editar centro de custo
    Abrir site
    Realizar login
    Editar centro de custo

Listar centro de custo
    Abrir site
    Realizar login
    Listar centro de custo

Cadastrar um departamento
    Abrir site
    Realizar login
    Cadastrar um departamento

Editar departamento
    Abrir site
    Realizar login
    Editar departamento

Listar departamento
    Abrir site
    Realizar login
    Listar departamento

*** Keywords ***
Abrir site
    Open Browser  ${baseUrl}  chrome
    Maximize Browser Window
    Title Should Be  Academy
    Sleep  2s

Realizar login
    Wait Until Element Is Visible  id=email
    Input Text  id=email  ${mail}
    Input Text  id=password  ${password}
    Click Element  xpath=//button[normalize-space(text())='Entrar']
    Sleep  1s

Cadastro de centro de custo
    Wait Until Element Is Visible  id=Cadastros
    Click Element  id=Cadastros
    Sleep  1s
    Wait Until Element Is Visible  id=Centro de Custo
    Click Element  id=Centro de Custo
    Wait Until Element Is Visible  id=Novo Cadastro
    Click Element  id=Novo Cadastro
    Input Text  id=costCentername   TesteJ
    Sleep  1s
    Select From List By Label  id=Diretoria  cadastros
    Click Element  id=save
    Sleep  2s
    Close Browser

Editar centro de custo
    Wait Until Element Is Visible  id=Cadastros
    Click Element  id=Cadastros
    Click Element  id=Centro de Custo
    Wait Until Element Is Visible  id=Novo Cadastro
    Sleep  2s
    Click Element  xpath=(//button[@id='edit'])[1]
    Wait Until Element Is Visible  xpath=//h5[normalize-space(text())='Editar Cadastro']
    Input Text  id=costCentername   Bananaa&
    Sleep  1s
    Click Element  id=save
    Sleep  2s
    Close Browser

Cadastrar um departamento
    Wait Until Element Is Visible  id=Cadastros
    ${is_visible}=  Run Keyword And Return Status  Element Should Be Visible  id=Departamento
    Run Keyword If  ${is_visible}  Click Element  id=Departamento
    ...  ELSE  Run Keywords  Click Element  id=Cadastros  AND  Click Element  id=Departamento
    Wait Until Element Is Visible  id=Novo Cadastro
    Click Element  id=Novo Cadastro
    Input Text  id=departmentName   TesteB
    Select From List By Label  id=Centro de Custo  teste
    Sleep  4s
    Click Element  id=save
    Close Browser

Editar departamento
    Wait Until Element Is Visible  xpath=//span[normalize-space(text())='Cadastros']
    Click Element  id=Cadastros
    Click Element  id=Departamento
    Wait Until Element Is Visible  id=Novo Cadastro
    Sleep  4s
    Click Element  xpath=(//button[@id='edit'])[3]
    Sleep  2s
    Input Text  id=departmentName   BugadoTestado
    Sleep  4s
    Click Element  id=save
    Wait Until Element Is Visible  xpath=//p[normalize-space(text())='BugadoTestado']
    Element Should Be Visible  xpath=//p[normalize-space(text())='BugadoTestado']
    Sleep  4s
    Close Browser

Listar centro de custo
    Wait Until Element Is Visible  id=Cadastros
    Click Element  id=Cadastros
    Click Element  id=Centro de Custo
    Wait Until Element Is Visible  id=Novo Cadastro
    Sleep  2s
    Close Browser

Listar departamento
    Wait Until Element Is Visible  id=Cadastros
    Click Element  id=Cadastros
    Click Element  id=Departamento
    Wait Until Element Is Visible  id=Novo Cadastro
    Sleep  2s
    Close Browser

Pesquisar departamento
    Wait Until Element Is Visible  id=Cadastros
    Click Element  id=Cadastros
    Click Element  id=Departamento
    Wait Until Element Is Visible  id=Novo Cadastro
    Input Text  xpath=//input[contains(@class,'MuiInputBase-input MuiOutlinedInput-input')]  TesteB
    Sleep  4s
    Close Browser