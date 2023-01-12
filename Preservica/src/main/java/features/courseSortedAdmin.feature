Feature:Course administrator choose List Courses and see list of registered students
  for available courses and check subscription level and available places

  Scenario: query for list of courses successful
    Given I am logged on University selection page
    When I query for "list of courses"
    And I click on one course
    Then I see registered students for the course

    #use case for unsuccessful query,query wrong,database down

  Scenario: See bookings and maximum places allowed
    Given I am logged on University selection page
    And I query for "list of course"
    And I can see "available places"
    And I can see "maximum places allowed"
    When I sort view by "CourseID"
    And I sort view by "StudentID"
    Then I can see the sorted "Available places"
    And I can see the sorted "Subscription level"