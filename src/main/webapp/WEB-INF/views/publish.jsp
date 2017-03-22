<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>发布</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>/dist/weui/weui.css">
</head>
<body>
	<myBody>
	<div class="weui-cells__title">类型</div>
	<div class="weui-cells weui-cells_radio">
		<label class="weui-cell weui-check__label" for="x11">
			<div class="weui-cell__bd">
				<p>有顺车</p>
			</div>
			<div class="weui-cell__ft">
				<input checked="checked" type="radio" class="weui-check"
					name="radio1" id="x11"> <span class="weui-icon-checked"></span>
			</div>
		</label> <label class="weui-cell weui-check__label" for="x12">

			<div class="weui-cell__bd">
				<p>搭顺车</p>
			</div>
			<div class="weui-cell__ft">
				<input type="radio" name="radio1" class="weui-check" id="x12">
				<span class="weui-icon-checked"></span>
			</div>
	</div>
	<div class="weui-cells weui-cells_form">
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">起点</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="text" pattern=""
					placeholder="请输入出发地(两个以上汉字)">
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">终点</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="text" pattern=""
					placeholder="请输入目的地(两个以上汉字)">
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label for="" class="weui-label">出发时间</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="datetime-local" value=""
					placeholder="">
			</div>
		</div>
		<div class="weui-cell weui-cell_select weui-cell_select-after">
			<div class="weui-cell__hd">
				<label class="weui-label">车型</label>
			</div>
			<div class="weui-cell__bd ">
				<select class="weui-select" name="select1">
					<option selected="" value="1">轿车</option>
					<option value="2">越野车SUV</option>
					<option value="3">面包车</option>
					<option value="3">卡车</option>
				</select>
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">空座数</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="number" pattern="[0-9]*"
					placeholder="请输入空座数">
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">补充说明</label>
			</div>
			<div class="weui-cell__bd">
				<textarea class="weui-textarea" placeholder="" rows="3"></textarea>
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">联系人</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="text" pattern=""
					placeholder="请输入联系人姓名">
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">手机号</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="tel" pattern=""
					placeholder="请输入联系人手机号">
			</div>
		</div>
		<div class="weui-btn-area">
			<a class="weui-btn weui-btn_primary" href="javascript:"
				id="showTooltips">确认发布</a>
		</div>
	</div>
	</myBody>
</body>
</html>