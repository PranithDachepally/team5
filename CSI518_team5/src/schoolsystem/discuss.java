package schoolsystem;

public class discuss {
	private int discuss_id;
	private String discuss_name;
	public discuss() {
		
	}
	
	public String getName() {
		return discuss_name;
	}
	public int getdiscussid() {
		return discuss_id;
	}
	public void setName(String name) {
		this.discuss_name = name;
		System.out.println("name: "+name);
	}
	public void setdiscussid(int discuss_id) {
		this.discuss_id = discuss_id;
		System.out.println("discuss_id: "+discuss_id);
	}
}
