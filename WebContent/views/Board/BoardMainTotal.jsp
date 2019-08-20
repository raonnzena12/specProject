<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board" import="java.util.ArrayList" import="board.model.vo.BoardPageInfo"%>
    
<%
	ArrayList<Board> tlist = (ArrayList<Board>)request.getAttribute("tlist");
	
	BoardPageInfo bpi = (BoardPageInfo)request.getAttribute("bpi");
	
	int boardCount = bpi.getBoardCount();
	int currentPage = bpi.getCurrentPage();
	int maxPage = bpi.getMaxPage();
	int startPage = bpi.getStartPage();
	int endPage = bpi.getEndPage();
	int limit = bpi.getLimit();
	int pagingBarSize = bpi.getPageingBarSize();
	
	/* request.setAttribute("tlist", tlist);
	request.setAttribute("bpi", bpi); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardMainTotal</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

        <style>
	       #Boardtotal{
	           /* 	width: 100%; */
	         	height: auto;
	           	margin: auto;
	          	padding: 0;
	          	color: black;
	       	}
	       	#header{
	        	width: 100%;
	        	/* height : 80px; */
	        	margin : 0;
	        	padding : 0;
	        	clear : both;
	        }
	     /*  body{
	            width: 1080px;
	            height: auto;
	        	margin: auto;
	        } */
	       /* article, section,nav{
	          border: 1px solid black; */
	            /* margin: 0;
	            padding: 0;
	            width: 1080px; */
	        }
	        #bnav{
	            width: 1080px;
	            height: 150px;
	            margin: auto;
	            padding: 0;
	            clear : both;
	            
	        }
	         #ad{
	            width: 1080px;
	            height: 200px;
	            margin: auto;
	            padding: 0;
	        }
	        #blist{
	            width: 1080px;
	            height: 600px;
	            margin: auto;
	            padding: 0;
	        }
	       /*  #btn{
	            width: 1080px;
	            height: 100px;
	            margin: auto;
	            padding-top: 5px;
	            
	        }
	        #page{
	            width: 1080px;
	            height: 100px;
	            margin: auto;
	            padding: 0;
	        } */
	        /* -----틀잡기----- */
	       
	       
	       #ad-2{
	            width: 1000px;
	            height: 80%;
	           /*  margin-top: 20px; */
	            margin-left: 38px;
	            background-color: gray;
	            color : white;
	        }
	       /*  #menu{
	            width: 1080px;
	            height: 100px;
	            padding-top: 15px;
	            margin : auto;
	        }
	        #page{
	            padding-left: 450px; 
	        }  */
	        
	        #boardlist{
	            width: 1080px;
	            height: 550px;
	            margin: auto;
	            padding: 0;
	            color: black;
	        }
			#boardbtn{
		            width: 1080px;
		            height: 80px;
		            margin: auto;
		            padding-top: 10px;
		            color: black;
		            
		        }
		   	#boardpage{
		            width: 1080px;
		            height: 100px;
		            margin: auto;
		            padding: 0;
		            padding-left: 360px;
		            color: black;
		        }
		    #searchselect{
		    	margin:0;
		    	padding: 0;
		    	float:left;
		    	display: block;
		    	padding-top: 5px;
		    	padding-bottom: 8px;
		    	margin-left:10px;
		    	color: black;
		    	
		    	
		    }
		    .form-inline{
		           display: block;
		           float: left;
		           margin-right: 10px;
		           margin-top:0;
		       }
		    #boardlisttable{
		    	text-align: center;
		    	color: black;
		    }
		    
        </style>
</head>
<body id="Boardtotal">
	<header id="header">
			<%@include file="/views/common/menubar.jsp"%>
	</header>
	
	<nav id="bnav"> 
		<%@include file="/views/Board/BoardListNav.jsp"%>
	</nav>
	<script>
		$(document).ready(function(){
			switch(<%=request.getAttribute("bno")%>){
			case 0 : $("#total").css({"background-color": "#00264B", "color" : "white"}); break;
			case 1: $("#lg").css({"background-color": "#00264B", "color" : "white"}); break;
			case 2: $("#samsung").css({"background-color": "#00264B", "color" : "white"}); break;
			case 3: $("#apple").css({"background-color": "#00264B", "color" : "white"}); break;
			case 4: $("#etc").css({"background-color": "#00264B", "color" : "white"}); break;
			case 5: $("#free").css({"background-color": "#00264B", "color" : "white"}); break;
			}
		});
	</script>
	
    <section id="ad">
     <article id="ad-2">광고</article>
   	</section>
   	
   	<section id="blist">
   		<section id="boardlist">
	      	<table class="table table-hover" id="boardlisttable">
	        	<thead>
	            	<tr>
	                    <th scope="col" width="10%">번호</th>
	                    <th scope="col" width="10%">분류</th>
	                    <th scope="col" width="55%">제목</th>
	                    <th scope="col" width="15%">날짜</th>
	                    <th scope="col" width="10%">조회</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<% if(tlist.isEmpty()){ %>
	            	<tr>
	            		<td colspan="5"> 등록된 게시글이 없습니다.</td>
	            	</tr>
	            	<% }else{ %>
	            		<%for(Board b : tlist){ %>
	            		<tr>
	            			<td><%= b.getbNo()%></td>
	            			<td><%= b.getCgCategory()%></td>
	            			<td><%= b.getbTitle()%></td>
	            			<td><%= b.getbRegdate()%></td>
	            			<td><%= b.getbCount()%></td>
	            		</tr>
	            		<% } %>
	            	<% } %>
	            </tbody>   
	       	</table>
	   	</section>
	    
	    <section id="boardbtn">
	       	<button type="button" class="btn btn-secondary"style="background-color : white; color : black; display : block; font-weight:bold; float : left; margin: 0 10px 0 5px;" onclick="location.href='<%=request.getContextPath()%>/maintotal.bo?bno=<%=request.getAttribute("bno")%>'">목록</button>
	        
	        <form class="form-inline my-2 my-lg-0" action="<%=request.getContextPath() %>/boardSearch.bo" method="GET">
		        <input class="form-control mr-sm-2" type="text" name="text" placeholder="Search">
		        <input type="hidden" name="bno" value="<%=request.getAttribute("bno")%>">
		        <button type="submit" class="btn btn-secondary"style="background-color : white; color : black; font-weight:bold; margin:0;">검색</button>
		      	<select name="search" id="searchselect">
					<option value="title" selected>제목</option>
					<option value="titleContent">제목 + 내용</option>
					<option value="content">내용</option>
				<!-- 	<option value="head">말머리</option> -->
				</select>
	        </form>
			
			<%if(loginUser != null){ %>
				<button type="button" class="btn btn-secondary"style="background-color : white; color : black; display : block; font-weight:bold; float : right; margin: 0 10px 0 5px;" onclick="location.href='<%=request.getContextPath()%>/writeform.bo'">글쓰기</button>
			<% }else{ %>
			
			<%} %>
	    </section>
	    
	    <!-- 페이징바 -->
	    <section id="boardpage">
			<div>
		         <ul class="pagination pagination-sm">
		   			<!-- 맨 처음(<<) -->
		   			<li class="page-item ">
		   				<a class="page-link" href="<%= request.getContextPath()%>/maintotal.bo?currentPage=1&bno=<%=request.getAttribute("bno")%>">&laquo;</a>
		   			</li>
		   			<!-- 이전 페이지로 -->
		   			<% if(currentPage <= 1){ %>
		   				<li class="page-item">
			   				<a class="page-link">&lt;</a>
			   			</li>
		   			<% }else{%>
		   				<li class="page-item">
			   				<a class="page-link" href="<%=request.getContextPath()%>/maintotal.bo?currentPage=<%= currentPage-1 %>&bno=<%=request.getAttribute("bno")%>">&lt;</a>
			   			</li>
		   			<%} %>
		   			<!-- 페이지 목록 넘기기 -->
		   			<% for(int p = startPage; p <= endPage; p++){ %>
		   				<%if(p == currentPage){ %>
			   				<li class="page-item">
			   					<a class="page-link"><%= p %></a>
			   				</li>
			   			<% } else { %>
				   			<li class="page-item">
				   				<a class="page-link" href="<%= request.getContextPath()%>/maintotal.bo?currentPage=<%= p%>&bno=<%=request.getAttribute("bno")%>"><%= p %></a>
				   			</li>
			   			<% } %>
		   			<% } %>
		     		
		     		<!-- 다음 페이지로 -->
		     		<% if(currentPage >= maxPage){ %>
		   				<li class="page-item">
			   				<a class="page-link">&gt;</a>
			   			</li>
		   			<% }else{%>
		   				<li class="page-item">
			   				<a class="page-link" href="<%=request.getContextPath()%>/maintotal.bo?currentPage=<%= currentPage+1 %>&bno=<%=request.getAttribute("bno")%>">&gt;</a>
			   			</li>
		   			<%} %>
		     		<!-- 맨끝으로(>>) -->
		    		 <li class="page-item">
		     			<a class="page-link" href="<%=request.getContextPath()%>/maintotal.bo?currentPage=<%= maxPage %>&bno=<%=request.getAttribute("bno")%>">&raquo;</a>
		     		</li>
	   			</ul>
	   		</div> 
	  	</section>
   	</section>
   	
   	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
    <!-- <script>
    	$(document).ready(function(){
    		$("#total").css({"background-color": "#00264B", "color" : "white"});
    	}); 
    
    </script> -->
    
    <script>
    	// 게시판 상세보기
    	$(function(){
    		$("#boardlisttable td").click(function(){
    			
    			var bno = $(this).parent().children().eq(0).text();
    			<%if(loginUser !=null){%>	
    				location.href="<%= request.getContextPath() %>/content.bo?bno="+bno;
    				<%-- location.href="<%= request.getContextPath()%>/replyCount.bo?bno="+bno; --%>
    			<% } else{ %>
					alert("로그인해야만 상세보기가 가능합니다!");
				<% } %>
    			<%-- &bpi=<%=request.getAttribute("bpi")%>&tlist=<%=request.getAttribute("tlist")%> --%>
    		});
    	});
    </script>
	
</body>
</html>