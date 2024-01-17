Feature: Create token session

  Background:
    * url URLBASE

  Scenario: Create token session OK
    * def body2 =
    """
    {
    "username" : "admin",
    "password" : "password123"
}
    """
    Given header Content-Type = 'application/json'
    And path 'auth'
    And request body2
    When method post
    Then status 200