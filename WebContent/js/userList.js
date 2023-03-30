/**
 * 
 */

$(function(){
	
	$('tr').css('cursor','pointer').click(function(){
		var userId = $(this).children().eq(0).text();
		if(userId != '아이디'){
			location.href = "${conPath}/userDetail.do?userId="+userId;
		}
	});
	
});