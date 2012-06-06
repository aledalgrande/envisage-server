Feature: Client
  In order to be able to store and visualise cucumber scenario results
  As a client user
  I want to be able to submit cucumber scenario results

Scenario: create a new result
  Given I have a cucumber result with:
    | name   | description  | value |
    | test01 | blablablabla | pass  |
  When I submit it
  Then it should be available in the database

Scenario: update a result
  Given I have a cucumber result with:
    | name   | description  | value |
    | test01 | blablablabla | fail  |
  And there is a record for that cucumber result
  When I submit it
  Then the record should be overwritten
