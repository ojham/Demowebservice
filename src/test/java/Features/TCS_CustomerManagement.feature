Feature: Validating TCS Customer services

  Background: Create TCS Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname            | TCS_Automation              |
      | lname            | TCS_Testing                 |
      | origin           | TCS                         |
      | email            | <RandomEmail>               |
      | magcode          | SI                          |
      | sharedsecret     | <AutogenerateBasedOnOrigin> |
      | password         | Welcome123                  |
      | tcslogin         | tcs2010                     |
      | tcspassword      | c0mmonG@teway1              |
      | appId            | com.time.sie.web            |
      | appType          |                           3 |
      | acct             | <RandomNumber>              |
      | acctlocation     | TCS                         |
      | subscriptiontype | S                           |
      | returnCustInfo   | Y                           |
      | returnAuthToken  | Y                           |
    And We log the Request
    When We send post request to service "Create_TCSCustomerWebservice"
    Then The response status code should be 201
    And Response body should contain
      | isNewCustomer | Y |
      | emailVerified | N |
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_token.token | authToken       |
      | cgiAccount       | cgiAccountValue |

  @CustomerCreation
  Scenario: Get TCS Customer
  Given We declare a new Request
  And We have below Path parameters
  | userid  | <FetchFromRequestParameters> |
  | magcode | <FetchFromRequestParameters> |
  And We log the Request
  When we send Get request to service "TCS_GetCustomerWebservice"
  Then The response status code should be 200
  And We log the Response
  And Response body should contain
  | userId | <FetchFromRequestParameters> |
  
  @CustomerCreation
  Scenario: Update TCS Customer
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
  When We send Put request to service "TCS_UpdateCustomerWebservice"
  Then The response status code should be 201
  
  Scenario: Delete TCS Customer
  Given We declare a new Request
  And We have below Path parameters
  | userid  | <FetchFromRequestParameters> |
  | magcode | <FetchFromRequestParameters> |
  And We have below Header parameters
  | tcslogin    | tcs2010        |
  | tcspassword | c0mmonG@teway1 |
  And We log the Request
  When We send Delete request to service "TCS_DeleteCustomerWebservice"
  Then The response status code should be 200
  
  @CustomerCreation
  Scenario: Change TCS Password
  Given We declare a new Request
  And We have below Path parameters
  | userid  | <FetchFromRequestParameters> |
  | magcode | <FetchFromRequestParameters> |
  And We have below Header parameters
  | Content-Type | application/json |
  And we have below Json Request Body
  | password    | Welcome123 |
  | newpassword | Welcome234 |
  And We log the Response
  When We send Put request to service "TCS_ChangePasswordWebservice"
  Then The response status code should be 200
  
  @CustomerCreation
  Scenario: Reset TCS Password
  Given We declare a new Request
  And We have below Path parameters
  | userid  | <FetchFromRequestParameters> |
  | magcode | <FetchFromRequestParameters> |
  And We log the Request
  When We send Put request to service "TCS_ResetPasswordWebservice"
  Then The response status code should be 200
  
  @CustomerCreation
  Scenario: TCS Get AuthToken
  Given We declare a new Request
  And We have below Path parameters
  | userid  | <FetchFromRequestParameters> |
  | magcode | <FetchFromRequestParameters> |
  And We have below Header parameters
  | Content-Type | application/json |
  And we have below Json Request Body
  | password | Welcome123 |
  And We log the Request
  When We send post request to service "TCS_GetAuthTokenWebservice"
  Then The response status code should be 201
  And Response body should contain
  | $ | token |
  And We log the Response
  And We fetch below parameters from Json Response Body
  | token | CGI-Token |
  
  @CustomerCreation
  Scenario: TCS Get AuthToken With CustomerData
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
  When We send post request to service "TCS_GetAuthTokenWithCustData"
  Then The response status code should be 201
  And We log the Response
  And Response body should contain
  | $     | token                        |
  | email | <FetchFromRequestParameters> |
  | $     | firstName                    |
  | $     | lastName                     |
  @CustomerCreation
  Scenario: TCS Get AuthToken With Full CustomerData
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
    When We send post request to service "TCS_GetAuthTokenWithFullCustData"
    Then The response status code should be 201
    And We log the Response
    And Response body should contain
      | $         | token             |
      | user_info | haskey->userId    |
      | user_info | haskey->firstName |
      | user_info | haskey->lastName  |
  @CustomerCreation
  Scenario: TCS RenewAuthToken
    Given We declare a new Request
    And We have the below Query parameters
      | authToken | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "TCS_RenewAuthToken"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | $ | authToken |

  @CustomerCreation
  Scenario: Get Entitlements
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
