<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>我</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>/dist/weui/weui.css">
</head>
<body>
	<myBody>
	<div class="weui-cells">
		<div class="weui-cell">
			<div class="weui-cell__hd"
				style="position: relative; margin-right: 10px;">
				<img src="./dist/images/0.jpg" style="width: 50px; display: block">
			</div>
			<div class="weui-cell__bd">
				<p>王老吉</p>
				<p style="font-size: 13px; color: #888888;"></p>
			</div>
		</div>
		<div class="weui-cell weui-cell_access">
			<div class="weui-cell__bd">
				<span style="vertical-align: middle">我的发布</span>
			</div>
			<div class="weui-cell__ft"></div>
		</div>
		<div class="weui-cell weui-cell_access">
			<div class="weui-cell__bd">
				<span style="vertical-align: middle">我的收藏</span>
			</div>
			<div class="weui-cell__ft"></div>
		</div>
		<div class="weui-cell weui-cell_access">
			<div class="weui-cell__bd">
				<span style="vertical-align: middle">修改资料</span>
			</div>
			<div class="weui-cell__ft"></div>
		</div>
		<div class="weui-cell weui-cell_access">
			<div class="weui-cell__bd">
				<span style="vertical-align: middle">修改密码</span>
			</div>
			<div class="weui-cell__ft"></div>
		</div>
				<div class="weui-cell weui-cell_access">
			<div class="weui-cell__bd">
				<span style="vertical-align: middle">意见反馈</span>
			</div>
			<div class="weui-cell__ft"></div>
		</div>
	</div>
	</myBody>
</body>
</html>