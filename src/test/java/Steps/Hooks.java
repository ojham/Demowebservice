package Steps;

import Base.baseUtil;
import Constants.constants;
import Utils.genericUtils;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;


public class Hooks extends baseUtil {
	private baseUtil base;
	genericUtils refGenericUtils = new genericUtils();

	public Hooks(baseUtil base) {
		this.base = base;
	}

	@Before
	public void scenarioInitialization() {
		System.out.println("Starting of Execution");
		base.urlProperties = refGenericUtils.readPropertyFile(constants.URL_PROPERTIES_FILE_PATH);
		base.sharedSecretProperties = refGenericUtils.readPropertyFile(constants.SHARED_SECRET_PROPERTIES_FILE_PATH);
		base.parameterMappingProperties = refGenericUtils
				.readPropertyFile(constants.PARAMETER_MAPPING_PROPERTIES_FILE_PATH);
		base.JsonRequestBody = refGenericUtils.readPropertyFile(constants.JsonRequest);
		base.QueryProperties=refGenericUtils.readPropertyFile(constants.QUERY_PROPERTIES_FILE_PATH);

	}

	@After
	public void TearDown(Scenario sc) {
		System.out.println("End of Execution");
		System.out.println("Status:" + sc.isFailed());
	}
	

}
