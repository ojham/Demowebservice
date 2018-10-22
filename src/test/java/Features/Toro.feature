Feature: Validating Toro services

  Background: Create Toro Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | sm                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | sm.toro                     |
      | appType         |                           9 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And Response body should contain
      | isNewCustomer | Y |
      | emailVerified | N |
    And We log the Response
    And We fetch below parameters from Json Response Body
      | cgiAccount | cgiAccountValue |

  @CustomerCreation
  Scenario: Verify getLogin and get Entitlements for ToroUser.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have the below Query parameters
      | userid   | <FetchFromRequestParameters> |
      | password | <FetchFromRequestParameters> |
      | appId    | <FetchFromRequestParameters> |
      | deviceid |                        12345 |
    And We log the Request
    When We send post request to service "ToroLoginWebservice"
    Then The response status code should be 200
    And We log the Response
    And We fetch below parameters from Json Response Body
      | authToken | authToken |
    And We declare a new Request
    And We have the below Query parameters
      | authToken | <FetchFromResponseParameters> |
      | appId     | sm.toro                       |
    And We log the Request
    When we send Get request to service "ToroEntitlementsWebservice"
    Then The response status code should be 200
    And We log the Response


  @CustomerCreation
  Scenario: Renew token for Toro Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have the below Query parameters
      | userid   | <FetchFromRequestParameters> |
      | password | <FetchFromRequestParameters> |
      | appId    | <FetchFromRequestParameters> |
      | deviceid |                        12345 |
    And We log the Request
    When We send post request to service "ToroLoginWebservice"
    Then The response status code should be 200
    And We log the Response
    And We fetch below parameters from Json Response Body
      | authToken | authToken |
    And We declare a new Request
    And We have the below Query parameters
      | authToken | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "ToroRenewAuthtokenWebservice"
    Then The response status code should be 200
    And Response body should contain
      | $ | token |
