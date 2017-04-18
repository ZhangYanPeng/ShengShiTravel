<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>详细信息</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>/dist/weui/weui.css">
<link rel="stylesheet" href="<%=basePath%>/dist/css/style.css">
</head>
<body>
	<myBody>
	<div class="weui-panel__bd">
		<div class="weui-media-box weui-media-box_text">
			<h4 class="weui-media-box__title view-ds-title">(有顺车)榆林→府谷</h4>
			<ul class="weui-media-box__info ">
				<li class="weui-media-box__info__meta view-info-meta"><i  class="fa fa-clock-o"></i>1小时前</li>
				<li
					class="weui-media-box__info__meta weui-media-box__info__meta_extra view-info-meta"><i  class="fa fa-eye"></i>5人</li>
				<li class="weui-media-box__info__meta"><a class="default-a"><i class="fa fa-heart"></i>收藏</a></li>
			</ul>
		</div>
	</div>
	<div class="weui-panel__bd">
		<div class="weui-media-box weui-media-box_text">
			<h4 class="weui-media-box__title view-title">基本信息</h4>
			<div class="weui-form-preview__bd">
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">类型</label> <span
						class="weui-form-preview__value" ><span style="color: #3498db;">有顺车</span>(轿车)</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">出发时间</label> <span
						class="weui-form-preview__value">2017-03-23 08:25</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">路线</label> <span
						class="weui-form-preview__value">榆林→府谷</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">座位数</label> <span
						class="weui-form-preview__value">4</span>
				</div>
			</div>
		</div>
		<div class="weui-media-box weui-media-box_text">
			<h4 class="weui-media-box__title view-title">路线信息</h4>
			<div class="weui-form-preview__bd">
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">路线距离</label> <span
						class="weui-form-preview__value">174.311公里</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">预计耗时</label> <span
						class="weui-form-preview__value">02小时18分钟</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">过路费</label> <span
						class="weui-form-preview__value">约66元</span>
				</div>
			</div>
		</div>
		<div class="weui-media-box weui-media-box_text">
			<h4 class="weui-media-box__title view-title">其他说明</h4>
			<p>一路顺风</p>
			<p class="default-shuoming">联系我时，请说是在xx顺车上看到的，谢谢！</p>
			<a class="default-a" style="font-size: 0.6em;">点击这里查看更多榆林到府谷的信息</a>
		</div>
		<div class="weui-media-box weui-media-box_text">
			<h4 class="weui-media-box__title view-title">联系方式</h4>
			<div class="weui-form-preview__bd">
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">联系人</label> <span
						class="weui-form-preview__value">王先生</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">联系方式</label> <span
						class="weui-form-preview__value" style="color: red;font-size: 1.5em;">1562321312323</span>
				</div>
			</div>
		</div>
	</div>
	</myBody>
</body>
</html>