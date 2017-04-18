// Initialize your app
var myApp = new Framework7();

// Export selectors engine
var $$ = Dom7;

// Add view
var mainView = myApp.addView('.view-main', {

});

var baseUrl = "http://localhost:8080/travel/";

var infoType = '0';// 列表类型
var orderType = '1';// 排序
var currentPage = '1';
var pageNo = '0';


/**
 * index.html
 */
// index页启动时加载listTab
$$.get('list.html',{},function (data) {
    $$('#list-tab').html(data);
    infoType = '0';
    orderType = '1';
    currentPage = '1';
    getListInfos(infoType,orderType,currentPage);
    initPullLoading();
})

// 底部TAB点击
$$('.tab-link').on('click',function (e) {
    var tabPage = $$(e.target).parent().prop('id');
    // console.log(tabPage);
    if (tabPage == 'publish'){
        myApp.popup('.popup-publish');
        return;
    }
    $$.get(tabPage+'.html',{},function (data) {
        $$('#'+tabPage+'-tab').html(data);
    })
});

// publish popup form change
$$('.category').on('change',function (e) {
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

// Add 'refresh' listener on it
ptrContent.on('refresh', function (e) {
    var  target = $$('.toolbar .tab-link').filter(function (index,el) {
        return $$(this).hasClass('active');
    });
    console.log('更新==>'+target.attr('id'));

    switch (target.attr("id")){
        case 'list':
        	infoType = '0';
        	currentPage = '1';
            $$('.info-list').html('');
        	getListInfos(infoType,orderType,currentPage);
            myApp.attachInfiniteScroll($$('.infinite-scroll'));
            $$('.infinite-scroll-preloader').show();
            break;
        case 'lift-list':
            break;
        case 'me':
            break;
    }
    myApp.pullToRefreshDone();

});

//Loading flag
var loading = false;

/**
 * 初始化上拉加载
 */
function initPullLoading(){
    var preHtml = "<div class='infinite-scroll-preloader'>"+
        "<div class='preloader'></div>"+
        "</div>";

    $$('.page-content').append($$(preHtml));

    // Attach 'infinite' event handler
    $$('.infinite-scroll').on('infinite', function () {
        console.log('上拉刷新');

        // Exit, if loading in progress
        if (loading) return;

        // Set loading flag
        loading = true;

        console.log("curr:"+currentPage+",pageNo:"+pageNo);

        if(currentPage > pageNo){
            // Nothing more to load, detach infinite scroll events to prevent unnecessary loadings
           myApp.detachInfiniteScroll($$('.infinite-scroll'));
            // Remove preloader
            $$('.infinite-scroll-preloader').hide();
            loading = false;
            return;
        }

        getListInfos(infoType,orderType,currentPage);

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
    return parseInt((now-publishTime)/1000/60);
}


/**
 * 加载信息列表
 * 
 * @param data
 */
function appendInfoList(data) {
	
    if (data==null || data == undefined)return;

    $$.each(data.results,function(i,info){
    	console.log(info);
    	  var preHtml =   "<li>"+
          "<div class='item-link item-content'>"+
              "<div class='item-media avatar'>" +
                  "<img  src='./img/0.jpg'>" +
              "</div>"+
              "<div class='item-inner'>"+
                  "<div class='item-title-row'>"+
                     "<div class='item-title'>START_POS→DESTINATION</div>"+
                      "<div class='item-after publish-time'>PUBLISH_TIME分钟前发布</div>"+
                  "</div>"+
                  "<div class='item-subtitle start-time'>出发日期：STARAT_TIME</div>"+
                  "<div class='item-text'>" +
                       "<span class='category-type'>CATEGORY</span><span class='contact'>CONTACT</span>" +
                  "</div>"+
              "</div>"+
          "</div>"+
      "</li>";
        preHtml = preHtml.replace('START_POS',info.startpos)
        .replace('DESTINATION',info.destination)
        .replace('PUBLISH_TIME',parsePublishTime(info.publish_time))
        .replace('STARAT_TIME',getFormatDateByLong(info.start_time,'MM月dd日hh:mm'))
        .replace('category-type',info.type==0?'category-youshunche':'category-dashunche')
        .replace('CATEGORY',info.type==0?'有顺车':'搭顺车')
        .replace('CONTACT',info.type==0?info.contact+'(车主)':info.contact+'(乘客)');
        $$('.info-list').append($$(preHtml));

    });

  
    
    
    pageNo = data.pageNo;
    currentPage = ''+(1+data.currentPage);



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
 */
function getListInfos(type,order,page) {
    console.log('请求信息列表：'+type+','+order+','+page);
    var url = baseUrl+'information/get_list';
    var data = {
        "type":type,
        "order":order,
        "page":page
    };
    $$.ajax({
        url:url,
        async:false,
        method:'POST',
        contentType:'application/json',
        data:JSON.stringify(data),
        dataType:'json',
        success:function (data) {
        	console.log(data);
            appendInfoList(data);
        },
        error:function (data) {

        }

    });
}

