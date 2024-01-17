Feature: API GET BOOKING

  Background:
    * url URLBASE

@ejecutar_escenario
  Scenario:  Validar consulta con metodo GET
    Given path 'booking'
    When method get
    Then status 200

    Scenario:  Validar consulta booking detalle
      Given path 'booking'
      When method get
      Then status 200
      * def id = response[0].bookingid
      Given header Accept = 'application/json'
      Given path 'booking',id
      When method get
      Then status 200
      And match response.firstname == 'John'
