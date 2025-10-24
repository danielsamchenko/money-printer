*** Settings ***
Library    Browser
Library    Collections
Library    BuiltIn
Library    OperatingSystem
Suite Setup       Open Sportsbook
Suite Teardown    Close Browser

*** Keywords ***
Open Sportsbook
    New Browser    chromium    headless=false
    New Page    https://on.sportsbook.fanduel.ca/
    ${rand}=    Evaluate    random.uniform(1,2)    modules=random
    Sleep    ${rand}s
