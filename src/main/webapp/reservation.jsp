<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH24小时制  hh12小时制
	String date=sdf.format(new Date());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>reserveLab</title>
<script type="text/javascript">
function check()
{
	var r = /^[0-9]*[1-9][0-9]*$/;
	if($("#reserveType").val()=='1'){
		if($("#reserveDate").val()==""){
			alert("请选择预约日期");
			return false;
		}
	}
	return true;
}
function check2(fromDate,endDate){
	var from=$("#from").val();
	var end=$("#end").val();
	if(from==""){
		alert("请选择开始日期");
		return false;
	}
	if(end==""){
		alert("请选择结束日期");
		return false;
	}
	return true;
}

function reserve(userId,userType){
    if(check()) {
		$.ajax({
			url :'${basePath}/reserveLab',/* 执行controller */
			type: 'post',
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType : 'json' , 
			data : $("#form").serialize(),
		    success : function(data){
		    	alert(data.msg);
		    	if(data.success==true){
		    		window.location.href='${basePath}/reservationByUser?userId='+userId+'&&userType='+userType;
		    	}
			},
			error : function(){
				alert("预约失败");
			}
		});
	} 
}
function reserve2(userId,fromDate,endDate,userType){
      if(check2(fromDate,endDate)) {  
		$.ajax({
			url :'${basePath}/reserveLab2',/* 执行controller */
			contentType:"application/x-www-form-urlencoded; charset=utf-8",
			dataType : 'json' , 
			data : $("#form2").serialize(),
		    success : function(data){
		    	alert(data.msg);
		    	if(data.success==true){
		    		window.location.href='${basePath}/reservationByUser?userId='+userId+'&&userType='+userType;
		    	}
			},
			error : function(){
				alert("预约失败");
			}
		});
  	}  
}

function showTab1(){
	$("#tab1").show();
	$("#tab2").hide();
	$("#tab3").hide();
	
	$("#t2").removeClass("selected");
	$("#t3").removeClass("selected");
	$("#t1").addClass("selected");
}
function showTab2(){
	$("#tab2").show();
	$("#tab1").hide();
	$("#tab3").hide();
	
	$("#t1").removeClass("selected");
	$("#t3").removeClass("selected");
	$("#t2").addClass("selected");
}
function showTab3(){
	$("#tab3").show();
	$("#tab1").hide();
	$("#tab2").hide();
	
	$("#t1").removeClass("selected");
	$("#t2").removeClass("selected");
	$("#t3").addClass("selected");
}
</script>
</head>

<body >
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">预约管理</a></li>
    <li><a href="#">预约实验室</a></li>
    </ul>
</div>
    
<div class="formbody">
<div id="usual1" class="usual"> 
    
    <div class="itab">
	  	<ul> 
	    <li><a id="t1" href="#tab1" class="selected" onclick="showTab1();">实验室预约详情</a></li> 
	    <li><a id="t2" href="#tab2" onclick="showTab2();">个人预约</a></li>
	    <c:if test="${loginuser.userType==1}"><li><a id="t3" href="#tab3" onclick="showTab3();">课堂预约</a></li></c:if>
	  	</ul>
    </div> 
	<div id="tab1" class="tabson">
    <div class="formtext"><b>实验室预约信息详情(此处只显示当前日期之后的预约信息)</b></div>
    <c:if test="${empty requestScope.lab_reservation_list}">
    	<center><b>当前日期之后该实验室未被预约，请放心预约。</b></center>
    </c:if>
    <c:if test="${not empty requestScope.lab_reservation_list}">
	<table class="tablelist">
	    <thead>
	    	<tr>
	        <th>实验楼名字<i class="sort"><img src="${basePath }/static/images/px.gif" /></i></th>
	        <th>实验室No</th>
	        <th>已被预约时间</th>
	        <th>预约类型</th>
	        <th>是否可约</th>
	        </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="list" items="${requestScope.lab_reservation_list}" > 
			<tr >
				<td >${list.buildingName }</td>
				<td >${list.roomNumber }</td>
				<td >
					<fmt:formatDate value="${list.reserveDate }" pattern="yyyy-MM-dd"/>
					<c:if test="${list.timeInterval==1 }">08:00~10:00</c:if>
					<c:if test="${list.timeInterval==2 }">10:00~12:00</c:if>
					<c:if test="${list.timeInterval==3 }">14:00~16:00</c:if>
					<c:if test="${list.timeInterval==4 }">16:00~18:00</c:if>
					<c:if test="${list.timeInterval==5 }">19:00~21:00</c:if>
				</td>
				<td >
					<c:if test="${list.reserveType==2 }">班级预约</c:if>
					<c:if test="${list.reserveType==1 }">个人预约</c:if>
				</td>
				<td style="background:#F00">不允许预约</td>
				<%--<c:if test="${list.reserveType==2 }"><td style="background:#F00">不允许预约</td></c:if>--%>
				<%--<c:if test="${list.reserveType==1 }"><td style="background:#42e718">只允许个人预约</td></c:if>--%>
				</td>
			</tr>			
		</c:forEach>
		</tbody>
	</table>
	</c:if>
	</div>

    <div id="tab2" class="tabson" style="display:none">
    <form action="" method="post" id="form" >
	<input type="hidden" name="labId" id="labId"  value="${labId}"></input> 
	<input type="hidden" name="userId" id="userId" value="${loginuser.userId}" ></input>
	<input type="hidden" name="createTime" id="createTime" value="<%=date %>" ></input>
	<input type="hidden" name="reserveType" id="reserveType" value="1" ></input>
	<ul class="forminfo">
		<li><label>预约类型：<b>*</b></label><input name="" id="" class="dfinput"  style="width:345px" value="个人预约" disabled="disabled"/></li>
		<li><label>实验室：<b>*</b></label><input name="" id="" class="dfinput"  style="width:345px" value="<%=request.getParameter("labName") %>" disabled="disabled"></input></li>
		<li><label>预约日期：<b>*</b></label><input name="reserveDate" id="reserveDate" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d}',maxDate:'%y-%M-{%d+3}'})" placeholder="选择时间" style="width:345px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"/></li>
		<li><label>预约时间段：<b>*</b></label>
		<select name="timeInterval" id="timeInterval" class="select1">
				<option value ="1">8:00~10:00</option>
				<option value ="2">10:00~12:00</option>
				<option value ="3">14:00~16:00</option>
				<option value ="4">16:00~18:00</option>
				<option value ="5">19:00~21:00</option>
		</select>
		</li>
		<li><label>预约人数：<b>*</b></label>
			<input name="personNumber" id="personNumber" class="dfinput"  style="width:345px" type="text" placeholder="只能填数字"/></li>
		<%--<select name="personNumber" id="personNumber" class="select1">--%>
				<%--<option value ="1">1人</option>--%>
				<%--<option value ="2">5人</option>--%>
				<%--<option value ="3">10人</option>--%>
				<%--<option value ="4">15人</option>--%>
				<%--<option value ="5">20人</option>--%>
				<%--<option value ="6">30人</option>--%>
				<%--<option value ="7">40人</option>--%>
				<%--<option value ="8">50人</option>--%>
				<%--<option value ="9">100人</option>--%>
				<%--<option value ="10">200人</option>--%>
		<%--</select>--%>
		</li>
		<li><label>公告内容：<b>*</b></label>
    	<textarea name="description" id="description"   wrap="hard" placeholder="输入预约详情" class="textarea1"></textarea>
    	</li>
    	<li><label>&nbsp;</label>
    	<input name="" type="button" class="btn btn-success" value="预约" onclick="reserve('${loginuser.userId}','${loginuser.userType}');"/>
    	<input name="" type="reset" class="btn btn-info" value="取消" onclick="window.location.href='${basePath}/reserveLabList'"/>
    	</li>
   		</ul>
	</form>
    </div>
    
    <div id="tab3" class="tabson" style="display:none">
    <form action="" method="post" id="form2" >
	<input type="hidden" name="labId" id="labId"  value="${labId}"></input> 
	<input type="hidden" name="userId" id="userId" value="${loginuser.userId}" ></input>
	<input type="hidden" name="createTime" id="createTime" value="<%=date %>" ></input>
	<input type="hidden" name="reserveType" id="reserveType" value="2" ></input>
	<ul class="forminfo">	
		<li><label>预约类型：<b>*</b></label><input name="" id="" class="dfinput"  style="width:345px" value="课堂预约" disabled="disabled"/></li>
		<li><label>实验室：<b>*</b></label><input name="" id="" class="dfinput"  style="width:345px" value="<%=request.getParameter("labName") %>" disabled="disabled"></input></li>
		<li><label>选择学期：<b>*</b></label>
		<select name="termId" id="termId" class="select1">
		<c:forEach var="term" items="${requestScope.termList}" >
				<option value ="${term.termId }">${term.termName }&nbsp;&nbsp;&nbsp;&nbsp; ${term.fromDate }--${term.endDate }</option>
		</c:forEach>
		</select>
		</li>
		<li><label>预约频度：<b>*</b></label>	
		<input name="from" id="from"  class="Wdate"  type="text" onfocus="WdatePicker({minDate:'%y-{%M-1}-%d',maxDate:'%y-%M-{%d-1}'})" placeholder="选择开始日期" style="width:150px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"/>		
		&nbsp;&nbsp;至&nbsp;&nbsp;
		<input name="end" id="end"  class="Wdate"  type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}',maxDate:'%y-{%M+3}-%d'})" placeholder="选择结束日期" style="width:150px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df;"/>
		&nbsp;&nbsp;&nbsp;&nbsp;
		每周<select name="weekday" id="weekday" class="select1" style="width:50px;">
				<option value ="1">一</option>
				<option value ="2">二</option>
				<option value ="3">三</option>
				<option value ="4">四</option>
				<option value ="5">五</option>
				<option value ="6">六</option>
				<option value ="7">日</option>
		</select>
		</li>
		<li><label>预约时间段：<b>*</b></label>
		<select name="timeInterval" id="timeInterval" class="select1">
				<option value ="1">8:00~10:00</option>
				<option value ="2">10:00~12:00</option>
				<option value ="3">14:00~16:00</option>
				<option value ="4">16:00~18:00</option>
				<option value ="5">19:00~21:00</option>
		</select>
		</li>
		<li><label>选择课程：<b>*</b></label>
		<select name="courseId" id="courseId"  class="select1">
		<c:forEach var="course" items="${requestScope.courseList}" > 
				<option value ="${course.courseId }">${course.courseName }-${course.personNumber }人</option>
		</c:forEach>
		</select>
		</li>
		<li><label>预约描述：<b>*</b></label>
    	<textarea name="description" id="description"   wrap="hard" placeholder="输入预约详情" class="textarea1"></textarea>
    	</li>
    	<li><label>&nbsp;</label>
    	<%--<input name="" type="button" class="btn" value="确定" onclick="reserve2('${loginuser.userId}','${term.fromDate }','${term.endDate }','${loginuser.userType}');"/> --%>
    	<input name="" type="button" class="btn" value="确定" onclick="reserve2('${loginuser.userId}','${loginuser.userType}');"/>
    	<input name="" type="reset" class="btn" value="取消" onclick="window.location.href='${basePath}/reserveLabList'"/>
    	</li>
   		</ul>
	</form>
    </div>
</div>

<script type="text/javascript"> 
	$("#usual1 ul").idTabs(); 
</script>
    
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>
</div>  
</body>
</html>