<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
    #mypageNav{
    	width:1000px;
    	height: 100px;
    	margin-top: 5%;
    }
	#mypageNav ul>li{
        width: 20%;
        float: left;
        list-style-type: none;
        line-height: 80px;
        
        margin: 0 15px;
        text-align: center;
        
    }
    #mypageNav ul a {
    	color: gray;
        text-decoration:none;
        font-size: 20px;
        font-weight: bold;
    }
    
    #info{
    	padding-bottom : 10px;
		border-bottom: 2px solid #00264B;   
    }
    
    #pwdInputLayer{
    	margin:auto !important;
    	width: 500px !important;
    }
    
    #pwdInputLayer button{
    	
    	font-size: 18px;
    }
    
    .center{
    	padding-left:180px !important;
    }
</style>
<title>회원정보 메뉴바</title>
<script>
    $(function(){

        $("a").mouseenter(function(){
            $(this).css("color","#00264B");
        }).mouseleave(function(){
            $(this).css("color","gray");
        });
    });
</script>
</head>
<body>
	<%@ include file ="/views/common/menubar.jsp" %>
	<nav id="mypageNav">
		<ul>
			<li><a href="#" id="info">회원정보</a></li>
			<li><a href="#">작성글보기</a></li>
			<li><a href="#">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    
    
    <div id="pwdInputLayer">
    	<form>
	    	<div id="pwdText">
	    		<p style="font-size:40px; text-align: center;">비밀번호 입력</p>
	            <p style="text-align: center">회원 정보를 안전하게 보호하기 위하여 비밀번호를 한번 더 입력해주세요.</p>
	    	</div>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email address</label>
			    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
			    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
			  </div>
			  <div class="form-group center">
			    <button type="button" class="btn btn-secondary btn-lg">취소</button>
			  	<button type="submit" class="btn btn-info btn-lg">확인</button>
			  </div>
			  
		</form>
    		
    	
    </div>
</body>
</html>