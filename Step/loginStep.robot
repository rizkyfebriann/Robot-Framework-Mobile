***Settings***
Library                 AppiumLibrary
Library                 OperatingSystem
Resource                ../Resources/loginPage.robot
Test Setup              Start Session
Test Teardown           Close Session


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