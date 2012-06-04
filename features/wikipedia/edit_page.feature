Feature: Edit User Page

Scenario: Can edit the user page for a logged in user
  Given I am logged into Wikipedia
  When I visit my user page
  And I edit the page by adding some arbitrary text
  Then I can see the arbitrary text has been saved on the page
  And the user edit appears in the revision history
