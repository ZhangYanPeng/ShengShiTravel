<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>有顺车</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>/dist/weui/weui.css">
</head>
<body>
	<myBody>
	<div class="weui-flex">
		<div class="weui-flex__item">
			<a>发布时间</a> <i class="fa fa-sort-up"></i>
		</div>
		<div class="weui-flex__item">
			<a>出发时间</a> <i class="fa fa-sort-up"></i>
		</div>
		<div class="weui-flex__item">
			<a href="javascript:;" id="choosePos" style="color: #3498db;">地点选择</a> <i
				class="fa fa-location-arrow"></i>
		</div>
		<div class="weui-skin_android" id="choosePos-actionsheet"
			style="display: none">
			<div class="weui-mask" id="choosePosMask"></div>
			<div class="weui-actionsheet">
				<div class="weui-actionsheet__menu">
					<div class="weui-actionsheet__cell">
						<div class="weui-cells weui-cells_form">
							<div class="weui-cell">
								<div class="weui-cell__hd">
									<label class="weui-label">起点</label>
								</div>
								<div class="weui-cell__bd">
									<input class="weui-input" type="text" pattern=""
										placeholder="输入出发地">
								</div>
							</div>
							<div class="weui-cell">
								<div class="weui-cell__hd">
									<label class="weui-label">终点</label>
								</div>
								<div class="weui-cell__bd">
									<input class="weui-input" type="text" pattern=""
										placeholder="输入目的地">
								</div>
							</div>
							<div class="weui-btn-area">
								<a class="weui-btn weui-btn_primary" href="javascript:"
									id="showTooltips">确认</a>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="weui-cells">
		<a class="weui-cell weui-cell_access" href="./view?category=youshunche">
			<div class="weui-cell__hd">
				<img
					src="<%=basePath%>/dist/images/0.jpg"
					alt="" style="width: 60px; margin-right: 5px; display: block">
			</div>
			<div class="weui-cell__bd">
				<p>榆林→府谷</p>
				<p style="font-size: 13px; color: #888888">出发日期:03月22日17:00</p>
				<p style="font-size: 13px; color: #888888"><span class="youshunche">有顺车</span> 李先生(车主)</p>
			</div>
			<div class="weui-cell__ft">
				<p style="font-size: 13px; color: #888888">53分钟前发布</p>
			</div>
		</a>
	</div>
	<script type="text/javascript">
		$('body').click(function(e){
			var target = e.target;
			if($(target).attr('id') == 'choosePos'){
				$('#choosePos-actionsheet').show();
			}else if($(target).attr('id') == 'choosePosMask'){
				$('#choosePos-actionsheet').hide();
			}
		});

	</script> </myBody>
</body>
</html>