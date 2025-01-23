*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Suite Setup       Setup Chrome Browser
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Resource          resource.robot

*** Test Cases ***
Valid Login
    Input Username    demo
    Input Password    mode
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser