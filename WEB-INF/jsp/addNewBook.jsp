<%--
  Created by IntelliJ IDEA.
  User: liushimin
  Date: 2021/7/17
  Time: 下午8:19
  To change this template use File | Settings | File Templates.
--%>
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
            <legend>上架新图书</legend>
        </fieldset>

        <form class="layui-form" action="addNewBook" method="POST"
              enctype="multipart/form-data">

            <!-- 图书标题 -->
            <div class="layui-form-item">
                <label class="layui-form-label">图书标题</label>
                <div class="layui-input-block" style="width: 400px;">
                    <input type="text" name="title" lay-verify="required"
                           autocomplete="off" placeholder="请输入标题" class="layui-input">
                </div>
            </div>

            <!-- 文件ISBN -->
            <div class="layui-form-item">
                <label class="layui-form-label">ISBN</label>
                <div class="layui-input-block" style="width: 400px;">
                    <input type="text" name="isbn" lay-verify="required"
                           autocomplete="off" placeholder="请输入ISBN号" class="layui-input">
                </div>
            </div>

            <!-- 文件作者 -->
            <div class="layui-form-item">
                <label class="layui-form-label">作者</label>
                <div class="layui-input-block" style="width: 400px;">
                    <input type="text" name="author" lay-verify="required"
                           autocomplete="off" placeholder="请输入作者" class="layui-input">
                </div>
            </div>

            <!-- 文件价格 -->
            <div class="layui-form-item">
                <label class="layui-form-label">价格</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input type="text" name="price" placeholder="元" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <!-- 文件出版时间 -->
            <div class="layui-form-item">
                <label class="layui-form-label">出版时间</label>
                <div class="layui-input-inline" style="width: 150px;">
                    <input type="date" name="publishTime" placeholder="元" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <!-- 图书分类 -->
            <div class="layui-form-item">
                <label class="layui-form-label">图书分类</label>
                <div class="layui-input-block" style="width: 300px;">
                    <select name="categoryId" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="1">小说</option>
                        <option value="2">文学</option>
                        <option value="3">动漫</option>
                        <option value="4">文化</option>
                        <option value="5">传记</option>
                        <option value="6">艺术</option>
                        <option value="7">童文件</option>
                        <option value="8">古籍</option>
                        <option value="9">历史</option>
                    </select>
                </div>
            </div>

            <!-- 图书简介 -->
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">图书简介</label>
                <div class="layui-input-block">
						<textarea name="introduction" placeholder="请输入内容" class="layui-textarea"
                                  style="width: 400px; height: 150px"></textarea>
                </div>
            </div>


            <!-- 文件的封面图片按钮 -->
            <div class="layui-form-item">
                <label class="layui-form-label">上传封面</label>
                <div class="layui-upload">
                    <input type="file" name="file" class="img_btn"
                           onchange="showPreview(this)" />
                </div>
            </div>

            <!-- 文件的封面图片 -->
            <div class="layui-form-item">
                <label class="layui-form-label">cover which is chosed</label>
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
                    <button type="submit" class="layui-btn" lay-filter="demo1">submit</button>
                    <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                </div>
             </div>

            </from>
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