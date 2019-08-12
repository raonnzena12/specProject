<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file ="/views/common/menubar.jsp" %>
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
    
    #emailInputLayer{
    	margin:auto !important;
    	width: 400px !important;
    	padding-top: 100px;
    }
    
    #emailInputLayer button{
    	
    	font-size: 18px;
    }
    
    .center{
    	padding-left:130px !important;
    }
</style>
<title>회원정보 메뉴바</title>
	
<script>

	
	var msg = "<%=(String)request.getAttribute("msg")%>";
	
	if(msg != "null") { // msg 값이 있을 경우
		
		alert(msg);
		
		<% session.removeAttribute("msg"); %>
		// 한번 출력 후 제거 (안하면 모든 페이지에서 계속 출력됨)
	}
    
</script>
</head>
<body>
	
    
    <div id="emailInputLayer">
    	<form id="inputEmailForm" action="<%=request.getContextPath()%>/findPwd.me" method="POST">
	    	<div id="pwdText">
	    		<p style="font-size:40px; text-align: center;">SPEC</p>
	            <p style="text-align: center">비밀번호를 재설정할 이메일을 입력해주세요.</p>
	    	</div>
			  
			  <div class="form-group">
			    <label for="userEmail">Email</label>
			    <input type="email" name="userEmail" class="form-control" id="userEmail" placeholder="이메일을 입력해주세요">
			  </div>
			  
			  <div class="form-group center">
			    <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>'">취소</button>
			  	<button type="submit" class="btn btn-info btn-lg" id="1124">확인</button>
			  </div>
			  
		</form>
    		
    	
    </div>
    
    <script>
    
    	var eCk;
    	$(function(){
    		$("#inputEmailForm input[name=userEmail]").on("input", function(){
    			var userEmail = $(this).val().trim();
    			
    			var regExp = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g;
    			
    			console.log(userEmail);
    			if(regExp.test(userEmail)){
    				
    				$.ajax({
    					url: "<%=request.getContextPath()%>/emailCheck.me",
    					type: "POST",
    					data : {email : userEmail},
    					success : function(result){
		    				if(result > 0){
    							console.log(result);
		    					$("#inputEmailForm input[name=userEmail]").removeClass('is-invalid');
		    					$("#inputEmailForm input[name=userEmail]").addClass('is-valid');
		    					eCk = true;
		    				} else{
    							console.log(result);
			    				$("#inputEmailForm input[name=userEmail]").removeClass('is-valid');
			    				$("#inputEmailForm input[name=userEmail]").addClass('is-invalid');
			    				eCk = false;
		    				}
    					},
    					
    					error: function(){
    						console.log("Ajax 통신 실패")
    					}
    				});
    				
    			} else {
    				console.log("이메일 형식 충족 실패");
					$("#inputEmailForm input[name=userEmail]").removeClass('is-valid');
    				$("#inputEmailForm input[name=userEmail]").addClass('is-invalid');
 					eCk = false;
    			}
    			
    		});
    		
    		$("#inputEmailForm").submit(function(){
    			if($("#inputEmailForm input[name=userEmail]").val().trim() == ""){
    				alert("이메일을 입력해주세요!!");
    				return false;
    			}
    			if(!eCk){alert("가입된 이메일을 입력해주세요!"); return false;}
    		});
    	});
    </script>
   
</body>
</html>