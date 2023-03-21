<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">

    <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <span class="fs-5 fw-semibold">TEST중 신치윤</span>
    </a>
    
    <ul class="list-unstyled ps-0">
    
      <li class="my-3">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
        	상영작/예정작
        </button>
        <div class="collapse" id="home-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">현재 상영영화</a></li>
            <li><a href="#" class="link-dark rounded">개봉 예정영화</a></li>
            <li><a href="#" class="link-dark rounded">예고편</a></li>
          </ul>
        </div>
      </li>
      
      <li class="my-3">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
        	자유게시판/평점리스트
        </button>
        <div class="collapse" id="dashboard-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">자유게시판</a></li>
            <li><a href="#" class="link-dark rounded">평점 리뷰</a></li>
            <li><a href="#" class="link-dark rounded">영화 랭킹</a></li>
            <li><a href="#" class="link-dark rounded">나머지</a></li>
          </ul>
        </div>
      </li>
      
      <li class="my-3">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
        	몰라 남는다
        </button>
        <div class="collapse" id="orders-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">남1</a></li>
            <li><a href="#" class="link-dark rounded">남2</a></li>
            <li><a href="#" class="link-dark rounded">남3</a></li>
            <li><a href="#" class="link-dark rounded">남4</a></li>
          </ul>
        </div>
      </li>
      
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          Account
        </button>
        <div class="collapse" id="account-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">New...</a></li>
            <li><a href="#" class="link-dark rounded">Profile</a></li>
            <li><a href="#" class="link-dark rounded">Settings</a></li>
            <li><a href="#" class="link-dark rounded">Sign out</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
</body>
</html>