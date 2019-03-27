<%@page import="demo5.StudentDao"%>
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
	String sid = request.getParameter("sid");
	System.out.print(sid);
	StudentDao dao = new StudentDao();
	
	
	String flag = dao.delete(sid);
	if(flag.equals("ok")){
		out.print("<script>alert('删除成功')</script>");
	}
	if(flag.equals("er")){
		out.print("<script>alert('删除失败')</script>");
	}

	out.write("<script>location.href='../index.jsp'</script>");
	%>
</body>
</html>