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
function getLabById(labId){
	window.location.href="${basePath}/getLabById?labId="+labId;
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
    <li><a href="#">多媒体教室管理</a></li>
    <li><a href="#">查看多媒体教室</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle" ><span>查看多媒体教室</span>
	</div>

<div id="tab2" class="tabson">

<table class="tablelist">
    <thead>
    	<tr>
        <th>教学楼名字<i class="sort"><img src="/static/images/px.gif" /></i></th>
        <th>多媒体教室No</th>
        <th>容纳人数</th>
        <th>教室状态</th>
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
				<td >
                    <c:choose>
                        <c:when test="${labList.isFree == 0}">
                            空闲
                        </c:when>
                        <c:when test="${labList.isFree == 1}">
                            已预约
                        </c:when>
                        <c:otherwise>
                            维修中
                        </c:otherwise>
                    </c:choose>

                </td>
				<td >${labList.description}</td>
				<td >
				
				
				<a onclick="getLabById('${labList.labId }');"  class="tablelink">
				<img src="/static/images/t02.png" ></img>编辑</a>
				&nbsp;&nbsp;&nbsp;
				<a onclick="deleteLab('${labList.labId }');" class="tablelink">
				<img src="/static/images/t03.png" ></img>删除</a>
				
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