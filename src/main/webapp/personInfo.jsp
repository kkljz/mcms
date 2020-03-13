<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common-header.jsp" %>
<%@ include file="common-ui.jsp" %>
<%-- <%@ include file="index.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>

    <script type="text/javascript">
        $(function () {
            $("#alterBtn").click(function () {
                $("#commitBtn").show();
                $(".forminfo").find("input").removeAttr("disabled");
            })

            //修改信息提交
            $("#commitBtn").click(function () {
                var userId = $(".forminfo").find("input[name='userId']").val();
                var userName = $(".forminfo").find("input[name='userName']").val();
                var sex = $(".forminfo").find("input[name='sex']").val();
                if (sex == '男'){
                    sex = 1;
                } else {
                    sex = 2;
                }
                var age = $(".forminfo").find("input[name='age']").val();
                var institute = $(".forminfo").find("input[name='institute']").val();
                var major = $(".forminfo").find("input[name='major']").val();

                $.ajax({
                    type: "POST",
                    url: '${basePath}/userUpdate',
                    data: {'userId':userId, 'userName':userName, 'sex':sex, 'age':age, 'institute':institute, 'major':major},
                    success : function(data){
                        if(data.success){
                            alert(data.msg);
                        }else{
                            alert(data.msg);
                        }
                    },
                    error : function(){
                        alert("信息修改失败，请求失败了……");
                    }
                })
            })

        })
    </script>
</head>

<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    <li><a href="#">个人信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>个人信息</span></div>

    <ul class="forminfo">
    <li><button id="alterBtn" class="button btn-primary">修改信息</button></li>
    <li><label>用户类别:</label>
        <c:if test="${loginuser.userType==0 }"><span style="color: red; font-size: 14px; font-weight: bold">管理员</span><br/></c:if>
        <c:if test="${loginuser.userType==1 }"><input name="userType" type="text" class="dfinput" value="教师" disabled="disabled"/><br/></c:if>
        <c:if test="${loginuser.userType==2 }"><input name="userType" type="text" class="dfinput" value="学生" disabled="disabled"/><br/></c:if>
    </li>
    <input name="userId" type="text" value="${loginuser.userId }" hidden/>
    <li><label>用户名：</label><input name="loginName" type="text" class="dfinput" value="${loginuser.loginName }" disabled="disabled"/></li>
    <li><label>姓名：</label><input name="userName" type="text" class="dfinput" value="${loginuser.userName }" disabled="disabled"/></li>
    <li><label>性别：</label>
    	<c:if test="${loginuser.sex==1 }"><input name="sex" type="text" class="dfinput" value="男" disabled="disabled"/><br/></c:if>
		<c:if test="${loginuser.sex==2 }"><input name="sex" type="text" class="dfinput" value="女" disabled="disabled"/><br/></c:if>
	</li>
    <li><label>年龄：</label><input name="age" type="text" class="dfinput" value="${loginuser.age }" disabled="disabled"/></li>
    <li><label>学院：</label><input name="institute" type="text" class="dfinput" value="${loginuser.institute }" disabled="disabled"/></li>
    <li><label>专业：</label><input name="major" type="text" class="dfinput" value="${loginuser.major }" disabled="disabled"/></li>
    <%--<li><label>第一次登陆:</label>--%>
    	<%--<c:if test="${loginuser.isFirstlogin==0 }"><input name="" type="text" class="dfinput" value="是" disabled="disabled"/><br/></c:if>--%>
		<%--<c:if test="${loginuser.isFirstlogin==1 }"><input name="" type="text" class="dfinput" value="否" disabled="disabled"/><br/></c:if>--%>
    <%--</li>--%>
    <li><button class="button btn-success" id="commitBtn" hidden>确定修改</button></li>
    </ul>
    </div>


</body>
</html>