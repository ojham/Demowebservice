$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("src/test/java/Features/Toro.feature");
formatter.feature({
  "line": 1,
  "name": "Validating Toro services",
  "description": "",
  "id": "validating-toro-services",
  "keyword": "Feature"
});
formatter.before({
  "duration": 5737842,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "Create Toro Customer",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "We have an ENDPOINT_baseURI \"BaseUrl\"",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "We declare a new Request",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "We have below Form parameters",
  "rows": [
    {
      "cells": [
        "fname",
        "Automation"
      ],
      "line": 7
    },
    {
      "cells": [
        "lname",
        "Testing"
      ],
      "line": 8
    },
    {
      "cells": [
        "origin",
        "APP"
      ],
      "line": 9
    },
    {
      "cells": [
        "email",
        "\u003cRandomEmail\u003e"
      ],
      "line": 10
    },
    {
      "cells": [
        "magcode",
        "sm"
      ],
      "line": 11
    },
    {
      "cells": [
        "sharedsecret",
        "\u003cAutogenerateBasedOnOrigin\u003e"
      ],
      "line": 12
    },
    {
      "cells": [
        "password",
        "Welcome123"
      ],
      "line": 13
    },
    {
      "cells": [
        "appId",
        "sm.toro"
      ],
      "line": 14
    },
    {
      "cells": [
        "appType",
        "9"
      ],
      "line": 15
    },
    {
      "cells": [
        "acct",
        "\u003cRandomNumber\u003e"
      ],
      "line": 16
    },
    {
      "cells": [
        "acctlocation",
        "APP"
      ],
      "line": 17
    },
    {
      "cells": [
        "returnCustInfo",
        "Y"
      ],
      "line": 18
    },
    {
      "cells": [
        "returnAuthToken",
        "Y"
      ],
      "line": 19
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "We log the Request",
  "keyword": "And "
});
formatter.step({
  "line": 21,
  "name": "We send post request to service \"CreateCustomerWebservice\"",
  "keyword": "When "
});
formatter.step({
  "line": 22,
  "name": "The response status code should be 201",
  "keyword": "Then "
});
formatter.step({
  "line": 23,
  "name": "Response body should contain",
  "rows": [
    {
      "cells": [
        "isNewCustomer",
        "Y"
      ],
      "line": 24
    },
    {
      "cells": [
        "emailVerified",
        "N"
      ],
      "line": 25
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 26,
  "name": "We log the Response",
  "keyword": "And "
});
formatter.step({
  "line": 27,
  "name": "We fetch below parameters from Json Response Body",
  "rows": [
    {
      "cells": [
        "cgiAccount",
        "cgiAccountValue"
      ],
      "line": 28
    }
  ],
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "BaseUrl",
      "offset": 29
    }
  ],
  "location": "restAssuredUtils.we_have_an_ENDPOINT_baseURI(String)"
});
formatter.result({
  "duration": 489081445,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weDeclareANewRequest()"
});
formatter.result({
  "duration": 146069213,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.We_have_below_Form_parameters(String,String\u003e)"
});
formatter.result({
  "duration": 45483450,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheRequest()"
});
formatter.result({
  "duration": 22920187,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "CreateCustomerWebservice",
      "offset": 33
    }
  ],
  "location": "restAssuredUtils.we_send_post_request_to_service(String)"
});
formatter.result({
  "duration": 3929767442,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "201",
      "offset": 35
    }
  ],
  "location": "restAssuredUtils.The_response_status_code_is(int)"
});
formatter.result({
  "duration": 35812073,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.Response_body_should_contain(String,String\u003e)"
});
formatter.result({
  "duration": 507353840,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheResponse()"
});
formatter.result({
  "duration": 39462942,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weFetchBelowParametersFromBody(String,String\u003e)"
});
formatter.result({
  "duration": 21647162,
  "status": "passed"
});
formatter.scenario({
  "line": 31,
  "name": "Verify getLogin and get Entitlements for ToroUser.",
  "description": "",
  "id": "validating-toro-services;verify-getlogin-and-get-entitlements-for-torouser.",
  "type": "scenario",
  "keyword": "Scenario",
  "tags": [
    {
      "line": 30,
      "name": "@CustomerCreation"
    }
  ]
});
formatter.step({
  "line": 32,
  "name": "We have an ENDPOINT_baseURI \"BaseUrl\"",
  "keyword": "Given "
});
formatter.step({
  "line": 33,
  "name": "We declare a new Request",
  "keyword": "And "
});
formatter.step({
  "line": 34,
  "name": "We have the below Query parameters",
  "rows": [
    {
      "cells": [
        "userid",
        "\u003cFetchFromRequestParameters\u003e"
      ],
      "line": 35
    },
    {
      "cells": [
        "password",
        "\u003cFetchFromRequestParameters\u003e"
      ],
      "line": 36
    },
    {
      "cells": [
        "appId",
        "\u003cFetchFromRequestParameters\u003e"
      ],
      "line": 37
    },
    {
      "cells": [
        "deviceid",
        "12345"
      ],
      "line": 38
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 39,
  "name": "We log the Request",
  "keyword": "And "
});
formatter.step({
  "line": 40,
  "name": "We send post request to service \"ToroLoginWebservice\"",
  "keyword": "When "
});
formatter.step({
  "line": 41,
  "name": "The response status code should be 200",
  "keyword": "Then "
});
formatter.step({
  "line": 42,
  "name": "We log the Response",
  "keyword": "And "
});
formatter.step({
  "line": 43,
  "name": "We fetch below parameters from Json Response Body",
  "rows": [
    {
      "cells": [
        "authToken",
        "authToken"
      ],
      "line": 44
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 45,
  "name": "We declare a new Request",
  "keyword": "And "
});
formatter.step({
  "line": 46,
  "name": "We have the below Query parameters",
  "rows": [
    {
      "cells": [
        "authToken",
        "\u003cFetchFromResponseParameters\u003e"
      ],
      "line": 47
    },
    {
      "cells": [
        "appId",
        "sm.toro"
      ],
      "line": 48
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 49,
  "name": "We log the Request",
  "keyword": "And "
});
formatter.step({
  "line": 50,
  "name": "we send Get request to service \"ToroEntitlementsWebservice\"",
  "keyword": "When "
});
formatter.step({
  "line": 51,
  "name": "The response status code should be 200",
  "keyword": "Then "
});
formatter.step({
  "line": 52,
  "name": "We log the Response",
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "BaseUrl",
      "offset": 29
    }
  ],
  "location": "restAssuredUtils.we_have_an_ENDPOINT_baseURI(String)"
});
formatter.result({
  "duration": 113230,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weDeclareANewRequest()"
});
formatter.result({
  "duration": 866051,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.we_have_the_below_Query_parameters(String,String\u003e)"
});
formatter.result({
  "duration": 3129434,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheRequest()"
});
formatter.result({
  "duration": 310564,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "ToroLoginWebservice",
      "offset": 33
    }
  ],
  "location": "restAssuredUtils.we_send_post_request_to_service(String)"
});
formatter.result({
  "duration": 1349763405,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 35
    }
  ],
  "location": "restAssuredUtils.The_response_status_code_is(int)"
});
formatter.result({
  "duration": 1161435,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheResponse()"
});
formatter.result({
  "duration": 3158562,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weFetchBelowParametersFromBody(String,String\u003e)"
});
formatter.result({
  "duration": 22996494,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weDeclareANewRequest()"
});
formatter.result({
  "duration": 4675688,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.we_have_the_below_Query_parameters(String,String\u003e)"
});
formatter.result({
  "duration": 454153,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheRequest()"
});
formatter.result({
  "duration": 301948,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "ToroEntitlementsWebservice",
      "offset": 32
    }
  ],
  "location": "restAssuredUtils.weSendGetRequestToService(String)"
});
formatter.result({
  "duration": 4979858478,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 35
    }
  ],
  "location": "restAssuredUtils.The_response_status_code_is(int)"
});
formatter.result({
  "duration": 1704614,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheResponse()"
});
formatter.result({
  "duration": 12045118,
  "status": "passed"
});
formatter.after({
  "duration": 305640,
  "status": "passed"
});
formatter.after({
  "duration": 1656947564,
  "status": "passed"
});
formatter.before({
  "duration": 5764918,
  "status": "passed"
});
formatter.background({
  "line": 3,
  "name": "Create Toro Customer",
  "description": "",
  "type": "background",
  "keyword": "Background"
});
formatter.step({
  "line": 4,
  "name": "We have an ENDPOINT_baseURI \"BaseUrl\"",
  "keyword": "Given "
});
formatter.step({
  "line": 5,
  "name": "We declare a new Request",
  "keyword": "And "
});
formatter.step({
  "line": 6,
  "name": "We have below Form parameters",
  "rows": [
    {
      "cells": [
        "fname",
        "Automation"
      ],
      "line": 7
    },
    {
      "cells": [
        "lname",
        "Testing"
      ],
      "line": 8
    },
    {
      "cells": [
        "origin",
        "APP"
      ],
      "line": 9
    },
    {
      "cells": [
        "email",
        "\u003cRandomEmail\u003e"
      ],
      "line": 10
    },
    {
      "cells": [
        "magcode",
        "sm"
      ],
      "line": 11
    },
    {
      "cells": [
        "sharedsecret",
        "\u003cAutogenerateBasedOnOrigin\u003e"
      ],
      "line": 12
    },
    {
      "cells": [
        "password",
        "Welcome123"
      ],
      "line": 13
    },
    {
      "cells": [
        "appId",
        "sm.toro"
      ],
      "line": 14
    },
    {
      "cells": [
        "appType",
        "9"
      ],
      "line": 15
    },
    {
      "cells": [
        "acct",
        "\u003cRandomNumber\u003e"
      ],
      "line": 16
    },
    {
      "cells": [
        "acctlocation",
        "APP"
      ],
      "line": 17
    },
    {
      "cells": [
        "returnCustInfo",
        "Y"
      ],
      "line": 18
    },
    {
      "cells": [
        "returnAuthToken",
        "Y"
      ],
      "line": 19
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 20,
  "name": "We log the Request",
  "keyword": "And "
});
formatter.step({
  "line": 21,
  "name": "We send post request to service \"CreateCustomerWebservice\"",
  "keyword": "When "
});
formatter.step({
  "line": 22,
  "name": "The response status code should be 201",
  "keyword": "Then "
});
formatter.step({
  "line": 23,
  "name": "Response body should contain",
  "rows": [
    {
      "cells": [
        "isNewCustomer",
        "Y"
      ],
      "line": 24
    },
    {
      "cells": [
        "emailVerified",
        "N"
      ],
      "line": 25
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 26,
  "name": "We log the Response",
  "keyword": "And "
});
formatter.step({
  "line": 27,
  "name": "We fetch below parameters from Json Response Body",
  "rows": [
    {
      "cells": [
        "cgiAccount",
        "cgiAccountValue"
      ],
      "line": 28
    }
  ],
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "BaseUrl",
      "offset": 29
    }
  ],
  "location": "restAssuredUtils.we_have_an_ENDPOINT_baseURI(String)"
});
formatter.result({
  "duration": 238359,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weDeclareANewRequest()"
});
formatter.result({
  "duration": 354461,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.We_have_below_Form_parameters(String,String\u003e)"
});
formatter.result({
  "duration": 1049025,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheRequest()"
});
formatter.result({
  "duration": 284718,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "CreateCustomerWebservice",
      "offset": 33
    }
  ],
  "location": "restAssuredUtils.we_send_post_request_to_service(String)"
});
formatter.result({
  "duration": 1956653574,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "201",
      "offset": 35
    }
  ],
  "location": "restAssuredUtils.The_response_status_code_is(int)"
});
formatter.result({
  "duration": 990769,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.Response_body_should_contain(String,String\u003e)"
});
formatter.result({
  "duration": 28264182,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheResponse()"
});
formatter.result({
  "duration": 641641,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weFetchBelowParametersFromBody(String,String\u003e)"
});
formatter.result({
  "duration": 7869122,
  "status": "passed"
});
formatter.scenario({
  "line": 56,
  "name": "Renew token for Toro Customer",
  "description": "",
  "id": "validating-toro-services;renew-token-for-toro-customer",
  "type": "scenario",
  "keyword": "Scenario",
  "tags": [
    {
      "line": 55,
      "name": "@CustomerCreation"
    }
  ]
});
formatter.step({
  "line": 57,
  "name": "We have an ENDPOINT_baseURI \"BaseUrl\"",
  "keyword": "Given "
});
formatter.step({
  "line": 58,
  "name": "We declare a new Request",
  "keyword": "And "
});
formatter.step({
  "line": 59,
  "name": "We have the below Query parameters",
  "rows": [
    {
      "cells": [
        "userid",
        "\u003cFetchFromRequestParameters\u003e"
      ],
      "line": 60
    },
    {
      "cells": [
        "password",
        "\u003cFetchFromRequestParameters\u003e"
      ],
      "line": 61
    },
    {
      "cells": [
        "appId",
        "\u003cFetchFromRequestParameters\u003e"
      ],
      "line": 62
    },
    {
      "cells": [
        "deviceid",
        "12345"
      ],
      "line": 63
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 64,
  "name": "We log the Request",
  "keyword": "And "
});
formatter.step({
  "line": 65,
  "name": "We send post request to service \"ToroLoginWebservice\"",
  "keyword": "When "
});
formatter.step({
  "line": 66,
  "name": "The response status code should be 200",
  "keyword": "Then "
});
formatter.step({
  "line": 67,
  "name": "We log the Response",
  "keyword": "And "
});
formatter.step({
  "line": 68,
  "name": "We fetch below parameters from Json Response Body",
  "rows": [
    {
      "cells": [
        "authToken",
        "authToken"
      ],
      "line": 69
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 70,
  "name": "We declare a new Request",
  "keyword": "And "
});
formatter.step({
  "line": 71,
  "name": "We have the below Query parameters",
  "rows": [
    {
      "cells": [
        "authToken",
        "\u003cFetchFromResponseParameters\u003e"
      ],
      "line": 72
    }
  ],
  "keyword": "And "
});
formatter.step({
  "line": 73,
  "name": "We log the Request",
  "keyword": "And "
});
formatter.step({
  "line": 74,
  "name": "we send Get request to service \"ToroRenewAuthtokenWebservice\"",
  "keyword": "When "
});
formatter.step({
  "line": 75,
  "name": "The response status code should be 200",
  "keyword": "Then "
});
formatter.step({
  "line": 76,
  "name": "Response body should contain",
  "rows": [
    {
      "cells": [
        "$",
        "token"
      ],
      "line": 77
    }
  ],
  "keyword": "And "
});
formatter.match({
  "arguments": [
    {
      "val": "BaseUrl",
      "offset": 29
    }
  ],
  "location": "restAssuredUtils.we_have_an_ENDPOINT_baseURI(String)"
});
formatter.result({
  "duration": 81641,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weDeclareANewRequest()"
});
formatter.result({
  "duration": 286359,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.we_have_the_below_Query_parameters(String,String\u003e)"
});
formatter.result({
  "duration": 491897,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheRequest()"
});
formatter.result({
  "duration": 241230,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "ToroLoginWebservice",
      "offset": 33
    }
  ],
  "location": "restAssuredUtils.we_send_post_request_to_service(String)"
});
formatter.result({
  "duration": 1294683245,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 35
    }
  ],
  "location": "restAssuredUtils.The_response_status_code_is(int)"
});
formatter.result({
  "duration": 3732920,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheResponse()"
});
formatter.result({
  "duration": 2628921,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weFetchBelowParametersFromBody(String,String\u003e)"
});
formatter.result({
  "duration": 12769220,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weDeclareANewRequest()"
});
formatter.result({
  "duration": 287590,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.we_have_the_below_Query_parameters(String,String\u003e)"
});
formatter.result({
  "duration": 285948,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.weLogTheRequest()"
});
formatter.result({
  "duration": 593230,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "ToroRenewAuthtokenWebservice",
      "offset": 32
    }
  ],
  "location": "restAssuredUtils.weSendGetRequestToService(String)"
});
formatter.result({
  "duration": 1271720803,
  "status": "passed"
});
formatter.match({
  "arguments": [
    {
      "val": "200",
      "offset": 35
    }
  ],
  "location": "restAssuredUtils.The_response_status_code_is(int)"
});
formatter.result({
  "duration": 1083487,
  "status": "passed"
});
formatter.match({
  "location": "restAssuredUtils.Response_body_should_contain(String,String\u003e)"
});
formatter.result({
  "duration": 9886761,
  "status": "passed"
});
formatter.after({
  "duration": 119385,
  "status": "passed"
});
formatter.after({
  "duration": 1547995038,
  "status": "passed"
});
});