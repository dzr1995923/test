<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加</title>
</head>
<body>
	<form action="dopage/doAdd.jsp" method="post">
		编号：<input type="text" name="eid"><br>
		名字：<input type="text" name="ename"><br>
		年龄：<input type="number" name="age"><br>
		部门：<select name="did">
				<option value="001">开发部</option>
				<option value="002">采购部</option>
				<option value="003">测试部</option>
		</select>
		<input type="submit" value="保存">
		<input type="button" onclick="javascript:history.back()" value="返回">
	</form>
</body>
</html>