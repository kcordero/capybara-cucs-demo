Feature: Withdraw Cash
  In order to have cash
  As an account holder
  I want to get cash from my account
  
  @wip
  Scenario Outline:
    Given I have <Initial Balance> in my account
    When I withdraw <Amount>
    Then My account should be left with <Balance>
    And Transaction should be a <Message>

    Examples:
      | Initial Balance | Amount | Balance | Message |
      | 500             | 100    | 400     | Success |
      | 500             | 1000   | 500     | Failure |

