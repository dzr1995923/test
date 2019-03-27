<%@page import="demo5.StudentDao"%>
<%@page import="java.util.List"%>
<%@page import="demo5.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.3.1.min.js"></script>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="layui/layui.all.js" type="text/javascript"></script>
<meta charset="utf-8" />
<title></title>
<style>
th {
	width: 100px;
}

table, th, td, tr {
	text-align: center;
	border: none;
}
</style>
</head>
<body>
	<%
		StudentDao dao = new StudentDao();
		List<Student> list = dao.getList(new Student());
	%>
	<div style="width:600px">
		<table border="1" class="layui-table">
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>email</td>

			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td class="sid"><%=list.get(i).getSid()%></td>
				<td><%=list.get(i).getSname()%></td>
				<td><%=list.get(i).getSex()%></td>
				<td><%=list.get(i).getEmail()%></td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
	<button data-method="notice" class="layui-btn" id="add">添加学生</button>
	<button class="layui-btn layui-btn-danger" onclick='del()'>删除学生</button>
	
</body>
<script type="text/javascript">
	//function add() {
	//location.href = "add.jsp"	
	//}
	
	var form;
    layui.use('form', function () {
        form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

        var active = {
            notice: function () {
            	
                //示范一个公告层
                layer.open({
                    type: 1
                    ,
                    title: false //不显示标题栏
                    ,
                    closeBtn: false
                    ,
                    area: '340px;'
                    ,
                    shade: 0.8
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btn: ['保存', '返回']
                    ,
                    btnAlign: 'c'
                    ,
                    moveType: 1 //拖拽模式，0或者1
                    ,
                    content: '<div style="padding-top: 20px;padding-right: 10px"><form class="layui-form" action="">\n' +
                        '        <div class="layui-form-item">\n' +
                        '            <label class="layui-form-label">学号</label>\n' +
                        '            <div class="layui-input-block">\n' +
                        '                <input type="text" id="sid" name="sid" lay-verify="title" autocomplete="off" placeholder="请输入学号" class="layui-input" required>\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '        <div class="layui-form-item">\n' +
                        '            <label class="layui-form-label">姓名</label>\n' +
                        '            <div class="layui-input-block">\n' +
                        '                <input type="text" id="sname" name="sname" lay-verify="title" autocomplete="off" placeholder="请输入姓名" class="layui-input" required>\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '        <div class="layui-form-item" id="sex">\n' +
                        '            <label class="layui-form-label">性别</label>\n' +
                        '            <input type="radio" name="sex" value="男" title="男">\n' +
                        '            <input type="radio" name="sex" value="女" title="女" checked>\n' +
                        '        </div>\n' +
                        '        <div class="layui-form-item">\n' +
                        '                        <label class="layui-form-label">邮箱</label>\n' +
                        '            <div class="layui-input-block">\n' +
                        '                <input type="email" id="email" name="email" lay-verify="title" autocomplete="off" placeholder="请输入邮箱" class="layui-input" required>\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '    </form></div>'
                    ,async: false,
                    success: function (layero) {
                        var btn = layero.find('.layui-layer-btn');
                        
                        btn.find('.layui-layer-btn0').attr({
                          
                        });
                        $('.layui-layer-btn0').on("click",function(){
                        	console.log($("#sid").val())
                        	location.href='dopage/doAdd.jsp?sid='+$("#sid").val()+'&sname='+$("#sname").val()+'&sex='+$("#sex input").val()+'&email='+$("#email").val()
                        })
                    }
                });
                
                
                form.render();
            }

        };

        $('#add').on('click', function () {

            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
            
            
        })

        //但是，如果你的HTML是动态生成的，自动渲染就会失效
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();

    });
	
	
	function del() {

		var sid = prompt("请输入要删除的学号", "");
		if (sid == "") {
			alert("输入为空，请重新输入！");
			del();
		} else if (sid != null) {
			var arr = new Array();
			arr = document.getElementsByClassName("sid");

			for (var i = 0; i < arr.length; i++) {
				if (arr[i].innerText == sid) {
					location.href = "dopage/doDel.jsp?sid=" + sid;
				} else {
					if (i == arr.length - 1)
						alert("此学号不存在")
				}

			}

		}

	}
</script>

</html>
