Feature: Login
  As a user
  I want to log into the system
  So that I can access my account

  Scenario: User logs in with valid credentials
    Given There is a user with name "Hilda" and password "password123"
    When I visit the login page
    And I put in "Nome de Usuário" with "Hilda"
    And I insert in "Senha" with "password123"
    And I press "Entrar"
    Then I should go to homepage
