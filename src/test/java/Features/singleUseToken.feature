#5493-auto sign-in process (singleUseToken)
Feature: verifying autoSignInProcess.

  #TC_CR_048
  @CustomerCreation
  Scenario: Verify customer creation with parameter singleUseToken set to true.
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname            | Automation                  |
  | lname            | Testing                     |
  | origin           | APP                         |
  | email            | <RandomEmail>               |
  | magcode          | PE                          |
  | sharedsecret     | <AutogenerateBasedOnOrigin> |
  | password         | Welcome123                  |
  | appId            | com.timeinc.people.web      |
  | appType          |                           3 |
  | subscriptiontype | S                           |
  | acct             | <RandomNumber>              |
  | acctlocation     | APP                         |
  | returnCustInfo   | Y                           |
  | returnAuthToken  | Y                           |
  | singleUseToken   | true                        |
  And We log the Request
  When We send post request to service "CreateCustomerWebservice"
  Then The response status code should be 201
  And We log the Response
  And Response body should contain
  | isNewCustomer | Y             |
  | emailVerified | N             |
  | auth_token    | haskey->token |
  
  # TC_CR_057 and TC_CR_058
  @CustomerCreation
  Scenario Outline: Verify customer creation with parameter singleUseToken set to true
  			and returnAuthToken set to N/Blank.
  
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname            | Automation                  |
  | lname            | Testing                     |
  | origin           | APP                         |
  | email            | <RandomEmail>               |
  | magcode          | PE                          |
  | sharedsecret     | <AutogenerateBasedOnOrigin> |
  | password         | Welcome123                  |
  | appId            | com.timeinc.people.web      |
  | appType          |                           3 |
  | subscriptiontype | S                           |
  | acct             | <RandomNumber>              |
  | acctlocation     | APP                         |
  | returnCustInfo   | Y                           |
  | returnAuthToken  | <returnAuthToken>           |
  | singleUseToken   | <singleUseToken>            |
  And We log the Request
  When We send post request to service "CreateCustomerWebservice"
  Then The response status code should be 201
  And We log the Response
  And Response body should contain
  | isNewCustomer | Y          |
  | emailVerified | N          |
  | $             | cgiAccount |
  
  Examples:
  | returnAuthToken | singleUseToken |
  | N               | true           |
  |                 | true           |
  #TC_CR_049 and # TC_CR_050
  @CustomerCreation
  Scenario: Verify the database entry after using singleUseToken
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname            | Automation                  |
  | lname            | Testing                     |
  | origin           | APP                         |
  | email            | <RandomEmail>               |
  | magcode          | PE                          |
  | sharedsecret     | <AutogenerateBasedOnOrigin> |
  | password         | Welcome123                  |
  | appId            | com.timeinc.people.web      |
  | appType          |                           3 |
  | subscriptiontype | S                           |
  | acct             | <RandomNumber>              |
  | acctlocation     | APP                         |
  | returnCustInfo   | Y                           |
  | returnAuthToken  | Y                           |
  | singleUseToken   | true                        |
  And We log the Request
  When We send post request to service "CreateCustomerWebservice"
  Then The response status code should be 201
  And We log the Response
  And Response body should contain
  | isNewCustomer | Y             |
  | emailVerified | N             |
  | auth_token    | haskey->token |
  And We fetch below parameters from Json Response Body
  | auth_token.token | authToken |
  Then We declare a new Request
  And We have the below Query parameters
  | CGI-App-Id | <FetchFromRequestParameters> |
  And We have below Header parameters
  | CGI-Token | <FetchFromResponseParameters> |
  And We log the Request
  When we send Get request to service "GetEntitlementWebservice"
  Then The response status code should be 200
  And We log the Response
  Then We declare a new Request
  And We have the below Query parameters
  | CGI-App-Id | <FetchFromRequestParameters> |
  And We have below Header parameters
  | CGI-Token | <FetchFromResponseParameters> |
  And We log the Request
  When we send Get request to service "GetEntitlementWebservice"
  Then The response status code should be 499
  And We log the Response
  And Response body should contain
  | errorDescription | 499 SINGLE_USE_TOKEN_ALREADY_USED |
  #TC_CR_054
   @CustomerCreation
  Scenario: Verify create auth token with parameter singleUseToken set to false in customer creation
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname            | Automation                  |
  | lname            | Testing                     |
  | origin           | APP                         |
  | email            | <RandomEmail>               |
  | magcode          | PE                          |
  | sharedsecret     | <AutogenerateBasedOnOrigin> |
  | password         | Welcome123                  |
  | appId            | com.timeinc.people.web      |
  | appType          |                           3 |
  | subscriptiontype | S                           |
  | acct             | <RandomNumber>              |
  | acctlocation     | APP                         |
  | returnCustInfo   | Y                           |
  | returnAuthToken  | Y                           |
  | singleUseToken   | false                       |
  And We log the Request
  When We send post request to service "CreateCustomerWebservice"
  Then The response status code should be 201
  And We log the Response
  And Response body should contain
  | isNewCustomer | Y             |
  | emailVerified | N             |
  | auth_token    | haskey->token |
  And We fetch below parameters from Json Response Body
  | auth_token.token | authToken |
  Then We declare a new Request
  And We have below Path parameters
  | userid  | <FetchFromRequestParameters> |
  | magcode | <FetchFromRequestParameters> |
  And We have below Header parameters
  | Content-Type | application/json |
  And we have below Json Request Body
  | deviceip   | 123.45.49.121                 |
  | deviceid   |                     123456781 |
  | CGI-App-Id | <FetchFromRequestParameters>  |
  | token      | <FetchFromResponseParameters> |
  And We log the Request
  When We send post request to service "GetAuthTokenEntitleCustWebservice"
  Then The response status code should be 404
  
  #TC_CR_055
  @CustomerCreation
  Scenario: Verify create auth token with parameter singleUseToken blank in customer creation
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname            | Automation                  |
      | lname            | Testing                     |
      | origin           | APP                         |
      | email            | <RandomEmail>               |
      | magcode          | PE                          |
      | sharedsecret     | <AutogenerateBasedOnOrigin> |
      | password         | Welcome123                  |
      | appId            | com.timeinc.people.web      |
      | appType          |                           3 |
      | subscriptiontype | S                           |
      | acct             | <RandomNumber>              |
      | acctlocation     | APP                         |
      | returnCustInfo   | Y                           |
      | returnAuthToken  | Y                           |
      | singleUseToken   |                             |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    And Response body should contain
      | isNewCustomer | Y             |
      | emailVerified | N             |
      | auth_token    | haskey->token |
    Then We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password | <FetchFromRequestParameters> |
    And We log the Request
    When We send post request to service "GetAuthTokenWebservice"
    Then The response status code should be 201
    And Response body should contain
      | $ | token |
    And We fetch below parameters from Json Response Body
      | token | authToken |
    Then We declare a new Request
    And We have the below Query parameters
      | CGI-App-Id | <FetchFromRequestParameters> |
    And We have below Header parameters
      | CGI-Token | <FetchFromResponseParameters> |
    And We log the Request
    When We send multiple get Request to service "GetEntitlementWebservice" and the response code should be 200.

  #TC_CR_056
  @CustomerCreation
  Scenario: Verify Get_Entitlement call using reusable auth token generated from singleUseToken
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname            | Automation                  |
      | lname            | Testing                     |
      | origin           | APP                         |
      | email            | <RandomEmail>               |
      | magcode          | PE                          |
      | sharedsecret     | <AutogenerateBasedOnOrigin> |
      | password         | Welcome123                  |
      | appId            | com.timeinc.people.web      |
      | appType          |                           3 |
      | subscriptiontype | S                           |
      | acct             | <RandomNumber>              |
      | acctlocation     | APP                         |
      | returnCustInfo   | Y                           |
      | returnAuthToken  | Y                           |
      | singleUseToken   | true                        |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    And Response body should contain
      | isNewCustomer | Y             |
      | emailVerified | N             |
      | auth_token    | haskey->token |
    Then We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | deviceip   | 123.45.49.121                |
      | deviceid   |                    123456781 |
      | CGI-App-Id | <FetchFromRequestParameters> |
      | password   | <FetchFromRequestParameters> |
    And We log the Request
    When We send post request to service "GetAuthTokenEntitleCustWebservice"
		Then The response status code should be 201
		And We fetch below parameters from Json Response Body
      | [0].auth_token.token | authToken |
    Then We declare a new Request
    And We have the below Query parameters
      | CGI-App-Id | <FetchFromRequestParameters> |
    And We have below Header parameters
      | CGI-Token | <FetchFromResponseParameters> |
    And We log the Request
    When We send multiple get Request to service "GetEntitlementWebservice" and the response code should be 200.
  
      