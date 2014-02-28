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
      | 8000    | 9000   | OK     | Same           | Balance not enough  |
      | 8000    | 8000   | OK     | Empty          | Success             |

    #Given I have <Initial Balance> in my account
    #When I withdraw <Amount>
    #Then My account should be left with <Balance>
    #And Transaction should be a <Message>

    #Examples:
    #  | Initial Balance | Amount | Balance | Message |
    #  | 500             | 100    | 400     | Success |
    #  | 500             | 1000   | 500     | Failure |

