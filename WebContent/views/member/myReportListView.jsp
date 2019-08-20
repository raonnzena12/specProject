<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,mobile.model.vo.PageInfo, mobile.model.vo.Report"%>
<%
	ArrayList<Report> rpList = (ArrayList<Report>)request.getAttribute("rpList");
	
	PageInfo pIf = (PageInfo)request.getAttribute("pIf");
	
	int boardCount = pIf.getListCount();
	int currentPage = pIf.getCurrentPage();
	int maxPage = pIf.getMaxPage();
	int startPage = pIf.getStartPage();
	int endPage = pIf.getEndPage();
	int limit = pIf.getLimit();
	int pagingBarSize = pIf.getPagingBarSize();


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
    	width: 1080px;
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
    	width:100%;
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
	.complete{
		color:#5ABEF5;
	}
</style>
<title>작성글 보기</title>
<%@ include file="/views/common/menubar.jsp" %>
<script>
	$(function() {

		console.log(<%= rpList.isEmpty()%>)
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
			<li><a href="<%=request.getContextPath()%>/myBoardList.me">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReviewList.me">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReportList.me" id="now">신고내역보기</a></li>
		</ul>
    </nav>
    <div id="articleLayer">
	    <div id="articleText">
	    	<p class="font">신고 내역 보기</p>
	    	<p class="total"><%=pIf.getListCount()%></p>
	    </div>
    	<table id="articleTable" class="table">
		  <thead>
		    <tr>
		      <th scope="col" width="250px">신고내용</th>
		      <th scope="col" width="100px">처리현황</th>
		      <th scope="col" width="200px">신고 된 글</th>
		      <th scope="col" width="150px">날짜</th>
		    </tr>
		  </thead>
		  <tbody>
		    
		    <% if(rpList.isEmpty()){ %>
            	<tr> 
            		<td colspan="5"> 등록된 게시글이 없습니다.</td>
            	</tr>
            	<% }else{ %>
            		<%for(Report r : rpList){ %>
            		<tr>
            			<td><%= r.getrContent()%></td>
            			<td><%if(r.getrResult() == 0){%>미처리<%}else{%><p class="complete">[처리완료]</p><%} %></td>
            			<td>[<%= r.getReRefContType()%>]<br><% String tmp =""; if(r.getReRefCont().replaceAll("<br>"," ").length() > 20){ tmp = r.getReRefCont().replaceAll("<br>"," ").substring(10) + "...";}else{ tmp = r.getReRefCont().replaceAll("<br>"," ");} %><%= tmp %></td>
            			<td><%= r.getrDate()%></td>
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
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/myReportList.me?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/myReportList.me?currentPage=<%= currentPage-1 %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/myReportList.me?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/myReportList.me?currentPage=<%= currentPage+1 %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/myReportList.me?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
		
	
</body>
</html>