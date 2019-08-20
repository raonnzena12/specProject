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
	
	String status = "";
	if(request.getAttribute("status") != null) {
		status = (String)request.getAttribute("status");
	}
	
	String searchSort = null;
	String searchText = null;
	if(request.getAttribute("searchSort") != null) {
		searchSort = (String)request.getAttribute("searchSort");
		searchText= (String)request.getAttribute("searchText");
	}
	
	if(status.contains("0")) {
		status = "관리자";
	}else if(status.contains("1")) {
		status = "일반";
	}else if(status.contains("2")) {
		status = "정지";
	}else if(status.contains("3")) {
		status = "탈퇴";
	}else if(status.contains("4")) {
		status = "전체";
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
	System.out.println("searchSort : " + searchSort);
	System.out.println("searchText : " + searchText);
	System.out.println("status : " + status);
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

	* {
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
        text-decoration-line: none;
        user-select: none;
    }
    
	.outer {
		width: 1200px;
		min-height: 600px;
		margin: auto;
	}
	
    .menu-outer {
    	width : 20%;
    	height :  fill;
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
    	height: auto;
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
    	float: left;
    }
    
    .content-1 table {
    	width: 100%;
    	margin: auto;
    	text-align: center;
    }
    
    .content-1 tr {
    	height: 30px;
    	border-bottom: 1px solid gray;
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
    
    .content-1 .statusPrint a {
    	margin: 1px;
    }
    
    .content-2 {
    	width: 100%;
    	height: 120px;
    	float: left;
    }
    
    .content-2-1 {
    	width: 65%;
    	height: 70%;
    	float: left;
    }
    
    .content-2-2 {
    	width: 35%;
    	height: 70%;
    	float: left;
    }
    
    .content-2-3 {
    	width: 90%;
    	height: 30%;
    	float: left;
    }
    
    .content-2-4 {
    	width: 10%;
    	height: 30%;
    	float: left;
    }
    
    .pagingBar {
    	width: 100%;
    	height: 40px;
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
    
</style>
<body>
	<div class="outer">
		<div class="menu-outer">
			<ul class="menu-ul">
				<li><a href="#">회원관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminBoard.do">글 관리</a></li>
				<li><a href="#">댓글 관리</a></li>
				<li><a href="#">리뷰 관리</a></li>
				<li><a href="#">신고 관리</a></li>
				<li><a href="#">일정 관리</a></li>
			</ul>
		</div>
		<div class="content-outer">
			<div class="title">
				<span style="font-size:30px">전체 회원 관리</span><br>
				<span style="color:gray"><h5>Total : <%=count%></h5></span>
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
						<td colspan="7">조회되는 멤버가 없습니다</td>
					</tr>
					<% }else { 
						int i = 1;%>
						<% for(AdminMember mem : list) { %>
						<tr class="statusPrint">
							<td><input type="checkbox" name="memberCheck" value="<%=mem.getUserNo()%>"></td>
							<td><%= mem.getrNum() %></td>
							<td><%= mem.getUserEmail() %></td>
							<td><%= mem.getUserName() %></td>
							<td><%= mem.getUserStatusType() %></td>
							<td><%= mem.getEnrollDate() %></td>
							<td name=<%=mem.getUserNo()%>>
								<% if(!mem.getUserStatusType().equals("일반")) { %>
									<a href="#" class="general" name=<%=mem.getUserNo()%> onclick="updateGeneral(<%=mem.getUserNo()%>);">일반</a>
								<% } %>
								<% if(!mem.getUserStatusType().equals("정지")) { %>
									<a href="#" class="suspend" name=<%=mem.getUserNo()%> onclick="updateSuspend(<%=mem.getUserNo()%>);">정지</a>
								<% } %>
								<% if(!mem.getUserStatusType().equals("탈퇴")) { %>
									<a href="#" class="delete" name=<%=mem.getUserNo()%> onclick="updateDelete(<%=mem.getUserNo()%>);">탈퇴</a>
								<% } %>
							</td>
						<% } %>
					<% } %>
				</table>
			</div>
			<div class="content-2">
				<div class="content-2-1">
				    <select class="status" id="selectUserStatus">
				    	<option>전체</option>
			        	<option>관리자</option>
			        	<option>일반</option>
			        	<option>정지</option>
			        	<option>탈퇴</option>
			        </select>&nbsp;
			      	<button type="button" id="statusBtn">확인</button>
				</div>
				<div class="content-2-2">
					<select class="searchSelect">
			        	<option>아이디</option>
			        	<option>닉네임</option>
			      	</select>
			      	<input type="text" placeholder="Search" id="searchInput">
			      	<button type="button" id="searchBtn">검색</button>
				</div>
				<div class="content-2-3">
					<label>선택된 유저 처리 : </label>&nbsp;
					<select id="editUserSelect">
						<option>일반</option>
			        	<option>정지</option>
			        	<option>탈퇴</option>
				    </select>
				    <button type="button" id="editUserBtn" onclick="editBtn()">확인</button>
				</div>
				<div class="content-2-4">
					<select id="sortNum">
			        	<option>5</option>
			        	<option>10</option>
			        	<option>15</option>
			        	<option>20</option>
			        	<option>30</option>
			      	</select>
				</div>
				
			</div>
			
			<!-----------페이징 바 ----------->
			<div class="pagingBar">
				<div class="pagingArea" align="center">
					<!-- 맨 처음으로(<<) -->
					<span class="pagingBtn clickBtn firstBtn" onclick="firstBtn()">&lt;&lt;</span>
					
					<!-- 이전 페이지로(<) -->
					<% if(currentPage <= 1) { %>
						<span class="pagingBtn">&lt;</span>
					<% } else{ %>
						<span class="pagingBtn clickBtn" onclick="backBtn()">&lt;</span>
					<% } %>
					
					<!-- 페이지 목록 -->
					<% for(int p = startPage; p<=endPage; p++){ %>
						<% if(p == currentPage) { %>
							<span class="pagingBtn selectBtn"><%= p %></span>
						<% } else{ %>
							<span class="pagingBtn clickBtn" onclick="middleBtn(<%=p%>)"><%=p %></span>
						<% } %>
					<%} %>
					
					<!-- 다음 페이지로(>) -->
					<% if(currentPage >= maxPage){ %>
						<span class="pagingBtn"> &gt; </span>
					<% } else{ %>
						<span class="pagingBtn clickBtn" onclick="nextBtn()">&gt;</span>
					<% } %>
					
					<!-- 맨 끝으로(>>) -->
					<span class="pagingBtn clickBtn" onclick="lastBtn()">&gt;&gt;</span>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		
		var sortNum = <%=sortNum%>;
		var isSort = <%= isSort %>;
		var sort = "<%= sort %>";
		
		var nameVal;
		
		var status; // 회원 상태 select option:selected 의 값을 담을 변수
		
		
		//--------------------------------- 페이징바 onclick 처리 ---------------------------------
		
		function firstBtn() {
			<% if(sort.contains("search")) { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=1&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>&searchSort=<%=searchSort%>&searchText=<%=searchText%>';
			<% }else { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=1&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>';
			<% } %>
		}
		
		function backBtn() {
			<% if(sort.contains("search")) { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=<%=currentPage-1%>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>&searchSort=<%=searchSort%>&searchText=<%=searchText%>';
			<% }else { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=<%=currentPage-1%>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>';
			<% } %>
		}
		
		function middleBtn(p) {
			<% if(sort.contains("search")) { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage='+p+'&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>&searchSort=<%=searchSort%>&searchText=<%=searchText%>';
			<% }else { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage='+p+'&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>';
			<% } %>
		}
		
		function nextBtn() {
			<% if(sort.contains("search")) { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=<%=currentPage+1%>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>&searchSort=<%=searchSort%>&searchText=<%=searchText%>';
			<% }else { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=<%=currentPage+1%>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>';
			<% } %>
		}
		
		function lastBtn() {
			<% if(sort.contains("search")) { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=<%=maxPage%>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>&searchSort=<%=searchSort%>&searchText=<%=searchText%>';
			<% }else { %>
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=<%=maxPage%>&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>';
			<% } %>
		}
		
		//------------------------ select, checkbox 처리 이벤트 -------------------------
		
		$("#sortNum").on('change',function(){
			sortNum = $("#sortNum option:selected").val();
			<% if(sort.contains("search")) { %>
				location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=1&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>&searchSort=<%=searchSort%>&searchText=<%=searchText%>';
			<% }else { %>
				location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=1&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>';
			<% } %>
		});
		
		$("#sortNum option").each(function(){
		    if($(this).val()==<%=sortNum%>){
		      $(this).attr("selected","selected");
		    }
		});
		 
		$(".status option").each(function(){
		    if($(this).val() == "<%=status%>"){
		      $(this).attr("selected","selected");
		    }
		});
		
		$(".searchSelect option").each(function(){
		    if($(this).val() == "<%=searchSort%>"){
		      $(this).attr("selected","selected");
		    }
		});
		
		$("#checkAll").on("change", function(){
			if($(this).is(":checked")) {
				$("input[name=memberCheck]").prop("checked",true);
			}else {
				$("input[name=memberCheck]").prop("checked",false);
			}
		});
		
		function editBtn() {
			var valArr = new Array();
			var edit = $("#editUserSelect option:selected").val();
			
			$("input[name=memberCheck]:checked").each(function(){
				valArr.push($(this).val());				
			});
			for(i in valArr) {
				if(edit == "일반") {
					updateGeneral(valArr[i]);
				}else if(edit == "정지") {
					updateSuspend(valArr[i]);
				}else {
					updateDelete(valArr[i]);
				}
			}
		}
		
		
		//------------------------------------ 회원 상태 처리 이벤트 ----------------------------------------
		
		function updateGeneral(nameVal) {
			status = "general";
			
 			$.ajax({
				url: "<%=request.getContextPath()%>/adminUpdateMember.do",
				type: "post",
				data : {status : status, mno : nameVal},
				success: function(result) {
					if(result > 0) {
						alert("회원 상태를 일반으로 성공적으로 변경하였습니다.");
						location.reload();
					}else {
						alert("회원 상태 일반으로 변경 중 오류 발생");
					}
				},
				error: function() {
					alert("통신 에러 발생");
				}
			});
		}
		
		function updateSuspend(nameVal) {
			status = "suspend";
			
 			$.ajax({
				url: "<%=request.getContextPath()%>/adminUpdateMember.do",
				type: "post",
				data : {status : status, mno : nameVal},
				success: function(result) {
					if(result > 0) {
						alert("회원 정지가 성공적으로 처리 되었습니다.");
						location.reload();
					}else {
						alert("회원 정지 처리 중 오류 발생");
					}
				},
				error: function() {
					alert("통신 에러 발생");
				}
			});
		}
		
		function updateDelete(nameVal) {
			status = "delete";
			
			$.ajax({
				url: "<%=request.getContextPath()%>/adminUpdateMember.do",
				type: "post",
				data : {status : status, mno : nameVal},
				success: function(result) {
					if(result > 0) {
						alert("회원 탈퇴가 성공적으로 처리 되었습니다.");
						location.reload();
					}else {
						alert("회원 탈퇴 처리 중 오류 발생");
					}
				},
				error: function() {
					alert("통신 에러 발생");
				}
			});
		}

		//------------------------------- search 이벤트 처리 --------------------------------------
		$("#searchBtn").click(function(){
			var searchSort = $(".searchSelect option:selected").val();
			var searchText = $("#searchInput").val();
			sort = "search";
			location.href='<%= request.getContextPath() %>/adminSelectMember.do?currentPage=1&sort='+sort+'&sortNum='+sortNum+'&isSort=<%=isSort%>&searchSort='+searchSort+'&searchText='+searchText+'';
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
				} %>
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
				var statusVal = $(".status option:selected").val();
				if(statusVal == "관리자") {
					sort = "status0";
				}else if(statusVal == "일반") {
					sort = "status1";
				}else if(statusVal == "정지") {
					sort = "status2";
				}else if(statusVal == "탈퇴") {
					sort = "status3";
				}else if(statusVal == "전체") {
					sort = "status4";
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