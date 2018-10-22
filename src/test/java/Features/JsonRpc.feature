Feature: Validating Json rpc functionality

#TC_json_rpc_001
  Scenario: Get Configuration of your Application
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    And we have JsonBody request "Get_ConfigurationRequest"
    And We log the Request
    When We send post request to service "JsonRpc"
    Then The response status code should be 201

 #TC_json_rpc_004
    Scenario: Get Subscriptions method
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    And we have JsonBody request "Get_SubscriptionRequest"
    And We log the Request
    When We send post request to service "JsonRpc"
    Then The response status code should be 201
   