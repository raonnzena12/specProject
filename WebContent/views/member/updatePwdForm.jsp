<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo = 0;
	try{
		userNo = Integer.parseInt(request.getParameter("userNo"));
	}catch(Exception e){
		e.printStackTrace();
	}
%>
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
	<%@ include file ="/views/common/menubar.jsp" %>
</head>
<body>
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage.me" id="info">회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myArticleList.jsp">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myReviewList.jsp">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    
    
    <div id="pwdInputLayer">
    	<form id="updatePwdForm" action="<%=request.getContextPath()%>/updatePwd.me" method="POST">
	    	<div id="pwdText">
	    		<p style="font-size:40px; text-align: center;">비밀번호 수정</p>
	    	</div>
			  
			  <div class="form-group">
			    <label for="pwd2">New Password</label>
			    <input type="hidden" name="userNo" value="<%=userNo%>">
			    <input type="password" class="form-control" name="newPwd" id="newPwd" placeholder="새로운 비밀번호">
			  </div>
			  <div class="form-group" id="checkPwd">
			    	비밀번호는 6자 이상 12자 이하이어야 하며,<br> 영문과 숫자를 포함해야 합니다.
			  </div>
			  <div class="form-group">
			    <label for="pwd3">Check New Password</label>
			    <input type="password" class="form-control" name="newPwd2" id="newPwd2" placeholder="새로운 비밀번호 확인">
			  </div>
			  <div class="form-group" id="checkPwd2">

			  </div>
			  <div class="form-group center">
			    <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>/mypage.me'">취소</button>
			  	<button type="submit" class="btn btn-info btn-lg">확인</button>
			  </div>
			  
		</form>
    		
    	
    </div>
    <script>
    	$(function(){
    		 var pCk;
    		    $("#updatePwdForm input[name=newPwd]").keyup(function(){
    				var pwd1 = $("#updatePwdForm input[name=newPwd]").val().trim();
    				
    				var regExp = /^[a-zA-Z0-9]{6,13}$/;
    				
    				if(regExp.test(pwd1)){
    					$("#updatePwdForm input[name=newPwd]").removeClass('is-invalid');
    					$("#updatePwdForm input[name=newPwd]").addClass('is-valid');
    					$("#checkPwd").css("display","none");
    		    		pCk = true;
    		    			
    				} else{
    					console.log("비밀번호 형식 충족 실패");
    					$("#updatePwdForm input[name=newPwd]").removeClass('is-valid');
    					$("#updatePwdForm input[name=newPwd]").addClass('is-invalid');
    					$("#checkPwd").css("display","block");
    						pCk = false;
    				}
    				
    			});
    			
    			$("#updatePwdForm input[name=newPwd],#updatePwdForm input[name=newPwd2]").keyup(function(){
    				var pwd1 = $("#updatePwdForm input[name=newPwd]").val().trim();
    				var pwd2 = $("#updatePwdForm input[name=newPwd2]").val().trim();
    			
    				if(pwd1 == pwd2){
    					console.log("비밀번호 일치");
    					$("#updatePwdForm input[name=newPwd2]").removeClass('is-invalid');
    					$("#updatePwdForm input[name=newPwd2]").addClass('is-valid');
    					pCk2=true;
    				} else{
    					console.log("비밀번호 불일치");
    					$("#updatePwdForm input[name=newPwd2]").removeClass('is-valid');
    					$("#updatePwdForm input[name=newPwd2]").addClass('is-invalid');
    					pCk2=false;
    				}
    			});
    			
    			$("#updatePwdForm").submit(function(){
    				
    				if($("#updatePwdForm input[name=newPwd]").val().trim() == ""){
    					alert("변경할 비밀번호를 입력해주세요.");
    					return false;
    				}
    				
    				if(!pCk){alert("비밀번호 형식을 확인해주세요. 영어 대소문자 포함 6자리 이상 12자리 미만입니다."); return false;}
    				if(!pCk2){alert("비밀번호가 일치하지 않습니다."); return false;}
    				
    			});
    	});
    
    </script>
</body>
</html>