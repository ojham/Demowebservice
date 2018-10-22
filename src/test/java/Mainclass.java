import java.util.ArrayList;
import java.util.LinkedList;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;



public class Mainclass {

	public static void main(String[] args) throws JsonProcessingException {
		
	Mainpojo Pojo = new Mainpojo();
	Pojo.setSharedSecret("aa16061e7815ca19a57c9db8f84c9601b739f570");
	Pojo.setOrigin("APP");
	//Pojo.setUser(Pojo.createUser());
	Pojo.setProfile(Pojo.createProfile());
	ObjectMapper mapper = new ObjectMapper();
	String json = mapper.writeValueAsString(Pojo);
	System.out.println(json);

//		Pojo P = new Pojo();
//		P.setSharedSecret("aa16061e7815ca19a57c9db8f84c9601b739f570");
//		P.setOrigin("APP");
//		
//		P.User1.setAppId("com.time.sie.web");
//		P.User1.setAppTypeUid("3");
//		P.User1.setAuthToken("103sdsd3sdf32sdfsdfsd393dfs2332sdf23423sef2es83");
//		Profile Pro = new Profile();
//		Pro.setFormat("TEXT");
//		Pro.setKey("ADDRESS");
//		Pro.setScope("GLOBAL");
//		Pro.setValue("02/10/1965");
//		
//	//	Profile Pro1 = new Profile();
//		Pro.setFormat("TEXT1");
//		Pro.setKey("ADDRESS2");
//		Pro.setScope("GLOBAL2");
//		Pro.setValue("02/10/19653");
//		P.Profile=new LinkedList<Profile>();
//	//	P.Profile.add(Pro1);
//		P.Profile.add(Pro);
//		P.setProfile(P.Profile);
		

	
		
		
//		ObjectMapper mapper = new ObjectMapper();
//		String json = mapper.writeValueAsString(P);
//		System.out.println(json);
	}
	
	
	
	

}
