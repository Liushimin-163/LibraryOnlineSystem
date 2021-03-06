<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<legend>编辑文件信息</legend>
			</fieldset>

			<form class="layui-form" action="updateBook" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${book.id }"  > 
				
				<!-- 图书标题 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Title</label>
					<div class="layui-input-block" style="width: 400px;">
						<input type="text" name="title" lay-verify="required"
							autocomplete="off" value="${book.title }" class="layui-input" >
					</div>
				</div>

				<!-- 文件ISBN -->
				<div class="layui-form-item">
					<label class="layui-form-label">ISBN</label>
					<div class="layui-input-block" style="width: 400px;">
						<input type="text" name="isbn" lay-verify="required"
							autocomplete="off" value="${book.isbn }" class="layui-input" >
					</div>
				</div>

				<!-- 文件作者 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Author</label>
					<div class="layui-input-block" style="width: 400px;">
						<input type="text" name="author" lay-verify="required"
							autocomplete="off" value="${book.author }" class="layui-input" >
					</div>
				</div>

				<!-- 文件价格 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Price</label>
					<div class="layui-input-inline" style="width: 100px;">
						<input type="text" name="price" value="${book.price}" autocomplete="off"
							class="layui-input" >
					</div>
				</div>

				<!-- 图书分类 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Category</label>
					<div class="layui-input-block" style="width: 300px;">
						<select name="categoryId" lay-verify="required">
							<option value="${cate.categoryId}">${cate.categoryName }</option>
							<option value="1">Novel</option>
							<option value="2">Literature</option>
							<option value="3">Animation</option>
							<option value="4">Culture</option>
							<option value="5">Biography</option>
							<option value="6">Art</option>
							<option value="7">Puffin Books</option>
							<option value="8">Ancient Books</option>
							<option value="9">History</option>
						</select>
					</div>
				</div>
				
				
				<!-- 出版时间 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Publish Time</label>
					<div class="layui-input-inline" style="width: 200px;">
						<input type="text" name="publishTime1" value="${book.publishTime}" pattern="yyyy年MM月"
						autocomplete="off" class="layui-input" disabled>
					</div>
				</div>
			
				<!-- 出版时间 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Republish Time</label>
					<div class="layui-input-inline" style="width: 200px;">
						<input type="date" name="publishTime"  pattern="yyyy年MM月"
						autocomplete="off" class="layui-input" >
					</div>
				</div>
				
				<!-- 图书简介 -->
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">Introduction</label>
					<div class="layui-input-block">
						<textarea name="introduction" class="layui-textarea"
							style="width: 400px; height: 150px" >${book.introduction}</textarea>
					</div>
				</div>

				<!-- 文件的封面图片 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Old cover</label>
					<div class="layui-upload">
						<div class="layui-upload-list">
							<c:if test="${book.image==null}">
										<img src="${baseUri}/static/images/book.jpg"  width="80px" height="100px;">
								</c:if> 
								<c:if test="${book.image !=null }">
									<c:if test="${book.image=='' }">
										<img src="${baseUri}/static/images/book.jpg" width="80px" height="100px;">
									</c:if>
									<c:if test="${book.image !='' }">
										<img src="${baseUri}/upload/bookPhoto/${book.image}" alt="" width="80px" height="100px;">
									</c:if>
								</c:if>
						</div>
					</div>
				</div>
				<!-- 文件的封面图片按钮 -->
				<div class="layui-form-item">
					<label class="layui-form-label">Update new cover</label>
					<div class="layui-upload">
						<input type="file" name="file" class="img_btn"
							onchange="showPreview(this)" />
					</div>
				</div>

				<!-- 文件的封面图片 -->
				<div class="layui-form-item">
					<label class="layui-form-label"></label>
					<div class="layui-upload">
						<div class="layui-upload-list">
							<img id="portrait" src=""
								style="display: none; width: 100px; height: 140px;" />
						</div>
					</div>
				</div>

				<!-- 提交文件信息 -->
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button type="submit" class="layui-btn" lay-filter="demo1">Submit</button>
						<button type="reset" class="layui-btn layui-btn-primary">Reset</button>
					</div>
				</div>
				
				
			</form>
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