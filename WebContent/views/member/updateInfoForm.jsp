<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file ="/views/common/menubar.jsp" %>
<style>
    body *{
        /* border: 1px solid black; */
    }
    #layer{
        margin: auto;
        /* margin-top: 5%; */
        width: 300px;
        
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
    
    .center{
    	padding-left:100px !important;
    }
    
    .menu {
		font-size: 2em;
		text-align:right;
		width:180px;
		height:50px;
		
	}
	
	.menu:hover {
		color:#00264B;
		font-weight:bold;
		cursor:pointer;
	}
	
	.fl{
		float:right;
	}
</style>

<title>회원정보 수정</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
		
		$("a").mouseenter(function() {
			$(this).css("color", "#00264B");
		}).mouseleave(function() {
			$(this).css("color", "gray");
		});
		
	});
</script>
</head>
<body>
	
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage.me" id="info">회원정보</a></li>
			<li><a href="#">작성글보기</a></li>
			<li><a href="#">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    
	<div id="layer">
		<div id="head">
            <p style="font-size:40px; text-align: center;">회원정보 수정</p>
        </div>
		
		<div id="mid">
            <form action="update.me" id="updateForm" method="POST">
                <div id="input1">
                    <table>
                        <tr><td><label>이메일</label><input type="email" name="userEmail" class="form-control" value="<%=loginUser.getUserEmail()%>" readonly></td></tr>
                        <tr><td><label>닉네임</label><input type="text" name="userName" class="form-control" placeholder="닉네임" value="<%=loginUser.getUserName()%>"></td></tr>
                        
                        <tr><td><input type="checkbox" name="optionInfo">&nbsp;선택정보 입력하기</td></tr>
                    </table>
                </div>
                <div id="optionInfo" class="form-group">
                     <table>
                        <tr>
                            <td colspan="2"><input class="form-control" type="tel" name="phone"
                                placeholder="핸드폰번호(01012341234)" disabled></td>
                        </tr>
                       
                        <tr>
                            <td><input class="form-control" type="text" name="device" placeholder="기종찾기" disabled readonly></td>
                            <td><button type="button" class="btn btn-info" disabled>기종찾기</button></td>
                        </tr>
                    </table>
                </div>
                <div id="submit">
                    <div class="center">
                        <!-- <button type="submit" class="btn btn-lg btn-block btn-info">JOIN</button> -->
                        <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>/mypage.me'">취소</button>
			  			<button type="submit" class="btn btn-info btn-lg">확인</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
       
    <script>
    
    	$(function(){
    		
        	var nCk;
        	
        		
        		$("#updateForm input[name=userName]").on("input", function(){
        			var userName = $("#updateForm input[name=userName]").val().trim();
        			
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
    			    				$("#updateForm input[name=userName]").removeClass('is-valid');
    			    				$("#updateForm input[name=userName]").addClass('is-invalid');
    			    				nCk = false;
    		    				} else{
    		    					console.log(result);
    		    					$("#updateForm input[name=userName]").removeClass('is-invalid');
    			    				$("#updateForm input[name=userName]").addClass('is-valid');
    		    					nCk = true;
    		    				}
        					},
        					
        					error: function(){
        						console.log("Ajax 통신 실패")
        					}
        				});
        				
        			} else{
        				console.log("이름 형식 충족 실패")
        				$("#updateForm input[name=userName]").removeClass('is-valid');
    			    	$("#updateForm input[name=userName]").addClass('is-invalid');
     					nCk = false;
        			}
        			
        			if($("#updateForm input[name=userName]").val().trim() == ""){
        				nCk = false;
        			}
        			
        		});
        		
        		
        		$("#updateForm").submit(function(){
        			if($("#updateForm input[name=userName]").val().trim() == "<%=loginUser.getUserName()%>" || $("#updateForm input[name=userName]").val().trim() == "" ){
        				nCk = true;
        			}
        			if(!nCk){
        				alert("이름 형식을 확인해주세요."); 
        				return false;
        			}
        			
        		});
    	});
    </script>  
</body>
</html>