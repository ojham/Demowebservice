import Base.baseUtil;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.path.xml.XmlPath;
import io.restassured.response.Response;
//import org.testng.annotations.Test;

import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.io.*;

import static org.hamcrest.CoreMatchers.equalTo;

import static io.restassured.RestAssured.given;
//import static org.jsoup.nodes.Entities.EscapeMode.base;

public class test1 {

    
    public static String generateStringFromResource(String filePath) throws IOException {
        return new String(Files.readAllBytes(Paths.get(filePath)));
    }

    //@Test
    public void validatingJSONGetResponses() {
        RestAssured.baseURI = "https://maps.googleapis.com";
        given().
                param("location", "51.503186,-0.126446").
                param("radius", "500").
                param("key", "AIzaSyA1nvEanMw8swY0ZiYGsuWJb8Ej90eygMU").
                when().
                get("/maps/api/place/nearbysearch/json").
                then().
                assertThat().statusCode(200).and().contentType(ContentType.JSON).
                and().body("results[0].name", equalTo("London")).and().
                body("results[0].place_id", equalTo("ChIJdd4hrwug2EcRmSrV3Vo6llI")).and().
                header("Server", "scaffolding on HTTPServer2");
    }

    //@Test
    public void validatingJSONPostResponses() {
        RestAssured.baseURI = "https://maps.googleapis.com";
        Response res = given().  //Fetching Raw Response
                queryParam("key", "AIzaSyA1nvEanMw8swY0ZiYGsuWJb8Ej90eygMU").
                body("{\n" +
                        "  \"location\": {\n" +
                        "    \"lat\": -33.8669710,\n" +
                        "    \"lng\": 151.1958750\n" +
                        "  },\n" +
                        "  \"accuracy\": 50,\n" +
                        "  \"name\": \"Google Shoes!\",\n" +
                        "  \"phone_number\": \"(02) 9374 4000\",\n" +
                        "  \"address\": \"48 Pirrama Road, Pyrmont, NSW 2009, Australia\",\n" +
                        "  \"types\": [\"shoe_store\"],\n" +
                        "  \"website\": \"http://www.google.com.au/\",\n" +
                        "  \"language\": \"en-AU\"\n" +
                        "}").
                when().
                post("/maps/api/place/add/json").
                then().
                assertThat().statusCode(200).and().contentType(ContentType.JSON).
                body("scope", equalTo("APP")).extract().response();
        String response = res.asString(); // Converting to string
        System.out.println(response);
        JsonPath js = new JsonPath(response);// Converting to Json
        String placeId = js.get("auth_token.token");
        System.out.println(placeId);
        //Second Post Request
        given().
                queryParam("key", "AIzaSyA1nvEanMw8swY0ZiYGsuWJb8Ej90eygMU").
                body("{\n" +
                        "  \"place_id\": \"" + placeId + "\"\n" +
                        "}").
                when().
                post("/maps/api/place/delete/json").
                then().
                assertThat().statusCode(200).and().contentType(ContentType.JSON).
                and().body("status", equalTo("OK"));


    }

    //@Test
    public void validatingXMLPostResponses() throws IOException {
        String requestXml = generateStringFromResource(System.getProperty("user.dir") + "\\src\\test\\Resources\\AddPlaceXmlRequest.xml");
        RestAssured.baseURI = "https://maps.googleapis.com";
        Response res = given().  //Fetching Raw Response
                queryParam("key", "AIzaSyA1nvEanMw8swY0ZiYGsuWJb8Ej90eygMU").
                body(requestXml).log().all().  // Logging Request
                when().
                post("/maps/api/place/add/Jsonxml").
                then().
                assertThat().statusCode(200).and().contentType(ContentType.XML).log().body(). //Logging Response
                extract().response();
        String response = res.asString(); // Converting to string
        //System.out.println(response);
        XmlPath x = new XmlPath(response);
        System.out.println(x.get("PlaceAddResponse.place_id"));

    }

    //JIRA API VALIDATION=============================================================================
    /*
    fetching Session Id for Header parameter and Authentication purpose
     */
    public String jiraApiCreateSessionId() {
        RestAssured.baseURI = "http://localhost:8080";
        Response res = given().
                header("Content-Type", "application/json").
                body("{ \"username\": \"vijianandhanbe\", \"password\": \"Iloveyou@123\" }").
                when().
                post("/rest/auth/1/session").
                then().
                assertThat().statusCode(200).
                extract().response();
        String response = res.asString();
        JsonPath js = new JsonPath(response);
        String sessionId = js.get("session.value");
        return sessionId;
    }

    /*
    For creating a Defect in JIRA
     */
    public String createIssue() {
        RestAssured.baseURI = "http://localhost:8080";
        Response res = given().
                header("Content-Type", "application/json").
                header("Cookie", "JSESSIONID=" + jiraApiCreateSessionId() + "").
                body("{\n" +
                        "    \"fields\": {\n" +
                        "       \"project\":\n" +
                        "       { \n" +
                        "          \"key\": \"JIR\"\n" +
                        "       },\n" +
                        "       \"summary\": \"Add and Update Comment\",\n" +
                        "       \"description\": \"Creating of an issue using project keys and issue type names using the REST API\",\n" +
                        "       \"issuetype\": {\n" +
                        "          \"name\": \"Bug\"\n" +
                        "       }\n" +
                        "   }\n" +
                        "}").
                when().
                post("/rest/api/2/issue").
                then().
                assertThat().statusCode(201).
                extract().response();
        String response = res.asString();
        JsonPath js = new JsonPath(response);
        String issueId = js.get("id");
        return issueId;
    }


    /**
     * Deleting Existing Issue in JIRA
     */
    //@Test
    public void deleteIssue() {
        RestAssured.baseURI = "http://localhost:8080";
        given().
                header("Cookie", "JSESSIONID=" + jiraApiCreateSessionId() + "").
                when().
                delete("/rest/api/2/issue/" + createIssue()).
                then().
                assertThat().statusCode(204);

    }

    /**
     * Updating Comment on Issue
     */
    //@Test
    public String createComment(String issueId) {
        RestAssured.baseURI = "http://localhost:8080";
        Response res = given().
                header("Content-Type", "application/json").
                header("Cookie", "JSESSIONID=" + jiraApiCreateSessionId() + "").
                body("{\n" +
                        "      \"body\": \"Added Comment through Automation\",\n" +
                        "      \"visibility\": {\n" +
                        "        \"type\": \"role\",\n" +
                        "        \"value\": \"Administrators\"\n" +
                        "      }\n" +
                        "    }").
                when().
                post("/rest/api/2/issue/" + issueId + "/comment").
                then().
                assertThat().statusCode(201).
                extract().response();
        String response = res.asString();
        JsonPath js = new JsonPath(response);
        String commentId = js.get("id");
        return commentId;
    }

    /**
     * Update Existing Comment in issue
     */
    //@Test
    public void updateComment() {
        RestAssured.baseURI = "http://localhost:8080";
        String issueId = createIssue();
        Response res = given().
                header("Content-Type", "application/json").
                header("Cookie", "JSESSIONID=" + jiraApiCreateSessionId() + "").
                body("{\n" +
                        "      \"body\": \"Updated Comment through Automation\",\n" +
                        "      \"visibility\": {\n" +
                        "        \"type\": \"role\",\n" +
                        "        \"value\": \"Administrators\"\n" +
                        "      }\n" +
                        "    }").
                when().
                put("/rest/api/2/issue/" + issueId + "/comment/" + createComment(issueId)).
                then().
                assertThat().statusCode(200).
                extract().response();
        String response = res.asString();
        JsonPath js = new JsonPath(response);
        String commentBody = js.get("body");
        System.out.println(commentBody);
    }

    // Twitter API Validation - OAuth Concept.
    //@Test
    public void fetchLatestTweet() {
        RestAssured.baseURI = "https://api.twitter.com/1.1/statuses";
        Response res = given().
                auth().oauth("lbCS8vF9EY2ql8LX4VhoJmdcM", "VOrQGuAMpoDW1HLn9EZJwVcQH5bCL74fbjjORehpJIlwfyEOqQ", "1009140711675998208-FaqjznPBvmqh6Grk2Q1bu6EAKAegLH", "QLX4KVHj9f38YpEDUhwoJwrzfeKzxYXv59tlOS2gG6eIV").
                queryParam("count", "2").
                when().get("/home_timeline.json").
                then().
                assertThat().statusCode(200).
                extract().response();
        String response = res.asString();
        JsonPath js = new JsonPath(response);
        String id = js.get("id_str").toString();
        String text = js.get("text").toString();
        System.out.println(id + "-->text=" + text);
    }

    //@Test
    public String Tweet() {
        RestAssured.baseURI = "https://api.twitter.com/1.1/statuses";
        Response res = given().
                auth().oauth("lbCS8vF9EY2ql8LX4VhoJmdcM", "VOrQGuAMpoDW1HLn9EZJwVcQH5bCL74fbjjORehpJIlwfyEOqQ", "1009140711675998208-FaqjznPBvmqh6Grk2Q1bu6EAKAegLH", "QLX4KVHj9f38YpEDUhwoJwrzfeKzxYXv59tlOS2gG6eIV").
                formParam("status", "Posting using RestAssured 1").
                when().post("/update.json").
                then().
                assertThat().statusCode(200).
                extract().response();
        String response = res.asString();
        JsonPath js = new JsonPath(response);
        String id = js.get("id_str").toString();
        String text = js.get("text").toString();
        System.out.println(id + "-->text=" + text);
        return id;
    }

    //@Test
    public void deleteTweet() {
        RestAssured.baseURI = "https://api.twitter.com/1.1/statuses";
        Response res = given().
                auth().oauth("lbCS8vF9EY2ql8LX4VhoJmdcM", "VOrQGuAMpoDW1HLn9EZJwVcQH5bCL74fbjjORehpJIlwfyEOqQ", "1009140711675998208-FaqjznPBvmqh6Grk2Q1bu6EAKAegLH", "QLX4KVHj9f38YpEDUhwoJwrzfeKzxYXv59tlOS2gG6eIV").
                when().post("/destroy/1009428505610743808.json").
                then().
                assertThat().statusCode(200).
                extract().response();
        String response = res.asString();
        JsonPath js = new JsonPath(response);
        String id = js.get("truncated").toString();
        System.out.println("Truncated" + id);
    }
    //@Test
    public void map(){
        Map<String, String> requestParams=new HashMap<String,String>();
        requestParams.put("a","1");
        requestParams.put("a","2");
        System.out.println(requestParams.get("a"));
    }
    

}
