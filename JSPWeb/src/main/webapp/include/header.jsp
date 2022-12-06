<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- 복사해서 가져옴 -->
 
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   
    <title>Welcome to MyWorld</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
    $('.carousel').carousel({
        interval: 2000 //changes the speed
    })
    </script>
	<style>
	.abc {
		position: sticky;
		top: 0px;
		width: 100%; 
		z-index: 10;
	}
	</style>
    
    
</head>

<body>
	<!-- header -->
	<div class="brand">My Web</div>        
    <div class="address-bar">Welcome to MyWorld</div>
    
    <nav class="navbar navbar-default abc" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
                <a class="navbar-brand" href="/hong">My First Web</a>
            </div>
           
           
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	
                    <li>
                        <a href="${pageContext.request.contextPath}/index.main">HOME</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/member/member.main">Member</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/board/board_list.board">BOARD</a>
                    </li>
                    
                    <!-- 특정 조건일 때 html부분이 보였다, 안보였다 해줌, if대신 choose 사용해도 됨 -->
                    <c:if test="${sessionScope.user_id == null }"> <!-- 로그인 안되어 있으면 login, join만 -->
                    <li>
                        <a href="${pageContext.request.contextPath}/user/user_login.user">LOGIN</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/user_join.user" style="color:red">JOIN</a>
                    </li>
					</c:if>
					
					<c:if test="${sessionScope.user_id != null }"> <!-- 로그인 되어 있으면 logout, mypage만 -->                   
                     <li>
                        <a href="${pageContext.request.contextPath}/user/user_logout.user">LOGOUT</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/user_mypage.user" style="color:red">MYPAGE</a>
                    </li>
                    </c:if>
                    
                </ul>
            </div>
            
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
 	<!-- end header -->