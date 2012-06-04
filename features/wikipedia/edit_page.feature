Feature: Edit Page

# ignore due to account being blocked
@ignore
Scenario: Edit a page as a logged in user
  Given I am logged into Wikipedia
  When I visit a random page
  And I edit the page by adding some arbitrary text
  Then I can see the arbitrary text has been saved on the page
  And the user edit appears in the revision history

# ignore due to account being blocked
@ignore
Scenario: Edit a page as a non-logged in user
  Given I am not logged into Wikipedia
  And I record my IP address
  When I visit a random page
  And I edit the page by adding some arbitrary text
  Then I can see the arbitrary text has been saved on the page
  And the IP address edit appears in the revision history