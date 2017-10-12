Feature: View a restaurant page
  As a User
  In order to see a restaurant page
  I should be able to go to the restaurant page

  Background:
    Given the following restaurants exist
      | name    | address    |  description          | res_category_name | menu_name    |
      | My Thai | Stockholm  |  Some hip thai place  | Brämhult          | Everyday  |
#    Given the described objcts have the following associations
#      | association    | category   |  menu                   |
#      | My Thai            | Thai       |  Everyday, Weekends     |

    And I navigate to the index page

  Scenario: User can view a restaurant page
    Given I click "My Thai"
    Then I should see "My Thai"
    And I should see "Stockholm"
    And I should see "Some hip thai place"
    And show me the page
    And I should see "Everyday"
