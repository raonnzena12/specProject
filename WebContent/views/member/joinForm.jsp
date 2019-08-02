<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body *{
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
    
</style>
<title>회원가입</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		
		var clicks = true;
		$("input[name=optionInfo]").click(function(){
			
			if(clicks){
				$("#optionInfo input").removeAttr("disabled");
			}else{
				$("#optionInfo input").attr("disabled","disabled");
			}
			clicks = !clicks;
		});
		
	});
</script>
</head>
<body>
	<%@ include file ="/views/common/menubar.jsp" %>
	
	<div id="layer">
		<div id="head">
            <p style="font-size:40px; text-align: center;">SPEC</p>
            <p style="text-align: center">간단히 가입하고 핸드폰 스펙을<br>편리하게 조회하세요</p>
        </div>
		
		<div id="mid">
            <form>
                <div id="input1">
                    <table>
                        <tr>
                        	<td width="275px"><input type="email" name="email" class="form-control" placeholder="이메일 주소"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" name="name" class="form-control" placeholder="닉네임"></td>
                        </tr>
                        <tr>
                        	<td><input type="password" name="pwd" class="form-control" placeholder="비밀번호"></td>
                        </tr>
                        <tr>
                        	<td><input type="password" name="pwd2" class="form-control" placeholder="비밀번호 확인"></td>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" name="optionInfo" >&nbsp;선택정보 입력하기</td>
                        </tr>
                    </table>
                </div>
                <div id="optionInfo" class="form-group">
                    <table>
                        <tr>
                            <td><input class="form-control" type="tel" name="phone"
                                placeholder="핸드폰번호(01012341234)" disabled></td>
                            <td><button type="button" class="btn btn-info">문자발송</button></td>
                        </tr>
                        <tr>
                            <td><input class="form-control" type="text" name="auth" placeholder="인증번호 입력" disabled></td>
                            <td><button type="button" class="btn btn-info">인증확인</button></td>
                        </tr>
                        <tr>
                            <td><input class="form-control" type="text" name="device" placeholder="기종찾기" disabled></td>
                            <td><button type="button" class="btn btn-info">기종찾기</button></td>
                        </tr>
                    </table>
                </div>
                <div id="submit">
                    <div class="center">
                        <button type="submit" class="btn btn-lg btn-block btn-info">JOIN</button>
                    </div>
                </div>
                <p>
			                    가입하면 SPEC의 약관, 데이터 정책 및<br>
			                    쿠키 정책에 동의하게 됩니다.
                </p>
            </form>
        </div>
    </div>
    
    <script>
    	
    
    	var eCk = false;
    	$(function(){
    		
    		$("input[name=userEmail]").on("input", function(){
    			var email = $(this).val().trim();
    			
    			var regExp = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g;
    			
    			if(regExp.test(email)){
    				$.ajax({
    					url: "<%=request.getContextPath()%>/idCheck.me",
    					type: "POST",
    					data : {email : email},
    					success : function(){
    						
    					},
    					
    					error: function(){
    						
    					}
    				});
    			} else{
    				$(this).css("border","1px solid red");
 
    			}
    			
    		});
    		
    		$("form").submit(function(){
    			
    			
    			
    		});
    		
    	});
    </script>
        
</body>
</html>