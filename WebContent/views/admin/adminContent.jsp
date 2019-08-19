<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, admin.model.vo.*"%>
<%
	String sort = "no";
	int sortNum = 5;
	ArrayList<AdminBoard> cList = (ArrayList<AdminBoard>)request.getAttribute("cList");
	AdminPageInfo pInf = (AdminPageInfo)request.getAttribute("pInf");
	int boardCount = pInf.getCount();
	int currentPage = pInf.getCurrentPage();
	int maxPage = pInf.getMaxPage();
	int startPage = pInf.getStartPage();
	int endPage = pInf.getEndPage();
	int limit = pInf.getLimit();
	int pagingBarSize = pInf.getPagingBarSize();
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
    	width: 70%;
    	height: 100%;
    	float: left;
    	padding: 50px 50px;
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
</style>
</head>
<body>
	<section id="adminContent">
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
			<h2>전체 글 관리</h2>
			<p>Total : <span id="total-count"></span></p>
			<form class="form-inline">
			<table class="table table-sm table-hover">
				<thead>
					<tr>
					<th scope="col" style="width:15px"><input type="checkbox" id="selectAll"></th>
					<th scope="col" style="width:80px">No</th>
					<th scope="col">글 제목</th>
					<th scope="col" style="width:100px">닉네임</th>
					<th scope="col" style="width:80px">조회수</th>
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
						for ( AdminBoard b : cList ) {%>
					<tr>
						<th scope="row"><input type="checkbox" name="selectContent" value="<%=b.getbNo()%>"></th>
						<th scope="row cnoNum"><%=b.getbNo()%></th>
						<td><a href="content.bo?bno=<%=b.getbNo()%>" target="_blank"><%=b.getbTitle()%></a></td>
						<td id="<%=b.getUserNo()%>"><%= b.getUserName()%></td>
						<td><%=b.getbCount() %></td>
						<td><%=b.getbRegdate() %></td>
						<td class="control"><span class="report">경고</span><span class="delete">삭제</span></td>
					</tr>
						<% }
					} %>
				</tbody>
			</table>

		
			<div class="input-group input-group-sm mb-3">
			<label class="my-1 mr-2" for="inlineFormCustomSelectPref">선택한&nbsp;<span id="selectCount"></span>개 글 편집 : </label>
			<select class="custom-select my-1 mr-sm-2 custom-select-sm" id="inlineFormCustomSelectPref">
				<option value="1">경고</option>
				<option value="2">삭제</option>
			</select> 
			<button type="button" class="btn btn-light my-1 border btn-sm">확인</button>
			<div class="space"></div>
			<select class="custom-select my-1 mr-sm-2 custom-select-sm" id="searchSelect">
				<option value="1">닉네임</option>
				<option value="2">글제목</option>
			</select> 
			<input type="text" class="form-control inputGroup-sizing-sm" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
			  <button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon2">검색</button>
			</div>
			</div>
		</form>

					
					<!------- 페이징 바 ------->
		<!-- 페이징 처리 시작! -->
		<div class="pagingArea">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/adminBoard.do?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1 || currentPage <= pagingBarSize ) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/adminBoard.do?currentPage=<%= currentPage-pagingBarSize %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/adminBoard.do?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					<%-- onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage+1 %>'">&gt;</span> --%>
					onclick="location.href='<%= request.getContextPath() %>/adminBoard.do?currentPage=<% if ( maxPage - currentPage >= pagingBarSize ) { %><%=currentPage+pagingBarSize%><% } else { %><%=maxPage%><% } %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/adminBoard.do?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
				</div>
		<div class="clear"></div>
	</section>
	<script>
		$(function(){
			$(".report").click(function(){

			});
			$(".delete").click(function(){
				var bno = $(this).parent().parent().children().eq(1).text();
				Swal.fire({
				title: '해당 글을 삭제하시겠습니까?',
				text: "유저에게는 비공개 처리되지만 관리화면에서는 조회 가능합니다.",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '삭제',
				cancelButtonText: '취소'
				}).then((result) => {
				if (result.value) {
					deleteBoard(bno);
				}
				});
			});
			// 펑션모음
			function deleteBoard(bno){

				location.href='<%= request.getContextPath() %>/adminContentUpdate.do?&currentPage=<%=currentPage%>&bno='+bno+'&type=1';
				// $.ajax({
				// 	url: "adminContentUpdate.do",
				// 	type: "GET",
				// 	data: { bno : bno, type : 1},
				// 	error: function(e){
				// 		console.log(e);
				// 	},
				// 	success: function(result){

				// 	}
				// });
			}
		});
	</script>
</body>
</html>