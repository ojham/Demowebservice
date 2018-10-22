Feature: Validating LUCIE Customer services with db verification.

  @CustomerCreation
  Scenario: Create Customer
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
    And we verify the if customer is created in database by executing the below Query
      #//for the "userid"  ,  Fetching RS for Query
      | userid  | <FetchFromRequestParameters> |
      | fname   | <FetchFromRequestParameters> |
      | magcode | SI                           |
   #   And we verify the if customer is created in database by executing the below Query , Vali RS with below expec values
    #  | userid | <FetchFromRequestParameters> |
    #  | fname  | <FetchFromRequestParameters> |
