Feature: Validating Change Request Services

  #LUCIE-6280(P3)-Create new logic to store/retrive lucie_pub_id in our profile system
  @CustomerCreation
  Scenario Outline: Verify Pub level Id in the response for NZ and JNZ magcodes.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | <magcode>                   |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | <appID>                     |
      | appType         |                           3 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And Response body should contain
      | isNewCustomer | Y                  |
      | emailVerified | N                  |
      | $             | pubLevelCustomerId |
    And We log the Response
    Then We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password   | <FetchFromRequestParameters> |
      | CGI-App-Id | <appID>                      |
      | appTypeUid |                            3 |
    And We log the Request
    When We send post request to service "GetAuthTokenWebservice"
    Then The response status code should be 201
    And We log the Response
    And Response body should contain
      | $ | token              |
      | $ | pubLevelCustomerId |

    Examples: 
      | magcode | appID           |
      | NZ      | com.nutritionaction.web |
      | JNZ     | org.cspinet.web |

  # LUCIE-6427 -  Platinum Subscription Type for NatGeo
  Scenario: Verify the Platinum Subscription Type for NatGeo
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Path parameters
      | userid  | demo_aexp_paid@mailinator.com |
      | magcode | NG                            |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password    | lucietest1     |
      | CGI-App-Id  | com.natgeo.web |
      | pubGroup    | NATGEO         |
      | magCodeList | NG             |
    And We log the Request
    When We send post request to service "GetAuthTokenEntitleWebservice"
    Then The response status code should be 201
    And We log the Response
    And We fetch below parameters from Json Response Body
      | NG.auth_token.token | CGI-Token |
    Then We declare a new Request
    And We have below Path parameters
      | userid  | demo_aexp_paid@mailinator.com |
      | magcode | NG                            |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password    | lucietest1     |
      | CGI-App-Id  | com.natgeo.web |
      | pubGroup    | NATGEO         |
      | magCodeList | NG             |
    And We log the Request
    When We send post request to service "GetAuthTokenEntitleCustWebservice"
    Then The response status code should be 201
    And We log the Response
    And We fetch below parameters from Json Response Body
      | NG[0].auth_token.token | authToken |
    Then We declare a new Request
    And We have the below Query parameters
      | CGI-App-Id | com.natgeo.web |
    And We have below Header parameters
      | CGI-Token | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "GetEntitlementWebservice"
    Then The response status code should be 200

  #LUCIE-6403 (P3) - Password validation for NG
  #TC_CR_336
  Scenario: Verifying Change Password call for NG customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Path parameters
      | userid  | timeNG001@mailinator.com |
      | magcode | NG                       |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password    | Welcome123  |
      | newpassword | Welcome@123 |
    When We send Put request to service "ChangePasswordWebservice"
    Then The response status code should be 200
    And We log the Response
    Then We declare a new Request
    And We have below Path parameters
      | userid  | timeNG001@mailinator.com |
      | magcode | NG                       |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password    | Welcome@123 |
      | newpassword | Welcomeabc  |
    When We send Put request to service "ChangePasswordWebservice"
    Then The response status code should be 406

  Scenario: Change the password Back to original
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Path parameters
      | userid  | timeNG001@mailinator.com |
      | magcode | NG                       |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password    | Welcome@123 |
      | newpassword | Welcome123  |
    When We send Put request to service "ChangePasswordWebservice"
    Then The response status code should be 200

  # LUCIE-6233(P3)-Alter createCustomer call to overwrite the password for existing customers
  @CustomerCreation
  Scenario: Verifying create and get customer call to overwrite the password for existing customers.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | SI                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        |                             |
      | appId           | com.time.sie.web            |
      | appType         |                           8 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    Then We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | <FetchFromRequestParameters> |
    And We have below Header parameters
      | origin       | APP                         |
      | sharedsecret | <AutogenerateBasedOnOrigin> |
    And We have the below Query parameters
      | returnCustInfo | Y |
    When we send Get request to service "GetCustomerWebservice"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | defaultPassword | true |
    Then We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | SI                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | com.time.sie.web            |
      | appType         |                           8 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    And Response body should contain
      | auth_token.defaultPassword | false |

  # LUCIE-6213(P3)-Passwords with space at end during create customer
  @CustomerCreation
  Scenario Outline: To verify Customer is being created with paasword having space in beginning/end.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | SI                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | <password>                  |
      | appId           | com.time.sie.web            |
      | appType         |                           3 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We append the "password" with space
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And Response body should contain
      | isNewCustomer | Y |
      | emailVerified | N |

    Examples: 
      | password   |
      | Welcome123 |

  #  LUCIE-6242(P3)-CSPI: CSPInet/na.com: Update LUCIE auth w/ customer data calls to include Digital Commerce account info
  #  LUCIE-6241(P3)-CSPI: CSPInet/na.com: Enhance TCS integration to handle Digital Commerce accounts
  Scenario: To check for dcaccountinfo in AuthTokenWithCustomerData response for JNZ magcode of CSPI publisher
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Path parameters
      | userid  | CSPISUB1@MAILINATOR.COM |
      | magcode | JNZ                     |
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | password    | lucie1          |
      | CGI-App-Id  | org.cspinet.web |
      | appTypeUid  |               3 |
      | pubGroup    | CSPI            |
      | magCodeList | *               |
    And We log the Request
    When We send post request to service "GetAuthTokenWithCustData"
    Then The response status code should be 201
    And Response body should contain
      | JNZ | haskey-> dcAccountInfo |

  # LUCIE-6287(P3) - Customers renew auth token support for pubGroup
  @CustomerCreation
  Scenario: To verify authToken gets generated when renew auth token call is executed with magcode TR and pubgroup NATGEO.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | TR                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | com.ngtraveler.web          |
      | appType         |                           3 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | pubGroup        | NATGEO                      |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_token.TR.token | authToken |
    Then We declare a new Request
    And We have the below Query parameters
      | authToken   | <FetchFromResponseParameters> |
      | appId       | com.ngtraveler.web            |
      | pubGroup    | <FetchFromRequestParameters>  |
      | magCodeList | *                             |
    And We log the Request
    When we send Get request to service "Renew_auth_tokenWebservice"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | $ | authToken |

  # LUCIE-6395 -  People Perks: Augeo + SUBS + LUCIE + Zuora Integration)
  # TC_CR_337
  @CustomerCreation
  Scenario: Verify  the V2/entitlements call for the user created with ZPH magcode.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
      | origin          | SUBS                        |
      | email           | <RandomEmail>               |
      | magcode         | ZPH                         |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | zph.zuora                   |
      | appType         |                          10 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_token.token | authToken |
    Then We declare a new Request
    And We have below Header parameters
      | authToken | <FetchFromResponseParameters> |
      | appId     | zph.zuora                     |
    When we send Get request to service "GetV2EntitlementWebservice"
    Then The response status code should be 200
    And Response body should contain
      | customer | haskey->lucieAccountKey |

  #  6133 (P3) - Add authToken parameter to DIN calls for demo choices
  #  TC_CR_202
  @CustomerCreation
  Scenario: Verify Auth token is been added to DIN call.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname            | TCS_Automation              |
      | lname            | TCS_Testing                 |
      | origin           | TCS                         |
      | email            | <RandomEmail>               |
      | magcode          | TD                          |
      | demochoices      | AGNR=AM                     |
      | sharedsecret     | <AutogenerateBasedOnOrigin> |
      | password         | Welcome123                  |
      | tcslogin         | tcs2010                     |
      | tcspassword      | c0mmonG@teway1              |
      | appId            | com.timeinc.time.web        |
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
    Then We declare a new Request
    And We have below Path parameters
      | userid  | dinupdate.dec142015@custserv.com |
      | magcode | TD                               |
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
      | token | authToken |
    Then We declare a new Request
    And We have the below Query parameters
      | sharedsecret | lucietest1                       |
      | demochoices  | q=a                              |
      | authToken    | <FetchFromResponseParameters>    |
      | email        | dinupdate.dec142015@custserv.com |
      | magcode      | TD                               |
      | origin       | lucietest1                       |
    When We send post request to service "Demo_ChoiceWebservice"
    Then The response status code should be 200
