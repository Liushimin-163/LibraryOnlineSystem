<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="layui-header">
	<div class="layui-logo">Library management system</div>
	<!-- 头部区域（可配合layui已有的水平导航） -->
	<%--<ul class="layui-nav layui-layout-left">
		<li class="layui-nav-item"><a href="###">控制台</a></li>
		<li class="layui-nav-item"><a href="###">商品管理</a></li>
		<li class="layui-nav-item"><a href="###">用户</a></li>
		<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="###">邮件管理</a>
				</dd>
				<dd>
					<a href="###">消息管理</a>
				</dd>
				<dd>
					<a href="###">授权管理</a>
				</dd>
			</dl></li>
	</ul>--%>
	<ul class="layui-nav layui-layout-right">
		<li class="layui-nav-item"><a href="javascript:;"> <img
				src="${baseUri}/static/images/head.jpg" class="layui-nav-img"> ${user.adminName }
		</a>
			<%--<dl class="layui-nav-child">
				<dd>
					<a href="###">基本资料</a>
				</dd>
				<dd>
					<a href="###">安全设置</a>
				</dd>
			</dl>--%>
		</li>
		<li class="layui-nav-item"><a href="adminLogout" onclick="return confirm('quit check${user.adminName }？')">login out</a></li>
	</ul>
</div>