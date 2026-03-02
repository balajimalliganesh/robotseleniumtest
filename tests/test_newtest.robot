*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Chrome Headless In CI
    ${options}=    Evaluate    from selenium.webdriver.chrome.options import Options; o=Options(); o.add_argument('--headless=new'); o.add_argument('--no-sandbox'); o.add_argument('--disable-dev-shm-usage'); o.add_argument('--window-size=1920,1080'); o
    Create Webdriver    Chrome    options=${options}
    Set Selenium Timeout    30s

*** Test Cases ***
Open Google And Check Title
    Open Chrome Headless In CI
    Go To    https://www.google.com
    Title Should Be    Google
    [Teardown]    Close Browser
