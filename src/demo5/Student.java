package demo5;

public class Student {
	private String sid;
	private String sname;
	private String sex;
	private String email;
	
	public Student() {
		super();
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Student(String sid, String sname, String sex, String email) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sex = sex;
		this.email = email;
	}
	
	}
