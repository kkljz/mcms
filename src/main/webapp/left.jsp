<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})
</script>


</head>

<body style="background:#f0f9fd;">
	<!-- <div class="lefttop"><span></span>通讯录</div> -->
    
    <dl class="leftmenu">
    
    <c:if test="${loginuser.userType==0}">
    <dd>
    <div class="title">
    <span><img src="/static/images/leftico01.png" /></span>主界面
    </div>
   		<ul class="menuson">
        <li class="active"><cite></cite><a href="${basePath }/AnnouncementList" target="rightFrame">公告</a><i></i></li>
        </ul> 
    </dd>
        
    <dd>
    <div class="title">
    <span><img src="/static/images/user.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="${basePath }/personInfo.jsp" target="rightFrame">个人信息</a><i></i></li>
        <li><cite></cite><a href="${basePath }/changePwd.jsp" target="rightFrame">修改个人密码</a><i></i></li>
        <li><cite></cite><a href="${basePath }/userList?userType=1" target="rightFrame">教师管理</a><i></i></li>
        <li><cite></cite><a href="${basePath }/userList?userType=2" target="rightFrame">学生管理</a><i></i></li>
        </ul>
    </dd>
    
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>多媒体教室管理
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="${basePath } /addLaboratory.jsp" target="rightFrame">新增多媒体教室</a><i></i></li>
        <li><cite></cite><a href="${basePath }/classroomList" target="rightFrame">查看多媒体教室</a><i></i></li>
        </ul>    
    </dd>
    
    <%-- <dd>
    <div class="title">
    <span><img src=" /images/leftico01.png" /></span>学期管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath } /addTerm.jsp" target="rightFrame">新增学期</a><i></i></li>
        <li><cite></cite><a href="#" target="rightFrame">删除学期</a><i></i></li>
        </ul>    
    </dd> --%>
    
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico03.png" /></span>预约信息管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/scheduleTable?labId=1" target="rightFrame">排期表</a><i></i></li>
        <li><cite></cite><a href="${basePath }/selectReservation.jsp?a=0" target="rightFrame">高级搜索</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>公告管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath } /addAnnouncement.jsp" target="rightFrame">发布公告</a><i></i></li>
        <li><cite></cite><a href="${basePath }/ManageAnnouncementList" target="rightFrame">删除公告</a><i></i></li>
        </ul>    
    </dd>
    </c:if>
    
	<c:if test="${loginuser.userType==1}">
	<dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>主界面
    </div>
   		<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/AnnouncementList" target="rightFrame">公告</a><i></i></li>
        </ul> 
    </dd>
        
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/personInfo.jsp" target="rightFrame">个人信息</a><i></i></li>
        <li><cite></cite><a href="${basePath } /changePwd.jsp" target="rightFrame">修改个人密码</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>预约管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/reserveLabList" target="rightFrame">预约多媒体教室</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/reservationByUser?userId=${loginuser.userId}&&userType=${loginuser.userType}" target="rightFrame">查看预约信息</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/scheduleTable?labId=1" target="rightFrame">多媒体教室排期表</a><i></i></li>
        <li><cite></cite><a href="${basePath }/selectReservation.jsp" target="rightFrame">高级搜索</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>课程管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath } /addCourse.jsp" target="rightFrame">新增课程</a><i></i></li>
        <li  ><cite></cite><a href="${basePath }/courseList?userId=${loginuser.userId}" target="rightFrame">课程列表</a><i></i></li>
        </ul>    
    </dd>
    
    <%-- <dd>
    <div class="title">
    <span><img src=" /images/leftico01.png" /></span>上传学生花名册
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath } /uploadCourse_User.jsp" target="rightFrame">上传学生花名册</a><i></i></li>
        </ul>    
    </dd> --%>
	</c:if>  
	
	<c:if test="${loginuser.userType==2}">
	<dd>
    <div class="title">
    <span><img src="/static/static/images/leftico01.png" /></span>主界面
    </div>
   		<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/AnnouncementList" target="rightFrame">公告</a><i></i></li>
        </ul> 
    </dd>
        
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/personInfo.jsp" target="rightFrame">个人信息</a><i></i></li>
        <li ><cite></cite><a href="${basePath } /changePwd.jsp" target="rightFrame">修改个人密码</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src=" /static/images/leftico01.png" /></span>预约管理
    </div>
    	<ul class="menuson">
        <li  class="active"><cite></cite><a href="${basePath }/reserveLabList" target="rightFrame">预约多媒体教室</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/reservationByUser?userId=${loginuser.userId}&&userType=${loginuser.userType}" target="rightFrame">查看预约信息</a><i></i></li>
        <li ><cite></cite><a href="${basePath }/schedule_table?labId=1" target="rightFrame">多媒体教室排期表</a><i></i></li>
        <li><cite></cite><a href="${basePath }/selectReservation.jsp" target="rightFrame">高级搜索</a><i></i></li>
        </ul>    
    </dd>
    
	</c:if>  
	  
    </dl>
    
</body>
</html>
