/**
 * 
 */

$(function(){
	
	$('.form').submit(function(){
		var q = $('#q').val();
		if(q.trim() == ''){
			alert('빈칸은 검색할 수 없습니다');
			return false;
		}
	});
	
});