*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Chrome Headless In CI
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080
    # If needed in some containers:
    # Call Method    ${options}    add_argument    --disable-gpu
    # Call Method    ${options}    add_argument    --disable-software-rasterizer

    Create Webdriver    Chrome    options=${options}
    Set Selenium Timeout    30s

*** Test Cases ***
Open Google And Check Title
    Open Chrome Headless In CI
    Go To    https://www.google.com
    Title Should Be    Google
    [Teardown]    Close Browser
