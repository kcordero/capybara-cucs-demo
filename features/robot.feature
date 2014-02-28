Feature: Robot mood
	
	@wip
  Scenario Outline:
    Given I am in a <Mood>
    When you tickle me
    Then I will <React>

    Examples:
    | Mood      | React  |
    | good mood | giggle |
    | bad mood  | snap   |

#  Scenario: Tickle a happy robot
#    Given I am in a good mood
#    When you tickle me
#    Then I will giggle

