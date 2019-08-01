<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#infoLayer{
		width:1500px;
		height: 800px;
		margin:auto;
	}
	#mobile{
		width:35%;
		height: 100%;
	}
	#mobileImg{
		height: 70%;
	}
	
	#mobileImg img{
		width:100%;
		height: 100%;
	}
	#mobile>div{
		width:100%;
	}
	.max-small {
    width: auto; height: auto;
    max-width: 100%;
    max-height: 100%;
	}
	.fl{
		float:left;
	}
	.fts{
		width:100%;
		font-size: 2em;
		font-weight: bold;
		text-align:center;
	}
	.tableArea {
		width:50%;
		height:100%;
		
	}
	.infoNav{
		width: 15%;
		height: 100%;
	}
	#listArea {
		width:70%;
		height:70%;
		margin-left: 10%;
		margin-top: 5%;
		border:1px solid black;
		text-align:center;
		border-collapse:collapse;
	}
	
	#listArea td, th{
		border-bottom: 1px solid black;
	}
	
	.nav{
		width: 180px;
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
</style>
<script>
	$(function() {

		$("a").mouseenter(function() {
			$(this).css("color", "#00264B");
		}).mouseleave(function() {
			$(this).css("color", "gray");
		})
		
	});
</script>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/views/member/mypageInfo.jsp" id="info">회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myArticleList.jsp">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myReviewList.jsp">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>

	<div id="infoLayer">
		<div id="mobile" class="fl">
			<div id="mobileImg">
				<img class="max-small" alt="" src="https://image-us.samsung.com/us/smartphones/galaxy-s10/gallery/s10e/prism-blue/001_Gallery_G970_Blue_1600x1200.jpg?$product-details-jpg$">
			</div>
			<div class="fts">SAMSUNG GALAXY s10e</div>
		</div>
		
		<div class="tableArea fl">
		
			<!-- 공지사항 목록 -->
			<table align="center" id="listArea">
				<tr>
					<th>이메일</th>
					<td>Testuser@user.co.kr</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>TestUser</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>01012341234</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>전화번호를 등록하지 않았습니다.</td>
				</tr>
				<tr>
					<th>최근로그인</th>
					<td></td>
				</tr>
			</table>
			
			
		</div>
		<div class="fl">
			<div class="menu" onclick="updateUserInfo();">회원정보 변경</div>
			<div class="menu" onclick="updateUserPwd();">비밀번호 변경</div>
			<div class="menu" onclick="deleteUser();">회원탈퇴</div>
		</div>
	</div>
	
	<script>
		function updateUserInfo(){
			location.href = "inputPwdForm.jsp";
		}
		
		
	</script>
</body>
</html>