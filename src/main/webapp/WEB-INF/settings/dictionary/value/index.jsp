<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/crm/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/crm/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="/crm/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div>
		<div style="position: relative; left: 30px; top: -10px;">
			<div class="page-header">
				<h3>字典值列表</h3>
			</div>
		</div>
	</div>
	<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px;">
		<div class="btn-group" style="position: relative; top: 18%;">
		  <button type="button" class="btn btn-primary" onclick="window.location.href='/crm/toView/settings/dictionary/value/save'"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		  <button type="button" class="btn btn-default" onclick="window.location.href='edit.jsp'"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
		  <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		</div>
	</div>
	<div style="position: relative; left: 30px; top: 20px;">
		<table class="table table-hover">
			<thead>
				<tr style="color: #B3B3B3;">
					<td><input type="checkbox" /></td>
					<td>序号</td>
					<td>字典值</td>
					<td>文本</td>
					<td>排序号</td>
					<td>字典类型编码</td>
				</tr>
			</thead>
			<tbody id="dictionaryValueBody">
				<%--<tr class="active">
					<td><input type="checkbox" /></td>
					<td>5</td>
					<td>3</td>
					<td>三级部门</td>
					<td>3</td>
					<td>orgType</td>
				</tr>--%>
			</tbody>
		</table>
	</div>
	<script>
        $.post("/crm/dictionary/dictionaryValuesList",{},function(data){
            var content = "";
            for(var i = 0 ; i < data.dataList.length; i++){
                var dictionaryValue = data.dataList[i];
                $('#dictionaryValueBody').append("<tr class=\"active\">\n" +
                    "\t\t\t\t\t<td><input type=\"checkbox\" /></td>\n" +
                    "\t\t\t\t\t<td>"+(i+1)+"</td>\n" +
                    "\t\t\t\t\t<td>"+dictionaryValue.value+"</td>\n" +
                    "\t\t\t\t\t<td>"+dictionaryValue.text+"</td>\n" +
                    "\t\t\t\t\t<td>"+dictionaryValue.orderNo+"</td>\n" +
                    "\t\t\t\t\t<td>"+dictionaryValue.typeCode+"</td>\n" +
                    "\t\t\t\t</tr>");
            }
        },"json");
    </script>
</body>
</html>