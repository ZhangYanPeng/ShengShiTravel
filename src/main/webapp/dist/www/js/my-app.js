// Initialize your app
var myApp = new Framework7();

// Export selectors engine
var $$ = Dom7;

// Add view
var mainView = myApp.addView('.view-main', {

});

// index页启动时加载listTab
$$.get('list.html', {}, function(data) {
	$$('#list-tab').html(data);
})


function parseSex(sex){
	switch(sex){
	case "0": return "保密";
	case "1": return "男";
	case "2": return "女";
	}
}

// 底部TAB点击
$$('.tab-link').on('click', function(e) {
	var tabPage = $$(e.target).parent().prop('id');

	if (tabPage == 'publish') {
		myApp.popup('.popup-publish');
	}
	$$.get(tabPage + '.html', {}, function(data) {
		$$('#' + tabPage + '-tab').html(data);
		
		//personal information load
		if (tabPage == 'me') {
			$$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				crossDomain : true,
				dataType : 'json',
				data : {
					'openid' : 'OPENID',
				},
				url : "http://localhost:8080/travel/customer/view",
				error : function(data) {// 请求失败处理函数
					alert("获取数据失败！");
				},
				success : function(data) {
					var info = data;
					$$("#headimgurl").attr("src",info.headimgurl);
					$$("#nickname").html(info.nickname);
					$$("#sex").html(parseSex(info.sex));
					$$("#address").html(info.province+","+info.city);
					$$("#name").html(info.name);
					$$("#phone").html(info.phone);
					
					function init_personal(){
						myApp.popup('.popup-personal-info');
						$$("#li_nickname").hide();
						$$("#li_sex").hide();
						$$("#li_address").hide();
						$$("#li_name").hide();
						$$("#li_phone").hide();
						$$("#openid_edit").val(info.openid);
						$$("#headimgurl_edit").val(info.headimgurl);
						$$("#nickname_edit").val(info.nickname);
						$$("#sex_edit").val(info.sex);
						$$("#country_edit").val(info.country);
						$$("#province_edit").val(info.province);
						$$("#city_edit").val(info.city);
						$$("#name_edit").val(info.name);
						$$("#phone_edit").val(info.phone);
					};
					
					$$("#href_nickname").on('click',function(){
						init_personal();
						$$("#li_nickname").show();
					});
					$$("#href_sex").on('click',function(){
						init_personal();
						$$("#li_sex").show();
					});
					$$("#href_address").on('click',function(){
						init_personal();
						$$("#li_address").show();
					});
					$$("#href_name").on('click',function(){
						init_personal();
						$$("#li_name").show();
					});
					$$("#href_phone").on('click',function(){
						init_personal();
						$$("#li_phone").show();
					});
					
					$$('.popup-personal-info').on('close', function () {
						var storedData = myApp.formToJSON("#personal-form");
						$$.ajax({
							async : false,
							cache : false,
							type : 'POST',
							crossDomain : true,
							dataType : 'json',
							data : storedData,
							error : function(data) {// 请求失败处理函数
								alert("获取数据失败！");
							},
							url : "http://localhost:8080/travel/customer/edit",
							success : function(data) {
								info = data;
								$$("#headimgurl").attr("src",data.headimgurl);
								$$("#nickname").html(data.nickname);
								$$("#sex").html(parseSex(data.sex));
								$$("#address").html(data.province+","+data.city);
								$$("#name").html(data.name);
								$$("#phone").html(data.phone);
								init_personal();
							}
						});
					});
				}
			});
		}
	})

});

