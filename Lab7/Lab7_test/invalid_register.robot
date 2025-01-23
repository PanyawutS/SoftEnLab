*** Settings ***
Documentation     Test cases for failed event registrations due to invalid inputs.
Resource          Resource.robot
Suite Setup       Setup Chrome Browser
Suite Teardown    Close Browser
Test Setup        Go To Registration Page

*** Test Cases ***
Empty Destination
    [Documentation]    ทดสอบเมื่อไม่ได้กรอกจุดหมายปลายทาง
    Go To Registration Page
    Input Registration Details    Somsong    Sandee    ${EMPTY}    Sodsai Sandee    Mother    somsong@kkumail.com    081-111-1234
    Submit Registration
    Error Message Should Be Shown    *Please enter your destination!!

Empty Email
    [Documentation]    ทดสอบเมื่อไม่ได้กรอกอีเมล
    Go To Registration Page
    Input Registration Details    Somsong    Sandee    Europe    Sodsai Sandee    Mother    ${EMPTY}    081-111-1234
    Submit Registration
    Error Message Should Be Shown    *Please enter your email!!

Invalid Email
    [Documentation]    ทดสอบเมื่อกรอกอีเมลไม่ถูกต้อง
    Go To Registration Page
    Input Registration Details    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@    081-111-1234
    Submit Registration
    Error Message Should Be Shown    *Please enter a valid email address!!

Empty Phone Number
    [Documentation]    ทดสอบเมื่อไม่ได้กรอกเบอร์โทร
    Go To Registration Page
    Input Registration Details    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@kkumail.com    ${EMPTY}
    Submit Registration
    Error Message Should Be Shown    *Please enter your phone number!!

Invalid Phone Number
    [Documentation]    ทดสอบเมื่อกรอกเบอร์โทรไม่ถูกต้อง
    Go To Registration Page
    Input Registration Details    Somsong    Sandee    Europe    Sodsai Sandee    Mother    somsong@kkumail.com    191
    Submit Registration
    Error Message Should Be Shown    *Please enter a valid phone number!!, e.g., 081-234-5678, 081 234 5678, or 081.234.5678

