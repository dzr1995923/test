package demo5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
	private Connection conn;
	private PreparedStatement ppst;
	private ResultSet rs;

	public Connection getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/school";
			conn = DriverManager.getConnection(url, "root", "1234");
//			System.out.println(conn);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
	public List<Student> getList(Student s){
		
		String sId = s.getSid();
		String sName = s.getSname();
		String sex = s.getSex();
		String email = s.getEmail();
		
		List<Object> args = new ArrayList<>();
		List<Student> list = new ArrayList<>();
		
		StringBuffer sql = new StringBuffer("SELECT * FROM student s WHERE 1=1");
		if(sId!=null) {
			sql.append(" and s.stu_no=? ");
			args.add(sId);
			
		}
		if(sName!=null) {
			sql.append(" and s.stu_name=? ");

			args.add(sName);
		}
		if(sex!=null) {
			sql.append(" and s.stu_sex=? ");

			args.add(sex);
		}
		if(email!=null) {
			sql.append(" and s.stu_email=? ");

			args.add(email);
		}
		
		//System.out.println("¾ä×Ó£º"+sql);
		//System.out.println("²ÎÊý£º"+args);
		
		try {
			ppst = getConn().prepareStatement(sql.toString());
			for (int i = 0; i < args.size(); i++) {
				ppst.setObject(i+1, args.get(i));
			}
			rs = ppst.executeQuery();
			
			while(rs.next()) {
				Student stu = new Student();
				stu.setSid(rs.getString("stu_no"));
				stu.setSname(rs.getString("stu_name"));
				stu.setSex(rs.getString("stu_sex"));
				stu.setEmail(rs.getString("stu_email"));
				list.add(stu);
				
			}
			
		}catch (Exception c) {
			// TODO: handle exception
			c.printStackTrace();
		}finally {
			close1();
		}
		return list;
		
	}
	
	public String executeUpdate(String sql,Object...objects) {
		
		try {
			ppst = getConn().prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				ppst.setObject(i+1, objects[i]);
			}
			
			ppst.executeUpdate();
			return "ok";
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return "error";
		}
		
		
		
	
	}
	
	
	
	
	
	public String add(Student s) {
		try {
			ppst = getConn().prepareStatement("insert into student values(?,?,?,?)");
			ppst.setString(1, s.getSid());
			ppst.setString(2, s.getSname());
			ppst.setString(3, s.getSex());
			ppst.setString(4, s.getEmail());
			ppst.executeUpdate();
			
			return "ok";
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return "er";
		}finally {
			try {
				ppst.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	public String delete(String sid) {
		try {
			ppst = getConn().prepareStatement("delete from student where stu_no=?");
			ppst.setString(1, sid);
			
			ppst.executeUpdate();
			
			return "ok";
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return "er";
		}finally {
			try {
				ppst.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	
	
	
	public void close1() {
		try {
			rs.close();
			ppst.close();
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
