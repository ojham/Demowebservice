package pojo;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Mainpojo {
	
	
	 private String sharedSecret;
	 private String origin;
	 private User user;
	 private List<Profile> profile = null;
	 private String externalId;

	 // Getter Methods 

	 public String getSharedSecret() {
		  return sharedSecret;
		 }

		 public String getOrigin() {
		  return origin;
		 }

		 public User getUser() {
		  return user;
		 }

	 // Setter Methods 

	 public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public void setSharedSecret(String sharedSecret) {
	  this.sharedSecret = sharedSecret;
	 }

	 public void setOrigin(String origin) {
	  this.origin = origin;
	 }

	 public void setUser(User userObject) {
	  this.user = userObject;
	 }

	 public List<Profile> getProfile() {
		return profile;
	}

	public void setProfile(List<Profile> profile) {
		this.profile = profile;
	}

	public User createUser(String AppId, String AppTypeUid, String AuthToken ){
		 user =new User();
		 user.setAppId(AppId);
		 user.setAppTypeUid(AppTypeUid);
		 user.setAuthToken(AuthToken);
		 return user;
	 }
	public User createUser(String AppId, String AppTypeUid, String AuthToken,String externalId ){
		 user =new User();
		 user.setAppId(AppId);
		 user.setAppTypeUid(AppTypeUid);
		 user.setAuthToken(AuthToken);
		 return user;
	 } 
	public User createUser_ExternalId(String AppId, String AppTypeUid, String externalId ){
		 user =new User();
		 user.setAppId(AppId);
		 user.setAppTypeUid(AppTypeUid);
		 user.setExternalId(externalId);
		 return user;
	 }

	 public List<Profile> createProfile(String scope, String format,String key, String value){
		 
		 Profile	 p = new Profile();
		 p.setFormat(format);
		 p.setKey(key);
		 p.setScope(scope);
		 p.setValue(value);
		 profile= new LinkedList<Profile>();
		 profile.add(p);
		 return profile;
		 
	 }

	 
}
