
var baseUrl = $('.list').attr('data-url');
var currPage = 1;

function getInformation(type,order,pageNo){
	var data = {
			'type':type,
			'order':order,
			'pageNo':pageNo
		};
	
	$.ajax({
		url:baseUrl+'/information/get_list',
		type:'POST',
		contentType: "application/json",
		data:JSON.stringify(data),
		success:function(data){
			console.log(data);
		}
	});
	
}

getInformation(0,1,1);