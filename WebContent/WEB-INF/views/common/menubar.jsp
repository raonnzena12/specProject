<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENUBAR</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
    * {
        /* border: 1px solid #ccc; */
        box-sizing: border-box;
        text-align: center;
        margin: 0px;
        padding: 0px;
        text-decoration: none;
        user-select: none;
    }
    body {
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 14px;
        width: 1200px;
        margin: auto;
        /* border: 1px solid red; */
        height: auto;
    }
    header {
        height: 80px;
        background-color: #34495E;
        position: relative;
    }
    article {
        width: 20%;
        float: left;
    }
    #logo {
        width:15%;
        float: left;
        line-height: 70px;
        color: #fff;
        font-weight: 900;
        font-size: 60px
    }
    nav {
        width:50%;
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
    #login-menu {
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
    #main-bn {
        height: 300px;
        clear: both;
    }
    #sect-3 {
        height: 200px;

    }
    #ranking article {
        width: 33.3333%;
        height: 100%;
    }
    #ranking {
        height: 250px;
    }
    #sub-bn {
        width:60%;
        float: left;
        height: 100%;
    }
    #main-ad {
        width:40%;
        height: 100%;
        float: left;
    }
    #sect-4 {
        height: 300px;
    }
    #release {
        height: 20%;
    }
    #rel-art {
        height: 80%;
    }
    #rel-art>article {
        height: 100%;
    }
    #sect-5 {
        height: 400px;
    }
    #brand {
        height: 20%;
    }
    #brand-1, #brand-2 {
        height: 40%;
    }
    #brand-1>article , #brand-2>article {
        height: 100%;
    }
    #sub-ad {
        height: 200px;
        clear: both;
    }
    #footer {
        clear: both;
        height: 200px;
    }

    /* 여기까지 틀잡기 */

    ul>li {
        width: 20%;
        float: left;
        list-style-type: none;
        line-height: 80px;
        margin: 0 15px;
    }
    ul a {
        color : white;
        font-size: 20px;
    }

    /* 클래스 스타일 지정 */
    .emp {
        font-size: 17px;
        font-weight: 700;
    }
    .taright {
        text-align: right;
    }
    .gray {
        color: #666;
    }
    .blue {
        color: dodgerblue;
    }
</style>
<script>
    $(document).ready(function(){
        $("#account").click(function(){
            $("#login-menu").css("display","block");
            $("#user-id").focus();
        });
        
        $("#login-menu").mouseenter(function(){
            $("#login-menu").css("display","block");
        }).mouseleave(function(){
            $("#login-menu").css("display","none");
        });
    });
</script>
</head>
<body>
	<header>
            <section id="logo">SPEC</section>
            <nav>
                <ul>
                    <li><a href="#">MOBILE</a></li>
                    <li><a href="#">COMPARE</a></li>
                    <li><a href="#">CALENDAR</a></li>
                    <li><a href="#">COMMUNITY</a></li>
                </ul>
            </nav>
            <section id="blank"></section>
            <section id="login">
                <i class="material-icons" id="account">account_circle</i></section>
            <div id="login-menu">
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
                        <td><br>회원이 아니신가요?<br> <a href="#"><p class="emp blue">가입하기</p></a>
                        </td>
                    </tr>
                </table>
            </div>    
        </header>
</body>
</html>