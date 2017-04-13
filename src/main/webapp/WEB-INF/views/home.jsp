<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="<%=basePath%>/dist/lib/jquery/jquery.js"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<script type="text/javascript">
$.ajax({
	async : false,
	cache : false,
	type : 'POST',
	contentType: "application/json", 
	dataType : 'text',
	data : 
		JSON.stringify({'openid':'OPENID',
				'nickname': 'NICKNAME',
				'sex':'1',
				'province':'PROVINCE',
				'city':'CITY',
				'country':'COUNTRY',
				'headimgurl':'http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46', 
				'unionid': 'o6_bmasdasdsad6_2sgVt7hMZOPfL',
		}),
	url : "./login_take",
	error : function(data) {// 请求失败处理函数
		alert("获取数据失败！");
	},
	success : function(data) {
		window.location.href = data;
	}
});
</script>
</body>
</html>
