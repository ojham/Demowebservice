Feature: Validating Zinio services

  Background: Create RollingStone Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                   |
      | lname           | Testing                      |
      | origin          | APP                          |
      | email           | <RandomEmail>                |
      | magcode         | RS                           |
      | sharedsecret    | <AutogenerateBasedOnOrigin>  |
      | password        | Welcome123                   |
      | appId           | com.wennermedia.rollingstone |
      | appType         |                            8 |
      | acct            | <RandomNumber>               |
      | acctlocation    | APP                          |
      | returnCustInfo  | Y                            |
      | returnAuthToken | Y                            |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And Response body should contain
      | isNewCustomer | Y |
      | emailVerified | N |
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_token.token | authToken       |
      | cgiAccount       | cgiAccountValue |

 
  @CustomerCreation
  Scenario: Login to Zinio customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | email    | <FetchFromRequestParameters> |
      | password | Welcome123                   |
      | appId    | com.wennermedia.rollingstone |
    And We log the Request
    When We send post request to service "ZinioLoginWebservice"
    Then The response status code should be 200
    And We log the Response

 
  @CustomerCreation
  Scenario: Get Entitlements for Zinio Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | email    | <FetchFromRequestParameters> |
      | password | <FetchFromRequestParameters> |
      | appId    | com.wennermedia.rollingstone |
    And We log the Request
    When We send post request to service "ZinioLoginWebservice"
    Then The response status code should be 200
    And We fetch below parameters from Json Response Body
      | token | authToken |
    And We declare a new Request
    And We have below Form parameters
      | authToken | <FetchFromResponseParameters> |
      | appId     | com.wennermedia.rollingstone  |
    And We log the Request
    When we send Get request to service "ZinioEntitlementsWebservice"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | $       | entitled_issues |
      | success | true            |

  
  @CustomerCreation
  Scenario Outline: Login to Zinio customer with invalid parameters
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | email    | <email>    |
      | password | <password> |
      | appId    | <appId>    |
    And We log the Request
    When We send post request to service "ZinioLoginWebservice"
    Then The response status code should be "<statuscode>"
    And We log the Response
    And Response body should contain
      | success | false |

    Examples: 
      | email                        | password                     | appId                        | statuscode |
      | <FetchFromRequestParameters> | Welcome12                    | com.wennermedia.rollingstone |        404 |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | com.wennermeda.rollingstone  |        400 |

  @CustomerCreation
  Scenario: Renew token for Zinio Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | email    | <FetchFromRequestParameters> |
      | password | <FetchFromRequestParameters> |
      | appId    | com.wennermedia.rollingstone |
    And We log the Request
    When We send post request to service "ZinioLoginWebservice"
    Then The response status code should be 200
    And We fetch below parameters from Json Response Body
      | token | authToken |
    And We declare a new Request
    And We have below Form parameters
      | authToken | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "ZinioRenewAuthtokenWebservice"
    Then The response status code should be 200
    And We log the Response

  
  @CustomerCreation
  Scenario Outline: Renew token for Zinio Customer for invalid/Blank  AuthToken.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | email    | <FetchFromRequestParameters> |
      | password | <FetchFromRequestParameters> |
      | appId    | com.wennermedia.rollingstone |
    And We log the Request
    When We send post request to service "ZinioLoginWebservice"
    Then The response status code should be 200
    And We fetch below parameters from Json Response Body
      | token | CGI-Token |
    And We declare a new Request
    And We have below Form parameters
      | authToken | <authToken> |
    And We log the Request
    When we send Get request to service "ZinioRenewAuthtokenWebservice"
    Then The response status code should be "<statuscode>"

    Examples: 
      | authToken                               | statuscode |
      |                                         |        401 |
      | e6644672e823769d629a0b0f975329aabe15f31 |        401 |

  #LUCIE-6366 (P3) - zinio resource granting wrong issue for error queue
  #TC_CR_326
  @CustomerCreation
  Scenario: Verifying Zinio Entitlement call for MJ magcode
    Given We declare a new Request
    And We have the below Query parameters
      | authToken | <FetchFromResponseParameters> |
      | appId     | com.wennermedia.mensjournal   |
    And We log the Request
    When we send Get request to service "ZinioEntitlementsWebservice"
    Then The response status code should be 200
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | TCS                         |
      | email           | <RandomEmail>               |
      | magcode         | MJ                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | com.wennermedia.mensjournal |
      | appType         |                           8 |
      | acct            |                             |
      | acctlocation    | TCS                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    And Response body should contain
      | isNewCustomer | Y |
      | emailVerified | N |
    Then We declare a new Request
    And We have below Form parameters
      | email    | <FetchFromRequestParameters> |
      | password | <FetchFromRequestParameters> |
      | appId    | com.wennermedia.mensjournal  |
    And We log the Request
    When We send post request to service "ZinioLoginWebservice"
    Then The response status code should be 200
    And We log the Response
    And We fetch below parameters from Json Response Body
      | token | authToken |
