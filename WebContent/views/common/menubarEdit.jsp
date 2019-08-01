<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean loginUser = true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENUBAR</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
    * {
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
        text-decoration: none;
        user-select: none;
    }
    body {
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 14px !important;
        min-width: 1200px !important;
        width:100%;
        margin: auto;
        height: auto;
    }

    #menubarNav {
        width:600px;
        float: left;
    }
    #blank {
        width: 28%;
        float: left;
    }
    #login {
        width: 7%;
        float: right;
    }
    #login i {
        text-align: center;
        font-size: 60px;
        color: white;
        line-height: 80px;
        cursor: pointer;
    }
    #login-menu,#mypageMenu {
        width: 230px;
        height: 270px;
        background-color: white;
        border: 1px solid #ccc;
        float: right;
        position: absolute;
        top: 70px;
        text-align: center;
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
        line-height: 80px;
        margin: 0 15px;
        text-align: center;
    }
    #menubarNav ul a {
        color : white;
        font-size: 20px;
    }
    
    
    #mypageMenu ul>li>a {
    	text-decoration:none;
    	font-size:20px;
    }
    /* #mypageMenu {
    	display: none;
    } */
    #compareMenu {
        float: left;
        z-index: 1;
        width: 100%;
        height: 500px;
        background-color: rgba(0,38,75,0.9);
    }
</style>
<script>
    $(document).ready(function(){
        $("#account").click(function(){
            $("#login-menu").css("display","block");
            $("#mypageMenu").css("display","block")
        });
		$("#login-menu").mouseenter(function() {
			$("#login-menu").css("display", "block");
			$("#mypageMenu").css("display", "block")
		}).mouseleave(function() {
			$("#login-menu").css("display", "none");
			$("#mypageMenu").css("display", "none")
		});
	});
</script>
</head>
<body>
    <div class="compareMenu"></div>
	<header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="<%=request.getContextPath()%>">SPEC</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">MOBILE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">COMPARE</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">CALENDAR</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">COMMUNITY</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="material-icons" id="account">account_circle</i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <section id="blank"></section>
        <section id="login">
            <i class="material-icons" id="account">account_circle</i></section>
        <% if(!loginUser){ %>
        <div id="login-menu">
            <form action="<%=request.getContextPath()%>/login.me">
            	<table id="login-table">
	                <tr>
	                    <td><input type="text" name="userId" id="user-id" placeholder="이메일 주소" autocomplete="off"></td>
	                </tr>
	                <tr>
	                    <td><input type="password" name="userPwd" id="user-pwd" placeholder="비밀번호"></td>
	                </tr>
	                <tr>
	                    <td><button type="submit">L O G I N</button></td>
	                </tr>
	                <tr>
	                    <td class="taright gray"><a href="#" class="gray">아이디</a> / <a href="#" class="gray">비밀번호</a> 찾기</td>
	                </tr>
	                <tr>
	                    <td><br>회원이 아니신가요?<br> <a href="<%=request.getContextPath()%>/joinInputForm.me"><p class="emp blue">가입하기</p></a>
	                    </td> 
	                </tr>
            	</table>
            </form>
        </div>
        <% } else{%>
        <div id="mypageMenu">
        	<ul>
        		<li><a href="<%=request.getContextPath()%>/mypageInfo.me">회원정보</a></li>
        		<li><a href="#">정보수정</a></li>
        		<li><a href="#">내글관리</a></li>
        		<li><a href="#">내리뷰관리</a></li>
        		<li><a href="#">내댓글관리</a></li>
        	</ul>
        </div>
        <% } %>    
    </header>
    
</body>
</html>