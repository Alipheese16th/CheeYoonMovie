/**
 * 
 */


$(function() {
	$( "#datepicker" ).datepicker({
		dateFormat: "yy-mm-dd",
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		yearSuffix: '년',
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		changeYear: true,  // 년을 바꿀수 있는 셀렉트 박스를 표시한다.
		showMonthAfterYear: true,
		showOtherMonths: true,  // 현재 달이 아닌 달의 날짜도 회색으로 표시
		//minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		minDate: new Date(1950, 1 - 1, 1), // 1950년 1월 1일을 최소날짜로 세팅
		maxDate: 'y',					// 현재 날짜 이전만 선택
		yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	});
} );
		  

$(function(){
		
		var sessionName = $('#userName').val();
		var sessionPw = $('#sessionPw').val();
		var sessionBirth = $('input[type="userBirth"]').val();
		var sessionEmail = $('#userEmail').val();
		var sessionTel = $('#sessionTel').val();
		
		// 이름 유효성 검사
		$('#userName').keyup(function(){
			var reg_name = /^[가-힣]{2,20}$/;
			var userName = $(this).val();

			if(userName==sessionName){	// 초기상태면 알림없음
				$('#userNameConfirmResult').html(' &nbsp; ');
	
			}else if(userName.search(/\s/)!=-1){
				$('#userNameConfirmResult').text('공백 입력 금지');
	
			}else if(userName.length < 2){
					$('#userNameConfirmResult').text('이름은 2글자 이상');
		
			}else if(userName.match(reg_name)){	// 한글 2~20자 패턴에 일치한 경우
					$('#userNameConfirmResult').html(' &nbsp; ');
		
			}else{
				$('#userNameConfirmResult').html('2~20자의 완성형 한글로 입력해주세요');
			}
		});// 이름 유효성 검사
		
	
  		// 새비밀번호 유효성 검사
  		$('#newPw').keyup(function(){
  			var newPw = $('#newPw').val();
 			var num = newPw.search(/[0-9]/g);
 			var eng = newPw.search(/[a-z]/ig);
 			var kor = newPw.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g);
 			var spc = newPw.search(/[~`!@#$%^&*()\-_+=|\\\[\]{}'";:?,.<>\/]/gi);
 			
 			if(newPw==""){ // 아무것도 입력하지 않았을시 알림없음
  				$('#newPwChkResult').html(' &nbsp; ');
		
 			}else if(newPw.search(/\s/)!=-1){
  				$('#newPwChkResult').text('비밀번호는 공백 없이 입력해주세요');
		
  			}else if(kor >= 0){
  				$('#newPwChkResult').text('한글 입력 금지');
		
  			}else if(num < 0 || eng < 0 || spc < 0 ){
  				$('#newPwChkResult').text('영문,숫자,특수문자를 혼합하여 입력하세요');
		
			}else if(newPw.length < 4 || newPw.length > 20){
  				$('#newPwChkResult').text('4자리 ~ 20자리 이내로 입력해주세요');
		
  			}else{
  				$('#newPwChkResult').html(' &nbsp; ');
  			}
  		}); // 비밀번호 유효성 검사
  		
	  	// 생일 유효성 검사
		var patternBirth = /^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		$('input[name="userBirth"]').change(function(){
			var userBirth = $(this).val();
			if(userBirth==sessionBirth){		// 초기값일 경우 알림없음
				$('#userBirthConfirmResult').html(' &nbsp; ');
			}else if(!userBirth.match(patternBirth)){
				$('#userBirthConfirmResult').text('올바르지 않은 날짜형식입니다');
			}else{
				$('#userBirthConfirmResult').html(' &nbsp; ');
			}
		});

  		// 이메일 유효성 검사
  		var patternMail = /^\w+@\w+(\.\w+){1,2}$/;
  		$('#userEmail').keyup(function(){
  			var userEmail = $(this).val();
  			
  			if(userEmail==sessionEmail){	// 초기값일 경우 알림없음
  				$('#userEmailConfirmResult').html(' &nbsp; ');
		
  			}else if(userEmail.match(patternMail)){	// 이메일 패턴에 일치한 경우에 중복검사
  				$.ajax({
  					url : 'userEmailConfirm.do',
  					type : 'get',
  					data : 'userEmail='+userEmail,
  					dataType : 'html',
  					success : function(data){
  						$('#userEmailConfirmResult').html(data);
  					},
  				});
  			}else{
  				$('#userEmailConfirmResult').text('올바르지 않은 이메일 형식입니다');
  			}
  		}); // email 유효성검사 + 중복검사
	  		
		// 전화번호 유효성검사
  		var patternTel = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
   		$('input[type="tel"]').keyup(function(){
   			var tel3 = $('#tel3').val();
			var userTel = $('#tel1').val()+"-"+$('#tel2').val()+"-"+tel3;
			
			if(userTel == sessionTel){		// 초기값일 경우 알림없음
				$('#userTelConfirmResult').html(' &nbsp; ');
			}else{
				if(userTel.match(patternTel)){
  					$('#userTelConfirmResult').html(" &nbsp; ");
	   			}else{
					$('#userTelConfirmResult').text("올바르지 않은 전화번호입니다");
				}
			}
   		}); // 전화번호 유효성검사
	  		
  		// submit검사 - 결과 알림창이 특정 메세지일경우에만 제출가능
  		$('form').submit(function(){
  			
  			var userNameConfirmResult = $('#userNameConfirmResult').text().trim();
  			var oldPw = $('#oldPw').val();
  			var newPwChkResult = $('#newPwChkResult').text().trim();
  			var userBirth = $('input[name="userBirth"]').val();
  			var userBirthConfirmResult = $('#userBirthConfirmResult').text().trim();
  			var userGender = $('input[name="userGender"]:radio:checked');
  			var userEmailConfirmResult = $('#userEmailConfirmResult').text().trim();
  			var userTelConfirmResult = $('#userTelConfirmResult').text().trim();
  			
  			if(userNameConfirmResult != ''){
  				alert('이름을 확인하세요');
  				$('#userName').focus();
  				return false;
  			}else if(oldPw != sessionPw){
  				alert('현비밀번호를 잘못입력하셨습니다');
  				$('#oldPw').focus();
  				return false;
  			}else if(newPwChkResult != ''){
  				alert('새 비밀번호를 잘못입력하셨습니다');
  				$('#newPw').focus();
  				return false;
  			}else if(userBirth.length < 1){
  				alert('생일을 입력하세요');
  				return false;
			}else if(userBirthConfirmResult == '올바르지 않은 날짜형식입니다'){
  				alert('생일을 제대로 입력해주세요');
				return false;
  			}else if(userGender.length < 1){
  				alert('성별을 선택하세요');
  				return false;
  			}else if(userEmailConfirmResult != "" && userEmailConfirmResult != '사용가능한 이메일입니다'){
  				alert('이메일이 잘못되었습니다');
  				$('#userEmail').focus();
  				return false;
  			}else if(userTelConfirmResult != ""){
				alert('전화번호가 잘못되었습니다');
				$('#tel1').focus();
				return false;
			}
  			
  		}); //submit 검사
	  		
});
