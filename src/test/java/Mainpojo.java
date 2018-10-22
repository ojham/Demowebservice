import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Mainpojo {
	
	
	 private String sharedSecret;
	 private String origin;
	 private User user;
	 private List<Profile> profile = null;


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
	 
	 
	 public List<Profile> createProfile(){
		 
		 Profile p = new Profile();
		 Profile p1 = new Profile();
		 p.setFormat("abc");
		 p.setKey("xyz");
		 p.setScope("123");
		 p.setValue("890");
		 
		 p1.setFormat("xdr");
		 p1.setKey("xyz");
		 p1.setScope("123");
		 p1.setValue("990");
		 profile= new LinkedList<Profile>();
		 profile.add(p1);
		 profile.add(p);
		 return profile;
		 
	 }
	 
	 
	 
}
