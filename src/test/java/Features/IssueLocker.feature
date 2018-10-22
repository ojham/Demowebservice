Feature: Validating IssueLockerCalls

  # 5696(P4):new web service or URL to display issue locker data
  #  TC_CR_062,TC_CR_063
  Scenario Outline: Verify getStatusCallofIssueLockertableforvariousMagzines.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have the below Query parameters
    |magcode|<magCode>|
    And We log the Request
    When we send Get request to service "IssueLockersWebservice"
    Then The response status code should be "<statuscode>"

    Examples: 
      | magCode | statuscode |
      | PE      |        200 |
      | ALL     |        200 |

  #  5753 (P4 ): Enhancemnets to the issue locker API and in the admin tool
  Scenario Outline: Inserting Different issue_type into issue locker table through issue locker API call
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | sharedSecret1 | <shared_Secret1> |
      | sharedSecret2 | <shared_Secret2> |
      | magCode       | <magCode>        |
      | CGI-App-Id    | <CGI-App-Id>     |
      | issueName     | <issueName>      |
      | issueNumber   | <issueNumber>    |
      | demoCode      | <demoCode>       |
      | issueType     | <issueType>      |
      | isAllApps     | <isAllApps>      |
      | statuscode    | <statuscode>     |
    And We log the Request
    When We send post request to service "IssueLockersWebservice"
    Then The response status code should be "<statuscode>"
    Then We declare a new Request
    And We have below Header parameters
      | sharedSecret1 | <FetchFromRequestParameters> |
      | sharedSecret2 | <FetchFromRequestParameters> |
    And We have the below Query parameters
      | magCode     | <FetchFromRequestParameters> |
      | appId       | <CGI-App-Id>                 |
      | issueName   | <FetchFromRequestParameters> |
      | issueNumber | <FetchFromRequestParameters> |
      | issueType   | <FetchFromRequestParameters> |
      | demoCode    | <FetchFromRequestParameters> |
      | isAllApps   | <FetchFromRequestParameters> |
    And We log the Request
    When We send Delete request to service "IssueLockersWebservice"
    Then The response status code should be 200

    Examples: 
      | shared_Secret1 | shared_Secret2              | magCode | CGI-App-Id                    | issueName       | issueNumber    | demoCode | issueType         | isAllApps | statuscode |
      | lucietest1     | <AutogenerateBasedOnOrigin> | PE      | com.timeinc.people.ipad.inapp | <YYYYMMDD>      | <RandomNumber> |          | NEWSSTAND_SPECIAL | false     |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      |                               | <YYYYMMDD>      | <RandomNumber> |          | NEWSSTAND_SPECIAL | true      |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android          | <MM.DD.YYYY>    | <RandomNumber> |          | EXCEPTION         | false     |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      |                               | <MM.DD.YYYY>    | <RandomNumber> |          | EXCEPTION         | true      |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      |                               | <MM.DD.YYYY>    | <RandomNumber> | BTF      | DEMOCODE          | true      |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android          | <MM.DD.YYYY>    | <RandomNumber> | BTF      | DEMOCODE          | false     |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android          | <YYYYMMDD>      | <RandomNumber> | BTF      | DEMOCODE          | false     |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      |                               | <month dd,YYYY> | <RandomNumber> |          | EVERGREEN         | true      |        201 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android          | <month dd,YYYY> | <RandomNumber> |          | EVERGREEN         | false     |        201 |

  Scenario Outline: Inserting Different issue_type into issue locker table through issue locker API call
    					with inavalid Data/credentials.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Header parameters
      | Content-Type | application/json |
    And we have below Json Request Body
      | sharedSecret1 | <shared_Secret1> |
      | sharedSecret2 | <shared_Secret2> |
      | magCode       | <magCode>        |
      | CGI-App-Id    | <CGI-App-Id>     |
      | issueName     | <issueName>      |
      | issueNumber   | <issueNumber>    |
      | demoCode      | <demoCode>       |
      | issueType     | <issueType>      |
      | isAllApps     | <isAllApps>      |
      | statuscode    | <statuscode>     |
    And We log the Request
    When We send post request to service "IssueLockersWebservice"
    Then The response status code should be "<statuscode>"

    Examples: 
      | shared_Secret1 | shared_Secret2              | magCode | CGI-App-Id           | issueName       | issueNumber    | demoCode | issueType         | isAllApps | statuscode |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android | <MM.DD.YYYY>    | <RandomNumber> |          | NEWSSTAND_SPECIAL | false     |        400 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android | <YYYYMMDD>      | <RandomNumber> |          | NEWSSTAND_SPECIAL |           |        400 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      |                      | <YYYYMMDD>      | <RandomNumber> |          | NEWSSTAND_SPECIAL | false     |        400 |
      | lucietest      | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android | <YYYYMMDD>      | <RandomNumber> |          | NEWSSTAND_SPECIAL | false     |        401 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android | <YYYYMMDD>      |             -1 |          | NEWSSTAND_SPECIAL | true      |        400 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android | <YYYYMMDD>      | <RandomNumber> |          | EXCEPTION         | false     |        400 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      |                      | <MM.DD.YYYY>    | <RandomNumber> | BTF      | DEMOCODE          |           |        400 |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.android | <month dd,YYYY> | <RandomNumber> |          | EVERGREEN         | true      |        400 |

  # 5856(P4):Evergreen Locker new API GET for one record
  Scenario Outline: Validate Get Call for various Issue_Type
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Header parameters
      | sharedSecret1 | <shared_Secret1> |
      | sharedSecret2 | <shared_Secret2> |
    And We have the below Query parameters
      | issueName | <issueName>   |
      | issueNum  | <issueNumber> |
      | issueType | <issueType>   |
      | demoCode  | <demoCode>    |
      | isAllApps | <isAllApps>   |
    And We have below Path parameters
      | magcode | <magCode>    |
      | appId   | <CGI-App-Id> |
    And We log the Request
    When we send Get request to service "IssueLockergetWebservice"
    Then The response status code should be "<statuscode>"
    And Response body should contain
      | magcode   | <magCode>    |
      | appId     | <CGI-App-Id> |
      | issueType | <issueType>  |

    Examples: 
      | shared_Secret1 | shared_Secret2              | magCode | CGI-App-Id                    | issueName      | issueNumber | issueType         | statuscode | demoCode | isAllApps |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag      | March 02, 2012 |           1 | EVERGREEN         |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.iphone           | 01.02.2012     |         709 | EXCEPTION         |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.web              |       20120917 |         659 | DEMOCODE          |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | PE      | com.timeinc.people.ipad.inapp |       20110221 |         861 | NEWSSTAND_SPECIAL |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | PE      | *                             | March 01, 2011 |         650 | EVERGREEN         |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.web              |       20120917 |         659 | DEMOCODE          |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag      | March 02, 2012 |           1 | EVERGREEN         |        200 |          | true      |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag      |                |           1 | EVERGREEN         |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag      | March 02, 2012 |             | EVERGREEN         |        200 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag      | March 02, 2012 |           1 | EVERGREEN         |        200 |          | abc       |

  Scenario Outline: Validate Get Call for various Issue_Type for invalid data.
    Given We have an ENDPOINT_baseURI "BaseUrl"
    Then We declare a new Request
    And We have below Header parameters
      | sharedSecret1 | <shared_Secret1> |
      | sharedSecret2 | <shared_Secret2> |
    And We have the below Query parameters
      | issueName | <issueName>   |
      | issueNum  | <issueNumber> |
      | issueType | <issueType>   |
    And We have below Path parameters
      | magcode | <magCode>    |
      | appId   | <CGI-App-Id> |
    And We log the Request
    When we send Get request to service "IssueLockergetWebservice"
    Then The response status code should be "<statuscode>"

    Examples: 
      | shared_Secret1 | shared_Secret2              | magCode | CGI-App-Id                                    | issueName      | issueNumber | issueType | statuscode | demoCode | isAllApps |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2012 |         861 | EVERGREEN |        404 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.web                              | March 02, 2012 |           1 | EVERGREEN |        404 |          |           |
      | lucietest2     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2012 |           1 | EVERGREEN |        401 |          |           |
      | lucietest2     | lucietest2                  | TD      | com.timeinc.time.digimag                      | March 02, 2012 |           1 | EVERGREEN |        401 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2014 |           1 | EVERGREEN |        404 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2012 |           1 | EXCEPTION |        404 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | SI      | com.time.sie.web                              |       20120917 |           1 | DEMOCODE  |        404 | BTH      |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> |         | com.timeinc.time.digimag                      | March 02, 2012 |           1 | EVERGREEN |        404 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      |                                               | March 02, 2012 |         861 | EVERGREEN |        404 |          |           |
      |                | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2012 |         861 | EVERGREEN |        401 |          |           |
      | lucietest1     |                             | TD      | com.timeinc.time.digimag                      | March 02, 2012 |         861 | EVERGREEN |        401 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2012 |           1 |           |        404 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag,com.timeinc.time.web | March 02, 2012 |           1 | EVERGREEN |        404 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2012 |           1 | TYPE      |        404 |          |           |
      | lucietest1     | <AutogenerateBasedOnOrigin> | TD      | com.timeinc.time.digimag                      | March 02, 2012 |         185 | EVERGREEN |        404 |          |           |
