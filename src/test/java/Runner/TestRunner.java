package Runner;

//import org.junit.runner.RunWith;
import org.testng.annotations.Test;

import cucumber.api.CucumberOptions;
//import cucumber.api.junit.Cucumber;
import cucumber.api.testng.AbstractTestNGCucumberTests;


//@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/java/Features/test.feature", 
				plugin = { "pretty","json:target/Result.json","html:target/site/cucumber-pretty"},
				glue = {"Steps"},
				//tags = " @creation",
				strict=true,
				dryRun=false,
				monochrome=true)

public class TestRunner extends AbstractTestNGCucumberTests {



}
