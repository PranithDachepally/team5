package schoolsystem;

public class Appointment {
	int receiverid;
	String rfirstname;
	String rlastname;
	int senderid;
	String sfirstname;
	String slastname;
	String time;
	String date;
	public Appointment() {
		// TODO Auto-generated constructor stub
	}
	public void setReceiverid(int rid) {
		this.receiverid = rid;
	}
	public void setRfirstname(String rfirstname) {
		this.rfirstname=rfirstname;
	}
	public void setRlastname(String rlastname) {
		this.rlastname=rlastname;
	}
	public void setSenderid(int senderid) {
		this.senderid=senderid;
	}
	public void setSfirstname(String sfirstname) {
		this.sfirstname=sfirstname;
	}
	public void setSlastname(String slastname) {
		this.slastname=slastname;
	}
	public int getReceiverid() {
		return receiverid;
	}
	public String getRfirstname() {
		return rfirstname;
	}
	public String getRlastname() {
		return rlastname;
	}
	public int getSenderid() {
		return senderid;
	}
	public String getSfirstname() {
		return sfirstname;
	}
	public String getSlastname() {
		return slastname;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTime() {
		return time;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDate() {
		return date;
	}
}
