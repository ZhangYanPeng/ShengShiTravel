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
<script type="text/javascript"
	src="<%=basePath%>/dist/lib/jquery/jquery.js"></script>
</head>
<body>
	<myBody>
	<div class="weui-cells__title">类型</div>
	<div class="weui-cells weui-cells_radio">
		<label class="weui-cell weui-check__label" for="cYoushunche">
			<div class="weui-cell__bd">
				<p>有顺车</p>
			</div>
			<div class="weui-cell__ft">
				<input checked="checked" type="radio" class="weui-check category"
					name="radio1" id="cYoushunche"> <span
					class="weui-icon-checked"></span>
			</div>
		</label> <label class="weui-cell weui-check__label" for="cDashunche">

			<div class="weui-cell__bd">
				<p>搭顺车</p>
			</div>
			<div class="weui-cell__ft">
				<input type="radio" name="radio1" class="weui-check category"
					id="cDashunche"> <span class="weui-icon-checked"></span>
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
		<div class="weui-cell weui-cell_select weui-cell_select-after "
			id="form-chexing">
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
		<div class="weui-cell" id="form-kongzuoshu">
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
		<div class="weui-btn-area" style="margin-bottom: 2em;">
			<a class="weui-btn weui-btn_primary" href="javascript:"
				id="showTooltips">确认发布</a>
		</div>
		<script type="text/javascript">
			$('.category').change(function(e) {
				var target = $(e.target);
				//console.log(target);
				if (target.attr('id') == 'cYoushunche') {
					$('#form-chexing').show();
					$('#form-kongzuoshu').show();
				} else {
					$('#form-chexing').hide();
					$('#form-kongzuoshu').hide();
				}
			});
		</script>
	</div>

	</myBody>
</body>
</html>