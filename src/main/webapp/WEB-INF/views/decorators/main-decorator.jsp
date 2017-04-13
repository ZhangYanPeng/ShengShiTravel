<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title><sitemesh:write property="title" /></title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>/dist/weui/weui.css">
<link rel="stylesheet"
	href="<%=basePath%>/dist/lib/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="<%=basePath%>/dist/css/style.css">
<script type="text/javascript"
	src="<%=basePath%>/dist/lib/jquery/jquery.js"></script>
</head>
<body>

	<div class="weui-tab">
		<div class="weui-tab__panel">
			<sitemesh:write property="myBody" />
		</div>
		<div class="weui-tabbar" data-tab="${tab}" id="tabbar">
			<a href="./list" id="youshunche" class="weui-tabbar__item "> <span
				style="display: inline-block; position: relative;"> <img
					src="./dist/images/car.png" alt="" class="weui-tabbar__icon">
			</span>
				<p class="weui-tabbar__label">有顺车</p>
			</a> <a href="./lift_list" id="dashunche" class="weui-tabbar__item">
				<img src="./dist/images/carlift.png" alt=""
				class="weui-tabbar__icon">
				<p class="weui-tabbar__label">搭顺车</p>
			</a> <a href="./publish" class="weui-tabbar__item"> <span
				style="display: inline-block; position: relative;"> <img
					src="./dist/images/speaker.png" alt="" class="weui-tabbar__icon">
			</span>
				<p class="weui-tabbar__label">发布</p>
			</a> <a href="./personal" id="wo" class="weui-tabbar__item"> <img
				src="./dist/images/user.png" alt="" class="weui-tabbar__icon">
				<p class="weui-tabbar__label">我</p>
			</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var tab = $('#tabbar').attr('data-tab');
			switch (tab) {
			case 'dashunche':
				$('#dashunche').addClass('weui-bar__item_on');
				break;
			case 'wo':
				$('#wo').addClass('weui-bar__item_on');
				break;
			default:
				$('#youshunche').addClass('weui-bar__item_on');
			}
		});
	</script>

</body>
</html>