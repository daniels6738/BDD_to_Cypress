Feature: Login Functionality

    Scenario: Successful login with valid credentials
        Given I am on the login page
        When I enter the username "standard_user"
        And I enter the password "secret_sauce"
        And I click the login button
        Then I should be redirected to the products page

    Scenario: Unsuccessful login with invalid credentials
        Given I am on the login page
        When I enter the username "wrong_user"
        And I enter the password "secret_sauce"
        And I click the login button
        Then I should see an error message "Username and password do not match any user in this service"

    Scenario: Successfully log out from the application
        Given I am logged in as a standard user
        When I open the sidebar menu
        And I click the logout link
        Then I should be on the login page