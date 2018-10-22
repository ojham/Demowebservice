package Base;

import java.util.HashMap;
import java.util.Properties;

import org.apache.log4j.LogManager;

public class baseUtil {
	public Properties urlProperties;
	public Properties sharedSecretProperties;
	public Properties parameterMappingProperties;
	public Properties JsonRequestBody;
	public Properties QueryProperties;
	// public static Logger log=LogManager.getLogger(Hooks.class.getName());




	// Customer Management
	public HashMap<String, String> requestParameters = new HashMap<String, String>();
	public HashMap<String, String> responseParameters = new HashMap<String, String>();
	


}
