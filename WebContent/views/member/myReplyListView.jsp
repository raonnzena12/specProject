<%@page import="java.util.ArrayList"%>
<%@page import="board.model.vo.BoardPageInfo,board.model.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Reply> rList = (ArrayList<Reply>)request.getAttribute("rList");
	
	BoardPageInfo bpi = (BoardPageInfo)request.getAttribute("bpi");
	
	int boardCount = bpi.getBoardCount();
	int currentPage = bpi.getCurrentPage();
	int maxPage = bpi.getMaxPage();
	int startPage = bpi.getStartPage();
	int endPage = bpi.getEndPage();
	int limit = bpi.getLimit();
	int pagingBarSize = bpi.getPageingBarSize();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#mypageNav{
    	width:1000px;
    	height: 100px;
    	margin-top: 5%;
    }
	#mypageNav ul>li{
        width: 15%;
        float: left;
        list-style-type: none;
        line-height: 80px;
        
        margin: 0 10px;
        text-align: center;
    }

    #mypageNav ul a {
    	color: gray;
        text-decoration:none;
        font-size: 20px;
        font-weight: bold;
    }
    
    #articleLayer{
    	width: 1000px;
    	min-height: 500px;
    	height: auto;
    	margin:auto;
    }
    
    /* *{
    	border: 1px solid black;
    } */
    .font{
    	font-size: 40px;
    	text-align: right;
    }
    
    .total{
    	font-size: 20px;
    	text-align: right;
    	color: gray;
    }
    #articleText{
    	margin-bottom: 10px;
    	
    }
    #articleText p{
    	margin:0;
    }
    
    #now{
    	padding-bottom : 10px;
		border-bottom: 2px solid #00264B; 
    }
    
    #articleTable{
    	text-align:center;
    }
    #page{
            width: 1080px;
            height: 100px;
            margin: auto;
            padding: 0;
            padding-left: 450px;
        }
        
        
    .pagingBtn{
		text-decoration: none;
		color : white;
		display : inline-block;
		width : 25px;
		height : 25px;
	}
	.pagingArea{
		CLEAR:both;
		height: 50px;
		position: relative;
	}
	
	.pagingArea span{
/* 		position: absolute;
		margin: auto;
		top: 10px;
		left: 15%; */
		color: black;
	}
	.white{
		color:white;
		font-size:10px;
	}
</style>
<title>작성글 보기</title>
<%@ include file="/views/common/menubar.jsp" %>
<script>
	$(function() {

		console.log(<%= rList.isEmpty()%>)
		$("a").mouseenter(function() {
			$(this).css("color", "#00264B");
		}).mouseleave(function() {
			$(this).css("color", "gray");
		});
		
	});
</script>
</head>
<body>
	
	
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage.me">회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/myBoardList.me" >작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReviewList.me">작성리뷰보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReplyList.me" id="now">작성댓글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReportList.me">신고내역보기</a></li>
		</ul>
    </nav>
    <div id="articleLayer">
	    <div id="articleText">
	    	<p class="font">작성 댓글 보기</p>
	    	<p class="total">Total : <%=boardCount%></p>
	    </div>
    	<table id="articleTable" class="table table-hover">
		  <thead>
		    <tr>
		      <!-- th scope="col" width="80px">번호</th> -->
		      <th scope="col" width="60px" class="white">page</th>
		      <th scope="col" width="60px" class="white">ref</th>
		      <th scope="col" width="400px">내용</th>
		      <th scope="col" width="200px">글제목</th>
		      <th scope="col" width="200px">등록일</th>
		      <th scope="col" width="200px">수정일</th>
		    </tr>
		  </thead>
		  <tbody>
		    
		    <% if(rList.isEmpty()){ %>
            	<tr> 
            		<td colspan="5"> 작성된 댓글이 없습니다.</td>
            	</tr>
            	<% }else{ %>
            		<%for(Reply r : rList){ %>
            		<tr>
            			<%-- <td><%= r.getcNo()%></td> --%>
            			<td class="white"><%= r.getcTableNo()%></td>
            			<td class="white"><%= r.getRefNo()%></td>
            			<td><% String tmp =""; if(r.getcContent().replaceAll("<br>"," ").length() > 20){ tmp = r.getcContent().replaceAll("<br>"," ").substring(10) + "...";}else{ tmp = r.getcContent().replaceAll("<br>"," ");} %><%= tmp %></td>
            			<td>[<%= r.getRefContType()%>]<br><%if(r.getRefCont() != null){ %><%=r.getRefCont() %><%} %></td>
            			<td><%= r.getcRegdate2()%></td>
            			<td><%= r.getcModidate2()%></td>
            		</tr>
            		<% } %>
            	<% } %>
		  </tbody>
		</table>
    </div>
    <!-- 페이징바 -->
    <!-- 페이징 처리 시작! -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/myReplyList.me?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/myReplyList.me?currentPage=<%= currentPage-1 %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/myReplyList.me?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/myReplyList.me?currentPage=<%= currentPage+1 %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/myReplyList.me?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
		
		<script>
		// 게시판 상세보기
		<%if(!rList.isEmpty()){%>
		$("#articleTable td").mouseenter(function(){
			$(this).parent().css("cursor","pointer");
		}).click(function(){
			var cno = $(this).parent().children().eq(0).text();
			var tno = $(this).parent().children().eq(1).text();
			var rno = $(this).parent().children().eq(2).text();
			// 로그인 한 사람만 게시글 상세보기 가능
				<% if(loginUser != null){ %>
					if(tno == 1){
						location.href="<%= request.getContextPath() %>/content.bo?bno="+rno +"&bcode=0";
					}else if(tno == 2){
						location.href="<%= request.getContextPath() %>/spec.mo?mno="+rno +"&page=1";
					}else{
						location.href="<%= request.getContextPath() %>/compareSpec.mo?mno="+rno;
					}
				<% } else{ %>
					alert("로그인해야만 상세보기가 가능합니다!");
				<% } %>
		});
		<%}%>
		
		// 페이징바 마우스오버 이벤트
		$(".clickBtn").mouseenter(function(){
			$(this).css("cursor","pointer");
		}).click(function(){
			$(this).css("font-weight","bold");
		});
		</script>
</body>
</html>
