Feature: Sign in
  In order to get access to protected sections of the site
  A user and auditor
  Should be able to sign in


    Scenario: User signs in successfully
      Given I exist as a user
      And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      And I should be signed in

    Scenario: User successfully entered the data
      Given I exist as a user
      And I am not logged in
      When I sign in with valid credentials
      Then I see a owner_link page
      When I click on the link "Please enter data"
      Then I should see a page of data entry
      And I should see "Введите показания горячей воды"
      And I enter the data

    Scenario: Auditor successful visits to the page with data 
    ....

