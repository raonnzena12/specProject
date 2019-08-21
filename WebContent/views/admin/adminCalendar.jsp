<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sort = "no";
	int sortNum = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-page</title>
<%@ include file ="/views/common/menubar.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
	* {
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
        text-decoration-line: none;
        user-select: none;
    }
    
	.outer {
		width: 1500px;
		height: 850px;
		margin: auto;
	}    
    .menu-outer {
    	width : 20%;
    	height : 100%;
    	border-right: 1px solid gray;
    	float: left;
    }
    
    .menu-ul {
    	width: 150px;
    	height: 100%;
    	margin: 30% 0 0 20%;
    	list-style-type: none;
    	float: left;
    }
    
    .menu-ul li {
    	font-size: 25px;
    	line-height: 200%;
    	margin-bottom: 10px;
    }
    
    .menu-ul a {
    	color: gray;
    }
    
    .content-outer {
    	width: 70%;
    	height: 100%; 
    	float: left;
    }
    
    .table-outer {
    	width: 100%;
    	height: 90%;
    	margin: 60px auto;
    }
    
    .each-table {
    	width: 50%;
    	height: 30%;
    	float: left;
    }
    
    .each-table table{
    	width: 90%;
    	margin: 20px auto; 
    }
    
    .each-table td {
    	height: 40px; 
    }
    
    .each-table table tr {
    	border-bottom: 1px solid gray;
    }
    
    .each-table table tr td:nth-child(1){
    	width: 10%;
    }
    
    .each-table table tr td:nth-child(2){
    	width: 60%;
    }
    
    .each-table table tr:nth-child(n+2) td:nth-child(1){
    	text-align: center;
    }
    
    .each-table table tr td:nth-child(3){
    	text-align: right;
    }
    
    
</style>
<body>
	<div class="outer">
		<div class="menu-outer">
			<ul class="menu-ul">
				<li><a href="<%=request.getContextPath() %>/adminSelectMember.do?sort=<%=sort%>&sortNum=<%=sortNum%>">회원관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminBoard.do">글 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminComment.ad">댓글 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminReview.ad">리뷰 관리</a></li>
				<li><a href="#">신고 관리</a></li>
				<li><a href="#">일정 관리</a></li>
			</ul>
		</div>

		<div class="content-outer">
			<iframe src="../../AdminCalendar.do" width="100%" height="100%" frameborder="0"></iframe>
		</div>
	</div>
	
	<script>
	</script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>