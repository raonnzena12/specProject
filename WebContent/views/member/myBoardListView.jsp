<%@page import="java.util.ArrayList"%>
<%@page import="board.model.vo.BoardPageInfo,board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> mList = (ArrayList<Board>)request.getAttribute("mList");
	
	BoardPageInfo bpi = (BoardPageInfo)request.getAttribute("bpi");
	
	int boardCount = 1;
	int currentPage = 2;
	int maxPage = 3;
	int startPage = 4;
	int endPage = 5;
	int limit = 6;
	int pagingBarSize = 7;


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
        width: 20%;
        float: left;
        list-style-type: none;
        line-height: 80px;
        
        margin: 0 15px;
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
    	height: 500px;
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
	
	
	.pagingArea span{
		position: absolute;
		margin: auto;
		top: 10px;
		left: 15%;
	}
</style>
<title>작성글 보기</title>
<%@ include file="/views/common/menubar.jsp" %>
<script>
	$(function() {

		console.log(<%= mList.isEmpty()%>)
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
			<li><a href="<%=request.getContextPath()%>/myBoardList.me" id="now">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myReviewList.jsp">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    <div id="articleLayer">
	    <div id="articleText">
	    	<p class="font">작성글 보기</p>
	    	<p class="total"><%=mList.size()%></p>
	    </div>
    	<table id="articleTable" class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col" width="80px">번호</th>
		      <th scope="col" width="400px">제목</th>
		      <th scope="col" width="150px">날짜</th>
		      <th scope="col">조회수</th>
		      <th scope="col" width="100px">댓글수</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">1</th>
		      <td>Mark</td>
		      <td>Otto</td>
		      <td>@mdo</td>
		      <td>@mdo</td>
		    </tr>
		    <% if(mList.isEmpty()){ %>
            	<tr> 
            		<td colspan="5"> 등록된 게시글이 없습니다.</td>
            	</tr>
            	<% }else{ %>
            		<%for(Board b2 : mList){ %>
            		<tr>
            			<td><%= b2.getbNo()%></td>
            			<td><%= b2.getCgCategory()%></td>
            			<td><%= b2.getbTitle()%></td>
            			<td><%= b2.getbRegdate2()%></td>
            			<td><%= b2.getbCount()%></td>
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
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage-1 %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage+1 %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
</body>
</html>