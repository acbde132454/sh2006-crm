<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/crm//jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/crm//jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="/crm//jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script src="/crm/layer/layer.js"></script>

<script type="text/javascript">

	//默认情况下取消和保存按钮是隐藏的
	var cancelAndSaveBtnDefault = true;
	
	$(function(){
		$("#remark").focus(function(){
			if(cancelAndSaveBtnDefault){
				//设置remarkDiv的高度为130px
				$("#remarkDiv").css("height","130px");
				//显示
				$("#cancelAndSaveBtn").show("2000");
				cancelAndSaveBtnDefault = false;
			}
		});
		
		$("#cancelBtn").click(function(){
			//显示
			$("#cancelAndSaveBtn").hide();
			//设置remarkDiv的高度为130px
			$("#remarkDiv").css("height","90px");
			cancelAndSaveBtnDefault = true;
		});
		
		$(".remarkDiv").mouseover(function(){
			$(this).children("div").children("div").show();
		});
		
		$(".remarkDiv").mouseout(function(){
			$(this).children("div").children("div").hide();
		});
		
		$(".myHref").mouseover(function(){
			$(this).children("span").css("color","red");
		});
		
		$(".myHref").mouseout(function(){
			$(this).children("span").css("color","#E6E6E6");
		});
	});
	
</script>

</head>
<body>
	
	<!-- 修改市场活动备注的模态窗口 -->
	<div class="modal fade" id="editRemarkModal" role="dialog">
		<%-- 备注的id --%>
        <div class="modal-dialog" role="document" style="width: 40%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改备注</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <input type="hidden" id="id" />
                        <div class="form-group">
                            <label for="edit-describe" class="col-sm-2 control-label">内容</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="3" id="noteContent"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateRemarkBtn">更新</button>
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
                    <h4 class="modal-title" id="myModalLabel1">修改市场活动</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form">

                        <div class="form-group">
                            <label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <select class="form-control" id="edit-marketActivityOwner">
                                    <option>zhangsan</option>
                                    <option>lisi</option>
                                    <option>wangwu</option>
                                </select>
                            </div>
                            <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-marketActivityName" value="发传单">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-startTime" value="2020-10-10">
                            </div>
                            <label for="edit-endTime" class="col-sm-2 control-label">结束日期</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-endTime" value="2020-10-20">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit-cost" class="col-sm-2 control-label">成本</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-cost" value="5,000">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="3" id="edit-describe">市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等</textarea>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">更新</button>
                </div>
            </div>
        </div>
    </div>

	<!-- 返回按钮 -->
	<div style="position: relative; top: 35px; left: 10px;">
		<a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left" style="font-size: 20px; color: #DDDDDD"></span></a>
	</div>
	
	<!-- 大标题 -->
	<div style="position: relative; left: 40px; top: -30px;">
		<div class="page-header">
			<h3>市场活动-发传单 <small>2020-10-10 ~ 2020-10-20</small></h3>
		</div>
		<div style="position: relative; height: 50px; width: 250px;  top: -72px; left: 700px;">
			<button type="button" class="btn btn-default" data-toggle="modal" data-target="#editActivityModal"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
			<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		</div>
	</div>
	
	<!-- 详细信息 -->
	<div style="position: relative; top: -70px;">
		<div style="position: relative; left: 40px; height: 30px;">
			<div style="width: 300px; color: gray;">所有者</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.owner}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">名称</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${activity.name}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>

		<div style="position: relative; left: 40px; height: 30px; top: 10px;">
			<div style="width: 300px; color: gray;">开始日期</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.startDate}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">结束日期</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${activity.endDate}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 20px;">
			<div style="width: 300px; color: gray;">成本</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.cost}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 30px;">
			<div style="width: 300px; color: gray;">创建者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${activity.createBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">2017-01-18 10:10:10</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 40px;">
			<div style="width: 300px; color: gray;">修改者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${activity.editBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">2017-01-19 10:10:10</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 50px;">
			<div style="width: 300px; color: gray;">描述</div>
			<div style="width: 630px;position: relative; left: 200px; top: -20px;">
				<b>
                    ${activity.description}
				</b>
			</div>
			<div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
	</div>
	
	<!-- 备注 -->
	<div id="remarkBody" style="position: relative; top: 30px; left: 40px;">
		<div class="page-header">
			<h4>备注</h4>
		</div>

        <c:forEach items="${activity.activityRemarks}" var="activityRemark">
		<!-- 备注1 -->
		<div class="remarkDiv" style="height: 60px;">
			<img title="zhangsan" src="/crm/image/user-thumbnail.png" style="width: 30px; height:30px;">
			<div style="position: relative; top: -40px; left: 40px;" >
				<h5 id="${activityRemark.id}">${activityRemark.noteContent}！</h5>
				<font color="gray">市场活动</font> <font color="gray">-</font> <b>${activity.name}</b> <small style="color: gray;"> ${activityRemark.createTime} 由${activityRemark.createBy}</small>
				<div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
					<a class="myHref"  href="javascript:void(0);" onclick="openEditRemark('${activityRemark.id}','${activityRemark.noteContent}')"  ><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="myHref" onclick="deleteRemark('${activityRemark.id}',$(this))" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
				</div>
			</div>
		</div>

        </c:forEach>
		
		<div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
			<form role="form" style="position: relative;top: 10px; left: 10px;">
				<textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"  placeholder="添加备注..."></textarea>
				<p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
					<button id="cancelBtn" type="button" class="btn btn-default">取消</button>
					<button type="button" id="saveActivityRemarkBtn" class="btn btn-primary">保存</button>
				</p>
			</form>
		</div>
	</div>
	<div style="height: 200px;"></div>

   <script>
       var aid;
       //点击每个市场活动备注的修改按钮
       function openEditRemark(id,noteContent) {
           //把id和内容设置到模态窗口，没必要从后台再查询一次
           //隐藏域
           $('#id').val(id);
           //备注内容
           $('#noteContent').val(noteContent);
           //弹出模态窗口
           $('#editRemarkModal').modal('show');
           aid = id;
       }

       //点击更新按钮，更新市场活动备注
       $('#updateRemarkBtn').click(function () {
           $.get("/crm/workbench/activity/updateRemark",{
               'id' : $('#id').val(),
               'noteContent' : $('#noteContent').val()
           },function (data) {
               if(data.ok){
                   layer.alert(data.message, {icon: 1});
                   //把在文本域输入的最新内容设置到页面备注的h5标签中
                  $("#" + aid).text($('#noteContent').val());
                   //关闭模态窗口
                   $('#editRemarkModal').modal('hide');
               }
           },'json');
       });

       //点击保存按钮，添加市场活动备注
       $('#saveActivityRemarkBtn').click(function () {
           $.get("/crm/workbench/activity/saveActivityRemark",{
               'activityId' : '${activity.id}',
               'noteContent' : $('#remark').val()
           },function (data) {
               if(data.ok){

                   layer.alert(data.message, {icon: 1});
                   $('#remarkDiv').before("<div class=\"remarkDiv\" style=\"height: 60px;\">\n" +
                       "\t\t\t<img title=\"zhangsan\" src=\"/crm/image/user-thumbnail.png\" style=\"width: 30px; height:30px;\">\n" +
                       "\t\t\t<div style=\"position: relative; top: -40px; left: 40px;\" >\n" +
                       "\t\t\t\t<h5 id="+data.t.id+">"+data.t.noteContent+"！</h5>\n" +
                       "\t\t\t\t<font color=\"gray\">市场活动</font> <font color=\"gray\">-</font> <b>"+'${activity.name}'+"</b> <small style=\"color: gray;\"> "+data.t.createTime+" 由"+data.t.createBy+"</small>\n" +
                       "\t\t\t\t<div style=\"position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;\">\n" +
                       "\t\t\t\t\t<a class=\"newMyHref\"  href=\"javascript:void(0);\" ><span class=\"glyphicon glyphicon-edit\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
                       "\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                       "\t\t\t\t\t<a class=\"deleteMyHref\" href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-remove\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
                       "\t\t\t\t</div>\n" +
                       "\t\t\t</div>\n" +
                       "\t\t</div>");

                   //清空备注内容
                   $('#remark').val("");
                   // console.log($("#remarkBody").html());
                 /*  $(".remarkDiv").mouseover(function(){
                       $(this).children("div").children("div").show();
                   });

                   $(".remarkDiv").mouseout(function(){
                       $(this).children("div").children("div").hide();
                   });

                   $(".myHref").mouseover(function(){
                       $(this).children("span").css("color","red");
                   });

                   $(".myHref").mouseout(function(){
                       $(this).children("span").css("color","#E6E6E6");
                   });*/

                 //js事件委托
                   $('#remarkBody').on('mouseover','.remarkDiv',function () {
                       $(this).children("div").children("div").show();
                   });
                   $('#remarkBody').on('mouseout','.remarkDiv',function () {
                       $(this).children("div").children("div").hide();
                   });

                   $('#remarkBody').on('mouseover','.newMyHref',function () {
                       $(this).children("span").css("color","red");
                   });

                   $('#remarkBody').on('mouseout','.newMyHref',function () {
                       $(this).children("span").css("color","#E6E6E6");
                   });

                   $('#remarkBody').on('mouseover','.deleteMyHref',function () {
                       $(this).children("span").css("color","red");
                   });

                   $('#remarkBody').on('mouseout','.deleteMyHref',function () {
                       $(this).children("span").css("color","#E6E6E6");
                   });



                   //重新绑定删除事件
                   $('#remarkBody').on('click','.deleteMyHref',function () {
                       deleteRemark(data.t.id,$(this));
                   })
                   //重新绑定修改事件
                   $('#remarkBody').on('click','.newMyHref',function () {
                       //隐藏域
                       $('#id').val(data.t.id);
                       //备注内容
                       $('#noteContent').val(data.t.noteContent);

                       //弹出模态窗口
                       $('#editRemarkModal').modal('show');

                       aid = data.t.id;
                   });
               }
           },'json');
       });

       //删除市场活动备注
       function deleteRemark(id,$this) {
           layer.confirm('确认删除该条备注吗？', {
               btn: ['确定', '取消'] //可以无限个按钮
           }, function(index, layero){
               //按钮【按钮一】的回调
               //获取到勾中记录的主键
               $.get("/crm/workbench/activity/deleteRemark",{'id':id},function(data){
                   if(data.ok){
                       layer.alert(data.message, {icon: 1});
                       //删除当前备注div
                       $this.parent().parent().parent().remove();
                   }
               },"json");
           }, function(index){

           });
       }
   </script>
</body>
</html>