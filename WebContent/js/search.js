/**
 * 
 */


	$(document).on('ready', function () {
		
		$('.card img, .card-title, .card-text').click(function(){
			var movieId = $(this).parents('.card').attr('id');
			location.href = '${conPath}/movieContent.do?movieId='+movieId;
		});
			
		$('.forms').submit(function(){
			var qs = $('#qs').val();
			if(qs.trim() == ''){
				alert('빈칸은 검색할 수 없습니다');
				return false;
			}
		});
		
		//별점기능 추가
        $('.kv-fa').rating({
            theme: 'krajee-fa',
            filledStar: '<i class="fa fa-star"></i>',
            emptyStar: '<i class="fa fa-star-o"></i>',
            stars:5,
            max:5,
            step:0.5,
            showCaption:false,
            displayOnly:true,
        });
        $('.rating,.kv-fa').on(
                'change', function () {
                    console.log('Rating selected: ' + $(this).val());
        });
    });