package pojo;

	import com.fasterxml.jackson.annotation.JsonInclude;
	import com.fasterxml.jackson.annotation.JsonInclude;
	import com.fasterxml.jackson.annotation.JsonProperty;
	import com.fasterxml.jackson.annotation.JsonPropertyOrder;

		public class Profile {

	
	private String scope;	
	private String format;	
	private String key;
	private String value;

	
	public String getScope() {
	return scope;
	}

	
	public void setScope(String scope) {
	this.scope = scope;
	}


	public String getFormat() {
	return format;
	}


	public void setFormat(String format) {
	this.format = format;
	}

	
	public String getKey() {
	return key;
	}

	
	public void setKey(String key) {
	this.key = key;
	}

	public String getValue() {
	return value;
	}


	public void setValue(String value) {
	this.value = value;
	}
	
	
	
	
}
