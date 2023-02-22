***Settings***
Library                 AppiumLibrary
Library                 OperatingSystem
Test Setup              Start Session
Test Teardown           Close Session

*** Variables ***
${REMOTE_URL}                           http://localhost:4723/wd/hub
${APPS}                                 ${CURDIR}/APK/LoginAPK.apk
${DEVICE}                               emulator-5554
${PLATFORM}                             Android
${AUTOMATION_NAME}                      UiAutomator2
${email_element}                        com.loginmodule.learning:id/textInputEditTextEmail
${password_element}                     com.loginmodule.learning:id/textInputEditTextPassword 
${login_btn_element}                    com.loginmodule.learning:id/appCompatButtonLogin
${user_box}                             com.loginmodule.learning:id/recyclerViewUsers
${snackbar_wrong_email_password}        com.loginmodule.learning:id/snackbar_text
${dashboard_name}                       com.loginmodule.learning:id/textViewName
${dashboard_email}                      com.loginmodule.learning:id/textViewEmail
${dashboard_password}                   com.loginmodule.learning:id/textViewPassword

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
    Input Text        ${email_element}     ${email}

Input password
    [Arguments]       ${password}
    Input Text        ${password_element}     ${password}

Click login button
    Click Element     ${login_btn_element}

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

***Test Cases***
Login with valid account
    Input username        tester@tester.co
    Input password        wisnu123
    Click login button
    Sleep                 1
    Success login

Login with invalid email account
    Input username                wisnu
    Input password                wisnu123
    Click login button    
    Sleep                         1
    Failed login invalid email

Login with invalid user account
    Input username                wisnu@invalid.co
    Input password                invalid
    Click login button    
    Sleep                         1
    Failed login wrong email or password