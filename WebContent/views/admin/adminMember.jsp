<%@page import="admin.model.vo.AdminPageInfo"%>
<%@page import="admin.model.vo.AdminMember"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	System.out.println("--------------------- adminMember.jsp -----------------------");

	ArrayList<AdminMember> list = (ArrayList<AdminMember>)request.getAttribute("list");
	AdminPageInfo pInf = (AdminPageInfo)request.getAttribute("pInf");
	
	boolean isSort = true;
	
	if(request.getAttribute("isSort") != null) {
		isSort = (boolean)(request.getAttribute("isSort"));
	}else {
		isSort = true;
	}
	
	String sort = "no";
	if(request.getAttribute("sort") != null) {
		sort = (String)request.getAttribute("sort");
	}
	
	int sortNum = (int)(request.getAttribute("sortNum"));
	
	int count = pInf.getCount();
	int currentPage = pInf.getCurrentPage();
	int maxPage = pInf.getMaxPage();
	int startPage = pInf.getStartPage();
	int endPage = pInf.getEndPage();
	int limit = pInf.getLimit();
	int pagingBarSize = pInf.getPagingBarSize();
	
	System.out.println("isSort : " + isSort);
	System.out.println("sort : " + sort);
	System.out.println("pInf : " + pInf);
%>
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

	html, body {
		height: 100%;
	}
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
    	width: 100%;
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
    	height: 40px;
    	border: 1px solid blue;
    	float: left;
    }
    
    .pagingArea {
    	width: 100%;
    	height: 100%;
    }
    
    .pagingBtn{
		text-decoration: none;
		color : black;
		display : inline-block;
		width : 25px;
		height : 25px;
	}
	
	.selectBtn{
		background-color: white;
		color : gray;
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
					<tr style="background-color:#E2E2E2">
						<th><input id="checkAll" type="checkbox" name="memberCheck"></th>
						<th id="no">No ▼</th>
						<th id="email">아이디 ▼</th>
						<th id="name">닉네임 ▼</i></th>
						<th>회원 상태</th>
						<th id="date">가입일 ▼</th>
						<th>회원관리 ▼</th>
					</tr>
					<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="7">등록된 게시글이 없습니다</td>
					</tr>
					<% }else { 
						int i = 1;%>
						<% for(AdminMember mem : list) { %>
						<tr>
							<td><input type="checkbox" name="memberCheck"></td>
							<td><%= mem.getrNum() %></td>
							<td><%= mem.getUserEmail() %></td>
							<td><%= mem.getUserName() %></td>
							<td><%= mem.getUserStatusType() %></td>
							<td><%= mem.getEnrollDate() %></td>
							<td><a href="#">정지</a><a href="#">탈퇴</a></td>
						<% } %>
					<% } %>
				</table>
			</div>
			<div class="content-2">
				<div class="content-2-1">
			      	<form class="form-inline my-2 my-lg-0">
			      		<label>유저 편집 : </label>
					    <select class="form-control" id="sort-1 status">
				        	<option>관리자</option>
				        	<option>일반</option>
				        	<option>정지</option>
				        	<option>탈퇴</option>
				        </select>
				      	<button type="button" class="btn btn-outline-dark" id="statuBtn">확인</button>
				    </form>
				</div>
				<div class="content-2-2">
			      	<form class="form-inline my-2 my-lg-0">
						<select class="form-control" id="sort-2">
				        	<option>아이디</option>
				        	<option>닉네임</option>
				      	</select>
				      	<input class="form-control mr-sm-2" type="text" placeholder="Search">
				      	<button type="button" class="btn btn-outline-dark">검색</button>
				  	</form>
				</div>
				<div class="content-2-3"></div>
				<div class="content-2-4">
					<!-- <form class="form-inline my-2 my-lg-0"> -->
						<select class="form-control" id="sortNum">
				        	<option>5</option>
				        	<option>10</option>
				        	<option>15</option>
				        	<option>20</option>
				        	<option>30</option>
				      	</select>
				  	<!-- </form> -->
				</div>
				
			</div>
			<div class="pagingBar">
				<div class="pagingArea" align="center">
					<!-- 맨 처음으로(<<) -->
					<span class="pagingBtn clickBtn" 
onclick="location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=1&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>'">&lt;&lt;</span>
				
					<!-- 이전 페이지로(<) -->
					<% if(currentPage <= 1) { %>
						<span class="pagingBtn">&lt;</span>
					<% } else{ %>
						<span class="pagingBtn clickBtn" 
							onclick="location.href='<%= request.getContextPath() %>
							/adminSelectMember.do?currentPage=<%= currentPage-1 %>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>'">&lt;</span>
					<% } %>
					
					<!-- 페이지 목록 -->
					<% for(int p = startPage; p<=endPage; p++){ %>
						<% if(p == currentPage) { %>
							<span class="pagingBtn selectBtn"><%= p %></span>
						<% } else{ %>
							<span class="pagingBtn clickBtn"
onclick="location.href='<%=request.getContextPath()%>/adminSelectMember.do?currentPage=<%=p%>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>'"><%=p %></span>
						<% } %>
					<%} %>
					
					<!-- 다음 페이지로(>) -->
					<% if(currentPage >= maxPage){ %>
						<span class="pagingBtn"> &gt; </span>
					<% } else{ %>
						<span class="pagingBtn clickBtn" 
onclick="location.href='<%=request.getContextPath()%>/adminSelectMember.do?currentPage=<%= currentPage+1 %>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>'">&gt;</span>
					<% } %>
					
					<!-- 맨 끝으로(>>) -->
					<span class="pagingBtn clickBtn"
						onclick="location.href='<%= request.getContextPath() %>
						/adminSelectMember.do?currentPage=<%= maxPage %>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>'">&gt;&gt;</span>
				</div>
			</div>
		</div>
	</div>
	
	<script>
/* 		function selectMember(sort, currentPage) {
			
			cSort = "no";
			
			var isSort;
			
			switch(sort) {
				case "no" : isSort = isNo; break;
				case "title" : isSort = isTitle; break;
				case "name" : isSort = isName; break;
				case "status" : isSort = isStatus; break;
				case "date" : isSort = isDate; break;
			}
			
			$.ajax({
				url: "../../adminSelectMember.do",
				type: "post",
				dataType: "json",
				async : false,
				data : {sort : sort, isSort : isSort, 
 : sortNum, currentPage : currentPage},
				success: function(map) {
					if(map != null) {
						var $listTable = $("#listTable");
						var $pagingArea = $(".pagingArea");
						var j = 1;
						
						$listTable.html(table);
						
						var mList = map[mList];
						
 						$.each(map, function(i){
 							if(i == "pInf") {
 								pInf = map[i];
 								console.log(pInf);
 								return false;
 							}
 							
							var $tr = $("<tr>");
							var $checkBox = $("<td>").html("<input type='checkbox' name='memberCheck'>");
							var $no = $("<td>").text(j++);
							var $email = $("<td>").text(map[i].userEmail);
							var $name = $("<td>").text(map[i].userName);
							var $status = $("<td>").text(map[i].userStatusType);
							var $enDate = $("<td>").text(map[i].enrollDate);
							var $statusManage = $("<td>").html("<a href='#'>정지</a><a href='#'>탈퇴</a>");
							
							$tr.append($checkBox);
							$tr.append($no);
							$tr.append($email);
							$tr.append($name);
							$tr.append($status);
							$tr.append($enDate);
							$tr.append($statusManage);
							$listTable.append($tr);
 						});
 						
 						//----------------------------- < 페이징바 처리 > ------------------------------------------
 						$pagingArea.html("");
 						
 						$span = $("<span class='pagingBtn clickBtn' onclick='selectMember(cSort, 1)'>").html("&lt;&lt;");
 						$pagingArea.append($span);
 						
 						//------------------------------ 이전 페이지로 ---------------------------------------
 						if(pInf["currentPage"] <= 1) {
 							$span = $("<span class='pagingBtn'>").html("&lt");
 						}else{
 							$span = $("<span class='pagingBtn clickBtn' onclick='selectMember(cSort, " + (pInf['currentPage']-1) + ");'>").html("&lt");
 						}
 						$pagingArea.append($span);
 						
 						
 						//------------------------------ 페이지 목록 ---------------------------------------
 						for(var p=pInf["startPage"]; p<=pInf["endPage"]; p++) {
 							console.log(p);
 							if(p == pInf["currentPage"]) {
 								$span = $("<span class='pagingBtn selectBtn'>").text(p);
 							}else {
 								$span = $("<span class='pagingBtn clickBtn' onclick='selectMember(cSort, " + p + ");'>").text(p); 
 							}
 							$pagingArea.append($span);
 						}
 						
 						//------------------------------ 다음 페이지로 ---------------------------------------
 						if(pInf["currentPage"] >= pInf["maxPage"]) {
 							$span = $("<span class='pagingBtn'>").text("&gt");
 						}else {
 							$span = $("<span class='pagingBtn clickBtn' onclick='selectMember(cSort, " +  (pInf['currentPage']+1) + ");'>").html("&gt;");
 						}
 						$pagingArea.append($span);
 						
 						//------------------------------ 맨 끝페이지로 ---------------------------------------
 						$span = $("<span class='pagingBtn clickBtn' onclick='selectMember(cSort, " + pInf['maxPage'] + ");'>").html("&gt;&gt;");
 						$pagingArea.append($span);
 						
					}
				},
				error : function() {
					alert("회원 조회 중 에러 발생");
				}
			});
		} */
		
		var sortNum = <%=sortNum%>;
		var isSort = <%= isSort %>;
		var sort = "<%= sort %>";
		$("#sortNum").on('change',function(){
			sortNum = $("#sortNum option:selected").val();
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=1&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>'
		});
		
		 $("#sortNum option").each(function(){
		    if($(this).val()==<%=sortNum%>){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
		});
		
 		$(function(){
			
			// -------------- 페이징바 마우스오버 이벤트 ----------------
			$(".clickBtn").mouseenter(function(){
				$(this).css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			});
			
			//--------------- 정렬 이벤트 ------------------
			$("#no").mouseenter(function(){
				$(this).css("color", "gray");
			}).mouseout(function(){
				$(this).css("color", "black");
			}).click(function(){
				<% if(sort.equals("no")) {
					if(isSort == true) {
						isSort = false;
					}else {
						isSort = true;
					}
				}%>
				sort = "no";
				location.href="<%=request.getContextPath()%>/adminSelectMember.do?currentPage=1&sort="+sort+"&sortNum="+sortNum+"&isSort=<%=isSort%>";
			});
			
			$("#email").mouseenter(function(){
				$(this).css("color", "gray");
			}).mouseout(function(){
				$(this).css("color", "black");
			}).click(function(){
				<% if(sort.equals("email")) {
					if(isSort == true) {
						isSort = false;
					}else {
						isSort = true;
					}
				}%>
				sort = "email";
				location.href="<%=request.getContextPath()%>/adminSelectMember.do?currentPage=1&sort="+sort+"&sortNum="+sortNum+"&isSort=<%=isSort%>";
			});
			
			$("#name").mouseenter(function(){
				$(this).css("color", "gray");
			}).mouseout(function(){
				$(this).css("color", "black");
			}).click(function(){
				<% if(sort.equals("name")) {
					if(isSort == true) {
						isSort = false;
					}else {
						isSort = true;
					}
				}%>
				sort = "name";
				location.href="<%=request.getContextPath()%>/adminSelectMember.do?currentPage=1&sort="+sort+"&sortNum="+sortNum+"&isSort=<%=isSort%>";
			});
			
			$("#statusBtn").click(function(){
				var statusVal = $("status option:selected").val();
				if(statusVal == "관리자") {
					sort = "status0";
				}else if(statusVal == "일반") {
					sort = "status1";
				}else if(statusVal == "정지") {
					sort = "status2";
				}else if(statusVal == "탈퇴") {
					sort = "status3";
				}
				location.href="<%=request.getContextPath()%>/adminSelectMember.do?currentPage=1&sort="+sort+"&sortNum="+sortNum+"&isSort=<%=isSort%>";
			});
			
			$("#date").mouseenter(function(){
				$(this).css("color", "gray");
			}).mouseout(function(){
				$(this).css("color", "black");
			}).click(function(){
				<% if(sort.equals("date")) {
					if(isSort == true) {
						isSort = false;
					}else {
						isSort = true;
					}
				}%>
				sort = "date";
				location.href="<%=request.getContextPath()%>/adminSelectMember.do?currentPage=1&sort="+sort+"&sortNum="+sortNum+"&isSort=<%=isSort%>";
			});
		});
		
		//selectMember("no", 1);
	
	</script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>