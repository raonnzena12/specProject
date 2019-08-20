<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, admin.model.vo.*"%>
<%
	ArrayList<AdminReview> cList = null;
	if ( (ArrayList<AdminReview>)request.getAttribute("cList") != null ) {
		cList = (ArrayList<AdminReview>)request.getAttribute("cList");
	} else {
		cList = (ArrayList<AdminReview>)request.getAttribute("sList");
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
<title>admin-review</title>
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
	#button-addon2, #serarchKeyW {
		margin-top: 4px;
		height: 31px;
	}
	#adminContent .arrow {
		font-size: 14px;
		line-height: 10px;
		cursor: pointer;
	}
	.typeSelector {
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
	#myDropdown2 {
		position: absolute;
		float: left;
		top: 20px;
		right: -30px;
		display: none;
		border: 1px solid #ddd;
		background-color: #fafafa;
		width: 50px;
		font-size: 12px;
		font-weight: 400;
		z-index: 1000;
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
				<li><a href="#">리뷰 관리</a></li>
				<li><a href="#">신고 관리</a></li>
				<li><a href="#">일정 관리</a></li>
			</ul>
		</div>
		<div class="content-outer">
			<h2>전체 리뷰 관리</h2>
			<p>Total : <span id="total-count"><%=pInf.getCount() %></span></p>
			<form class="form-inline">
			<table class="table table-sm table-hover border-bottom">
				<thead>
					<tr>
					<th scope="col" style="width:15px"><input type="checkbox" id="selectAll"></th>
					<th scope="col" style="width:60px">No<% if ( sort < 5 && sort > 0 ) { %><i class="material-icons arrow" id="noOrderBy">arrow_drop_down</i><% } %></th>
					<th scope="col" style="width:60px" class="typeSelector">
						기종명
					</th>
					<th scope="col" class="typeSelector">리뷰 제목<% if ( sort > 0 && sort < 8  ) { %><i class="material-icons arrow" id="conTypeSelect">arrow_drop_down</i>
						<div id="myDropdown" class="dropdown-content">
							<a href='<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage %>&limit=<%=limit%>'>전체리뷰</a>
							<a href='<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage %>&limit=<%=limit%>&sort=5'>일반리뷰</a>
							<a href='<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage %>&limit=<%=limit%>&sort=6'>삭제리뷰</a>
							<a href='<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage %>&limit=<%=limit%>&sort=7'>경고리뷰</a>
						</div>
						<% } %>
					</th>
					<th scope="col" style="width:100px">닉네임</th>
					<th scope="col" style="width:50px">추천수</th>
					<th scope="col" style="width:120px">작성일</th>
					<th scope="col" style="width:80px;">리뷰관리</th>
					</tr>
				</thead>
				<tbody>
					<% if( cList.isEmpty() ) { %>
					<tr>
						<td colspan="8">
							등록된 리뷰가 없습니다.
						</td>
					</tr>
					<% } else { 
						for ( AdminReview b : cList ) {%>
					<tr>
						<th scope="row"><input type="checkbox" name="selectContent" value="<%=b.getrNo()%>"></th>
						<th scope="row cnoNum"><%=b.getrNo()%></th>
						<td><%=b.getMobileName()%></td>
						<td><a href="<%=request.getContextPath()%>/spec.mo?mno=<%=b.getrRefMno()%>&page=2" target="_blank">
							<% if ( b.getrStatusCode() == 1 ) { %>
								<%=b.getrContent().replaceAll("<br>"," ").length() > 20 ? b.getrContent().replaceAll("<br>"," ").substring(0, 19) : b.getrContent().replaceAll("<br>"," ")%>
							<% } else if ( b.getrStatusCode() == 2 ) { %>
								<del class="delContent"><%=b.getrContent().replaceAll("<br>"," ")%></del>
							<% } else if ( b.getrStatusCode() == 3 ) { %>
								<i class="material-icons reportContent">lock</i><%=b.getrContent().replaceAll("<br>"," ")%>
							<% } %>
						</a></td>
						<td id="<%=b.getrWriterNo()%>"><%= b.getrWriterName()%></td>
						<td><%=b.getrRegDate() %></td>
						<td class="control"><span class="report">경고</span><span class="delete">삭제</span></td>
					</tr>
						<% }
					} %>
				</tbody>
			</table>

		
			<div class="input-group input-group-sm mb-3">
			<label class="my-1 mr-2" for="inlineFormCustomSelectPref">선택한&nbsp;<span id="selectCount">0</span>개 리뷰 편집 : </label>
			<select class="custom-select my-1 mr-sm-2 custom-select-sm" id="inlineFormCustomSelectPref">
				<option value="2">삭제</option>
				<option value="3">경고</option>
			</select> 
			<button type="button" class="btn btn-light my-1 border btn-sm" id="pluralRequest">확인</button>
			<div class="space"></div>
			<select class="custom-select my-1 mr-sm-2 custom-select-sm" id="searchSelect">
				<option value="1">닉네임</option>
				<option value="2">리뷰제목</option>
				<option value="3">기종명</option>
				<option value="4">BRAND</option>
			</select> 
			<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" id="serarchKeyW">
			<div class="input-group-append">
			  <button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon2">검색</button>
			</div>
			</div>
		</form>

					
					<!------- 페이징 바 ------->
		<!-- 페이징 처리 시작! -->
		<div class="pagingArea">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href=<% if ( sort != 0 ) { %>'<%= request.getContextPath() %>/adminComment.ad?currentPage=1&limit=<%=limit%>&sort=<%=sort%>'<% } else { %>'<%= request.getContextPath() %>/commentSearch.ad?currentPage=1&limit=<%=limit%>&type=<%=searchType%>&keyWord=<%=keyWord%>'<% } %>">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1 || currentPage <= pagingBarSize ) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href=<% if (sort != 0 ) { %>'<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage-pagingBarSize %>&limit=<%=limit%>&sort=<%=sort%>'<% } else { %>'<%= request.getContextPath() %>/commentSearch.ad?currentPage=<%= currentPage-pagingBarSize %>&limit=<%=limit%>&type=<%=searchType%>&keyWord=<%=keyWord%>'<% } %>">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href=<% if ( sort != 0 ) { %>'<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= p %>&limit=<%=limit%>&sort=<%=sort%>'<% } else { %>'<%= request.getContextPath() %>/commentSearch.ad?currentPage=<%= p %>&limit=<%=limit%>&type=<%=searchType%>&keyWord=<%=keyWord%>'<% } %>"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href=<% if ( sort != 0 ) { %>'<%= request.getContextPath() %>/adminComment.ad?currentPage=<% if ( maxPage - currentPage >= pagingBarSize ) { %><%=currentPage+pagingBarSize%><% } else { %><%=maxPage%><% } %>&limit=<%=limit%>&sort=<%=sort%>'<% } else { %>'<%= request.getContextPath() %>/commentSearch.ad?currentPage=<% if ( maxPage - currentPage >= pagingBarSize ) { %><%=currentPage+pagingBarSize%><% } else { %><%=maxPage%><% } %>&limit=<%=limit%>&type=<%=searchType%>&keyWord=<%=keyWord%>'<% } %>">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href=<% if ( sort != 0 ) { %>'<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= maxPage %>&limit=<%=limit%>&sort=<%=sort%>'<% } else { %>'<%= request.getContextPath() %>/commentSearch.ad?currentPage=<%= maxPage %>&limit=<%=limit%>&type=<%=searchType%>&keyWord=<%=keyWord%>'<% } %>">&gt;&gt;</span>
		</div>
		<div class="input-group input-group-sm mb-3">
		<select class="custom-select my-1 mr-sm-2 custom-select-sm" id="selectLimit">
				<option>---</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
			</select> 
		</div>
				</div>
		<div class="clear"></div>
	</section>
	<script>
		$(function(){
			// 경고처리를 하나 눌렀을 떄
			$(".report").click(function(){
				var cno = $(this).parent().parent().children().eq(1).text();
				Swal.fire({
				title: '댓글 경고',
				text: "해당 댓글을 경고처리 하시겠습니까?",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '경고',
				cancelButtonText: '취소'
				}).then((result) => {
				if (result.value) {
					reportReview(cno);
				}
				});
			});
			// 삭제처리를 하나 눌렀을 떄
			$(".delete").click(function(){
				var cno = $(this).parent().parent().children().eq(1).text();
				Swal.fire({
				title: '댓글 삭제',
				text: "해당 댓글을 삭제하시겠습니까?",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '삭제',
				cancelButtonText: '취소'
				}).then((result) => {
				if (result.value) {
					deleteReview(cno);
				}
				});
			});
			//전체 선택 체크박스의 상태가 변할 때 전체선택
			$("#selectAll").change(function(){
				if (this.checked) {
					$("input[name=selectContent]").prop("checked",true);
				} else {
					$("input[name=selectContent]").prop("checked",false);
				}
				$("#selectCount").text($("input[name=selectContent]:checked").length);
			});
			// 체크한 갯수가 바뀔 떄 카운트
			$("input[name=selectContent]").change(function(){
				$("#selectCount").text($("input[name=selectContent]:checked").length);
			});
			// 복수의 글 체크 후 확인을 눌렀을 때
			$("#pluralRequest").on("click",function(){
				if ($("input[name=selectContent]:checked").length == 0 ) return false;
				var ckStr = "";
				$("input[name=selectContent]:checked").each(function(){
					ckStr += $(this).val() + "/";
				});
				var type = $("#inlineFormCustomSelectPref").val();
				if ( type == 2 ) {
					Swal.fire({
					title: '댓글 삭제',
					text: "해당 댓글을 삭제하시겠습니까?",
					type: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '삭제',
					cancelButtonText: '취소'
					}).then((result) => {
					if (result.value) {
						deleteReview(ckStr);
					}
					});
				} else if ( type == 3 ) {
					Swal.fire({
					title: '댓글 경고',
					text: "해당 댓글을 경고처리 하시겠습니까?",
					type: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '경고',
					cancelButtonText: '취소'
					}).then((result) => {
					if (result.value) {
						reportReview(ckStr);
					}
					});
				}
			});
			// 검색 버튼 눌렀을 떄
			$("#button-addon2").on("click",function(){
				var keyWord = $("#serarchKeyW").val().trim();
				if ( keyWord.length == 0 ) return false;
				var type = $("#searchSelect").val();

				location.href='<%=request.getContextPath()%>/commentSearch.ad?type='+type+'&keyWord='+keyWord+'&limit=<%=limit%>';

			});
			// limit 변경했을때
			$("#selectLimit").change(function(){
				var limit = $(this).val();
				if ( limit != "---" && <%=sort!= 0%> ) {
					location.href='<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage %>&limit='+limit+'&sort=<%=sort%>';
				} else {
					location.href='<%= request.getContextPath() %>/commentSearch.ad?currentPage=<%= currentPage %>&limit='+limit+'&type=<%=searchType%>&keyWord=<%=keyWord%>';
				}
			});
			// sort 변경했을 때
			$("#noOrderBy").on("click", function(){
				if ( <%=sort != 2%> ) {
					location.href='<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage %>&limit=<%=limit%>&sort=2';
				} else {
					location.href='<%= request.getContextPath() %>/adminComment.ad?currentPage=<%= currentPage %>&limit=<%=limit%>';
				}
			});
			// 글제목 화살표 표시했을때 display 변경
			$("#conTypeSelect").on("click", function(){
				if ( $("#myDropdown").css("display") == "none" ) {
					$("#myDropdown").css("display","block");
				} else {
					$("#myDropdown").css("display","none");
				}
			});
			$("#conTableSelect").on("click", function(){
				if ( $("#myDropdown2").css("display") == "none" ) {
					$("#myDropdown2").css("display","block");
				} else {
					$("#myDropdown2").css("display","none");
				}
			});
		});
		// 펑션모음
		function deleteReview(cno){
			location.href='<%=request.getContextPath()%>/commentUpdate.ad?currentPage=<%=currentPage%>&type=2&cno='+cno+'&tno='+tno+'&limit=<%=limit%>&sort=<%=sort%>';
		}
		function reportReview(cno){
			location.href='<%=request.getContextPath()%>/commentUpdate.ad?currentPage=<%=currentPage%>&type=3&cno='+cno+'&tno='+tno+'&limit=<%=limit%>&sort=<%=sort%>';
		}
	</script>
</body>
</html>