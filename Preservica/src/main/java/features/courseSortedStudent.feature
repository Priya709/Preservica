Feature: Student choose List Courses and can see his/her registered courses

  Scenario: query for list of courses successful
    Given I am logged on University selection page
    When I query for my requested "list of courses"
    Then I can see number of attendees
    And I can not see detail of other students

     #use case for unsuccessful query,query wrong,might return wrong list,database down


  Scenario: see sorted view of list
    Given I am logged on University selection page
    And I query for my registered"list of courses"
    When I sort view by "CourseID"
    And I sort view by "StudentID"
    Then I can see the sorted bookings