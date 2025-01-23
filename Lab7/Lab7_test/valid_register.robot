*** Settings ***
Documentation     Test cases for successful event registrations.
Resource          resource.robot
Suite Setup       Setup Chrome Browser
Suite Teardown    Close Browser
Test Setup        Go To Registration Page

*** Test Cases ***
Valid Registration
    [Documentation]    ทดสอบการลงทะเบียนด้วยข้อมูลที่ถูกต้อง
    Go To Registration Page
    Input Registration Details    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@kkumail.com    081-111-1234
    Submit Registration
    Registration Success Page Should Be Open