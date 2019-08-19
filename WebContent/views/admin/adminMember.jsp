<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-member</title>
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
		width: 1200px;
		height: 600px;
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
    	padding-left: 20px;
    }
    
    .title {
    	width: 100%;
    	height: 20%;
    	padding: 20px 0 0 20px;
    	float: left;
    }
    
    .content-1 {
    	width: 100%;
    	height: 50%;
    	border: 1px solid orange;
    	float: left;
    }
    
    .content-1 table {
    	width: 90%;
    	margin: auto;
    	text-align: center;
    }
    
    .content-1 tr {
    	height: 30px;
    }
    
    .content-1 th:nth-child(1), .content-1 td:nth-child(1) {
    	width: 3%;
    }
    .content-1 th:nth-child(2), .content-1 td:nth-child(2) {
    	width: 7%;
    }
    .content-1 th:nth-child(3), .content-1 td:nth-child(3) {
    	width: 20%;
    }
    .content-1 th:nth-child(4), .content-1 td:nth-child(4) {
    	width: 20%;
    }
    .content-1 th:nth-child(5), .content-1 td:nth-child(5) {
    	width: 15%;
    }
    .content-1 th:nth-child(6), .content-1 td:nth-child(6) {
    	width: 20%;
    }
    .content-1 th:nth-child(7), .content-1 td:nth-child(7) {
    	width: 15%;
    }
    
    .content-2 {
    	width: 100%;
    	height: 20%;
    	border: 1px solid green;
    	float: left;
    }
    
    .pagingBar {
    	width: 100%;
    	height: 10%;
    	border: 1px solid blue;
    	float: left;
    }
    
    table {
    	border: 1px solid black;
    }
    
    tr {
    	border: 1px solid red;
    }
    
    th, td {
    	border: 1px solid blue;
    }
</style>
<body>
	<div class="outer">
		<div class="menu-outer">
			<ul class="menu-ul">
				<li><a href="#">회원관리</a></li>
				<li><a href="#">글 관리</a></li>
				<li><a href="#">댓글 관리</a></li>
				<li><a href="#">리뷰 관리</a></li>
				<li><a href="#">신고 관리</a></li>
				<li><a href="#">일정 관리</a></li>
			</ul>
		</div>
		<div class="content-outer">
			<div class="title">
				<span style="font-size:30px">전체 회원 관리</span><br>
				<span style="color:gray"><h5>Total : ??</h5></span>
			</div>
			<div class="content-1">
				<table id="listTable">
					<tr>
						<th><input type="checkbox"></th>
						<th>No ▼</th>
						<th>아이디 ▼</th>
						<th>닉네임 ▼</i></th>
						<th>회원 상태 ▼</th>
						<th>가입일 ▼</th>
						<th>회원관리 ▼</th>
					</tr>
				</table>
			</div>
			<div class="content-2"></div>
			<div class="pagingBar"></div>
		</div>
	</div>
	
	<script>
		
		function selectMember(sort, num) {
			$.ajax({
				url: "../../adminSelectMember.do",
				type: "post",
				dataType: "json",
				success: function(map) {
					if(sort == 'title') {
						
					}
				}
			});
		}
	
	</script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>