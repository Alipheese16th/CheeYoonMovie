/**
 * 
 */

$(function(){
	
	$('.adminLogin').click(function(){
		if ($('#adminLogin').css('display') == 'none') {
	        $('#adminLogin').css('display', 'block');
	    }
	});
	
	$('#loginCancel').click(function(){
		if ($('#adminLogin').css('display') == 'block') {
	        $('#adminLogin').css('display', 'none');
	    }
	});
	
});