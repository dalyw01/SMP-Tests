Feature: Retrieve volume values

 Scenario: Check volume values on HTML player
  Given I am on a page with the HTML player and press CTA
  When I enter player volume using keys
  Then I should be able to retrieve + check volume values going down
  And retrieve + check volume values going up
