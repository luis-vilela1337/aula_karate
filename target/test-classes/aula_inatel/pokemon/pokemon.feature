Feature: Testando API Pokemon
  Background: before all
    * def url_base =  "https://pokeapi.co/api/v2/"

  Scenario: Testando retorno
    Given url "https://pokeapi.co/api/v2/pokemon/ditto"
    When method get
    Then status 200


  Scenario: Testando retorno com value invalido
    Given url "https://pokeapi.co/api/v2/pokemon/abacate"
    When method get
    Then status 404

  Scenario: Testando retorno ditto e verificando JSON
    Given url url_base
    And path "/pokemon/ditto"
    When method get
    Then status 200
    And match response.name == "ditto"
    And match response.id == 132

  Scenario: Testando retorno poke red e entrando no elementos do array
    Given url url_base
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