Feature: Validating Amazon Customer services

  Background: Create Amazon Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Amazon_Automation           |
      | lname           | Amazon_Testing              |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | SI                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | com.time.sie.web            |
      | appType         |                           3 |
      | acct            | <RandomNumber>              |
      | acctlocation    | AMAZON                      |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And Response body should contain
      | isNewCustomer | Y          |
      | emailVerified | N          |
      | $             | auth_token |
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_token.token | authToken       |
      | cgiAccount       | cgiAccountValue |

 @CustomerCreation
  Scenario: Get Amazon Customer
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | CGI-Token | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "GetCustomerWebservice"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | userId | <FetchFromRequestParameters> |


@CustomerCreation
  Scenario: Update Amazon Customer
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | fname     | John                          |
      | lname     | Smith                         |
      | CGI-Token | <FetchFromResponseParameters> |
    And We log the Request
    When We send Put request to service "UpdateCustomerWebservice"
    Then The response status code should be 201

  Scenario: Delete Amazon Customer
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | sharedsecret | <FetchFromRequestParameters> |
    And We log the Request
    When We send Delete request to service "DeleteCustomerWebservice"
    Then The response status code should be 200


@CustomerCreation
  Scenario: Change Amazon Password
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password    | Welcome123 |
      | newpassword | Welcome234 |
    And We log the Request
    When We send Put request to service "ChangePasswordWebservice"
    Then The response status code should be 200
@CustomerCreation
  Scenario: Reset Amazon Password
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We log the Request
    When We send Put request to service "ResetPasswordWebservice"
    Then The response status code should be 200


@CustomerCreation
  Scenario: Get Amazon AuthToken
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password | Welcome123 |
    And We log the Request
    When We send post request to service "GetAuthTokenWebservice"
    Then The response status code should be 201
    And Response body should contain
      | $ | token |
    And We log the Response
    And We fetch below parameters from Json Response Body
      | token | CGI-Token |

@CustomerCreation
  Scenario: Get Amazon AuthToken With Entitlements
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password   | Welcome123                   |
      | CGI-App-Id | <FetchFromRequestParameters> |
      | appTypeUid | <FetchFromRequestParameters> |
    And We log the Request
    When We send post request to service "GetAuthTokenEntitleWebservice"
    Then The response status code should be 201
    And We log the Response
    And Response body Array should contain
      | [0].auth_token | haskey->token            |
      | [1]            | haskey->subscriptionUrls |
      | [1]            | haskey->issues           |
      | [1].subscriber | haskey->subscriberId     |
    And We fetch below parameters from Json Response Body
      | auth_token.token | CGI-Token |


@CustomerCreation
  Scenario: Get Amazon AuthToken With CustomerData
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password   | Welcome123                   |
      | CGI-App-Id | <FetchFromRequestParameters> |
      | appTypeUid | <FetchFromRequestParameters> |
    And We log the Request
    When We send post request to service "GetAuthTokenWithCustData"
    Then The response status code should be 201
    And We log the Response
    And Response body should contain
      | $     | token                        |
      | email | <FetchFromRequestParameters> |
      | $     | firstName                    |
      | $     | lastName                     |
    And We fetch below parameters from Json Response Body
      | token | CGI-Token |
      
@CustomerCreation
  Scenario: Get Amazon AuthToken With Entitlement and CustomerData
    Given We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password   | Welcome123                   |
      | CGI-App-Id | <FetchFromRequestParameters> |
      | appTypeUid | <FetchFromRequestParameters> |
    And We log the Request
    When We send post request to service "GetAuthTokenEntitleCustWebservice"
    Then The response status code should be 201
    And We log the Response
    And Response body Array should contain
      | [0].auth_token | haskey->token            |
      | [0].auth_token | haskey->firstName        |
      | [0].auth_token | haskey->lastName         |
      | [0].auth_token | haskey->email            |
      | [1]            | haskey->subscriptionUrls |
      | [1]            | haskey->issues           |
      | [1].subscriber | haskey->subscriberId     |
    And We fetch below parameters from Json Response Body
      | auth_token.token | CGI-Token |

@CustomerCreation
  Scenario: Amazon RenewAuthToken
    Given We declare a new Request
    And We have the below Query parameters
      | authToken | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "Renew_auth_tokenWebservice"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | $ | authToken |

@CustomerCreation
  Scenario: Get Amazon Entitlements
    Given We declare a new Request
    And We have the below Query parameters
      | CGI-App-Id | <FetchFromRequestParameters> |
    And We have below Header parameters
      | CGI-Token | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "GetEntitlementWebservice"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | $ | subscriptionUrls |
