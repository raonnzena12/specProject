<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    #reviewTable{
    	text-align:center;
    }
</style>
<title>작성글 보기</title>
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
	<%@ include file="/views/common/menubar.jsp" %>
	
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/views/member/mypageInfo.jsp" >회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myArticleList.jsp">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/views/member/myReviewList.jsp" id="now">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    <div id="articleLayer">
	    <div id="articleText">
	    	<p class="font">작성 리뷰 보기</p>
	    	<p class="total">Total : 2</p>
	    </div>
    	<table id="reviewTable" class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col" width="80px">번호</th>
		      <th scope="col" width="400px">제목</th>
		      <th scope="col">리뷰 기종</th>
		      <th scope="col">날짜</th>
		      <th scope="col" width="120px">추천수/비추수</th>
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
		    <tr>
		      <th scope="row">2</th>
		      <td>Jacob</td>
		      <td>Thornton</td>
		      <td>@fat</td>
		      <td>@fat</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Larry the Bird</td>
		      <td>@twitter</td>
		      <td>@twitter</td>
		      <td>@twitter</td>
		    </tr>
		  </tbody>
		</table>
    </div>
    
</body>
</html>