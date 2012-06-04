Feature: Wiki Commons Upload Wizard

  Scenario: Can access upload wizard when logged in
    Given I am logged into Commons
    When I visit the Upload Wizard
    Then I should see the Upload Wizard content

  Scenario: Can't access upload wizard when not logged in
    Given I am not logged into Commons
    When I visit the Upload Wizard
    Then I should not see the Upload Wizard content