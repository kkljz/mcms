<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>schedule_table</title>
<script type="text/javascript">
	function getScheduleTable(){
		var labId=$("#labId").val();
		window.location.href='${basePath}/scheduleTable?labId='+labId;
		/* $('#lab_id option:eq(lab_id)').attr('selected',true); */
		}
</script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">预约信息管理</a></li>
    <li><a href="#">排期表</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <!-- <div class="formtitle"><span>排期表</span></div> -->

<div id="tab2" class="tabson">
<ul class="seachform">
    <li><label>选择实验室</label>
    <div class="vocation">
    <select name="labId" id="labId"  class="select1">
		<option value ="">请选择实验室</option> 
	<c:forEach var="labList" items="${requestScope.labList}" >
		<option value ="${labList.labId }">${labList.buildingName }${labList.roomNumber }</option>
	</c:forEach>
	</select>
    </div>
    </li>
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询" onclick="getScheduleTable()"/></li>
</ul>

<%--<table class="tablelist">--%>
<table class="tablelist table table-bordered table-hover">
    <thead>
    	<tr>
    	<th colspan="6" align="center">实验室：${requestScope.list[0].buildingName}${requestScope.list[0].roomNumber}--总位置：${requestScope.list[0].personNumber}</th>
  		</tr>
  		
    	<tr>
        <th>日期		</th>
        <th>8:00~10:00</th>
        <th>10:00~12:00</th>
        <th>14:00~16:00</th>
        <th>16:00~18:00</th>
        <th>19:00~21:00</th>
        </tr>
    </thead>
    <tbody>
	  <c:forEach var="list" items="${requestScope.list}" >
	  <tr >
	    <td><B><fmt:formatDate value="${list.scheduleDate }" pattern="yyyy-MM-dd"/></B></td>
	    
	    <c:if test="${list.t1!=0 }"><td style="background:#fc4e16">已预约</td></c:if>
	    <c:if test="${list.t1==0 }"><td style="background:#71e73b">无人预约&nbsp;&nbsp;&nbsp;&nbsp;空余</td></c:if>

		  <c:if test="${list.t2!=0 }"><td style="background:#fc4e16">已预约</td></c:if>
		  <c:if test="${list.t2==0 }"><td style="background:#71e73b">无人预约&nbsp;&nbsp;&nbsp;&nbsp;空余</td></c:if>

		  <c:if test="${list.t3!=0 }"><td style="background:#fc4e16">已预约</td></c:if>
		  <c:if test="${list.t3==0 }"><td style="background:#71e73b">无人预约&nbsp;&nbsp;&nbsp;&nbsp;空余</td></c:if>

		  <c:if test="${list.t4!=0 }"><td style="background:#fc4e16">已预约</td></c:if>
		  <c:if test="${list.t4==0 }"><td style="background:#71e73b">无人预约&nbsp;&nbsp;&nbsp;&nbsp;空余</td></c:if>

		  <c:if test="${list.t5!=0 }"><td style="background:#fc4e16">已预约</td></c:if>
		  <c:if test="${list.t5==0 }"><td style="background:#71e73b">无人预约&nbsp;&nbsp;&nbsp;&nbsp;空余</td></c:if>
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
