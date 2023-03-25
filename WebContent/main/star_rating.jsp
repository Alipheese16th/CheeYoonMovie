<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>CheeYoonMovie</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="${conPath}/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${conPath}/css/styles.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	
    <!-- 별점기능추가 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${conPath}/css/star-rating.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="${conPath}/css/theme.css" media="all" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="${conPath}/js/star-rating.js" type="text/javascript"></script>
    <script src="${conPath}/js/theme.js" type="text/javascript"></script>
	<!-- star-rating -->
</head>
<body>

	<div class="d-flex" id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container-fluid">
			    
			    
			    <h1>asdfasdfasdfa</h1>
			    
			    
			    <div class="page-header">
		            <h3>Font Awesome Star LTR</h3>
		        </div>
		        <input type="text" class="kv-fa rating-loading" value="3.75" data-size="xl" title="">
		        <br>
		        <input type="text" class="kv-fa rating-loading" value="2.5" data-size="lg" title="">
		        <br>
		        <input type="text" class="kv-fa rating-loading" value="1.75" data-size="md" title="">
		        <br>
		        <input type="text" class="kv-fa rating-loading" value="4" data-size="sm" title="">
		        <br>
		        <input type="text" class="kv-fa rating-loading" value="2" data-size="xs" title="">
		        <br>
			    
			    
			    
			    
			    
			    
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
		
	</div>
			
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>

<script>

	$(document).on('ready', function () {
	       
		//별점기능 추가
        $('.kv-fa').rating({
            theme: 'krajee-fa',
            filledStar: '<i class="fa fa-star"></i>',
            emptyStar: '<i class="fa fa-star-o"></i>'
        });

        $('.rating,.kv-fa').on(
                'change', function () {
                    console.log('Rating selected: ' + $(this).val());
        });
        
        
    });

</script>

</body>
</html>
