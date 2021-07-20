<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
       scope="request"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录界面</title>
    <meta charset=UTF-8>
    <link rel="stylesheet" href="${baseUri}/static/css/bootstrap.css">
    <link href="${baseUri}/static/iconfont/style.css" type="text/css" rel="stylesheet">
    <link href="${baseUri}/static/css/login.css" type="text/css" rel="stylesheet">

</head>

<body>
<div class="container wrap1" style="height: 450px;">
    <h2 class="mg-b20 text-center">Library Management System</h2>
    <div
            class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
        <p class="text-center font16">Administration</p>
        <form action="login" method="post">
            <div class="form-group mg-t20">
                <i class="icon-user icon_font"></i>
                <input type="text" class="login_input" required="required" placeholder="Please enter your admin number" name="adminNumber"/>
            </div>
            <div class="form-group mg-t20">
                <i class="icon-lock icon_font"></i>
                <input type="password" class="login_input" required="required" placeholder="Please enter your admin password" name="adminPwd"/>
            </div>
            <div class="checkbox mg-b25">
                <!-- <label>
                    <input type="checkbox" />记住我的登录信息
                </label> -->
                <label>
                    <c:if test="${Login_error !=null}">
                        warring：<span class="login_msg">${Login_error}</span>
                    </c:if>
                </label>
            </div>
            <button style="" class="login_btn">Login</button>
        </form>
    </div>
    <!--row end-->
</div>
<!--container end-->
</body>
</html>
