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
	

</head>
<body>
	
    
    <div id="emailInputLayer">
    	<form id="inputNameForm" action="<%=request.getContextPath()%>/findEmail.me" method="POST">
	    	<div id="pwdText">
	    		<p style="font-size:40px; text-align: center;">SPEC</p>
	            <p style="text-align: center">이메일을 찾을 이름과 전화번호를 입력해주세요.</p>
	    	</div>
			  
			  <div class="form-group">
			    <label for="userName">Name</label>
			    <input type="text" name="userName" class="form-control" id="userName" placeholder="이름을 입력해주세요">
			  </div>
			  <div class="form-group">
			    <label for="phone">Phone</label>
			    <input type="tel" name="phone" class="form-control" id="phone" placeholder="전화번호를 입력해주세요">
			  </div>
			  
			  <div class="form-group center">
			    <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>'">취소</button>
			  	<button type="submit" class="btn btn-info btn-lg" id="1124">확인</button>
			  </div>
			  
		</form>
    		
    	
    </div>
    
    <script>
    
    	var nCk;
    	var pCk;
    	$(function(){
    		$("#inputNameForm input[name=userName]").on("input", function(){
    			var userName = $(this).val().trim();
    			
    			var regExp = /^[a-z][a-zA-Z0-9]{4,}$/;
    			
    			console.log(userName);
    			if(regExp.test(userName)){
    				
    				$.ajax({
    					url: "<%=request.getContextPath()%>/nameCheck.me",
    					type: "POST",
    					data : {name : userName},
    					success : function(result){
		    				if(result > 0){
    							console.log(result);
		    					$("#inputNameForm input[name=userName]").removeClass('is-invalid');
		    					$("#inputNameForm input[name=userName]").addClass('is-valid');
		    					nCk = true;
		    				} else{
    							console.log(result);
			    				$("#inputNameForm input[name=userName]").removeClass('is-valid');
			    				$("#inputNameForm input[name=userName]").addClass('is-invalid');
			    				nCk = false;
		    				}
    					},
    					
    					error: function(){
    						console.log("Ajax 통신 실패")
    					}
    				});
    				
    			} else {
    				console.log("이름 형식 충족 실패");
					$("#inputNameForm input[name=userName]").removeClass('is-valid');
    				$("#inputNameForm input[name=userName]").addClass('is-invalid');
 					nCk = false;
    			}
    			
    		});
    		$("#inputNameForm input[name=phone]").on("input", function(){
    			var phone = $(this).val().trim();
    			
    			console.log(phone);
    				
    			$.ajax({
    				url: "<%=request.getContextPath()%>/phoneCheck.me",
    				type: "POST",
    				data : {phone : phone},
    				success : function(result){
		    			if(result > 0){
    						console.log(result);
		    				$("#inputNameForm input[name=phone]").removeClass('is-invalid');
		    				$("#inputNameForm input[name=phone]").addClass('is-valid');
		    				pCk = true;
		    			} else{
    						console.log(result);
			    			$("#inputNameForm input[name=phone]").removeClass('is-valid');
			    			$("#inputNameForm input[name=phone]").addClass('is-invalid');
			    			pCk = false;
		    			}
    				},
    					
    				error: function(){
    					console.log("Ajax 통신 실패")
    				}
    			});
    				
    			
    			
    		});
    		
    		$("#inputNameForm").submit(function(){
    			if($("#inputNameForm input[name=userName]").val().trim() == ""){
    				alert("이름을 입력해주세요!!");
    				return false;
    			}
    			if($("#inputNameForm input[name=phone]").val().trim() == ""){
    				alert("전화번호를 입력해주세요!!");
    				return false;
    			}
    			if(!nCk){alert("가입된 이름을 입력해주세요!"); return false;}
    			if(!pCk){alert("가입된 전화번호를 입력해주세요!"); return false;}
    		});
    	});
    </script>
   
</body>
</html>