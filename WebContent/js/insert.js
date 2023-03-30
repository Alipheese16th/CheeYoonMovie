/**
 * 
 */


$(function() {
	
	$('.my-select').selectpicker();
	
	// 영화 등록
	$('.insertMovie').click(function(){
		if ($('#movieForm').css('display') == 'none') {
	        $('#movieForm').css('display', 'block');
	    }
	});
	$('#movieCancel').click(function(){
		if ($('#movieForm').css('display') == 'block') {
	        $('#movieForm').css('display', 'none');
	    }
	});
	
	// 태그 등록
	$('.insertTag').click(function(){
		if ($('#tagForm').css('display') == 'none') {
	        $('#tagForm').css('display', 'block');
	    }
	});
	$('#tagCancel').click(function(){
		if ($('#tagForm').css('display') == 'block') {
	        $('#tagForm').css('display', 'none');
	    }
	});
	
	// 트레일러 등록
	$('.insertTrailer').click(function(){
		if ($('#trailerForm').css('display') == 'none') {
	        $('#trailerForm').css('display', 'block');
	    }
	});
	$('#trailerCancel').click(function(){
		if ($('#trailerForm').css('display') == 'block') {
	        $('#trailerForm').css('display', 'none');
	    }
	});
	
	
	$("#datepicker").datepicker({
		dateFormat: "yy-mm-dd",
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		yearSuffix: '년',
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		changeYear: true,  // 년을 바꿀수 있는 셀렉트 박스를 표시한다.
		showMonthAfterYear: true,
		showOtherMonths: true,  // 현재 달이 아닌 달의 날짜도 회색으로 표시
		//minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		minDate: new Date(1900, 1 - 1, 1), // 1900년 1월 1일을 최소날짜로 세팅
		maxDate: new Date(2100, 1 - 1, 1),	// 2100년 1월 1일을 최대날짜로 세팅
		yearRange: 'c-100:c+100', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	});
	
       
});
