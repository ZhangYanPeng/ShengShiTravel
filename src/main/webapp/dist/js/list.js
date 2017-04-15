
var baseUrl = $('.list').attr('data-url');
var currentPage = 1;
var pageCount;
var pageNo;
var pageSize;

var type = 0;// 列表类型
var order = 1;// 排序方式
var publish_dec = false;
var start_dec = false;
var refresh = false;

function append(data){
	console.log(data);
	$.each(data.results,function(i,item){
		var a = $('<a/>').addClass('weui-cell weui-cell_access').appendTo($('.list'));
		// TODO
		$(a).attr('href','#');
		
		var hd = $('<div/>').addClass('weui-cell__hd').appendTo(a);
		// TODO
		var imgUrl = 'http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0';
		$('<img/>').attr('src',imgUrl)
					.attr('style','width: 60px; margin-right: 5px; display: block')
					.appendTo(hd);
		
		var bd = $('<div/>').addClass('weui-cell__bd').appendTo(a);
		$('<p/>').text(item.startpos+'→'+item.destination).appendTo(bd);
		$('<p/>').attr('style','font-size: 13px; color: #888888')
				.text(getFormatDateByLong(item.start_time,'MM月dd日hh:mm'))
				.appendTo(bd);
		var p = $('<p/>').attr('style','font-size: 13px; color: #888888').appendTo(bd);
		if(item.type == 0){
			var pHtml = "<span class = 'youshunche'>有顺车</span>"+item.contact+'(车主)';
			$(p).html(pHtml);
		}else{
			var pHtml = "<span class = 'dashunche'>搭顺车</span>"+item.contact+'(乘客)';
			$(p).html(pHtml);
		}
		
		var ft = $('<div/>').addClass('weui-cell__ft').appendTo(a);
		var publish_time = item.publish_time;
		var now = Date.parse(new Date());
		var ago = parseInt((now-publish_time)/1000/60);
		$('<p/>').attr('style','font-size: 13px; color: #888888')
				.text(ago+'分钟前发布').appendTo(ft);
	});
	

}

function getInformation(){
	var data = {
			'type':type,
			'order':order,
			'pageNo':currentPage
		};
	
	
	$.ajax({
		url:baseUrl+'/information/get_list',
		type:'POST',
		async: false,
		contentType: "application/json",
		data:JSON.stringify(data),
		success:function(data){
			
			currentPage = data.currentPage;
			pageNo = data.pageNo;
			
			
			if(refresh){
				$('.list').html('');
				append(data);
			}else{
				append(data);
			}
			
			$('.info-bottom').remove();
			$('<div/>').addClass('info-bottom').appendTo($('.list'));
		},
		error: function(xhr, type){
			
        }
	});
	
}

function initSortClick(){
	
	$(document).on('click',function(e){
		var target = $(e.target).attr('id');
		//发布时间排序
		if(target == 'publish-time'){
			publish_dec = !publish_dec; 
			order = publish_dec?2:1;
			if(order == 1){
				$(e.target).next().attr('class','fa fa-sort-up');
			}else{
				$(e.target).next().attr('class','fa fa-sort-down');
			}
			refresh = true;
			currentPage= 1;
			getInformation();
			refresh = false;
		}
		//出发时间排序
		if(target == 'start-time'){
			start_dec = !start_dec; 
			order = start_dec?4:3;
			if(order == 3){
				$(e.target).next().attr('class','fa fa-sort-up');
			}else{
				$(e.target).next().attr('class','fa fa-sort-down');
			}
			refresh = true;
			currentPage= 1;
			getInformation();
			refresh = false;
		}
	});
}

$(document).ready(function(){
	type = $('.info-type').attr('data-type');
	initSortClick();
	
	getInformation()
	
	// 监听滑动上拉加载
	var infoBottom = $('.info-bottom').offset().top;
	var tabbarBottom = $('.weui-tabbar').offset().top;
	var notBottom = infoBottom < tabbarBottom?false:true;
	var offset = $('.weui-tabbar').offset().top+10;
	
	$('div').scroll(function(){
// console.log('滚动了'+$('.weui-tabbar').offset().top
// +','+$('.info-bottom').offset().top);
			if(notBottom && offset >= $('.info-bottom').offset().top){
				
				if(currentPage == pageNo){
					var nomore = "<div class='weui-loadmore weui-loadmore_line'>"
						+"<span class='weui-loadmore__tips'>没更多数据了</span>"
						+"</div>";
					$('.info-bottom').html(nomore);
					
				}else{
					var loadmore = "<div class='weui-loadmore'>"
						+"<i class='weui-loading'></i>"
						+"<span class='weui-loadmore__tips'>正在加载</span>"
						+"</div>";
					$('.info-bottom').html(loadmore);
					notBottom = false;
					
					currentPage = currentPage+1;
					getInformation(type,order,currentPage,0)
				}
				
				notBottom = true;
				
			}
	});

	
	
});
