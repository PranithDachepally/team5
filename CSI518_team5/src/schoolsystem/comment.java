package schoolsystem;

public class comment {
	private int comment_id;
	private int discuss_id;
	private String comment_content;
	private int iduser;
	public comment() {
		
	}
	public int getcommentid() {
		return comment_id;
	}
	public String getComment() {
		return comment_content;
	}
	public int getiduser() {
		return iduser;
	}
	public int getdiscussid() {
		return discuss_id;
	}
	public void setcommentid(int comment_id) {
		this.comment_id = comment_id;
		System.out.println("comment_id: "+comment_id);
	}
	public void setComment(String comment) {
		this.comment_content = comment;
		System.out.println("comment: "+comment);
	}
	public void setiduser(int iduser) {
		this.iduser = iduser;
		System.out.println("iduser: "+iduser);
	}
	public void setdiscussid(int discuss_id) {
		this.discuss_id = discuss_id;
		System.out.println("discuss_id: "+discuss_id);
	}

}
