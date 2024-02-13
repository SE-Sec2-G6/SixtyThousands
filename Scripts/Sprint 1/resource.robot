*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}         	localhost:8080
${BROWSER}        	Chrome
${DELAY}          	0
${INDEX URL}      	http://${SERVER}

*** Keywords ***
Open Browser To Index Page
    Open Browser    ${INDEX URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Index Page Should Be Open

Index Page Should Be Open
    Title Should Be    SOUVENIR SHOP

Clicks
    [Arguments]    ${path}
    Wait Until Element Is Visible    ${path}    5
    Click Element    ${path}

Go to Product Page
    Clicks xpath=/html/body/main/header/div[2]/div/div[1]/div[2]/div[1]/ul/li[1]/a
    
#Size 1=S, 2=M, 3=L, 4=XL
Select Size
    [Arguments]    ${size}
    Select From List By Value    id=group_1    ${size}

Go To Form Page
    Go To    ${FORM URL}
    Form Page Should Be Open

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Credentials
    Click Button    submitButton

Completed Page Should Be Open
    Title Should Be    Completed

Check Error
    [Arguments]    ${error}
    Page Should Contain 	${error}