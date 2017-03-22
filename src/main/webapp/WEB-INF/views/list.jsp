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
			<a href="javascript:;" id="choosePos">地点选择</a> <i
				class="fa fa-location-arrow"></i>
		</div>
		<div class="weui-skin_android" id="choosePos-actionsheet"
			style="display: none">
			<div class="weui-mask"></div>
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
		<a class="weui-cell weui-cell_access" href="javascript:;">
			<div class="weui-cell__hd">
				<img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII="
					alt="" style="width: 60px; margin-right: 5px; display: block">
			</div>
			<div class="weui-cell__bd">
				<p>榆林→募股</p>
				<p style="font-size: 13px; color: #888888">出发日期:03月22日17:00</p>
				<p style="font-size: 13px; color: #888888">有顺车 李先生(车主)</p>
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
			}else if($(target).attr('id') != 'choosePos-actionsheet'){
				$('#choosePos-actionsheet').hide();
			}
		});

	</script> </myBody>
</body>
</html>