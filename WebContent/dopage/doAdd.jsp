
<%@page import="demo5.StudentDao"%>
<%@page import="demo5.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	request.setCharacterEncoding("utf-8");
	String sid = request.getParameter("sid");
	String sname = request.getParameter("sname");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");

	System.out.print(sid);
	
	StudentDao dao = new StudentDao();
	Student s = new Student();
	
	s.setSid(sid);
	s.setSname(sname);
	s.setSex(sex);
	s.setEmail(email);

	String flag = dao.add(s);
	if(flag.equals("ok")){
		out.print("<script>alert('添加成功')</script>");
	}
	if(flag.equals("er")){
		out.print("<script>alert('添加失败')</script>");
	}

	out.write("<script>location.href='../index.jsp'</script>");


%>


</body>
</html>