// Initialize your app
var myApp = new Framework7();

// Export selectors engine
var $$ = Dom7;

// Add view
var mainView = myApp.addView('.view-main', {

});

var baseUrl = getRootPath();
// console.log(baseUrl);
var openid='OPENID';

var infoType = '0';// 列表类型
var orderType = '1';// 排序
var currentPage = '1';
var pageNo = '0';

/**
 * index.html
 */
// index页启动时加载listTab
showListTab();


// 底部TAB点击
$$('.tab-link').on('click', function(e) {
	var tabPage = $$(e.target).parent().prop('id');
	console.log(tabPage);
	if (tabPage == 'publish') {
		myApp.popup('.popup-publish');
		return;
	}

	if (tabPage == 'list' || tabPage == 'lift-list'){
		$$.get('list.html',{},function (data) {
            $$('#' + tabPage + '-tab').html(data);
            switch (tabPage) {
                case 'list':
                    infoType = '0';
                    $$('#lift-list-tab').html('');

                    showListTab();
                    break;
                case 'lift-list':
                    infoType = '1'
                    $$('#list-tab').html('');
                    showListTab();
                    break;
            }
        });
	}

	if(tabPage == 'me'){
		$$.get('me.html',{},function (data) {
            $$('#me-tab').html(data);
            $$('.subnavbar').hide();
        	// personal information load
        	$$.ajax({
        		async : false,
        		cache : false,
        		type : 'POST',
        		crossDomain : true,
        		dataType : 'json',
        		data : {
        			'openid' : openid,
        		},
        		url : baseUrl+"/customer/view",
        		error : function(data) {// 请求失败处理函数
        			alert("获取数据失败！");
        		},
        		success : function(data) {
        			var info = data;
        			$$("#me_headimg").attr("src", info.headimgurl);
        			$$("#me_nickname").html(info.nickname);
        		}
        	});
        });

	}

	// $$.get(tabPage + '.html', {}, function(data) {
	// 	$$('#' + tabPage + '-tab').html(data);
	// 	switch (tabPage) {
	// 	case 'list':
	// 		infoType = '0';
	// 		showListTab('0');
	// 		break;
	// 	case 'lift-list':
	// 		infoType = '1'
	// 		showListTab();
	// 		break;
	// 	case 'me':
	// 		showPersonalInfo();
	// 		break;
	// 	}
	// });
});

/**
 * 初始化页面
 */
$$(document).on('pageInit', function (e) {
    var page = e.detail.page;
    console.log(page.name);
    if(page.name == 'info-view'){
		getInfoView(page.query.information_id);
	}
    
    if(page.name == 'personal' ){
    	showPersonalInfo();
    }
    
    if(page.name == 'personal_edit' ){
    	// personal information load
    	$$.ajax({
    		async : false,
    		cache : false,
    		type : 'POST',
    		crossDomain : true,
    		dataType : 'json',
    		data : {
    			'openid' : openid,
    		},
    		url : baseUrl+"/customer/view",
    		error : function(data) {// 请求失败处理函数
    			alert("获取数据失败！");
    		},
    		success : function(data) {
    			var info = data;
    			
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
				
				var content = page.query.content;
				if(content == "nickname")
					$$("#li_nickname").show();
				if(content == "sex")
					$$("#li_sex").show();
				if(content == "address")
					$$("#li_address").show();
				if(content == "name")
					$$("#li_name").show();
				if(content == "phone")
					$$("#li_phone").show();
    		}
    	});
	}
    
    if(page.name =='my_publishment'){

    	$$.ajax({
    		url : baseUrl+"customer/get_publishment",
    		crossDomain : true,
    		async : false,
    		method : 'POST',
    		contentType : 'application/json',
    		data : JSON.stringify({"openid" : openid}),
    		dataType : 'json',
    		success : function(data) {
    			$$.each(data, function(i, info) {
    				// console.log(info);
    				var preHtml = "<li><a onclick='edit("+info.id+")'>"
    						+ "<div class='item-link item-content'>"
    						+ "<div class='item-media avatar'>"
    						+ "<img  src='./img/0.jpg'>"
    						+ "</div>"
    						+ "<div class='item-inner'>"
    						+ "<div class='item-title-row'>"
    						+ "<div class='item-title' style='color: #1a1a1a'>START_POS→DESTINATION</div>"
    						+ "<div class='item-after publish-time'>PUBLISH_TIME前发布</div>"
    						+ "</div>"
    						+ "<div class='item-subtitle start-time'>出发日期：STARAT_TIME</div>"
    						+ "<div class='item-text'>"
    						+ "<span class='category-type'>CATEGORY</span><span class='contact'>CONTACT</span>"
    						+ "</div>" + "</div>" + "</div>" + "</a></li>";
    				preHtml = preHtml.replace('START_POS', info.startpos)
    						.replace('DESTINATION', info.destination)
    						.replace('PUBLISH_TIME',
    								parsePublishTime(info.publish_time))
    						.replace(
    								'STARAT_TIME',
    								getFormatDateByLong(info.start_time,
    										'MM月dd日hh:mm')).replace(
    								'category-type',
    								info.type == 0 ? 'category-youshunche'
    										: 'category-dashunche')
    						.replace('CATEGORY',
    								info.type == 0 ? '有顺车' : '搭顺车')
    						.replace(
    								'CONTACT',
    								info.type == 0 ? info.contact + '(车主)'
    										: info.contact + '(乘客)');
    				$$('.info-list').append($$(preHtml));
    			});
    		},
    		error : function(data) {

    		}

    	});
    }
});
function edit(id){
	var url = baseUrl + 'information/get_information';
    $$.ajax({
        url : url,
        crossDomain : true,
        async : false,
        method : 'POST',
        data : {
        	information_id:id
		},
        dataType : 'json',
        error : function(data){
        	
        },
        success : function(data) {
        	$$("#id").val(data.id);
        	$$("#type").val(data.type);
        	$$("#startpos").val(data.startpos);
        	$$("#startpos").val(data.startpos);
        	$$("#destination").val(data.destination);
        	$$("#start_time").val(data.start_time);
        	$$("#car_type").val(data.car_type);
        	$$("#capacity").val(data.capacity);
        	if(data.road_type==1){
        		$$("#road_type").attr('checked','checked')
        	}else{
        		$$("#road_type").removeAttr('checked');
        	}
        	$$("#road_toll").val(data.road_toll);
        	$$("#remarks").val(data.remarks);
        	$$("#contact").val(data.contact);
        	$$("#contact_info").val(data.contact_info);
        }
	});
	myApp.popup('.popup-edit');
}
// publish popup form change
$$('.category').on('change', function(e) {
	var target = $$(e.target);
	// console.log(target);
	if (target.attr('id') == 'cYoushunche') {
		$$('#form-chexing').show();
		$$('#form-kongzuoshu').show();
		$$('#type').val('0');
	} else {
		$$('#form-chexing').hide();
		$$('#form-kongzuoshu').hide();
		$$('#type').val('1');
	}
});

/**
 * list and lift list pull to refresh
 */
// Pull to refresh content
var ptrContent = $$('.pull-to-refresh-content');

/**
 * 下拉刷新绑定
 */
ptrContent.on('refresh', function(e) {
	var target = $$('.toolbar .tab-link').filter(function(index, el) {
		return $$(this).hasClass('active');
	});
	console.log('更新==>' + target.attr('id'));

	switch (target.attr("id")) {
	case 'list':
		infoType = '0';
		currentPage = '1';
		$$('.info-list').html('');
		getListInfos(infoType, orderType, currentPage);
		myApp.attachInfiniteScroll($$('.infinite-scroll'));
		break;
	case 'lift-list':
		break;
	case 'me':
		break;
	}
	myApp.pullToRefreshDone();

});

/**
 * 绑定点击事件
 */
$$(document).on('click',function(e) {
	var target = $$(e.target);
	// console.log(target);

	// 发布信息
	if ($$(target).hasClass('publish-from-submit')) {
		publishInfoSubmit();
	}
	
	if($$(target).hasClass('edit-form-submit')){
		var data = $('#edit-form').serializeObject();
		// console.log(data);
		var url = baseUrl + 'information/publish';
		$$.ajax({
			url : url,
			crossDomain : true,
			async : false,
			method : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(data) {
				if (data == 1) {
					location.href = baseUrl + 'wx/index.html';
				} else {

				}
			},
			error : function(data) {

			}

		});
	}

	// 按发布时间排序
	if ($$(target).hasClass('sort-publish-time')) {

		if (orderType != '1' && orderType != '2') {
			orderType = '1';
		} else {
			orderType = orderType == '1' ? '2' : '1';
		}
		$(target).next('i').attr(
				'class',
				orderType == '1' ? 'fa fa-sort-up'
						: 'fa fa-sort-down');
		$$('.info-list').html('');
		currentPage = '1';
		getListInfos(infoType, orderType, currentPage);
	}

	// 按出发时间排序
	if ($$(target).hasClass('sort-start-time')) {
		if (orderType != '3' && orderType != '4') {
			orderType = '3';
		} else {
			orderType = orderType == '3' ? '4' : '3';
		}
		$$('.info-list').html('');
		$(target).next('i').attr(
				'class',
				orderType == '3' ? 'fa fa-sort-up'
						: 'fa fa-sort-down');
		currentPage = '1';

		getListInfos(infoType, orderType, currentPage);
	}

	// 选择地点查询 提交
	if ($$(target).hasClass('choose-location-submit')) {
		var s = $$('.choose-location-s').val();
		var d = $$('.choose-location-d').val();
		console.log(s + "," + d);
		$$('.info-list').html('');
		currentPage = '1';
		getListInfos(infoType, orderType, currentPage, s, d);
		myApp.closeModal('.popover-choose-location');
	}
	
	if(e.srcElement.id=="save_personal"){
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
				mainView.router.back();
				showPersonalInfo();
			}
		});
	}
});

/**
 * 获取详细信息
 * @param id
 */
function getInfoView(id) {
	var url = baseUrl + 'information/read';
    $$.ajax({
        url : url,
        crossDomain : true,
        async : false,
        method : 'POST',
        data : {
        	information_id:id
		},
        dataType : 'json',
        success : function(data) {
           	data = infoFormat(data);
           	console.log(data);
			$$('.info-view-header-title').text('('+data.type+')'+data.startpos+'→'+data.destination);
			$$('.info-view-header-publish-time').text(data.publish_time+'前');
			$$('.info-view-header-view-count').text(data.read_times+'人');
			$$('.info-view-content-type').text(data.type=='有顺车'?data.type+'('+data.car_type+')':data.type);
			$$('.info-view-content-start-time').text(data.start_time);
			$$('.info-view-content-pos').text(data.startpos+'→'+data.destination);
			if (data.type=='有顺车'){
                $$('.info-view-item-capacity-row').show();
                $$('.info-view-content-capacity').text(data.capacity);
			}else {
				$$('.info-view-item-capacity-row').hide();
			}
			$$('.info-view-content-distance').text(data.distance+'公里');
			$$('.info-view-content-during-time').text(data.time);
			$$('.info-view-content-is-gaosu').text(data.road_type);
			$$('.info-view-content-road-toll').text('约'+data.road_toll+'元');
			$$('.info-view-content-remarks').text(data.remarks);
			$$('.info-view-content-more-text').text(data.startpos+'到'+data.destination);
			$$('.info-view-content-contact').text(data.contact);
			$$('.info-view-content-contact-info').text(data.contact_info);

			$$('.give-me-call').prop('href','tel:'+data.contact_info);
            $$('.give-me-sms').prop('href','sms:'+data.contact_info);
        },
        error : function(data) {

        }

    });
}

/**
 * 格式化info数据
 * @param data
 * @returns {*}
 */
function infoFormat(data) {
	data.type = data.type=='0'?'有顺车':'搭顺车';
	data.publish_time = parsePublishTime(data.publish_time);
	data.start_time = getFormatDateByLong(data.start_time, 'yyyy年MM月dd日hh:mm');
	var carType = data.car_type;
	switch (carType){
		case 1:
			data.car_type = '轿车';
			break;
        case 2:
            data.car_type = '越野车SUV';
            break;
        case 3:
            data.car_type = '面包车';
            break;
        case 4:
            data.car_type = '卡车';
            break;
		default:
			data.car_type = '未知车型';
	}
	data.road_type = data.road_type == '0'?'不走高速':'走高速';
	return data;
}

/**
 * 发布信息
 * 
 * @returns
 */
function publishInfoSubmit() {
	var data = $('#publish-form').serializeObject();
	// console.log(data);
	var url = baseUrl + 'information/publish';
	$$.ajax({
		url : url,
		crossDomain : true,
		async : false,
		method : 'POST',
		contentType : 'application/json',
		data : JSON.stringify(data),
		dataType : 'json',
		success : function(data) {
			if (data == 1) {
				location.href = baseUrl + 'wx/index.html';
			} else {

			}
		},
		error : function(data) {

		}

	});
}

// Loading flag
var loading = false;

/**
 * 初始化上拉加载
 */
function initPullLoading() {
	var preHtml = "<div class='infinite-scroll-preloader'>"
			+ "<div class='preloader'></div>" + "</div>";

	$$('.page-content').append($$(preHtml).hide());

	// Attach 'infinite' event handler
	$$('.infinite-scroll').on('infinite', function() {
		console.log('上拉刷新');
		$$('.infinite-scroll-preloader').show();
		// Exit, if loading in progress
		if (loading)
			return;

		// Set loading flag
		loading = true;

		console.log("curr:" + currentPage + ",pageNo:" + pageNo);

		if (currentPage > pageNo) {
			// Nothing more to load, detach infinite scroll events to prevent
			// unnecessary loadings
			myApp.detachInfiniteScroll($$('.infinite-scroll'));
			// Remove preloader
			$$('.infinite-scroll-preloader').hide();
			loading = false;
			return;
		}

		getListInfos(infoType, orderType, currentPage);

		loading = false;

	});
	// myApp.attachInfiniteScroll($$('.infinite-scroll'));
}

/**
 * 格式化发布时间
 * 
 * @param publishTime
 * @returns {Number}
 */
function parsePublishTime(publishTime) {
	var now = Date.parse(new Date());
	var s = parseInt((now - publishTime) / 1000);
	if (s < 60)
		return s + '秒';
	var m = parseInt(s / 60);
	if (m < 60)
		return m + '分钟';
	var h = parseInt(m / 60);
	if (h < 24)
		return h + '小时';
	var d = parseInt(h / 24);
	if (d < 30)
		return d + '天';
	var mo = parseInt(mo / 30);
	if (mo < 12)
		return mo + '月';
}

/**
 * 加载信息列表
 * 
 * @param data
 */
function appendInfoList(data) {

	if (data == null || data == undefined)
		return;

	$$.each(data.results, function(i, info) {
		// console.log(info);
		var preHtml = "<li><a href='info-view.html?information_id="+info.id+"'>"
				+ "<div class='item-link item-content'>"
				+ "<div class='item-media avatar'>"
				+ "<img  src='./img/0.jpg'>"
				+ "</div>"
				+ "<div class='item-inner'>"
				+ "<div class='item-title-row'>"
				+ "<div class='item-title' style='color: #1a1a1a'>START_POS→DESTINATION</div>"
				+ "<div class='item-after publish-time'>PUBLISH_TIME前发布</div>"
				+ "</div>"
				+ "<div class='item-subtitle start-time'>出发日期：STARAT_TIME</div>"
				+ "<div class='item-text'>"
				+ "<span class='category-type'>CATEGORY</span><span class='contact'>CONTACT</span>"
				+ "</div>" + "</div>" + "</div>" + "</a></li>";
		preHtml = preHtml.replace('START_POS', info.startpos)
				.replace('DESTINATION', info.destination)
				.replace('PUBLISH_TIME',
						parsePublishTime(info.publish_time))
				.replace(
						'STARAT_TIME',
						getFormatDateByLong(info.start_time,
								'MM月dd日hh:mm')).replace(
						'category-type',
						info.type == 0 ? 'category-youshunche'
								: 'category-dashunche')
				.replace('CATEGORY',
						info.type == 0 ? '有顺车' : '搭顺车')
				.replace(
						'CONTACT',
						info.type == 0 ? info.contact + '(车主)'
								: info.contact + '(乘客)');
		$$('.info-list').append($$(preHtml));
	});

	pageNo = data.pageNo;
	currentPage = '' + (1 + data.currentPage);

}

/**
 * 显示list.html
 */
function showListTab() {
    orderType = '1';
    currentPage = '1';
	$$('.subnavbar').show();
	$$.get('list.html', {}, function(data) {
		$$('#list-tab').html(data);
		getListInfos(infoType, orderType, currentPage);
		initPullLoading();
	});
}

/**
 * 获取列表信息
 * 
 * @param type
 *            类型 0为有顺车，1为搭顺车
 * @param order
 *            1：发布时间升序；2：发布时间降序；3：出发时间升序；4出发时间降序
 * @param page
 *            请求页码
 * @param start_pos
 *            出发地点
 * @param destination
 *            终点
 */
function getListInfos(type, order, page, start_pos, destination) {
	// console.log('请求信息列表：'+type+','+order+','+page);
	var url, data;
	if (start_pos == null || destination == null) {
		url = baseUrl + 'information/get_list';
		data = {
			"type" : type,
			"order" : order,
			"page" : page
		};
	} else {
		url = baseUrl + 'information/search';
		data = {
			"type" : type,
			"order" : order,
			"page" : page,
			"start_pos" : start_pos,
			"destination" : destination
		};
	}

	$$.ajax({
		url : url,
		crossDomain : true,
		async : false,
		method : 'POST',
		contentType : 'application/json',
		data : JSON.stringify(data),
		dataType : 'json',
		success : function(data) {
			console.log(data);
			appendInfoList(data);
		},
		error : function(data) {

		}

	});
}

function parseSex(sex) {
	switch (sex) {
	case "0":
		return "保密";
	case "1":
		return "男";
	case "2":
		return "女";
	}
}

function showPersonalInfo() {
	$$('.subnavbar').hide();
	// personal information load
	$$.ajax({
		async : false,
		cache : false,
		type : 'POST',
		crossDomain : true,
		dataType : 'json',
		data : {
			'openid' : openid,
		},
		url : "http://localhost:8080/travel/customer/view",
		error : function(data) {// 请求失败处理函数
			alert("获取数据失败！");
		},
		success : function(data) {
			var info = data;
			$$("#headimgurl").attr("src", info.headimgurl);
			$$("#nickname").html(info.nickname);
			$$("#sex").html(parseSex(info.sex));
			$$("#address").html(info.province + "," + info.city);
			$$("#name").html(info.name);
			$$("#phone").html(info.phone);
		}
	});
}
/**
 * 获取根目录
 * @returns {string}
 */
function getRootPath() {
    //获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8080
    var localhostPath = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/ems
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return(localhostPath + projectName+"/");
}
