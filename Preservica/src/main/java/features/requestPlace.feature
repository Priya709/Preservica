Feature: Request a place on a course

  Scenario Outline:  I want to make sure that user with invalid/incomplete data will not be created for student registration
    Given I open student registration 'sign-up' form
    And I want to enter name as '<Name>'
    And I want to enter email as '<Email>'
    And I want to enter date of birth as '<DOB>'
    And I want to enter password as '<Password>'
    And I want to enter confirmation password as '<ConfirmationPassword>'
    When I click on confirm button
    Then I should see the message '<ErrorMessage>'

    Examples:
      | Name      | Email          | DOB        | Password         | ConfirmationPassword | ErrorMessage                           |
      |           | test@gmail.com | 03/08/1989 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Required                               |
      | Name@test | test@gmail.com | 03/08/1989 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Name format is not correct             |
      | NameTest  |                | 03/08/1989 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Required                               |
      | NameTest  | testgmail.com  | 03/08/1989 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Invalid email address                  |
      | NameTest  | testgmailcom   | 03/08/1989 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Invalid email address                  |
      | NameTest  | test@gmail.com |            | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Required                               |
      | NameTest  | testgmailcom   | 1989/08/03 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Invalid DOB format                     |
      | Name@test | test@gmail.com | 03/08/1890 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E     | Invalid date                           |
      | NameTest  | test@gmail.com | 03/08/1989 |                  |                      | Required                               |
      | NameTest  | test@gmail.com | 03/08/1989 | cYPHByet5s@Qji5E | LKPHByet5s@Qji5E     | passwords are not the same             |
      | NameTest  | test@gmail.com | 03/08/1989 | 123              | 123                  | Password must be at least 8 chars      |
      | NameTest  | test@gmail.com | 03/08/1989 | PriyankaIndia    | PriyankaIndia        | Include  at least one number or symbol |

  Scenario: I would like to create new valid user account.
    Given I open student registration "sign-Up" form
    And I create an account using the following details:
      | Name           | Email                       | DOB        | Password         | Confirmation password |
      | Cucumber-User  | cucumberuseremail@gmail.com | 01/09/1990 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E      |
      | Cucumberuser's | cucumberuseremail@gmail.com | 01/09/1990 | cYPHByet5s@Qji5E | cYPHByet5s@Qji5E      |
    When I click on confirm button
    Then Details are stored in the database with a valid "student ID"

  Scenario: Already existing student register for course
    When I am able to login
    Then I am able to register for the course
    And I should see the confirmation message as "successfully registered"
#negative for above

  Scenario: Already existing student canceling the registration for course
    When I am able to login
    And I am able to cancel the registration
    Then I should see the confirmation message as "registration cancelled"
#negative for above

  Scenario:Check the forgot password link
    Given I can open student sign in form
    When I can enter the emailId "xyz@gmail.com"
    And I can click on "forgot password"
    And I can click on submit button
    Then I should receive an email with "reset password link"

    ## password validation has been covered in above in scenario outline test case as its asked in acceptance criteria
  Scenario: unsuccessful password reset
    Given I can open student sign in form
    When I can enter the emailId "xyz@gmail.com"
    And I can click on "forgot password"
    And I can click on submit button
    Then Failed to receive an email with "reset password link"


