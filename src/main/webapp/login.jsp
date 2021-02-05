<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/crm/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/crm/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="/crm/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

<%--引入layer--%>
<script src="/crm/layer/layer.js"></script>
</head>
<body>
	<div style="position: absolute; top: 0px; left: 0px; width: 60%;">
		<img src="/crm/image/IMG_7114.JPG" style="width: 100%; height: 90%; position: relative; top: 50px;">
	</div>
	<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">CRM &nbsp;<span style="font-size: 12px;">&copy;2017&nbsp;动力节点</span></div>
	</div>
	
	<div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
		<div style="position: absolute; top: 0px; right: 60px;">
			<div class="page-header">
				<h1>登录</h1>
			</div>
			<form id="userLoginForm" action="/crm/user/login" class="form-horizontal" method="post" role="form">
				<div class="form-group form-group-lg">
					<div style="width: 350px;">
						<input class="form-control" id="username" name="loginAct" type="text" placeholder="用户名">
					</div>
					<div style="width: 350px; position: relative;top: 20px;">
						<input class="form-control" id="password" name="loginPwd" type="password" placeholder="密码">
					</div>
					<div class="checkbox"  style="position: relative;top: 30px; left: 10px;">
							<span id="msg" style="color: red">${message}</span>
					</div>
					<button type="button" onclick="subForm()" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
    //按下回车，提交表单 onkeypree=onkeydown+onkeyup
    document.onkeypress = function (ev) {
        if(ev.keyCode == 13){
            //获取用户名和密码信息，校验非空
            subForm();
        }
    }

    //点击登录按钮进行校验，校验成功，提交表单 type="submit"默认提交表单
    function subForm() {
        //获取用户名和密码信息，校验非空
        if($('#username').val() == ""){
            layer.alert('用户名不能为空', {icon: 5});
            return false;
        }else if($('#password').val() == ""){
            layer.alert('密码不能为空', {icon: 5});
            return false;
        }
        $('#userLoginForm').submit();
    }
</script>
</html>