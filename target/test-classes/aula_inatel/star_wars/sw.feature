Feature: Testando API Starwars
  Scenario: Testando retorno people/1/
    Given url "https://swapi.dev/api/people/1/"
    When method get
    Then status 200
    And match $.name == "Luke Skywalker"

  Scenario: Testando retorno people/1/ com informações invalidas
    Given url "https://swapi.dev/api/people/123132/"
    When method get
    Then status 404

  Scenario: Testando retorno starships/9/
    Given url "https://swapi.dev/api/starships/9/"
    When method get
    Then status 200
    And match $.manufacturer == "Imperial Department of Military Research, Sienar Fleet Systems"