***Settings***
Library                 AppiumLibrary
Library                 OperatingSystem
Variables               ../Resources/loginElement.yaml

*** Variables ***
${REMOTE_URL}                           http://localhost:4723/wd/hub
${APPS}                                 ${EXECDIR}/APK/LoginAPK.apk
${DEVICE}                               emulator-5554
${PLATFORM}                             Android
${AUTOMATION_NAME}                      UiAutomator2

***Keywords***
Start Session
    Set Appium Timeout  5
    Open Application    ${REMOTE_URL}
    ...                 automationName=${AUTOMATION_NAME} 
    ...                 platformName=${PLATFORM}   
    ...                 deviceName=${DEVICE}
    ...                 app=${APPS}
    ...                 autoGrantPermissions=true
    ...                 noReset=false
    Sleep               1

Input username
    [Arguments]       ${email}
    Input Text        ${txt_email}     ${email}

Input password
    [Arguments]       ${password}
    Input Text        ${txt_password}     ${password}

Click login button
    Click Element     ${btn_login}

Success login
    Page should contain element     ${dashboard_name}
    Page should contain element     ${dashboard_email}
    Page should contain element     ${dashboard_password}

Failed login invalid email
    Page should contain text          Enter Valid Email

Failed login wrong email or password
    Page should contain element       ${snackbar_wrong_email_password}       

Close Session
    Capture Page Screenshot
    Close Application   