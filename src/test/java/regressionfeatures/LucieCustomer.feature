#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
#@tag
# @Regression @CustomerCreation
Feature: Verifying Lucie Customer .

  Scenario Outline: Create Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | <fname>           |
      | lname           | <lname>           |
      | origin          | <origin>          |
      | email           | <email>           |
      | magcode         | <magcode>         |
      | sharedsecret    | <sharedsecret>    |
      | password        | <password>        |
      | appId           | <appId>           |
      | appType         | <appType>         |
      | acct            | <acct>            |
      | acctlocation    | <acctlocation>    |
      | returnCustInfo  | <returnCustInfo>  |
      | returnAuthToken | <returnAuthToken> |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be "<statuscode>"
    And Response body should contain
      | isNewCustomer | Y          |
      | emailVerified | N          |
      | $             | auth_token |
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_token.token | authToken       |
      | cgiAccount       | cgiAccountValue |

    Examples: 
      | Slno | fname            | lname         | origin | email                         | magcode | sharedsecret                  | password   | appId                     | appType | acct           | acctlocation | returnCustInfo | returnAuthToken | statuscode |
      |    1 | LUCIE_Automation | LUCIE_Testing | APP    | <RandomEmail>                 | SI      | <AutogenerateBasedOnOrigin>   | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    2 | LUCIE_Automation | LUCIE_Testing | APP    | <RandomEmail>                 | SI      | <AutogenerateBasedOnOrigin>   |            |                           |         |                |              |                |                 |        201 |
      |    3 | LUCIE_Automation | LUCIE_Testing | APP    | <RandomEmail>                 | TK      | <AutogenerateBasedOnOrigin>   | Welcome123 | com.timeinc.tfk.classroom |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    4 |                  | LUCIE_Testing | APP    | <RandomEmail>                 | TK      | <AutogenerateBasedOnOrigin>   | Welcome123 |                           |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    5 | LUCIE_Automation |               | APP    | <RandomEmail>                 | TK      | <AutogenerateBasedOnOrigin>   | Welcome123 |                           |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    6 | LUCIE_Automation | LUCIE_Testing | APPS   | <RandomEmail>                 | SI      | <AutogenerateBasedOnOrigin>   | Welcome123 |                           |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    7 | LUCIE_Automation | LUCIE_Testing | APP    | <RandomEmail>                 |         | <AutogenerateBasedOnOrigin>   | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        400 |
      |    8 | LUCIE_Automation | LUCIE_Testing | APP    |                               | SI      | <AutogenerateBasedOnOrigin>   | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        400 |
      |    9 | LUCIE_Automation | LUCIE_Testing | APP    | <RandomEmail>                 | SI      | <AutogenerateBasedOnOrigin>   | Welcom     | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |   10 | LUCIE_Automation | LUCIE_Testing | APP    | demoautomation@mailinator.com | SI      | <AutogenerateBasedOnOrigin>   | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |   11 | LUCIE_Automation | LUCIE_Testing | APP    | <RandomEmail>                 | SI      | aa16061e7815ca19a57c9db8f84c9 | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        401 |

  #@Regression
  Scenario Outline: Create Customer with invalid TLds
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | <fname>           |
      | lname           | <lname>           |
      | origin          | <origin>          |
      | email           | <email>           |
      | magcode         | <magcode>         |
      | sharedsecret    | <sharedsecret>    |
      | password        | <password>        |
      | appId           | <appId>           |
      | appType         | <appType>         |
      | acct            | <acct>            |
      | acctlocation    | <acctlocation>    |
      | returnCustInfo  | <returnCustInfo>  |
      | returnAuthToken | <returnAuthToken> |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be "<statuscode>"

    Examples: 
      | Slno | fname            | lname         | origin | email         | magcode | sharedsecret                | password   | appId                     | appType | acct           | acctlocation | returnCustInfo | returnAuthToken | statuscode |
      |    1 | LUCIE_Automation | LUCIE_Testing | APP    | time@a.con    | SI      | <AutogenerateBasedOnOrigin> | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    2 | LUCIE_Automation | LUCIE_Testing | APP    | timea@a.neet  | SI      | <AutogenerateBasedOnOrigin> | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> |              |                |                 |        201 |
      |    3 | LUCIE_Automation | LUCIE_Testing | APP    | timea@a.ooorg | TK      | <AutogenerateBasedOnOrigin> | Welcome123 | com.timeinc.tfk.classroom |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    4 | LUCIE_Automation | LUCIE_Testing | APP    | timea@a.eud   | TK      | <AutogenerateBasedOnOrigin> | Welcome123 | com.timeinc.tfk.classroom |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    5 | LUCIE_Automation | LUCIE_Testing | APP    | timea@a.nrt   | TK      | <AutogenerateBasedOnOrigin> | Welcome123 | com.timeinc.tfk.classroom |       3 | <RandomNumber> | APP          | Y              | Y               |        201 |
      |    6 | LUCIE_Automation | LUCIE_Testing | APP    | a@a.rrcom     | SI      | <AutogenerateBasedOnOrigin> | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        400 |
      |    7 | LUCIE_Automation | LUCIE_Testing | APP    | a@a.npt       | SI      | <AutogenerateBasedOnOrigin> | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        400 |
      |    8 | LUCIE_Automation | LUCIE_Testing | APP    | a@a.asdfasdf  | SI      | <AutogenerateBasedOnOrigin> | Welcome123 | com.time.sie.web          |       3 | <RandomNumber> | APP          | Y              | Y               |        400 |

  #5473 - New Web Service Call to return a list of Magazines (magcode_list_by_customer)
  # @Regression
  @CustomerCreation
  Scenario: To verify the magcode_list_by_customer api call.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | LUCIE_Automation            |
      | lname           | LUCIE_Testing               |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | SI                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | com.time.sie.web            |
      | appType         |                           3 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
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
    Then We declare a new Request
    And We have below Header parameters
      | CGI-Token | <FetchFromResponseParameters> |
    And We have the below Query parameters
      | CGI-App-Id | <FetchFromRequestParameters> |
    And We log the Request
    When we send Get request to service "MagcodeListbyCustomer"
    Then The response status code should be 200
    And Response body Array should contain
      | magCodeList | SI |

  # @Regression
  @CustomerCreation
  Scenario Outline: To verify the magcode_list_by_customer api call with invalid/Blank Authtoken.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | LUCIE_Automation            |
      | lname           | LUCIE_Testing               |
      | origin          | APP                         |
      | email           | <RandomEmail>               |
      | magcode         | SI                          |
      | sharedsecret    | <AutogenerateBasedOnOrigin> |
      | password        | Welcome123                  |
      | appId           | com.time.sie.web            |
      | appType         |                           3 |
      | acct            | <RandomNumber>              |
      | acctlocation    | APP                         |
      | returnCustInfo  | Y                           |
      | returnAuthToken | Y                           |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_token.token | authToken       |
      | cgiAccount       | cgiAccountValue |
    Then We declare a new Request
    And We have below Header parameters
      | CGI-Token | <CGI-Token> |
    And We have the below Query parameters
      | CGI-App-Id | <CGI-App-Id> |
    And We log the Request
    When we send Get request to service "MagcodeListbyCustomer"
    Then The response status code should be "<statuscode>"

    Examples: 
      | CGI-Token                                                 | CGI-App-Id                   | statuscode |
      |                                                           | <FetchFromRequestParameters> |        400 |
      | 12b5f41f55858eda6defe6c0237edbc050569599498d1287936fc1f84 | <FetchFromRequestParameters> |        401 |

  @Regression
  Scenario: To verify magcode_list_by_customer api call with blank AppId.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname            | LUCIE_Automation            |
      | lname            | LUCIE_Testing               |
      | origin           | APP                         |
      | email            | <RandomEmail>               |
      | magcode          | SI                          |
      | sharedsecret     | <AutogenerateBasedOnOrigin> |
      | password         | Welcome123                  |
      | appId            | com.time.sie.web            |
      | appType          |                           3 |
      | acct             | <RandomNumber>              |
      | acctlocation     | APP                         |
      | subscriptiontype | S                           |
      | returnCustInfo   | Y                           |
      | returnAuthToken  | Y                           |
      | magCodeList      | SI,PE                       |
    And We log the Request
    When We send post request to service "CreateMultitleCustomer"
    Then The response status code should be 201
    And We log the Response
    And We fetch below parameters from Json Response Body
      | auth_tokens[0].auth_token.token | authToken |
    Then We declare a new Request
    And We have below Header parameters
      | CGI-Token | <FetchFromResponseParameters> |
    And We have the below Query parameters
      | CGI-App-Id | <FetchFromRequestParameters> |
    And We log the Request
    When we send Get request to service "MagcodeListbyCustomer"
    Then The response status code should be 200
    And We fetch the magcodelist from  the Json Response Body and match with expected magcodelist.
    Then We declare a new Request
    And We have below Path parameters
      | userid  | <FetchFromRequestParameters> |
      | magcode | PE                           |
    And We have below Header parameters
      | sharedsecret | <FetchFromRequestParameters> |
    And We log the Request
    When We send Delete request to service "DeleteCustomerWebservice"
    Then The response status code should be 200

  # 5537 - Sync parameters of Create CGI Customer and Create TCS Customer
  @CustomerCreation
  Scenario: To create Custonmer with receiptnumber and receipttransactionid.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname                | LUCIE_Automation            |
      | lname                | LUCIE_Testing               |
      | origin               | APP                         |
      | email                | <RandomEmail>               |
      | magcode              | SI                          |
      | sharedsecret         | <AutogenerateBasedOnOrigin> |
      | password             | Welcome123                  |
      | appId                | com.time.sie.web            |
      | appType              |                           3 |
      | acct                 | <RandomNumber>              |
      | acctlocation         | APP                         |
      | subscriptiontype     | S                           |
      | returnCustInfo       | Y                           |
      | returnAuthToken      | Y                           |
      | receiptnumber        |                     1255366 |
      | receipttransactionid |                     8523690 |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be 201
    And We log the Response

  #5574 - Amazon Dev - Add New Parameter To Reject Bad word During Customer Creation
  @CustomerCreation
  Scenario Outline: To create customer with  rejectInvalidword parameter set to Y/N and invalid/valid password.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname                 | LUCIE_Automation            |
      | lname                 | LUCIE_Testing               |
      | origin                | APP                         |
      | email                 | <RandomEmail>               |
      | magcode               | SI                          |
      | sharedsecret          | <AutogenerateBasedOnOrigin> |
      | password              | <password>                  |
      | appId                 | com.time.sie.web            |
      | appType               |                           3 |
      | acct                  | <RandomNumber>              |
      | acctlocation          | AMAZON                      |
      | subscriptiontype      | S                           |
      | returnCustInfo        | Y                           |
      | returnAuthToken       | Y                           |
      | rejectInvalidPassword | <rejectInvalidPassword>     |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be "<statuscode>"
		And We log the Response
		
    Examples: 
      | password   | rejectInvalidPassword | statuscode |
      | Welcome123 | Y                     |        201 |
      | Welc       | N                     |        201 |
      | Welcome    | Y                     |        417 |

  # 5990 (P3) : Create a new create customer account call for OAuth2 project
  	@creation
	 @CustomerCreation
  Scenario Outline: Verify CreateCustomer Call with new parameter - oauth2Response(SLT).
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname            | LUCIE_Automation            |
      | lname            | LUCIE_Testing               |
      | origin           | APP                         |
      | email            | <RandomEmail>               |
      | magcode          | SI                          |
      | sharedsecret     | <AutogenerateBasedOnOrigin> |
      | password         | Welcome123                  |
      | appId            | com.time.sie.web            |
      | appType          |                           3 |
      | acct             | <RandomNumber>              |
      | acctlocation     | APP                         |
      | subscriptiontype | S                           |
      | returnCustInfo   | Y                           |
      | returnAuthToken  | Y                           |
      | oauth2Response   | SLT                         |
    And We log the Request
    When We send post request to service "CreateCustomerWebservice"
    Then The response status code should be "<statuscode>"
    And We log the Response
    And Response body should contain
      | isNewCustomer | Y            |
      | emailVerified | N            |
      | $             | auth_token   |
      | $             | oauth2_token |

    Examples: 
      | oauth2Response | statuscode |
      | slt            |        201 |
      | llt            |        201 |
