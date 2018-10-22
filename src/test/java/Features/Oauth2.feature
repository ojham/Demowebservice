#5985 (P3) : OAuth2 Short Lived Token Web Service
#5986 (P3) : OAuth2 Long Lived Token Web Service
#5987 (P3) : Me Web Service
Feature: Validating Oauth2 feature.
  This feature validates the Oauth2 short lived, long lived and me webservices.

  Background: Create Customer
    Given We have an ENDPOINT_baseURI "BaseUrl"
    And We declare a new Request
    And We have below Form parameters
      | fname           | Automation                  |
      | lname           | Testing                     |
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


@CustomerCreation
  Scenario: Verifying generation of Short Lived , Long Lived and me webservice call.
    Given We declare a new Request
    And We have below Form parameters
      | user_id      | <FetchFromRequestParameters>        |
      | password     | <FetchFromRequestParameters>        |
      | app_id       | <FetchFromRequestParameters>        |
      | app_type     | <FetchFromRequestParameters>        |
      | redirect_uri | https://localhost:8080/testRedirect |
      | scope        | all                                 |
    And We log the Request
    When We send post request to service "Oauth2TokengetcodeWebservice"
    Then The response status code should be 201
    And Response body should contain
      | $ | code |
    And We fetch below parameters from Json Response Body
      | code | access_token |
    Then We declare a new Request
    And We have the below Query parameters
      | code          | <FetchFromResponseParameters>       |
      | client_secret | <AutogenerateBasedOnOrigin>         |
      | app_id        | <FetchFromRequestParameters>        |
      | app_type      | <FetchFromRequestParameters>        |
      | redirect_uri  | https://localhost:8080/testRedirect |
      | grant_type    | authorization_code                  |
    And We log the Request
    When We send post request to service "Oauth2TokengetTokenWebservice"
    Then The response status code should be 201
    And Response body should contain
      | $ | access_token |
      | $ | token_type   |
      | $ | expires_in   |
    And We fetch below parameters from Json Response Body
      | access_token | access_token |
    Then We declare a new Request
    And We have the below Query parameters
      | access_token | <FetchFromResponseParameters> |
      | app_id       | <FetchFromRequestParameters>  |
      | app_type     | <FetchFromRequestParameters>  |
    When we send Get request to service "MeWebservice"
    Then The response status code should be 200
    And We verify the  "lucieProfile.userId" in Json Response

	@CustomerCreation
  Scenario Outline: verify shortlived token with invalid parameters.
    Given We declare a new Request
    And We have below Form parameters
      | user_id      | <user_id>      |
      | password     | <password>     |
      | app_id       | <app_id>       |
      | app_type     | <app_type>     |
      | redirect_uri | <redirect_uri> |
      | scope        | all            |
    And We log the Request
    When We send post request to service "Oauth2TokengetcodeWebservice"
    Then The response status code should be "<statuscode>"


    Examples: 
      | user_id                      | password                     | app_id                       | app_type                     | redirect_uri                        | scope | statuscode |
      |                              | <FetchFromRequestParameters> | <FetchFromRequestParameters> | <FetchFromRequestParameters> | https://localhost:8080/testRedirect | all   |        400 |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | <FetchFromRequestParameters> |                            5 | https://localhost:8080/testRedirect | all   |        400 |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | com.time.si.web              | <FetchFromRequestParameters> | https://localhost:8080/testRedirect | all   |        400 |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | <FetchFromRequestParameters> | <FetchFromRequestParameters> | https://localhost:8080/test         | all   |        401 |
      | <FetchFromRequestParameters> | Welcome321                   | <FetchFromRequestParameters> | <FetchFromRequestParameters> | https://localhost:8080/testRedirect | all   |        401 |



	@CustomerCreation
  Scenario Outline: verify longlived token with invalid parameters.
    And We have below Form parameters
      | user_id      | <FetchFromRequestParameters>        |
      | password     | <FetchFromRequestParameters>        |
      | app_id       | <FetchFromRequestParameters>        |
      | app_type     | <FetchFromRequestParameters>        |
      | redirect_uri | https://localhost:8080/testRedirect |
      | scope        | all                                 |
    And We log the Request
    When We send post request to service "Oauth2TokengetcodeWebservice"
    Then The response status code should be 201
    And Response body should contain
      | $ | code |
    And We fetch below parameters from Json Response Body
      | code | access_token |
    Then We declare a new Request
    And We have the below Query parameters
      | code          | <code>             |
      | client_secret | <client_secret>    |
      | app_id        | <app_id>           |
      | app_type      | <app_type>         |
      | redirect_uri  | <redirect_uri>     |
      | grant_type    | authorization_code |
    And We log the Request
    When We send post request to service "Oauth2TokengetTokenWebservice"
    Then The response status code should be "<statuscode>"


    Examples: 
      | code                          | client_secret               | app_id                       | app_type                     | redirect_uri                        | grant_type         | statuscode |
      | 1856df89cae6d51a5b9559a5ab71  | <AutogenerateBasedOnOrigin> | <FetchFromRequestParameters> | <FetchFromRequestParameters> | https://localhost:8080/testRedirect | authorization_code |        404 |
      | <FetchFromResponseParameters> | <AutogenerateBasedOnOrigin> | com.time.si.web              | <FetchFromRequestParameters> | https://localhost:8080/testRedirect | authorization_code |        400 |
      | <FetchFromResponseParameters> | <AutogenerateBasedOnOrigin> | <FetchFromRequestParameters> |                           11 | https://localhost:8080/testRedirect | authorization_code |        400 |
      | <FetchFromResponseParameters> | beb495b2dd7e3c44937141a7b13 | <FetchFromRequestParameters> | <FetchFromRequestParameters> | https://localhost:8080/testRedirect | authorization_code |        401 |
   #  | <FetchFromResponseParameters> | <AutogenerateBasedOnOrigin> | <FetchFromRequestParameters> | <FetchFromRequestParameters> | https://localhost:8081/test         | authorization_code |        404 |


@CustomerCreation
  Scenario Outline: verify  Meservice call with blank with different blank parameters.
    Given We declare a new Request
    And We have below Form parameters
      | user_id      | <FetchFromRequestParameters>        |
      | password     | <FetchFromRequestParameters>        |
      | app_id       | <FetchFromRequestParameters>        |
      | app_type     | <FetchFromRequestParameters>        |
      | redirect_uri | https://localhost:8080/testRedirect |
      | scope        | all                                 |
    And We log the Request
    When We send post request to service "Oauth2TokengetcodeWebservice"
    Then The response status code should be 201
    And Response body should contain
      | $ | code |
    And We fetch below parameters from Json Response Body
      | code | access_token |
    Then We declare a new Request
    And We have the below Query parameters
      | code          | <FetchFromResponseParameters>       |
      | client_secret | <AutogenerateBasedOnOrigin>         |
      | app_id        | <FetchFromRequestParameters>        |
      | app_type      | <FetchFromRequestParameters>        |
      | redirect_uri  | https://localhost:8080/testRedirect |
      | grant_type    | authorization_code                  |
    And We log the Request
    When We send post request to service "Oauth2TokengetTokenWebservice"
    Then The response status code should be 201
    And Response body should contain
      | $ | access_token |
      | $ | token_type   |
      | $ | expires_in   |
    And We fetch below parameters from Json Response Body
      | access_token | access_token |
    Then We declare a new Request
    And We have the below Query parameters
      | access_token | <access_token> |
      | app_id       | <app_id>       |
      | app_type     | <app_type>     |
    When we send Get request to service "MeWebservice"
    Then The response status code should be "<statuscode>"
    Then We declare a new Request


    Examples: 
      | access_token                  | app_id                       | app_type                     | statuscode |
      |                               | <FetchFromRequestParameters> | <FetchFromRequestParameters> |        400 |
      | <FetchFromResponseParameters> |                              | <FetchFromRequestParameters> |        400 |
      | <FetchFromResponseParameters> | <FetchFromRequestParameters> |                              |        400 |
      | fa5902319316dca88d389bd32a0   | <FetchFromRequestParameters> | <FetchFromRequestParameters> |        404 |
      | <FetchFromResponseParameters> | com.time.sie.webbbbb         | <FetchFromRequestParameters> |        400 |
      | <FetchFromResponseParameters> | <FetchFromRequestParameters> |                           45 |        400 |
