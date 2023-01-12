Feature: Course administrator can add new course to the university curriculum for students
  to register and lecturers to assign themselves,when course is full it can go ahead

  Background: open university URL "www.xyz.com"

  Scenario: Course administrator successfully added a new course
    Given I am on login page as "Administrator"
    And I can enter userID "adminID"
    And I can enter password "Password"
    And I am able to click on submit button
    And I am able to click on "add new course" button
    And I enter course fields
      | course_name | course_details | course_duration | course_specialisation | course_startdate | course_enddate |
      | xyz         | abc            | 1year           | qtp                   | 01/09/2022       | 30/08/2023
    When I can click on course submit button
    Then I should see the Confirmation message "Successfully course added"
    And course successfully added with valid courseID

   #add course fields can be negative
  Scenario: Course administrator not successfull
    Given I am on login page as "Administrator"
    And I can enter userID "adminID"
    And I can enter password "Password"
    And I am able to click on submit button
    And I am able to click on "add new course" button
    And I enter course fields
      | course_name | course_details | course_duration | course_specialisation | course_startdate | course_enddate |
      | xyz         | abc            | 1year           | qtp                   | 01/09/2022       | 30/08/2023
    When I can click on course submit button
    Then I should see the error message "duplicate course"


  Scenario: Student successfully register for the course
    Given I am on login page as "Student"
    And I can enter userID "studentID"
    And I can enter password "Password"
    And I am able to click on submit button
    When I select new course name "xyz"
    Then I should see the Confirmation message "Successfully course added"
    And details stored with valid courseID

  Scenario: Student failed to register due to full course
    Given I am on login page as "Student"
    And I can enter userID "studentID"
    And I can enter password "Password"
    And I am able to click on submit button
    And I select course selection page
    When I click on course availability
    Then I see error message "due to full course"
    #if adding again enable button false,deadline gone

  Scenario:Lecturer successfully assigned a course
    Given I am on login page as "Lecturer"
    And I can enter userID "lecturerID"
    And I can enter password "Password"
    And I am able to click on submit button
    When I select course selection page
    And I am able to assign a course
    Then I should see the Confirmation message "course assigned"

  Scenario:Lecturer not successfull in assigning a course
    Given I am on login page as "Lecturer"
    And I can enter userID "lecturerID"
    And I can enter password "Password"
    And I am able to click on submit button
    When I select course selection page
    Then I should see the error message "course not available"
    #usecase: course select not able to,dropdown not working,is it enabled for lecturer,
#fields names,already

  Scenario:Lecturer not successfull in assigning a course
    Given I am on login page as "Lecturer"
    And I can enter userID "lecturerID"
    And I can enter password "Password"
    And I am able to click on submit button
    When I select course selection page
    Then I should see the error message "course not available"
    #usecase: course select not able to,dropdown not working,is it enabled for lecturer,
#fields names,already

  Scenario: course not going ahead
    Given I am on login page as "Administrator"
    And I can enter userID "adminID"
    And I can enter password "Password"
    And I am able to click on submit button
    And I am able to go to course detail page
    When I check the number of student availability for course
    Then I should see the error message "insufficient student for course"

    #not sure how to check availability