Feature: Request course place
  Student found the course and provided all details to register for a course

  Scenario Outline:student course selection form invalidated
    Given I select the course "abc"
    And  I verify that student detail form displaying
    And I want to enter name as '<Name>'
    And I want to enter email as '<Email>'
    And I want to enter date of birth as '<DOB>'
    When I click on confirm button
    Then I should see the message '<ErrorMessage>'
    Examples:
      | Name      | Email          | DOB        | ErrorMessage               |
      |           | test@gmail.com | 03/08/1989 | Required                   |
      | Name@test | test@gmail.com | 03/08/1989 | Name format is not correct |
      | NameTest  |                | 03/08/1989 | Required                   |
      | NameTest  | testgmail.com  | 03/08/1989 | Invalid email address      |
      | NameTest  | testgmailcom   | 03/08/1989 | Invalid email address      |
      | NameTest  | test@gmail.com |            | Required                   |
      | NameTest  | testgmailcom   | 1989/08/03 | Invalid DOB format         |

  Scenario:student course selection form validation
    Given I select the course "abc"
    And  I verify that student detail form displaying
    And I want to enter name as '<Name>'
    And I want to enter email as '<Email>'
    And I want to enter date of birth as '<DOB>'
      | Name          | Email                       | DOB        |
      | Cucumber-User | cucumberuseremail@gmail.com | 01/09/1990 |
    When I click on confirm button
    Then I should see the message "confirmation message"

  Scenario: student successfully selected course
    Given open the university URL "www.xyz.com"
    And I select the course "abc"
    And I am entering student detail
      | Name          | Email                       | DOB        |
      | Cucumber-User | cucumberuseremail@gmail.com | 01/09/1990 |
    When I click on confirm button
    Then I should see the message "student successfully selected the course"
    And Details are stored in the database with a valid student ID

      # since student already signed in and we are utilising his/her stored details for selected
      # course registration
  Scenario: course selection not successful
    Given Open the university student sign in form
    And I can enter UserID "UserID"
    And I can enter password "password"
    And I can click on submit button
    And Open the course selection form
    When I click on select the course name "course name"
    Then I can see the message "unsuccessful selection"
  #possible reasons for unsuccessful



