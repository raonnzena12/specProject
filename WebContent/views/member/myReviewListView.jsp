<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,mobile.model.vo.PageInfo, mobile.model.vo.Review"%>
<%
	ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");

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
    	height: 100%;
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
    
    #reviewTable{
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
</style>
<title>작성글 보기</title>
	<%@ include file="/views/common/menubar.jsp" %>
<script>
	$(function() {

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
			<li><a href="<%=request.getContextPath()%>/mypage.me" >회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/myBoardList.me">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReviewList.me" id="now">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    <div id="articleLayer">
	    <div id="articleText">
	    	<p class="font">작성 리뷰 보기</p>
	    	<p class="total">Total : <%=boardCount %></p>
	    </div>
    	<table id="reviewTable" class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col" width="80px">토글</th>
		      <th scope="col" width="50px"></th>
		      <th scope="col" width="400px">제목</th>
		      <th scope="col" width="200px">리뷰 기종</th>
		      <th scope="col" width="200px">날짜</th>
		      <th scope="col" width="80px">추천수</th>
		    </tr>
		  </thead>
		  <tbody>
		    <% if(rList.isEmpty()){ %>
		    <tr>
		    	<td colspan="5">등록한 리뷰가 없습니다.</td>
		    </tr>
		    <% } else{ %>
		    	<% for(Review r : rList){ %>
		    	<tr>
		    		<td><%=r.getRnum() %></td>
		    		<td><%=r.getrRefMno() %></td>
		    		<td><%=r.getrTitle() %></td>
		    		<td><%=r.getrDeviceName() %></td>
		    		<td><%=r.getrRegDate2() %></td>
		    		<td><%=r.getrLike() %></td>
		    	</tr>
		    	<% } %>
		    <% } %>
		  </tbody>
		</table>
    </div>
    <!-- 페이징 처리 시작! -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로(<<) -->
			<span class="pagingBtn clickBtn" onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=1'">&lt;&lt;</span>
		
			<!-- 이전 페이지로(<) -->
			<% if(currentPage <= 1) { %>
				<span class="pagingBtn">&lt;</span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= currentPage-1 %>'">&lt;</span>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage) { %>
					<span class="pagingBtn selectBtn"><%= p %></span>
				<% } else{ %>
					<span class="pagingBtn clickBtn" 
						onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= p %>'"><%=p%></span>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage >= maxPage){ %>
				<span class="pagingBtn"> &gt; </span>
			<% } else{ %>
				<span class="pagingBtn clickBtn" 
					onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= currentPage+1 %>'">&gt;</span>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<span class="pagingBtn clickBtn"
				onclick="location.href='<%= request.getContextPath() %>/myReviewList.me?currentPage=<%= maxPage %>'">&gt;&gt;</span>
		</div>
		
		<script>
		// 게시판 상세보기
		
		console.log('<%= rList.get(1).getrRegDate2()%>');
		
		$("#reviewTable td").mouseenter(function(){
			$(this).parent().css("cursor","pointer");
		}).click(function(){
			var mno = $(this).parent().children().eq(1).val();
			
			console.log(mno);
			// 로그인 한 사람만 게시글 상세보기 가능
			<%-- <% if(loginUser != null){ %>
				location.href="<%= request.getContextPath() %>/spec.mo?mno="+mno + "&page=2";
			<% } else{ %>
				alert("로그인해야만 상세보기가 가능합니다!");
			<% } %> --%>
		});
		
		// 페이징바 마우스오버 이벤트
		$(".clickBtn").mouseenter(function(){
			$(this).css("cursor","pointer");
		}).click(function(){
			$(this).css("font-weight","bold");
		});
		</script>
</body>
</html>