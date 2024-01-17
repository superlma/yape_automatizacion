Feature:  API POST BOOKING

  Background:
    * url URLBASE

  Scenario: valida la creación de una reserva

    * def body =
    """
    {
    "firstname" : "Luis",
    "lastname" : "Martinez",
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
    And path 'booking'
    And request body
    When method post
    Then status 200



  Scenario Outline: valida la creación de una reserva con un archivo csv

    * def body =
    """
    {
    "firstname" : "#(nombre)",
    "lastname" : "#(apellido)",
    "totalprice" : #(precio),
    "depositpaid" : #(deposito),
    "bookingdates" : {
        "checkin" : "#(fecha_inicio)",
        "checkout" : "#(fecha_fin)"
    },
    "additionalneeds" : "#(informacion)"
}
    """
    Given header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And path 'booking'
    And request body
    When method post
    Then status 200
    And match response.booking.firstname == "#(nombre)"
    And match response.booking.lastname == "#(apellido)"
    And match response.booking.totalprice == (parseInt(precio))
    And match response.booking.depositpaid == (deposito === 'true')
    And match response.booking.bookingdates.checkin ==  "#(fecha_inicio)"
    And match response.booking.bookingdates.checkout == "#(fecha_ fin)"
    And match response.booking.additionalneeds == "#(informacion)"

    Examples:
     |read('data/create-booking.csv')|
