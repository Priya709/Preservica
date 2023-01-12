Feature: Student search for the courses so that he can register
  to attend the courses

  Background: Student is on home page of university website

  Scenario: I want to make sure student not able to search for course
    When I can search for university course
      | course_name | expected_result |
      |             | Required        |
      | Man@        | No result       |
      | Techn_ology | No result       |
      | 123         | No result       |
      | man123      | No result       |
      | man123man   | No result       |

    Then I am not able to see matching Titles and Course IDs

  Scenario: Student search for courses
    When I can search for university course
      | course_name  |
      | Finance      |
      | *Management  |
      | Man*         |
      | "Management" |
      | *Man         |
    Then I am able to see matching Titles and Course IDs
    And I am able to register and attend the course

  Scenario:Search failed
    Given I can search for the course
    When I am using "*finance" in search criteria
    Then I can not see related search


  Scenario:Search failed
    Given I can search for the course
    When Student is using "*finance" in search criteria
    Then I can see error message as "page not found"





