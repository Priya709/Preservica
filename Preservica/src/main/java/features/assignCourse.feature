Feature:
  Course Administrator process the request for places on current course and assign a place,
  when course is full,
  lecturer will be assigned to go ahead

  Scenario Outline:Incorrect details entered
    Given Course Admin is on Website to make selection on the form
    And I select StudentID as '<StudentID>'
    And I select CourseID as '<CourseID>'
    And I select LecturerId as '<LecturerID>'
    And I select course date as '<Course_Date>'
    When I click on selection button
    Then I should see the message '<ErrorMessage>'
    Examples:
      | StudentID         | CourseID | LecturerID | Course_Date | ErrorMessage      |
      | S1231234562416332 | C987     | L456       | 01/09/2022  | Invalid ID        |
      |                   | C987     |            | 01/09/2022  | Required          |
      | S123              |          | L456       | 01/09/2022  | Required          |
      | S_123             | C987     | L456       | 01/09/2022  | Invalid ID        |
      | S123              | C9@7     | L456       | 01/09/2022  | Invalid ID        |
      | S123              | C987     | L456       | 2022/01/09  | Wrong date Format |
      | S123              | C987     | L456       |             | Required          |

  Scenario:Correct details entered
    Given Course Admin is on Website to make selection on the form
    And I select StudentID as '<StudentID>'
    And I select CourseID as '<CourseID>'
    And I select LecturerId as '<LecturerID>'
    And I select course date as '<Course_Date>'
      | StudentID | CourseID | LecturerID | Course_Date |
      | S123      | C987     | L456       | 01/09/2022  |
    When I click on selection button
    Then I should see the Confirmation message '<ConfirmationMessage>'

    #can be added multiple records

  Scenario:Course admin successfully assigned a place
    Given I am on University selection page
    And I select StudentID as "StudentID"
    And I select CourseID as "CourseID"
    And I select LecturerId as "LecturerID"
    And I select course date as "Course_Date"
    When I click on confirm button
    Then Record has been created in database
    And Confirmation message displayed "Booking is valid"
    And Confirmation email sent to the email address "email address" for student ID
    And Number of students attending is updated
    #Assuming CA is already logged in

  Scenario:Course admin not successfull in assigning a place
    Given I am on University selection page
    And I select StudentID as "StudentID"
    And I select CourseID as "CourseID"
    And I select LecturerId a "LecturerID"
    And I select course date as "Course_Date"
    When I click on confirm button
    Then I should see the message error message as "Error Message"
    And Course is over-subscribed

  Scenario:Course is going ahead
    Given I am on University selection page
    And I select StudentID as "StudentID"
    And I select CourseID as "CourseID"
    And I select LecturerId as "LecturerID"
    And I select course date as "Course_Date"
    When I click on confirm button
    And Confirmation message displayed "Booking is valid"
    Then Confirmation email sent to the email address "email address" for student ID
    And Number of students attending is updated
    And Course is full

