<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");
%>
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
        width: 15%;
        float: left;
        list-style-type: none;
        line-height: 80px;
        
        margin: 0 10px;
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

	
	var msg = "<%=(String)request.getAttribute("msg")%>";
	
	if(msg != "null") { // msg 값이 있을 경우
		
		alert(msg);
		
		<% session.removeAttribute("msg"); %>
		// 한번 출력 후 제거 (안하면 모든 페이지에서 계속 출력됨)
	}
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
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage.me" id="info">회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/myBoardList.me">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReviewList.me">작성리뷰보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReplyList.me">작성댓글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReportList.me">신고내역보기</a></li>
		</ul>
    </nav>
    
    
    <div id="pwdInputLayer">
    	<form id="checkPwdForm" action="<%=request.getContextPath()%>/checkPwd.me" method="POST">
	    	<div id="pwdText">
	    		<p style="font-size:40px; text-align: center;">비밀번호 입력</p>
	            <p style="text-align: center">회원 정보를 안전하게 보호하기 위하여 비밀번호를 한번 더 입력해주세요.</p>
	    	</div>
			  
			  <div class="form-group">
			    <label for="checkPwd">Password</label>
			    <input type = "hidden" name = "code" value = "<%=code%>">
			    <input type="password" name="checkPwd" class="form-control" id="checkPwd" placeholder="Password">
			  </div>
			  <div class="form-group center">
			    <button type="button" class="btn btn-secondary btn-lg" onclick="javascript:history.back();">취소</button>
			  	<button type="submit" class="btn btn-info btn-lg" id="1124">확인</button>
			  </div>
			  
		</form>
    		
    	
    </div>
    
    <script>
    	
    </script>
   
</body>
</html>