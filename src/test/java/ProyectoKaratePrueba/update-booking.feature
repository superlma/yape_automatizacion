Feature: UPDATE BOOKING

  Background:
    * url URLBASE
    * def feature = call read('classpath:ProyectoKaratePrueba/crear-token.feature')
    * def feature2 = call read('classpath:ProyectoKaratePrueba/Consultar_Booking.feature@ejecutar_escenario')

  Scenario:  validar la actualización de la reserva
    * def body =
    """
    {
    "firstname" : "James",
    "lastname" : "Brown",
    "totalprice" : 111,
    "depositpaid" : true,
    "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
    },
    "additionalneeds" : "Breakfast"
}
    """

    Given header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And cookie token = feature.response.token
    And path 'booking' , feature2.response[0].bookingid
    And request body
    When method put
    Then status 200


  Scenario:  validar actualización parcial de reserva
    * def body =
    """
    {
    "firstname" : "Luis",
    "lastname" : "Martinez",
    "totalprice" : 2222,
    "depositpaid" : false
  }
    """

    Given header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And cookie token = feature.response.token
    And path 'booking' , feature2.response[0].bookingid
    And request body
    When method patch
    Then status 200