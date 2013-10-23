@javascript
Feature: User manages tasks
  Scenario: User adds a new task
    Given user go to the new task page
    And user fill tasks content in "new-todo" with "To do TODO"
    When user click "hidden_click"
    Then user should see "To do TODO"
    When I check "toggle" checkbox
    Then user should see "Clear"
    When user click "clearcompleted"
    Then user should not see "To do TODO"