package pojo;
import com.fasterxml.jackson.annotation.JsonIgnoreType;

//@JsonIgnoreType
public class User {
	


	private String authToken;
	private String appId;
	private String appTypeUid;
	private String externalId;
	

	 // Getter Methods 

	 public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public String getAuthToken() {
	  return authToken;
	 }

	 public String getAppId() {
	  return appId;
	 }

	 public String getAppTypeUid() {
	  return appTypeUid;
	 }

	 // Setter Methods 

	 public void setAuthToken(String authToken) {
	  this.authToken = authToken;
	 }

	 public void setAppId(String appId) {
	  this.appId = appId;
	 }

	 public void setAppTypeUid(String appTypeUid) {
	  this.appTypeUid = appTypeUid;
	 }


	 
	 
	 
	}


