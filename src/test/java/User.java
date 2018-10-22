import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreType;

//@JsonIgnoreType
public class User {
	
	
	 private String authToken;
	 public  String appId;
	 private String appTypeUid;


	 // Getter Methods 

	

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
	 
	 
	 
	 @Override
		public String toString() {
			return  Arrays.asList(authToken, appId, appTypeUid).toString();
		//	return new ToStringBuilder(this).append("authToken", authToken).append("appId", appId).append("appTypeUid", appTypeUid)..toString();
		}
	}


