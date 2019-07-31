<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#infoLayer{
		width:1000px;
		height: 800px;
	}
	#mobile{
		width:40%;
	}
	#mobile>span{
		width:100%;
	}
	.max-small {
    width: auto; height: auto;
    max-width: 500px;
    max-height: 500px;
	}
	.fl{
		float:left;
	}
	.fts{
		width:40%;
		font-size: 2em;
		font-weight: bold;
		text-align:center;
	}
	.tableArea {
		width:650px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	#listArea {
		border:1px solid black;
		text-align:center;
		border-collapse:collapse;
	}
	
	#listArea td, th{
		border-bottom: 1px solid black;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<%@ include file ="mypageMenubar.jsp" %>
	
	<div id="infoLayer">
		<div id="mobile" class="fl">
			<span>
				<img class="max-small" alt="" src="https://image-us.samsung.com/us/smartphones/galaxy-s10/gallery/s10e/prism-blue/001_Gallery_G970_Blue_1600x1200.jpg?$product-details-jpg$">
			</span>
			<span class="fts">SAMSUNG GALAXY s10e</span>
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
	</div>
</body>
</html>