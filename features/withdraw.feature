@javascript

Feature: Withdraw Cash
  In order to have cash
  As an account holder
  I want to get cash from my account

  @withdraw
  Scenario Outline:
    Given I am on My Account page
    And I have <Balance>
    When I input <Amount> to withdraw
    And click <Button>
    Then my remaining balance should be <Balance Status>
    And Message should say <Message>

    Examples:
      | Balance | Amount | Button | Balance Status | Message             |
      | 10000   | 2000   | OK     | Deducted       | Success             |
      | 10000   | 11000  | OK     | Same           | Balance not enough  |
      | 10000   | 10000  | OK     | Empty          | Success             |