Feature: Testando pokemon e gorest
  Background: before all
    * def url_base_pokemon =  "https://pokeapi.co/api/v2/"
    * def url_base_gorest =  "https://gorest.co.in/"


  Scenario: Testando retorno pokemon ditto
    Given url url_base_pokemon
    And path "/pokemon/ditto"
    When method get
    Then status 200


  Scenario: Testando retorno com value invalido com pokemon abacate
    Given url url_base_pokemon
    And path "/pokemon/abacate"
    When method get
    Then status 404

  Scenario: Testando retorno ditto e verificando JSON
    Given url url_base_pokemon
    And path "/pokemon/ditto"
    When method get
    Then status 200
    And match response.name == "ditto"
    And match response.id == 132

  Scenario: Testando retorno poke red e entrando no elementos do array
    Given url url_base_pokemon
    And path "/version/1"
    When method get
    Then status 200
    And  def idioma = $.names[5].language.url
    And print idioma
    And url idioma
    When method get
    Then status 200
    And match $.id == 7
    And match $.name == "es"

    Scenario: Testando metodo post no gorest e retornando 401
      Given url url_base_gorest
      And path "/public/v2/users"
      When method post
      Then status 401

    Scenario: Testando metodo delete no gorest
      Given header Authorization = "Bearer c2cd94e4f0259925e93f158ba8a6fd485792fa79958a962d4bd8a2cc721a05ef"
      Given url url_base_gorest
      And path "/public/v2/users/48"
#      se nao rodar mudar o numero do user
      When method delete
      Then status 204



