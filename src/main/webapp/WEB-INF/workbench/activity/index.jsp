<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/crm/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />


<script type="text/javascript" src="/crm/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="/crm/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

<%--日历插件--%>
<link href="/crm/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/crm/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/crm/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>

<%--导入bootstrap的分页插件--%>
<link rel="stylesheet" href="/crm/jquery/bs_pagination/jquery.bs_pagination.min.css" />
<script src="/crm/jquery/bs_pagination/en.js"></script>
<script src="/crm/jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
</head>
<body>

	<!-- 创建市场活动的模态窗口 -->
	<div id="createActivityModal" class="modal fade" id="createActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
				</div>
				<div class="modal-body">
				
					<form class="form-horizontal" id="createActivityForm" role="form">
					
						<div class="form-group">
							<label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select name="owner" class="form-control" id="create-marketActivityOwner">
                                    <c:forEach items="${users}" var="user">
                                        <option value="${user.id}">${user.name}</option>
                                    </c:forEach>
								</select>
							</div>
                            <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" name="name" class="form-control" id="create-marketActivityName">
                            </div>
						</div>
						
						<div class="form-group">
							<label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" name="startDate" class="form-control" id="create-startTime">
							</div>
							<label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" name="endDate" class="form-control" id="create-endTime">
							</div>
						</div>
                        <div class="form-group">

                            <label for="create-cost" class="col-sm-2 control-label">成本</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" name="cost" class="form-control" id="create-cost">
                            </div>
                        </div>
						<div class="form-group">
							<label for="create-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea name="description" class="form-control" rows="3" id="create-describe"></textarea>
							</div>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="createActivityBtn" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改市场活动的模态窗口 -->
	<div class="modal fade" id="editActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
				</div>
				<div class="modal-body">
				
					<form id="editActivityForm" class="form-horizontal" role="form">
					    <input type="hidden" id="activityId" name="id" />
						<div class="form-group">
							<label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" name="owner" id="edit-marketActivityOwner">
                                    <c:forEach items="${users}" var="user">
                                        <option value="${user.id}">${user.name}</option>
                                    </c:forEach>
								</select>
							</div>
                            <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input name="name" type="text" class="form-control" id="edit-marketActivityName" />
                            </div>
						</div>

						<div class="form-group">
							<label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input name="startDate" type="text" class="form-control" id="edit-startTime" value="2020-10-10">
							</div>
							<label for="edit-endTime" class="col-sm-2 control-label">结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" name="endDate" class="form-control" id="edit-endTime" value="2020-10-20">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-cost" class="col-sm-2 control-label">成本</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" name="cost" class="form-control" id="edit-cost" value="5,000">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea name="description" class="form-control" rows="3" id="edit-describe">市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等</textarea>
							</div>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="editActivityBtn">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>市场活动列表</h3>
			</div>
		</div>
	</div>
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input class="form-control" id="name" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input class="form-control" id="owner" type="text">
				    </div>
				  </div>


				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">开始日期</div>
					  <input class="form-control" type="text" id="startTime" />
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">结束日期</div>
					  <input class="form-control" type="text" id="endTime">
				    </div>
				  </div>
				  
				  <button type="button" onclick="queryActivity()" class="btn btn-default">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" onclick="createActivity()" class="btn btn-primary" data-toggle="modal" data-target="#createActivityModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" id="updateActivityBtn" class="btn btn-default" data-toggle="modal"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" id="deleteActivityBtn" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
			</div>
			<div style="position: relative;top: 10px;">
				<table id="table" class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input id="father" type="checkbox" /></td>
							<td>名称</td>
                            <td>所有者</td>
							<td>开始日期</td>
							<td>结束日期</td>
						</tr>
					</thead>
					<tbody id="activityListBody">
						<%--<tr class="active">
							<td><input type="checkbox" /></td>
							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">发传单</a></td>
                            <td>zhangsan</td>
							<td>2020-10-10</td>
							<td>2020-10-20</td>
						</tr>--%>
					</tbody>
				</table>
			</div>
			
			<div style="height: 50px; position: relative;top: 30px;">
                <div id="activityPage">

                </div>
				<%--<div>
					<button type="button" class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>
				</div>
				<div class="btn-group" style="position: relative;top: -34px; left: 110px;">
					<button type="button" class="btn btn-default" style="cursor: default;">显示</button>
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							10
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">20</a></li>
							<li><a href="#">30</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>
				</div>
				<div  style="position: relative;top: -88px; left: 285px;">
					<nav>
						<ul class="pagination">
							<li class="disabled"><a href="#">首页</a></li>
							<li class="disabled"><a href="#">上一页</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">下一页</a></li>
							<li class="disabled"><a href="#">末页</a></li>
						</ul>
					</nav>
				</div>--%>
			</div>
			
		</div>
		
	</div>
</body>
<script src="/crm/layer/layer.js"></script>
<script>


    //删除 单个删除和批量删除原理一样
    $('#deleteActivityBtn').click(function () {
        var length = $('.son:checked').length;
        if(length == 0){
            layer.alert("至少选中一条记录", {icon: 5});
            return;
        }
        layer.confirm('确认删除选中的记录吗？', {
            btn: ['确定', '取消'] //可以无限个按钮
        }, function(index, layero){
            //按钮【按钮一】的回调
            //获取到勾中记录的主键
            var ids = [];
            $('.son:checked').each(function () {
                ids.push($(this).val());
            });
            //可以把数组内容以指定分隔符进行分割，返回字符串类型，默认使用逗号分割

            $.get("/crm/workbench/activity/deleteBatch",{'ids':ids.join()},function (data) {
                if(data.ok){
                    layer.alert(data.message, {icon: 1});
                    //刷新页面
                    refresh(1,3);
                }
            },'json');

            //发送异步删除请求
        }, function(index){

        });
    });
    
    //点击更新按钮，异步保存修改活动信息
    $('#editActivityBtn').click(function () {
        $.post("/crm/activity/createOrUpdateActivity",$('#editActivityForm').serialize(),
            function (data) {
                //弹出添加成功消息
                if(data.ok){
                    alert(data.message);
                }
                //关闭模态窗口
                $('#editActivityModal').modal('hide');
                //刷新页面
                refresh(1,3);
                //清空表单
                document.getElementById('editActivityForm').reset();
            },'json');
    });

    //调用刷新页面方法
    refresh(1,3);

    //全选、全不选、根据son勾中的个数决定father是否勾中
    $('#father').bind('click',function () {
        var $father = $(this);
        $('.son').each(function () {
            //attr:获取的是自定义属性 prop:固有属性
            $(this).prop('checked',$father.prop("checked"));
        });
    });

    $('.son').each(function () {
        $(this).click(function () {
            //获取所有son的长度
            var sonLength = $('.son').length;
            //获取勾中的son的长度
            var checkedLenth = $('.son:checked').length;

            if(sonLength == checkedLenth){
                //father勾中
                $('#father').prop("checked",true);
            }else{
                $('#father').prop("checked",false);
            }
        });

    });
    
    //点击修改按钮，判断是否勾中记录，或者勾中记录>1，提示消息
    $('#updateActivityBtn').click(function () {

        var length = $('.son:checked').length;
        if(length == 0){
            layer.alert("至少选中一条记录", {icon: 5});
            return;
        }else if(length > 1){
            layer.alert("只能操作一条记录", {icon: 5});
            return;
        }
        //发送异步查询当前记录的请求
        /*

            var btn;js
           js-->jquery $(btn)
           jquery-->js $(btn)[0]($(btn).get(0))

         */
        $.get('/crm/workbench/activity/queryById',{'id':$('.son:checked')[0].value},
            function (data) {
            //把查询的内容设置到修改页面模态窗口中
            $('#edit-marketActivityName').val(data.name);
            $('#edit-startTime').val(data.startDate);
            $('#edit-endTime').val(data.endDate);
            $('#edit-cost').val(data.cost);
            $('#edit-describe').val(data.description);
            //把市场活动主键设置到隐藏域中
            $('#activityId').val(data.id);
        },'json');
        $('#editActivityModal').modal('show');
    });

    /*$('#table').on('click','#father',function () {
        alert(222);
    });*/

    //点击查询按钮进行异步查询
    function queryActivity() {
        refresh(1,3);
    }


    /*
     * 因为列表页面的分页查询、添加、修改、删除、多条件复杂查询之后都要重新查询数据，编写刷新的方法
    */
    /*发送异步请求，查询市场活动所有数据*/
    function refresh(page,pageSize){
         $.ajax({
             url : '/crm/workbench/activity/activityList',
             data : {
                 'page' : page,
                 'pageSize' : pageSize,
                 'name' : $('#name').val(),
                 'owner' : $('#owner').val(),
                 'startDate' : $('#startTime').val(),
                 'endDate' : $('#endTime').val()
             },
             type : 'get',
             async : false,
             dataType : 'json',
             success : function(data){

                // alert(data.t.name);
                 if(data.t != null){
                     $('#name').val(data.t.name);
                 }
                 var content = ""
                 for(var i = 0; i < data.dataList.length; i++){
                     var activity = data.dataList[i];
                     content += "<tr class=\"active\">\n" +
                         "\t\t\t\t\t\t\t<td><input value="+activity.id+" class='son' type=\"checkbox\" /></td>\n" +
                         "\t\t\t\t\t\t\t<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='/crm/workbench/activity/queryDetail?id="+activity.id+"';\">"+activity.name+"</a></td>\n" +
                         "                            <td>"+activity.owner+"</td>\n" +
                         "\t\t\t\t\t\t\t<td>"+activity.startDate+"</td>\n" +
                         "\t\t\t\t\t\t\t<td>"+activity.endDate+"</td>\n" +
                         "\t\t\t\t\t\t</tr>";
                 }

                 $('#activityListBody').html(content);

                 $("#activityPage").bs_pagination({
                     currentPage: data.pageInfo.pageNum, // 页码
                     rowsPerPage: data.pageInfo.pageSize, // 每页显示的记录条数
                     maxRowsPerPage: 20, // 每页最多显示的记录条数
                     totalPages: data.pageInfo.pages, // 总页数
                     totalRows: data.pageInfo.total, // 总记录条数
                     visiblePageLinks: 3, // 显示几个卡片
                     showGoToPage: true,
                     showRowsPerPage: true,
                     showRowsInfo: true,
                     showRowsDefaultInfo: true,
                     onChangePage : function(event, obj){
                         //pageList(obj.rowsPerPage,obj.currentPage);
                         refresh(obj.currentPage,obj.rowsPerPage);
                     }
                 });

             }
         });
     }


    //创建市场活动日历插件
    $("#create-startTime").datetimepicker({
        language:  "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn : true,
        pickerPosition: "bottom-left"
    });
    $("#create-endTime").datetimepicker({
        language:  "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn : true,
        pickerPosition: "bottom-left"
    });

    $("#edit-startTime").datetimepicker({
        language:  "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn : true,
        pickerPosition: "bottom-left"
    });
    $("#edit-endTime").datetimepicker({
        language:  "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn : true,
        pickerPosition: "bottom-left"
    });

    //点击新建按钮，异步查询所有者信息
    /*$.get("/crm/user/queryAllUser",function (data) {
        var content = "";
        for(var i = 0; i < data.dataList.length; i++){
            var user = data.dataList[i];
            content += "<option value="+user.id+">"+user.name+"</option>";
        }
        $('#create-marketActivityOwner').html(content);
        $('#edit-marketActivityOwner').html(content);
    },'json');*/

    //点击保存按钮，异步保存市场活动信息
    $('#createActivityBtn').click(function () {
        $.post("/crm/activity/createOrUpdateActivity",$('#createActivityForm').serialize(),
            function (data) {
            //弹出添加成功消息
            if(data.ok){
                alert(data.message);
            }
            //关闭模态窗口
            $('#createActivityModal').modal('hide');
            //刷新页面
            refresh(1,3);
            //清空表单
            document.getElementById('createActivityForm').reset();
        },'json');
    });
</script>
</html>