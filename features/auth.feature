Feature: Authentication
  In order to get a authentication integrated in sso of your infraestructure
  An user can authenticate throught the cas

  Scenario: I Can't see Dashboard before authentication
    When I am not authenticated
    And  I visit dashboard page
    Then I should be redirected to sso login page

  Scenario: I Can see Dashboard after authentication
    When I am authenticated
    And I visit dashboard page
    Then  I can see dashboard page

  Scenario: I Can't see Dashboard after logout
    When I am authenticated
    And I visit dashboard page
    And I click logout link
    Then I should be redirected to sso login page



