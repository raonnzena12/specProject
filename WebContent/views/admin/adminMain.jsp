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
    	height: 600px;
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
				<li><a href="#">글 관리</a></li>
				<li><a href="#">댓글 관리</a></li>
				<li><a href="#">리뷰 관리</a></li>
				<li><a href="#">신고 관리</a></li>
				<li><a href="#">일정 관리</a></li>
			</ul>
		</div>

		<div class="content-outer">
			<div class="table-outer">
				<div class="each-table">
					<table id="memberTable">
						<tr>
							<th><i class="material-icons">supervisor_account</i></th>
							<th>회원 관리</th>
							<td><a href="<%=request.getContextPath() %>/adminSelectMember.do?sort=<%=sort%>&sortNum=<%=sortNum%>">more></td>
						</tr>
					</table>
				</div>
				<div class="each-table">
					<table id="boardTable">
						<tr>
							<td><i class="material-icons">format_list_numbered</i></td>
							<th>글 관리</th>
							<td><a href="#">more></td>
						</tr>
					</table>
				</div>
				<div class="each-table">
					<table id="commentTable">
						<tr>
							<td><i class="material-icons">reply_all</i></td>
							<th>댓글 관리</td>
							<td><a href="#">more></td>
						</tr>
					</table>
				</div>
				<div class="each-table">
					<table id="reviewTable">
						<tr>
							<td><i class="material-icons">rate_review</i></td>
							<th>리뷰 관리</th>
							<td><a href="#">more></td>
						</tr>
					</table>
				</div>
				<div class="each-table">
					<table id="reportTable">
						<tr>
							<td><i class="material-icons">phone</i></td>
							<th>신고 관리</th>
							<td><a href="#">more></td>
						</tr>
					</table>
				</div>
				<div class="each-table">
					<table id="calendarTable">
						<tr>
							<td><i class="material-icons">calendar_today</i></td>
							<th>일정 관리</th>
							<td><a href="#">more></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
		function selectMember() {
			
			var sort="admin";
			var sortNum = 0;
			var currentPage = 0;
			
			$.ajax({
				url : "../../adminSelectMember.do",
				type : "post",
				dataType : "json",
				data : {sort : sort, sortNum : sortNum},
				success : function(map) {
					if(map != null) {
						var $memberTable = $("#memberTable");
						
 						for(var i=0; i<2; i++) {
							var $tr = $("<tr>");
							var $icon = $("<td>").html('<i class="material-icons">perm_identity</i>');
							var $name = $("<td>").text(map[i].userName);
							var $enDate = $("<td>").text(map[i].enrollDate);
							
							$tr.append($icon);
							$tr.append($name);
							$tr.append($enDate);
							$memberTable.append($tr);
						}
					}
				},
				error : function() {
					alert('회원정보를 불러오는 중 에러 발생');
				}
			});
		}
		
		function selectBoard() {
			$.ajax({
				url : "../../adminSelectBoard.do",
				type : "post",
				dataType : "json",
				success : function(map) {
					if(map != null) {
						var $boardTable = $("#boardTable");
						
 						for(var i=0; i<2; i++) {
							var $tr = $("<tr>");
							var $icon = $("<td>").html('<i class="material-icons">format_list_bulleted</i>');
							var $title = $("<td>").text(map[i].bTitle);
							var $enDate = $("<td>").text(map[i].bRegdate);
							
							$tr.append($icon);
							$tr.append($title);
							$tr.append($enDate);
							$boardTable.append($tr);
						}
					}
				},
				error : function() {
					alert('글 정보를 불러오는 중 에러 발생');
				}
			});
		}
		
		function selectComment() {
			$.ajax({
				url : "../../adminSelectComment.do",
				type : "post",
				dataType : "json",
				success : function(map) {
					if(map != null) {
						var $commentTable = $("#commentTable");
						
 						for(var i=0; i<2; i++) {
							var $tr = $("<tr>");
							var $icon = $("<td>").html('<i class="material-icons">reply</i>');
							var $title = $("<td>").text(map[i].cContent);
							var $enDate = $("<td>").text(map[i].cRegdate);
							
							$tr.append($icon);
							$tr.append($title);
							$tr.append($enDate);
							$commentTable.append($tr);
						}
					}
				},
				error : function() {
					alert('댓글 정보를 불러오는 중 에러 발생');
				}
			});
		}
		
		function selectReview() {
			$.ajax({
				url : "../../adminSelectReview.do",
				type : "post",
				dataType : "json",
				success : function(map) {
					if(map != null) {
						var $reviewTable = $("#reviewTable");
						
 						for(var i=0; i<2; i++) {
							var $tr = $("<tr>");
							var $icon = $("<td>").html('<i class="material-icons">textsms</i>');
							var $title = $("<td>").text(map[i].rTitle);
							var $enDate = $("<td>").text(map[i].rRegDate);
							
							$tr.append($icon);
							$tr.append($title);
							$tr.append($enDate);
							$reviewTable.append($tr);
						}
					}
				},
				error : function() {
					alert('리뷰 정보를 불러오는 중 에러 발생');
				}
			});
		}
		
		function selectReport() {
			$.ajax({
				url : "../../adminSelectReview.do",
				type : "post",
				dataType : "json",
				success : function(map) {
					if(map != null) {
						var $reportTable = $("#reportTable");
						
 						for(var i=0; i<2; i++) {
							var $tr = $("<tr>");
							var $icon = $("<td>").html('<i class="material-icons">textsms</i>');
							var $title = $("<td>").text(map[i].rTitle);
							var $enDate = $("<td>").text(map[i].rRegDate);
							
							$tr.append($icon);
							$tr.append($title);
							$tr.append($enDate);
							$reportTable.append($tr);
						}
					}
				},
				error : function() {
					alert('리뷰 정보를 불러오는 중 에러 발생');
				}
			});
		}
		
		function selectCalendar() {
			$.ajax({
				url : "../../adminSelectCalendar.do",
				type : "post",
				dataType : "json",
				success : function(map) {
					if(map != null) {
						var $calendarTable = $("#calendarTable");
						
						for(var i=0; i<2; i++) {
							var $tr = $("<tr>");
							var $icon = $("<td>").html('<i class="material-icons">date_range</i>');
							var $title = $("<td>").text(map[i].title);
							var $date = $("<td>").text(map[i].date);
							
							$tr.append($icon);
							$tr.append($title);
							$tr.append($date);
							$calendarTable.append($tr);
						}
					}
				},
				error : function() {
					alert("캘린더 정보를 불러오는 중 에러 발생");
				}
			});
		}
		
		selectMember(); 
		
		selectBoard();
		
		selectComment();
		
		selectReview();
		
		selectCalendar();

	</script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>