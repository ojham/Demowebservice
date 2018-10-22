
	import com.fasterxml.jackson.annotation.JsonInclude;
	import com.fasterxml.jackson.annotation.JsonInclude;
	import com.fasterxml.jackson.annotation.JsonProperty;
	import com.fasterxml.jackson.annotation.JsonPropertyOrder;

	@JsonInclude(JsonInclude.Include.NON_NULL)
	@JsonPropertyOrder({
	"scope",
	"format",
	"key",
	"value"
	})
	public class Profile {

	@JsonProperty("scope")
	private String scope;
	@JsonProperty("format")
	private String format;
	@JsonProperty("key")
	private String key;
	@JsonProperty("value")
	private String value;

	@JsonProperty("scope")
	public String getScope() {
	return scope;
	}

	@JsonProperty("scope")
	public void setScope(String scope) {
	this.scope = scope;
	}

	@JsonProperty("format")
	public String getFormat() {
	return format;
	}

	@JsonProperty("format")
	public void setFormat(String format) {
	this.format = format;
	}

	@JsonProperty("key")
	public String getKey() {
	return key;
	}

	@JsonProperty("key")
	public void setKey(String key) {
	this.key = key;
	}

	@JsonProperty("value")
	public String getValue() {
	return value;
	}

	@JsonProperty("value")
	public void setValue(String value) {
	this.value = value;
	}
	
	
	
	
}
