<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加</title>
		<link href="layui/css/layui.css" rel="stylesheet">
		<script src="layui/layui.js" type="text/javascript"></script>
</head>
<body>
	<form action="dopage/doAdd.jsp" method="post">
		学号：<input type="text" name="sid" required><br>
		名字：<input type="text" name="sname" required><br>
		性别：<input type="radio" name="sex" checked="checked" value="男">男 <input type="radio" name="sex" value="女">女<br>
		邮箱：<input type="email" name="email">
		<input type="submit" value="保存">
		<input type="button" onclick="javascript:history.back()" value="返回">
	</form>
</body>
</html>