package Model;

import java.util.Date;

public class Feedback {

	private int id;
	private String name;
	private String email;
	private String subject;
	private String message;
	private Date create_at;
	private int user_id;
	private int status;
	
	public Feedback(int id, String name, String email, String subject, String message, Date create_at, int user_id,
			int status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.create_at = create_at;
		this.user_id = user_id;
		this.status = status;
	}
	
	public Feedback( String name, String email, String subject, String message, Date create_at, int user_id,
			int status) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.create_at = create_at;
		this.user_id = user_id;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "feedback [id=" + id + ", name=" + name + ", email=" + email + ", subject=" + subject + ", message="
				+ message + ", create_at=" + create_at + ", user_id=" + user_id + ", status=" + status + "]";
	}
	
	
}
