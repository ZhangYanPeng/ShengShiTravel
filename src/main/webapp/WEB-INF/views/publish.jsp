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
<script type="text/javascript"
	src="<%=basePath%>/dist/lib/json_serialize/json.js"></script>

<script type="text/javascript" src="<%=basePath%>/dist/weui/weui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/dist/weui/weui.min.css"></script>
</head>
<body>
	<form action="<%=basePath%>/information/publish" method="post"
		id="publish-form" data-url="<%=basePath%>">
		<div class="weui-cells weui-cells_form">
			<div class="weui-cells__title">类型</div>
			<div class="weui-cells weui-cells_radio">
				<label class="weui-cell weui-check__label" for="cYoushunche">
					<div class="weui-cell__bd">
						<p>有顺车</p>
					</div>
					<div class="weui-cell__ft">
						<input checked="checked" type="radio" name="radio1"
							class="weui-check category" id="cYoushunche"> <span
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
				</label>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">起点</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" pattern="" name="startpos"
						id="startpos" placeholder="请输入出发地(两个以上汉字)">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">终点</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" pattern="" name="destination"
						id="destination" placeholder="请输入目的地(两个以上汉字)">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label for="" class="weui-label">出发时间</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="datetime-local" value=""
						placeholder="" name="start_time" id="start_time">
				</div>
			</div>
			<div class="weui-cell weui-cell_select weui-cell_select-after "
				id="form-chexing">
				<div class="weui-cell__hd">
					<label class="weui-label">车型</label>
				</div>
				<div class="weui-cell__bd ">
					<select class="weui-select" name="chexing" id="car_type">
						<option selected="" value="1">轿车</option>
						<option value="2">越野车SUV</option>
						<option value="3">面包车</option>
						<option value="3">卡车</option>
					</select>
				</div>
			</div>
			<div class="weui-cell" id="form-kongzuoshu">
				<div class="weui-cell__hd">
					<label class="weui-label">座位数</label>
				</div>
				<div class="weui-cell__bd">
					<input name="capacity" class="weui-input" type="number"
						pattern="[0-9]*" placeholder="请输入座位数" id="capacity">
				</div>
			</div>
			<div class="weui-cell weui-cell_select weui-cell_select-after "
				id="form-daolu">
				<div class="weui-cell__hd">
					<label class="weui-label">道路</label>
				</div>
				<div class="weui-cell__bd ">
					<select class="weui-select" name="road_type" id="road_type">
						<option selected="" value="1">高速</option>
						<option value="2">低速</option>
					</select>
				</div>
			</div>
			<div class="weui-cell" id="form-guolufei">
				<div class="weui-cell__hd">
					<label class="weui-label">过路费(元)</label>
				</div>
				<div class="weui-cell__bd">
					<input name="road_toll" class="weui-input" type="text"
						id="road_toll" placeholder="请输入过路费">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">补充说明</label>
				</div>
				<div class="weui-cell__bd">
					<textarea class="weui-textarea" placeholder="" rows="3"
						id="remarks" name="remarks"></textarea>
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">联系人</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" pattern="" name="contact"
						id="contact" placeholder="请输入联系人姓名">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">手机号</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="tel" pattern="" name="contact_info"
						id== "contact_info"
						placeholder="请输入联系人手机号">
				</div>
			</div>
			<input type="hidden" name="openid" value="asdsad">
		</div>
	</form>
	<div class="weui-btn-area" style="margin-bottom: 2em;">
		<a class="weui-btn weui-btn_primary" href="javascript:" id="submit">确认发布</a>
	</div>



	<script type="text/javascript">
		$('.category').change(function(e) {
			var target = $(e.target);
			//console.log(target);
			if (target.attr('id') == 'cYoushunche') {
				$('#form-chexing').show();
				$('#form-kongzuoshu').show();
				$('#type').val('0');
			} else {
				$('#form-chexing').hide();
				$('#form-kongzuoshu').hide();
				$('#type').val('1');
			}
		});
	</script>
	<script type="text/javascript">
		$('#submit').click(function() {
			var info="";
			var check = 0;
			if ( $('#startpos').val() =="" ){
				info += "请输入出发地<br>";
				check = 1;
			}
			if ( $('#destination').val() =="" ){
				info += "请输入目的地<br>";
				check = 1;
			}
			if ( $('#start_time').val() =="" ){
				info += "请选择出发时间<br>";
				check = 1;
			}
			if ( $('#capacity').val()==0 ){
				info += "请输入空座数<br>";
				check = 1;
			}
			if ( $('#contact').val() == "" ){
				info += "请输入联系人姓名<br>";
				check = 1;
			}
			if ( $('#contact_info').val() == "" ){
				info += "请输入联系人手机号<br>";
				check = 1;
			}
			else{
				var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
				if(!myreg.test($('#contact_info').val())) 
				{ 
				    info += "请输入正确的手机号<br>";
				    check = 1;
				}
			}
			if (check == 1)
				weui.alert(info);
			else{
				$.ajax({
					url:$('#publish-form').attr('action'),
					type:'POST',
					contentType: "application/json",
					data:JSON.stringify($('#publish-form').serializeObject()),
					error:function(data){
						console.log(data);
					},
					success:function(result){
						//有顺车
						if($('#type').val() == 0){
							location.href = $('#publish-form').attr('data-url')+'/list'
						}else{
							location.href = $('#publish-form').attr('data-url')+'/lift_list'
						}
						if(result == 1){
							
						}else{
							
						}
					}
				});
			});
		}
	</script>

</body>
</html>