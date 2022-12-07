Feature: Testando API JSONplaceholder
  Background: before all
    * def url_base =  "https://jsonplaceholder.typicode.com/"
    * def post_request = {"userId":1,"title":"foo","body":"bar"}
  Scenario: Testando retorno
    Given url url_base
    And path "todos/1"
    When method get
    Then status 200
    And def batata = response
    And print batata
    And match $.id == 1


  Scenario: Testando retorno com bad invalido chamando endpoint que nao existe
    Given url url_base
    And path "todos/3232"
    When method get
    Then status 404

  Scenario: Testando retorno com metodo post com bad request
    Given url url_base
    And path "posts/1"
    When request post_request
    And method post
    Then status 404

  Scenario: Testando retorno com metodo delete
    Given url url_base
    And path "posts/1"
    When method delete
    Then status 200


  Scenario: Testando retorno e check json
    Given url url_base
    And path "/users"
    When method get
    Then status 200
    And match $.[0].website == "hildegard.org"
    And print response

  Scenario: Testando retorno  e check json
    Given url url_base
    And path "/albums"
    When method get
    Then status 200
    And match $.[2].title == "omnis laborum odio"


#  Scenario: Testando retorno com metodo post e verificando o json
#    Given url url_base
#    And path "posts/1"
#    When request post_request
#    And method post
#    Then status 200
#    And match $.
#

