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
	<div class="info-type" data-type="0"></div>
	<div class="weui-flex">
		<div class="weui-flex__item">
			<a id="publish-time">发布时间</a> <i class="fa fa-sort-up"></i>
		</div>
		<div class="weui-flex__item">
			<a id="start-time">出发时间</a> <i class="fa fa-sort-up"></i>
		</div>
		<div class="weui-flex__item">
			<a href="javascript:;" id="choosePos" style="color: #3498db;">地点选择</a>
			<i class="fa fa-location-arrow"></i>
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
	<div class="weui-cells list" id="info-list" data-url="<%=basePath%>">
		
	</div>
	<script type="text/javascript">
		$('body').click(function(e) {
			var target = e.target;
			if ($(target).attr('id') == 'choosePos') {
				$('#choosePos-actionsheet').show();
			} else if ($(target).attr('id') == 'choosePosMask') {
				$('#choosePos-actionsheet').hide();
			}
		});
		
	</script> </myBody>
	<myScript> <script type="text/javascript">
		$('.weui-tabbar a:eq(0)').addClass('weui-bar__item_on');
	</script> <script type="text/javascript" src="<%=basePath%>/dist/js/list.js"></script>
	</myScript>
</body>
</html>