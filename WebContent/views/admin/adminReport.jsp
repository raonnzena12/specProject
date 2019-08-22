<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, admin.model.vo.*"%>
<%
	ArrayList<AdminReport> cList = null;
	if ( (ArrayList<AdminReport>)request.getAttribute("cList") != null ) {
		cList = (ArrayList<AdminReport>)request.getAttribute("cList");
	} else {
		cList = (ArrayList<AdminReport>)request.getAttribute("sList");
	}
	AdminPageInfo pInf = (AdminPageInfo)request.getAttribute("pInf");
	int boardCount = pInf.getCount();
	int currentPage = pInf.getCurrentPage();
	int maxPage = pInf.getMaxPage();
	int startPage = pInf.getStartPage();
	int endPage = pInf.getEndPage();
	int limit = pInf.getLimit();
	int pagingBarSize = pInf.getPagingBarSize();
	int sort = pInf.getSortNum();
	int searchType = pInf.getSearchType();
	String keyWord = pInf.getKeyWord();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-content</title>
<%@ include file ="/views/common/menubar.jsp" %>
<style>
	#adminContent {
		width: 1200px;
		min-height: 600px;
		height: auto;
		margin: auto;
	}
	#adminContent a {
		text-decoration: none;
		color: #333;
	}
	#adminContent .delContent {
		color: #aaa;
		text-decoration:line-through;
	}
	#adminContent .reportContent {
		color: #666;
		font-size: 13px;
	}
    .menu-outer {
    	width : 20%;
    	min-height : 600px;
    	height: auto;
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
    	width: 80%;
    	height: 100%;
    	float: left;
    	padding: 20px 20px;
    }
	.control span {
		font-size: 12px;
		color: crimson;
		margin: 0 5px;
		cursor: pointer;
	}
	#adminContent table {
		text-align: center;
	}
	.cnoNum {
		font-size: 12px;
	}
	.space {
		width: 200px;
	}
	.pagingArea {
		margin: 10px auto;
		text-align: center;
	}
	.pagingBtn{
		text-decoration: none;
		color : #999;
		display : inline-block;
		width : 25px;
		height : 25px;
		cursor: pointer;
	}
	.selectBtn{
		/* background-color: white; */
		color : darkred;
		font-weight: 900;
	}
	#button-addon2, #serarchKeyW {
		margin-top: 4px;
		height: 31px;
	}
	#adminContent .arrow {
		font-size: 14px;
		line-height: 10px;
		cursor: pointer;
	}
	#typeSelector {
		position: relative;
	}
	#myDropdown {
		position: absolute;
		float: left;
		top: 20px;
		right: 60px;
		display: none;
		border: 1px solid #ddd;
		background-color: #fafafa;
		width: 50px;
		font-size: 12px;
		font-weight: 400;
		z-index: 1000;
	}
	.clear {
		clear: both;
	}
	
	.refDetail:hover{
		cursor:pointer;
	}
</style>
</head>
<body>
	<section id="adminContent">
		<div class="menu-outer">
			<ul class="menu-ul">
				<li><a href="<%=request.getContextPath() %>/adminSelectMember.do?sort=no&sortNum=5">회원관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminBoard.do">글 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminComment.ad">댓글 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminReview.ad">리뷰 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/adminReport.do">신고 관리</a></li>
				<li><a href="<%=request.getContextPath()%>/loadAdminCalendar.do">일정 관리</a></li>
			</ul>
		</div>
		<div class="content-outer">
			<h2>신고 글 관리</h2>
			<p>Total : <span id="total-count"><%=pInf.getCount() %></span></p>
			<form class="form-inline">
			<table class="table table-sm table-hover border-bottom">
				<thead>
					<tr>
					
					
					<th scope="col" style="width:60px">글번호</th>
					<th scope="col" style="width:100px">닉네임</th>
					<th scope="col" style="width:80px">처리현황</th>
					<th scope="col" style="width:80px">상태</th>
					<th scope="col" style="width:120px">신고사유</th>
					<th scope="col" style="width:100px">게시판</th>
					<th scope="col" style="width:120px">작성일</th>
					<th scope="col" style="width:80px;">글관리</th>
					</tr>
				</thead>
				<tbody>
					<% if( cList.isEmpty() ) { %>
					<tr>
						<td colspan="7">
							등록된 글이 없습니다.
						</td>
					</tr>
					<% } else { 
						for ( AdminReport a : cList ) {%>
					<tr>
						<th scope="row cnoNum" id="<%=a.getrRefConNo()%>"><%=a.getrRefConNo() %></th>
						<th scope="row cnoNum" id="<%=a.getrWriter()%>"><%=a.getrWriter2() %></th>
						<th scope="row cnoNum"><% if(a.getrResult() == 1){%>처리<%}else{ %><p style="color:red">미처리</p><%}%></th>
						<td><%=a.getReStatusType()%></td>
						<td id="<%=a.getrTableNo()%>"><a class="conDetail" ><% String tmp =""; if(a.getrContent().replaceAll("<br>"," ").length() > 20){ tmp = a.getrContent().replaceAll("<br>"," ").substring(10) + "...";}else{ tmp = a.getrContent().replaceAll("<br>"," ");} %><%= tmp %></a></td>
						<td id="<%=a.getrRefNo()%>"><a class="refDetail"><% if(a.getrTableNo() ==  1){%>글<%}else if(a.getrTableNo() ==  2){ %>댓글<%}else if(a.getrTableNo() ==  4){ %>모바일 리뷰<%}else if(a.getrTableNo() ==  5){ %>모바일 댓글<%}else{ %>비교 댓글<%} %><br>[<%= a.getReRefContType()%>]</a></td>
						<td><%=a.getrDate()%></td>
						<td class="control" id="<%=a.getrNo()%>"><span class="report">경고</span><span class="delete">삭제</span></td>
					</tr>
						<% }
					} %>
				</tbody>
			</table>

		
			
		</form>

					
					<!------- 페이징 바 ------->
		<!-- 페이징 처리 시작! -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/adminReport.do?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/adminReport.do?currentPage=<%= currentPage-1 %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/adminReport.do?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/adminReport.do?currentPage=<%= currentPage+1 %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/adminReport.do?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
	</section>
		<div class="clear"></div>
	<script>
		$(function(){
			// 경고처리를 하나 눌렀을 떄
			$(".report").click(function(){
				var tno = $(this).parent().parent().children().eq(4).attr("id");
				var refNo = $(this).parent().parent().children().eq(0).attr("id");
				var rNo = $(this).parent().attr("id");
				console.log(tno);
				console.log(refNo);
				console.log(rNo);
				
				Swal.fire({
				title: '게시글 경고',
				text: "해당 글을 경고처리 하시겠습니까?",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '경고',
				cancelButtonText: '취소'
				}).then((result) => {
				if (result.value) {
					reportBoard(tno,refNo,rNo);
				}
				});
			});
			// 삭제처리를 하나 눌렀을 떄
			$(".delete").click(function(){
				var tno = $(this).parent().parent().children().eq(4).attr("id");
				var refNo = $(this).parent().parent().children().eq(0).attr("id");
				var rNo = $(this).parent().attr("id");
				Swal.fire({
				title: '게시글 삭제',
				text: "해당 글을 삭제하시겠습니까?",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '삭제',
				cancelButtonText: '취소'
				}).then((result) => {
				if (result.value) {
					deleteBoard(tno, refNo, rNo);
				}
				});
			});
			
			
			$(".refDetail").click(function(){
				var tno = $(this).parent().parent().children().eq(4).attr("id");
				var refNo = $(this).parent().attr("id");
				
				
				refDetail(tno,refNo);
			});
		});
		// 펑션모음
		
		function refDetail(tno,refNo){
			console.log(tno + " "+ refNo);
			
			if(tno == 1){
				location.href="<%= request.getContextPath() %>/content.bo?bno="+refNo +"&bcode=0";	
			}else if(tno == 2){
				location.href="<%= request.getContextPath() %>/content.bo?bno="+refNo +"&bcode=0";
			}else if(tno == 4){
				location.href="<%= request.getContextPath() %>/spec.mo?mno="+refNo + "&page=2";
			}else if(tno == 5){
				location.href="<%= request.getContextPath() %>/spec.mo?mno="+refNo +"&page=1";
			}else{
				location.href="<%= request.getContextPath() %>/compareSpec.mo?mno="+refNo;
			}
		}
		function deleteBoard(tno,refNo,rNo){
			location.href="<%=request.getContextPath()%>/reportDelete.ad?tno="+tno+"&refNo="+refNo + "&rNo="+rNo;			
		}
		function reportBoard(tno,refNo,rNo){
			
			location.href="<%=request.getContextPath()%>/reportUpdate.ad?tno="+tno+"&refNo="+refNo+ "&rNo="+rNo;
			
		}
	</script>
</body>
</html>