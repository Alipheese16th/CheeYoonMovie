<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="navbar">
    <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <span class="fs-5 fw-semibold">TEST중 신치윤</span>
    </a>
    
    <ul class="list-unstyled ps-0">
    
      <li class="my-3 text-center">
      <a href="#" class="text-center">
       	영화 홈
      </a>
      </li>
      
      <li class="my-3">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
        	영화리스트
        </button>
        <div class="collapse" id="dashboard-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">현재 상영작</a></li>
            <li><a href="#" class="link-dark rounded">상영 예고작</a></li>
            <li><a href="#" class="link-dark rounded">예고편</a></li>
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
  
  
<!--   <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white"> -->
<!--     <div class="position-sticky"> -->
<!--       <div class="list-group list-group-flush mx-3 mt-4"> -->
<!--         <a -->
<!--           href="#" -->
<!--           class="list-group-item list-group-item-action py-2 ripple" -->
<!--           aria-current="true" -->
<!--         > -->
<!--           <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span> -->
<!--         </a> -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple active"> -->
<!--           <i class="fas fa-chart-area fa-fw me-3"></i><span>Webiste traffic</span> -->
<!--         </a> -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-lock fa-fw me-3"></i><span>Password</span></a -->
<!--         > -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-chart-line fa-fw me-3"></i><span>Analytics</span></a -->
<!--         > -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple"> -->
<!--           <i class="fas fa-chart-pie fa-fw me-3"></i><span>SEO</span> -->
<!--         </a> -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-chart-bar fa-fw me-3"></i><span>Orders</span></a -->
<!--         > -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-globe fa-fw me-3"></i><span>International</span></a -->
<!--         > -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-building fa-fw me-3"></i><span>Partners</span></a -->
<!--         > -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-calendar fa-fw me-3"></i><span>Calendar</span></a -->
<!--         > -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-users fa-fw me-3"></i><span>Users</span></a -->
<!--         > -->
<!--         <a href="#" class="list-group-item list-group-item-action py-2 ripple" -->
<!--           ><i class="fas fa-money-bill fa-fw me-3"></i><span>Sales</span></a -->
<!--         > -->
<!--       </div> -->
<!--     </div> -->
<!--   </nav> -->
 
  
  
  
  
  
</body>
</html>