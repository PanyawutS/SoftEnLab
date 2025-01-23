*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        chrome
${DELAY}          0.2
${URL}            http://${SERVER}/
${REGISTER URL}   http://${SERVER}/Lab7/Form.html
${SUCCESS URL}    http://${SERVER}/Lab7/Complete.html
${CHROME_BROWSER_PATH}  ${EXECDIR}${/}ChromeForTesting${/}chrome-win64{/}chrome-win64{/}chrome.exe
${CHROME_DRIVER_PATH}   ${EXECDIR}${/}ChromeForTesting${/}chromedriver-win64{/}chromedriver-win64{/}chromedriver.exe

*** Keywords ***
Setup Chrome Browser
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${options}    service=${service}

Open Browser To Registration Page
    Open Browser    ${REGISTER URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go To Registration Page
    Go To    ${REGISTER URL}
    Registration Page Should Be Open

Registration Page Should Be Open
    Title Should Be    Customer Inquiry

Wait For First Name Field
    Wait Until Element Is Visible    id=firstname    timeout=10s

Input Registration Details
    [Arguments]    ${firstName}    ${lastName}    ${destination}    ${contactPerson}    ${relationship}    ${email}    ${phone}
    Wait For First Name Field
    Input Text    id=firstname    ${firstName}
    Input Text    id=lastname    ${lastName}
    Input Text    id=destination    ${destination}
    Input Text    id=contactperson    ${contactPerson}
    Input Text    id=relationship    ${relationship}
    Input Text    id=email    ${email}
    Input Text    id=phone    ${phone}
    Set Selenium Speed    ${DELAY}

Submit Registration
    Click Button    id=submitButton

Registration Success Page Should Be Open
    Location Should Be    ${SUCCESS URL}
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.

Error Message Should Be Shown
    [Arguments]    ${message}
    Page Should Contain    ${message}