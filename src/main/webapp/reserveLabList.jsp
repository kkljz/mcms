<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>labList</title>
<script type="text/javascript">
function getLabReserveById(labId,userId,labName){
	window.location.href="${basePath}/getLabReserveById?labId="+labId+"&&userId="+userId+"&&labName="+labName;
}
	function deleteLab(labId){
		var labId=labId;
		if(confirm("是否确认删除该多媒体教室？")){
		$.ajax({
			url:"${basePath}/deleteLab",
			data:{"labId":labId},
			dataType:"json",
			type : 'post' ,
			success:function(data){
				 if(data.success){
					alert(data.msg);
					window.location.href="${basePath}/labList";
				} 
			},
			error:function(data){
				alert(data.msg);
			}		
		});	
		}}
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">预约管理</a></li>
    <li><a href="#">预约多媒体教室</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>预约多媒体教室</span></div>

<div id="tab2" class="tabson">

<table class="tablelist">
    <thead>
    	<tr>
        <th>教学楼名称<i class="sort"><img src="${basePath }/static/images/px.gif" /></i></th>
        <th>多媒体教室No</th>
        <th>容纳人数</th>
        <th>是否空闲</th>
        <th>描述</th>
        <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="labList" items="${requestScope.labList}">
			<tr >				
				<td >${labList.buildingName }</td>
				<td >${labList.roomNumber }</td>
				<td >${labList.personNumber }</td>
				<td >${labList.isFree }</td>
				<td >${labList.description}</td>
				<td >
				
				
				<a onclick="getLabReserveById('${labList.labId }','${loginuser.userId }','${labList.buildingName }${labList.roomNumber }');"  class="tablelink">
				<img src="${basePath }/static/images/t01.png" ></img>预约</a>
				
				</td>
			</tr>			
		</c:forEach> 
	</tbody>
</table>
</div>
</div>
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>