
Feature: To verify creation , reteriveing and deleting profile webservices.

  Background: Create Customer
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

  #TC_CR_203
  @profileDeletion
  Scenario: To create a profile with scope as Application.
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    Then createJSonObject
      | origin       | <FetchFromRequestParameters>  |
      | sharedsecret | <FetchFromRequestParameters>  |
      | appId        | <FetchFromRequestParameters>  |
      | appTypeUid   | <FetchFromRequestParameters>  |
      | authToken    | <FetchFromResponseParameters> |
      | scope        | APPLICATION                   |
      | format       | TEXT                          |
      | key          | DOB                           |
      | value        | 02/10/1965                    |
    And We log the Request
    When We send post request to service "ProfileWebservice"
    Then The response status code should be 201

  #TC_CR_204
  @profileDeletionExternalid
  Scenario: Verify the Create Profile call with AD/External customer and scope as GLOBAL
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    Then createJSonObject from global
      | origin       | <FetchFromRequestParameters> |
      | sharedsecret | <FetchFromRequestParameters> |
      | appId        | <FetchFromRequestParameters> |
      | appTypeUid   | <FetchFromRequestParameters> |
      | externalId   | acbd                         |
      | scope        | GLOBAL                       |
      | format       | TEXT                         |
      | key          | ADDRESS                      |
      | value        | 110 HendricksStreet          |
    And We log the Request
    When We send post request to service "ProfileWebservice"
    Then The response status code should be 201

  #TC_CR_205
  @profileDeletionExternalid
  Scenario: Verify Create profile call by passing both ExternalId and authtoken
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    Then createJSonObject from global
      | origin       | <FetchFromRequestParameters>  |
      | sharedsecret | <FetchFromRequestParameters>  |
      | appId        | <FetchFromRequestParameters>  |
      | appTypeUid   | <FetchFromRequestParameters>  |
      | externalId   | acbd                          |
      | authToken    | <FetchFromResponseParameters> |
      | scope        | GLOBAL                        |
      | format       | TEXT                          |
      | key          | ADDRESS                       |
      | value        | 110 HendricksStreet           |
    And We log the Request
    When We send post request to service "ProfileWebservice"
    Then The response status code should be 201

  #  TC_CR_207&TC_CR_208
  @CustomerCreation
  Scenario: Verify Create profile call with missing parameters.
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    Then createJSonObject from global
      | origin       | <FetchFromRequestParameters> |
      | sharedsecret | <FetchFromRequestParameters> |
      | appId        | <FetchFromRequestParameters> |
      | appTypeUid   | <FetchFromRequestParameters> |
      | scope        | GLOBAL                       |
      | format       | TEXT                         |
      | key          | ADDRESS                      |
      | value        | 110 HendricksStreet          |
    And We log the Request
    When We send post request to service "ProfileWebservice"
    Then The response status code should be 400

  # TC_CR_209
  @profileDeletionExternalid
  Scenario: Verify get profile call .
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    Then createJSonObject from global
      | origin       | <FetchFromRequestParameters>  |
      | sharedsecret | <FetchFromRequestParameters>  |
      | appId        | <FetchFromRequestParameters>  |
      | appTypeUid   | <FetchFromRequestParameters>  |
      | externalId   | acbd                          |
      | authToken    | <FetchFromResponseParameters> |
      | scope        | GLOBAL                        |
      | format       | TEXT                          |
      | key          | ADDRESS                       |
      | value        | 110 HendricksStreet           |
    And We log the Request
    When We send post request to service "ProfileWebservice"
    Then The response status code should be 201
    And We declare a new Request
    And We have the below Query parameters
      | sharedsecret | <FetchFromRequestParameters> |
      | origin       | <FetchFromRequestParameters> |
      | externalId   | acbd                         |
      | scope        | GLOBAL                       |
      | appId        | <FetchFromRequestParameters> |
      | appTypeUid   | <FetchFromRequestParameters> |
      | key          | ADDRESS                      |
    Then we send Get request to service "ProfileWebservice"
    Then The response status code should be 200
    And We log the Response
    And Response body should contain
      | user.externalId | acbd             |
      | user.appId      | com.time.sie.web |
      | user.appTypeUid |                3 |

  #TC_CR_210 and TC_CR_211
  @profileDeletion
  Scenario Outline: Verify get profile Call with inavalid/missing parameters.
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    Then createJSonObject
      | origin       | <FetchFromRequestParameters>  |
      | sharedsecret | <FetchFromRequestParameters>  |
      | appId        | <FetchFromRequestParameters>  |
      | appTypeUid   | <FetchFromRequestParameters>  |
      | authToken    | <FetchFromResponseParameters> |
      | scope        | APPLICATION                   |
      | format       | TEXT                          |
      | key          | DOB                           |
      | value        | 02/10/1965                    |
    And We log the Request
    When We send post request to service "ProfileWebservice"
    Then The response status code should be 201
    And We declare a new Request
    And We have the below Query parameters
      | sharedsecret | <sharedsecret>               |
      | origin       | <origin>                     |
      | authToken    | <authToken>                  |
      | scope        | APPLICATION                  |
      | appId        | <FetchFromRequestParameters> |
      | appTypeUid   | <FetchFromRequestParameters> |
      | key          | ADDRESS                      |
    Then we send Get request to service "ProfileWebservice"
    Then The response status code should be "<statuscode>"

    Examples: 
      | sharedsecret                 | origin                       | authToken | appId                        | appTypeUid                   | key     | statuscode |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> |           | <FetchFromRequestParameters> | <FetchFromRequestParameters> | ADDRESS |        400 |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | acbd      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | ADDRESS |        401 |

	#TC_CR_213 and TC_CR_214
  @profileDeletion
  Scenario Outline: Verify delete  profile Call with inavalid/missing parameters.
    And We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    Then createJSonObject
      | origin       | <FetchFromRequestParameters>  |
      | sharedsecret | <FetchFromRequestParameters>  |
      | appId        | <FetchFromRequestParameters>  |
      | appTypeUid   | <FetchFromRequestParameters>  |
      | authToken    | <FetchFromResponseParameters> |
      | scope        | APPLICATION                   |
      | format       | TEXT                          |
      | key          | DOB                           |
      | value        | 02/10/1965                    |
    And We log the Request
    When We send post request to service "ProfileWebservice"
    Then The response status code should be 201
    And We declare a new Request
    And We have the below Query parameters
      | sharedsecret | <sharedsecret>               |
      | origin       | <origin>                     |
      | authToken    | <authToken>                  |
      | scope        | APPLICATIONN                 |
      | appId        | <FetchFromRequestParameters> |
      | appTypeUid   | <FetchFromRequestParameters> |
      | key          | ADDRESS                      |
    Then We send Delete request to service "ProfileWebservice"
    Then The response status code should be "<statuscode>"

    Examples: 
      | sharedsecret                 | origin                       | authToken                     | appId                        | appTypeUid                   | key     | statuscode |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | <FetchFromResponseParameters> | <FetchFromRequestParameters> | <FetchFromRequestParameters> | ADDRESS |        400 |
      | <FetchFromRequestParameters> | <FetchFromRequestParameters> | abcd                          | <FetchFromRequestParameters> | <FetchFromRequestParameters> | ADDRESS |        401 |
