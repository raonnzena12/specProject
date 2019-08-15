<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENUBAR</title>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- Google WebIcon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- Google WebFont -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Bootstrap 4.3.1 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- Bootstrap select -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<style>

    * {
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
        text-decoration: none;
        user-select: none;
    }

    body {
        /* font-family: 'Noto Sans KR', sans-serif; */
        font-size: 14px !important;
        /* min-width: 1200px !important; */
        width:100%;
        margin: auto;
        height: auto;
    }
    header {
        background-color: #00264B;
        width: 100%;
        z-index: 2;
    }
    #logo{
        width:180px;
        color: #fff;
        font-weight: 900;
        font-size: 40px;
        text-align: center;
        cursor: pointer;
    }
    #menubarNav {
        float: left;
        /* height: 80px; */
    }
/*     #blank {
        width: 28%;
        float: left;
    } */
    #login {
        width: 7%;
        float: right;
    }
    #login i {
        text-align: center;
        font-size: 40px;
        color: white;
        cursor: pointer;
    }
    #login-menu{
        width: 230px;
        height: 270px;
        background-color: white;
        border: 1px solid #ccc;
        float: right;
        position: absolute;
        top: 50px;
        text-align: center;
        right: 0px;
        display: none;
    }
    
    #mypageMenu{
    	width: 200px;
        height: 180px;
        background-color: white;
        border: 1px solid #ccc;
        float: right;
        position: absolute;
        top: 70px;
        padding: 10px 20px;
        text-align: left;
        right: 0px;
        display: none;
    }
    
    #login-table {
        margin: 20px 12px;
    }
    #login-menu input {
        width: 200px;
        height: 40px;
        padding: 10px;
        text-align: left;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin: 2px auto;
    }
    #login-menu button {
        width: 200px;
        height: 40px;
        margin: 2px auto;
        border-radius: 5px;
        background-color: dodgerblue;
        border: 0px;
        font-weight: 900;
        color: #fff;
        font-size: 15px;
        cursor: pointer;
    }

    /* 여기까지 틀잡기 */

    #menubarNav ul>li {
        width: 20%;
        float: left;
        list-style-type: none;
        margin: 0 15px;
        text-align: center;
    }
    #menubarNav ul a {
        color : white;
        font-size: 16px;
    }
    #menubarNav ul a:hover {
        color : yellowgreen;
        text-decoration: none;
    }
    header ul {
    	list-style-type: none;
    }
    #mypageMenu ul>li>a {
    	text-decoration:none;
    	font-size:20px;
    }
    #compareMenu {
        width: 100%;
        height: 600px;
        background-color: rgba(0,38,75,0.8);
        text-align: center;
        display: none; 
        float: left;
        z-index: 1000;
    }
    #compareMenu * {
        /* border: 1px solid white; */
        display: inline-block;
    }
    .comWrapper {
        width: 900px;
        height: 500px;
        margin: 0 auto;
        text-align: center;
        position: relative;
    }
    .comWrapper i, .comStart {
        cursor: pointer;
        line-height: 500px;
        font-size: 100px;
        color: rgba(255, 255, 255, 0.7);
    }
    .comDevice1, .comDevice2 {
        width: 400px;
        height: 100%;
        position: absolute;
        top: 0;
    }
    .comDevice1 {
        left: 0;
    }
    .comDevice2 {
        right: 0;
    }
    .comStart {
        width: 90px;
        height: 100%;
    }
    .loginmenu {
        z-index: 10;
    }
    #veil {
        display: none;
        z-index: 5;
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        left: 0;
    }
</style>
<script>

	
    $(document).ready(function(){
        $("#account").click(function(){
        	$(".loginmenu").toggle();
        });
        $("#veil").on("click", function(){
        	$(".loginmenu").toggle();
        });
        $("#compareOpen").click(function(){
            // $(".compareMenu").slideToggle(500);
            $(".compareMenu").css("display", "block");
        });
	});
</script>
</head>
<body id="tttt">
	<header class="navbar sticky-top navbar-expand navbar-dark flex-column flex-md-row bd-navbar">
        <section id="logo" onclick="location.href='<%=request.getContextPath()%>'">SPEC</section>
        <div id="menubarNav" class="navbar-nav-scroll">
            <ul class="navbar-nav bd-navbar-nav flex-row" >
                <li class="nav-item"><a href="<%=request.getContextPath()%>/devicelist.mo">MOBILE</a></li>
                <li class="nav-item"><a href="#" id="compareOpen">COMPARE</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/calendar.do">CALENDAR</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/maintotal.bo?bno=0">COMMUNITY</a></li>
            </ul>
        </div>
        <!-- <section id="blank"></section> -->
        <ul id="login" class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
             <% if( loginUser != null && loginUser.getUserStatus() == 0) {%>
            <li><i class="material-icons">settings</i></li>
            	<% } %> 
            <li class=" nav-item dropdown">
            
                <i class="material-icons" id="account">account_circle</i>
                <div class="loginmenu" id="veil"></div>
            	<% if(loginUser == null){ %>
        <div id="login-menu" class="dropdown-menu dropdown-menu-right loginmenu" aria-labelledby="account" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <form action="<%=request.getContextPath()%>/login.me">
            	<table id="login-table">
	                <tr>
	                    <td><input type="text" name="userEmail" id="user-email" placeholder="이메일 주소" autocomplete="off"></td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="userPwd" id="user-pwd" placeholder="비밀번호"></td>
	                </tr>
	                <tr>
	                    <td><button type="submit">L O G I N</button></td>
	                </tr>
	                <tr>
	                    <td class="taright gray"><a href="inputNameForm.me" class="gray">아이디</a> / <a href="inputEmailForm.me" class="gray">비밀번호</a> 찾기</td>
	                </tr>
	                <tr>
	                    <td><br>회원이 아니신가요?<br> <a href="joinForm.me"><p class="emp blue">가입하기</p></a>
	                    </td> 
	                </tr>
            	</table>
            </form>
        </div>
        <% } else{ %>
        <div id="mypageMenu" class="dropdown-menu dropdown-menu-right loginmenu" aria-labelledby="account">
        	<ul>
        		<li><a href="<%=request.getContextPath()%>/mypage.me">회원정보</a></li>
        		<li><a href="inputPwdForm.me?code=1">정보수정</a></li>
        		<li><a href="<%=request.getContextPath()%>/myBoardList.me">내글관리</a></li>
        		<li><a href="<%=request.getContextPath()%>/myReviewList.me">내리뷰관리</a></li>
        		<li><a href="#">내댓글관리</a></li>
        		<li><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
        	</ul>
        </div>
        <% } %>    
            </li>
        </ul>
    </header>
    <div class="compareMenu" id="compareMenu">
        <form>
           <div class="comWrapper">
               <div class="comDevice1"><i class="material-icons">add_circle</i></div>
               <div class="comStart">VS</div>
               <div class="comDevice2"><i class="material-icons">add_circle</i></div>
           </div>

        </form>
    </div>	
</body>
</html>