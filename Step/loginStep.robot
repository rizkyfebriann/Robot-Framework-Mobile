***Settings***
Library                 AppiumLibrary
Library                 OperatingSystem
Resource                ../Resources/loginPage.robot
Test Setup              Start Session
Test Teardown           Close Session


***Test Cases***
Login with valid account
    Input username        test1@mail.com
    Inputing password     123456
    Click login button
    Sleep                 1
    Success login

Login with invalid email account
    Input username                wisnu
    Inputing password             wisnu123
    Click login button    
    Sleep                         1
    Failed login invalid email

Login with invalid user account
    Input username                wisnu@invalid.co
    Inputing password             invalid
    Click login button    
    Sleep                         1
    Failed login wrong email or password