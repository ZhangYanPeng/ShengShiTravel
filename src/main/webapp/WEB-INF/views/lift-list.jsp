<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>搭顺车</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<link rel="stylesheet" href="<%=basePath%>/dist/weui/weui.css">
</head>
<body>
	<myBody>
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
				<p style="font-size: 13px; color: #888888">搭顺车 王先生(乘客)</p>
			</div>
			<div class="weui-cell__ft">
				<p style="font-size: 13px; color: #888888">53分钟前发布</p>
			</div>
		</a>
	</div>

	<script type="text/javascript">
		var openid = getUrlParam("openid");
		$.ajax({
			async : false,
			cache : false,
			type : 'POST',
			contentType: "application/json", 
			dataType : 'json',
			data :
				JSON.stringify({ 
					"order" : "1",
					"type":"1",
					"pageNo" : "1" 
				}),
			url : "<%=basePath%>/information/get_list",
			error : function(data) {// 请求失败处理函数
				console.log(data);
				alert("获取数据失败！");
			},
			success : function(data) {
				console.log(data);
			}
		});
	</script> 
</myBody>
</body>
</html>