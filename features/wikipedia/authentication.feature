Feature: Wikipedia Authentication

Scenario: Logged in user
  Given I am logged into Wikipedia
  When I visit the Wikipedia main page
  Then I can see I am logged into Wikipedia

  Scenario: Anonymous User
  Given I am not logged into Wikipedia
  When I visit the Wikipedia main page
  Then I can see I am not logged in Wikipedia