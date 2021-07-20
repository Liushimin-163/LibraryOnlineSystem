﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="baseUri" value="${pageContext.request.contextPath }"
	scope="request"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统</title>
<link rel="stylesheet" href="${baseUri}/static/layui/css/layui.css">
</head>
<script type="text/javascript">
	function showPreview(source) {
		var file = source.files[0];
		if (window.FileReader) {
			var fr = new FileReader();
			console.log(fr);
			var portrait = document.getElementById('portrait');
			fr.onloadend = function(e) {
				portrait.src = e.target.result;
			};
			fr.readAsDataURL(file);
			portrait.style.display = 'block';
		}
	}
</script>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">

		<!-- 引入头部导航 -->
		<c:import url="nav/titlenav.jsp"></c:import>

		<!-- 引入左边导航 -->
		<c:import url="nav/leftnav.jsp"></c:import>



		<div class="layui-body">
			<!-- 内容主体区域 -->
			<fieldset class="layui-elem-field layui-field-title">
				<legend>已下架的图书</legend>
			</fieldset>
			<div class="layui-form">
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="150">
						<col width="150">
						<col width="80">
						<col width="80">
						<col width="50">
						<col width="50">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>ISBN</th>
							<th>Library name</th>
							<th>Author</th>
							<th>Category</th>
							<th>Price(RMB)</th>
							
							<th>Put on shelves </th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookList}" var="book">
							<tr>
								<td>${book.isbn }</td>
								<td>${book.title }</td>
								<td>${book.author }</td>
								<td>
									<c:if test="${book.categoryId==1 }">Novel</c:if>
									<c:if test="${book.categoryId==2 }">Literature</c:if>
									<c:if test="${book.categoryId==3 }">Animation</c:if>
									<c:if test="${book.categoryId==4 }">Culture</c:if>
									<c:if test="${book.categoryId==5 }">Biography</c:if>
									<c:if test="${book.categoryId==6 }">Art</c:if>
									<c:if test="${book.categoryId==7 }">Puffin Books</c:if>
									<c:if test="${book.categoryId==8 }">Ancient Books</c:if>
									<c:if test="${book.categoryId==9 }">History</c:if>
								</td>
								<td>${book.price }</td>		
								<td>
								<a class="layui-btn"
									style="background-color: #33cc00" href="updateBackBook?id=${book.id }">Put on shelves</a>
								</td>
								<td>
									<a class="layui-btn"
									style="background-color: #ff0000" href="deleteBookReal?id=${book.id }" 
									onclick="return confirm('File delete checked:《${book.title }》？')">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	

		</div>
		<!-- 引入底部导航 -->
		<c:import url="nav/bottom.jsp"></c:import>
	</div>

	<script src="${baseUri}/static/layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
		layui.use([ 'form' ], function() {
			var form = layui.form;
		});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
	</script>
</body>
</html>