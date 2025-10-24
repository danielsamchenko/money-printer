*** Settings ***
Library    Browser
Library    Collections
Library    String
Library    BuiltIn
Variables    ../locators/locators.py
Variables    ../config/config.py

*** Test Cases ***
Accept Daily Reward
    Login To Sportsbook

*** Keywords ***
Random Delay
    [Arguments]    ${min}=0.3    ${max}=1.0
    ${delay}=    Evaluate    random.uniform(${min}, ${max})    modules=random
    Sleep    ${delay}s

Type Like Human
    [Arguments]    ${locator}    ${text}
    ${chars}=    Split String To Characters    ${text}
    FOR    ${char}    IN    @{chars}
        Type Text    ${locator}    ${char}    delay=0.1
        Random Delay
    END

Scroll Element Into View
    [Arguments]    ${locator}
    Run Keyword And Ignore Error    Hover    ${locator}

Wait And Click
    [Arguments]    ${locator}
    Wait For Elements State    ${locator}    visible    timeout=10s
    Scroll Element Into View    ${locator}
    Hover    ${locator}
    Random Delay
    Click    ${locator}

Wait And Fill Text
    [Arguments]    ${locator}    ${text}
    Wait For Elements State    ${locator}    visible    timeout=10s
    Scroll Element Into View    ${locator}
    Hover    ${locator}
    Random Delay
    Type Like Human    ${locator}    ${text}


Login To Sportsbook
    Wait And Click    ${LOGIN_LINK}
    Sleep    100s
    Wait And Fill Text    ${EMAIL_INPUT}    ${EMAIL}
    Wait And Fill Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Wait And Click    ${LOGIN_BUTTON}
