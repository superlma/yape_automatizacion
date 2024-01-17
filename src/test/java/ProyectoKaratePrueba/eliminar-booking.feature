Feature: DELETE BOOKJING

  Background:
    * url URLBASE
    * def feature = call read('classpath:ProyectoKaratePrueba/crear-token.feature')
    * def feature2 = call read('classpath:ProyectoKaratePrueba/Consultar_Booking.feature@ejecutar_escenario')

  Scenario: validar que se elimine la reserva
    Given cookie token = feature.response.token
    And path 'booking' , feature2.response[0].bookingid
    When method delete
    Then status 201