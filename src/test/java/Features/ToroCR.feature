Feature: Validating toro cr feature

  #TC_CR_307
  @CustomerCreation
  Scenario: the Issue_ProductId in the response for toro bravo user for FO magcode.
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname           | Automation                  |
  | lname           | Testing                     |
  | origin          | APP                         |
  | email           | <RandomEmail>               |
  | magcode         | FO                          |
  | sharedsecret    | <AutogenerateBasedOnOrigin> |
  | password        | Welcome123                  |
  | appId           | fo.toro                     |
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
  | cgiAccount       | cgiAccountValue |
  Then We declare a new Request
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
  Then We declare a new Request
  And We have the below Query parameters
  | authToken | <FetchFromResponseParameters> |
  | appId     | fo.toro                       |
  | deviceid  |                         12345 |
  And We log the Request
  When we send Get request to service "ToroEntitlementsWebservice"
  Then The response status code should be 200
  And We log the Response
  And We fetch below parameters from Json Response Body
  | issues.issue_productId              | productId           |
  | issues.issuePDF_assetPathSigned     | assetPathSigned     |
  | issues.issuePDF_assetPathExpiration | assetPathExpiration |

  @CustomerCreation
  Scenario: the Issue_ProductId in the response for toro bravo user for TD magcode.
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname           | Automation                  |
  | lname           | Testing                     |
  | origin          | APP                         |
  | email           | <RandomEmail>               |
  | magcode         | TD                          |
  | sharedsecret    | <AutogenerateBasedOnOrigin> |
  | password        | Welcome123                  |
  | appId           | td.toro                     |
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
  | cgiAccount       | cgiAccountValue |
  Then We declare a new Request
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
  Then We declare a new Request
  And We have the below Query parameters
  | authToken | <FetchFromResponseParameters> |
  | appId     | td.toro                       |
  | deviceid  |                         12345 |
  And We log the Request
  When we send Get request to service "ToroEntitlementsWebservice"
  Then The response status code should be 200
  And We log the Response
  And We fetch below parameters from Json Response Body
  | issues.issue_productId              | productId           |
  | issues.issuePDF_assetPathSigned     | assetPathSigned     |
  | issues.issuePDF_assetPathExpiration | assetPathExpiration |
  
  @CustomerCreation
  Scenario: Verify XIP Response Generator for Toro Brovo .
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname           | Automation                  |
  | lname           | Testing                     |
  | origin          | APP                         |
  | email           | <RandomEmail>               |
  | magcode         | PE                          |
  | sharedsecret    | <AutogenerateBasedOnOrigin> |
  | password        | Welcome123                  |
  | appId           | pe.toro.xip                 |
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
  | cgiAccount       | cgiAccountValue |
  Then We declare a new Request
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
  Then We declare a new Request
  And We have the below Query parameters
  | authToken | <FetchFromResponseParameters> |
  | appId     | pe.toro.xip                   |
  | deviceid  |                         12345 |
  And We log the Request
  When we send Get request to service "ToroEntitlementsWebservice"
  Then The response status code should be 200
  And We log the Response
  And We fetch below parameters from Json Response Body
  | issues.issue_productId | productId |
  
  
  	
  	#LUCIE-6341 (P3) - Toro Bravo Entitlement - throwing NPE with AD token
  	@CustomerCreation
  Scenario: Verifying Toro Entitlement call for Ad User.
  Given We have an ENDPOINT_baseURI "BaseUrl"
  And We declare a new Request
  And We have below Form parameters
  | fname           | Automation                  |
  | lname           | Testing                     |
  | origin          | APP                         |
  | email           | manish.ojha@timeinc.com     |
  | magcode         | SM                          |
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
  | cgiAccount       | cgiAccountValue |
  Then We declare a new Request
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
  Then We declare a new Request
  And We have the below Query parameters
  | authToken | <FetchFromResponseParameters> |
  | appId     | sm.toro                       |
  | deviceid  |                         12345 |
  And We log the Request
  When we send Get request to service "ToroEntitlementsWebservice"
  Then The response status code should be 200
  And We log the Response
  And We fetch below parameters from Json Response Body
  | issues.issue_productId | productId |
  
  Scenario: Get Brands for Toro Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | sharedsecret | lucietest1 |
      | brandId      | *          |
    And We log the Request
    When we send Get request to service "ToroBravoBrand"
    Then The response status code should be 200
    And We log the Response
    And We fetch below parameters from Json Response Body
      | brandArray[2].brandId | brandId |
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | sharedsecret | lucietest1                    |
      | brandId      | <FetchFromResponseParameters> |
    And We log the Request
    When we send Get request to service "ToroBravoBrand"
    Then The response status code should be 200
    And Response body Array should contain
      | brandArray.brandId   | 2e1094dd8d4f4f37d4ced9b4b261ed5f |
      | brandArray.magCode   | SM                               |
      | brandArray.brandName | Real Simple                      |



	#LUCIE-6332 (P3) - Toro Bravo CaaS query
	#LUCIE-6336 (P3) - Toro - Sorting for Get Latest Issue
  Scenario: Get Catalog for Toro Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | sharedsecret | lucietest1 |
      | appId        | sm.toro    |
    And We log the Request
    When we send Get request to service "ToroGetCatalogWebservice"
    Then The response status code should be 200
    And We log the Response
    And weverifythenumberof "issues"
 
