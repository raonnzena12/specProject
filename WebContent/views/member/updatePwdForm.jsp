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
    	width: 400px !important;
    }
    
    #pwdInputLayer button{
    	
    	font-size: 18px;
    }
    
    .center{
    	padding-left:130px !important;
    }
    
    #checkPwd{
    	text-align:center;
    	background:gray; 
    	padding: 10px;
    	color:white;
    }
</style>
<title>비밀번호 변경</title>
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
			<li><a href="<%=request.getContextPath()%>/views/member/mypageInfo.jsp" id="info">회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myArticleList.jsp">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myReviewList.jsp">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    
    
    <div id="pwdInputLayer">
    	<form>
	    	<div id="pwdText">
	    		<p style="font-size:40px; text-align: center;">비밀번호 수정</p>
	    	</div>
			  <div class="form-group">
			    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" readonly>
			  </div>
			  <div class="form-group">
			    <label for="pwd">Current Password</label>
			    <input type="password" class="form-control" id="pwd" placeholder="현재 비밀번호">
			  </div>
			  <div class="form-group">
			    <label for="pwd2">New Password</label>
			    <input type="password" class="form-control" id="pwd2" placeholder="새로운 비밀번호 확인">
			  </div>
			  <div class="form-group" id="checkPwd">
			    	비밀번호는 6자 이상이어야 하며,<br> 영문과 숫자를 포함해야 합니다.
			  </div>
			  <div class="form-group">
			    <label for="pwd3">New Password</label>
			    <input type="password" class="form-control" id="pwd3" placeholder="새로운 비밀번호 확인">
			  </div>
			  <div class="form-group" id="checkPwd2">

			  </div>
			  <div class="form-group center">
			    <button type="button" class="btn btn-secondary btn-lg">취소</button>
			  	<button type="submit" class="btn btn-info btn-lg">확인</button>
			  </div>
			  
		</form>
    		
    	
    </div>
</body>
</html>