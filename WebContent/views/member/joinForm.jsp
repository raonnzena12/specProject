<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #joinFormBody *{
        /* border: 1px solid black; */
    }
    #layer{
        margin: auto;
        margin-top: 5%;
        width: 350px;
    }
    #layer *{
        box-sizing: border-box;
    }

    #layer input{
        padding-top: 10px;
        padding-bottom: 10px; 
        padding-right: 20px;
        font-size:18px !important;
    }
    #head{
        width: 100%;
        height: 20%;
    }
    #mid{
        width: 100%;
        height: 70%;
    }

    #mid form{
        height: 100%;
    }
    #input1 table {
        width: 100%;
    }
    #input1 input {
        margin: 5px 0;
    }
    #mid form>ul{
        height: 40%;
    }
    #mid form>ul>li{
        height: 20%;
    }
    #optionInfo table{
        box-sizing: border-box;
        width: 100%;
    }
    #optionInfo input {
        margin: 5px 0;
        width: 96%;
        
    }
    #table1{
        box-sizing: border-box;
    }
    #input1{
        padding-top: 10px;
        padding-bottom: 20px;
    }
    #input1 table{
        padding: 0px 10px;
    }
    #mid p {
        text-align: center;
        font-size: 12px;
        color: #666;
        margin: 20px;
    }
    .form-control, .btn{
    	font-size : 1em !important;
    }
    
    .result{
    	margin:auto;
    	width:100%;
    	height:100%;
    	padding: 10px;
    	text-align:center;
    }
    
    #deviceSelect * {
    	font-size:18px !important;
    }
</style>
<title>회원가입</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	$(function(){
		
		clicks = true;
		$("input[name=optionInfo]").click(function(){
			
			if(clicks){
				$("#optionInfo *").removeAttr("disabled");
			}else{
				$("#optionInfo *").attr("disabled","disabled");
			}
			clicks = !clicks;
		});
		
	});
</script>
<%@ include file ="/views/common/menubar.jsp" %>
</head>
<body id="joinFormBody">
	
	<div id="layer">
		<div id="head">
            <p style="font-size:40px; text-align: center;">SPEC</p>
            <p style="text-align: center">간단히 가입하고 핸드폰 스펙을<br>편리하게 조회하세요</p>
        </div>
		
		<div id="mid">
            <form id="joinForm" action="<%=request.getContextPath()%>/insert.me" method="POST">
                <div id="input1">
                    <table>
                        <tr>
                        	<td width="275px"><input type="text" name="userEmail" class="form-control" placeholder="이메일 주소" required></td>
                        </tr>
                        <tr>
                        	<td><input type="text" name="userName" class="form-control" placeholder="닉네임" required></td>
                        </tr>
                        <tr>
                        	<td><input type="password" name="pwd" class="form-control" placeholder="비밀번호" required autocomplete=off></td>
                        </tr>
                        <tr>
                        	<td><input type="password" name="pwd2" class="form-control" placeholder="비밀번호 확인" required></td>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" id="selectOption" name="optionInfo" >&nbsp;<label for="selectOption">선택정보 입력하기</label></td>
                        </tr>
                    </table>
                </div>
                <div id="optionInfo" class="form-group">
                    <table>
                        <tr>
                            <td colspan="2"><input class="form-control" type="tel" name="phone"
                                placeholder="핸드폰번호(01012341234)" disabled></td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<select class="selectpicker" data-live-search="true" id="deviceSelect" >
									<option data-tokens="ketchup mustard">Hot Dog, Fries
										and a Soda</option>
									<option data-tokens="mustard">Burger, Shake and a
										Smile</option>
									<option data-tokens="frosting">Sugar, Spice and all
									
									<option value="salt">abc소금</option>
								</select>

							</td>
                        </tr>
                        <tr>
                            <td><input class="form-control" type="text" name="device" placeholder="기종찾기" disabled readonly></td>
                            <td><button type="button" class="btn btn-info" disabled>기종찾기</button></td>
                        </tr>
                    </table>
                </div>
                <div id="submit">
                    <div class="center">
                        <button type="submit" class="btn btn-lg btn-block btn-info">JOIN</button>
                    </div>
                </div>
                <p>
			                    - 가입하면 SPEC의 약관, 데이터 정책 및
			                    쿠키 정책에 동의하게 됩니다.<br>
			                    - 선택정보 (전화번호)는 아이디 비밀번호 찾기 시 본인 확인 인증수단으로 이용됩니다.  
                </p>
            </form>
        </div>
    </div>
    
    <script>
    	/* $("#deviceSelect").change(function(){
    		console.log($(this).val());
    		console.log($("#optionInfo > table > tbody > tr:nth-child(1) > td > div > div > div > input").val());
    	});
     */
    	
    	// 모바일 기종 리스트 조회용 function
    	/* function selectMlist(){
    		$.ajax({
    			url: "select"
    		})
    		
    	}
     */
    	var eCk;
    	var nCk;
    	var pCk;
    	var pCk2;
    	var oCk;
    	$(function(){
    		
    		$("#joinForm input[name=userEmail]").on("input", function(){
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
		    					$("#joinForm input[name=userEmail]").removeClass('is-valid');
		    					$("#joinForm input[name=userEmail]").addClass('is-invalid');
		    					eCk = false;
		    				} else{
    							console.log(result);
			    				$("#joinForm input[name=userEmail]").removeClass('is-invalid');
			    				$("#joinForm input[name=userEmail]").addClass('is-valid');
			    				eCk = true;
		    				}
    					},
    					
    					error: function(){
    						console.log("Ajax 통신 실패")
    					}
    				});
    				
    			} else {
    				console.log("이메일 형식 충족 실패");
					$("#joinForm input[name=userEmail]").removeClass('is-valid');
    				$("#joinForm input[name=userEmail]").addClass('is-invalid');
 					eCk = false;
    			}
    			
    		});
    		
    		$("#joinForm input[name=userName]").on("input", function(){
    			var userName = $("#joinForm input[name=userName]").val().trim();
    			
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
			    				$("#joinForm input[name=userName]").removeClass('is-valid');
			    				$("#joinForm input[name=userName]").addClass('is-invalid');
			    				nCk = false;
		    				} else{
		    					console.log(result);
		    					$("#joinForm input[name=userName]").removeClass('is-invalid');
			    				$("#joinForm input[name=userName]").addClass('is-valid');
		    					nCk = true;
		    				}
    					},
    					
    					error: function(){
    						console.log("Ajax 통신 실패")
    					}
    				});
    				
    			} else{
    				console.log("이름 형식 충족 실패")
    				$("#joinForm input[name=userName]").removeClass('is-valid');
			    	$("#joinForm input[name=userName]").addClass('is-invalid');
 					nCk = false;
    			}
    			
    		});
    		
    		$("#joinForm input[name=pwd]").keyup(function(){
    			var pwd = $("#joinForm input[name=pwd]").val().trim();
    			
    			var regExp = /^[a-zA-Z0-9]{6,12}$/;
    			
    			if(regExp.test(pwd)){
    				$("#joinForm input[name=pwd]").removeClass('is-invalid');
    				$("#joinForm input[name=pwd]").addClass('is-valid');
		    		pCk = true;
		    			
    			} else{
    				console.log("비밀번호 형식 충족 실패");
    				$("#joinForm input[name=pwd]").removeClass('is-valid');
    				$("#joinForm input[name=pwd]").addClass('is-invalid');
 					pCk = false;
    			}
    			
    		});
    		
    		$("#joinForm input[name=pwd],input[name=pwd2]").keyup(function(){
				var pwd = $("input[name=pwd]").val().trim();
				var pwd2 = $("input[name=pwd2]").val().trim();
			
				if(pwd == pwd2){
					console.log("비밀번호 일치");
					$("#joinForm input[name=pwd2]").removeClass('is-invalid');
					$("#joinForm input[name=pwd2]").addClass('is-valid');
					pCk2=true;
				} else{
					console.log("비밀번호 불일치");
					$("#joinForm input[name=pwd2]").removeClass('is-valid');
					$("#joinForm input[name=pwd2]").addClass('is-invalid');
					pCk2=false;
				}
			});
    		
    		
    		
    		$("#joinForm").submit(function(){
    			
    			console.log(clicks);
    			
    			if(!clicks){
    				if($("#joinForm input[name=phone]").val().trim() == "" || $("#joinForm input[name=device]").val().trim() == ""){
    					console.log($("#joinForm input[name=phone]").val().trim());
    					alert("휴대폰 번호 및 기종 정보를 입력해주세요");
    					$("#joinForm input[name=phone]").focus();
    					return false;
    				}
    				
    			
    				
    			}
    			if(!eCk){alert("사용 가능한 이메일을 입력해주세요."); return false;}
    			if(!nCk){alert("이름 형식을 확인해주세요."); return false;}
    			if(!pCk){alert("비밀번호 형식을 확인해주세요. 영어 대소문자 포함 6자리 이상 12자리 미만입니다."); return false;}
    			if(!pCk2){alert("비밀번호가 일치하지 않습니다."); return false;}
    			/* if(!oCk){alert("비밀번호가 일치하지 않습니다."); return false;} */
    		});
    		
    	});
    </script>
        
</body>
</html>