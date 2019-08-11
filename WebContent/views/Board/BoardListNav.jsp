<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList Nav</title>
 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<style>
		 #boardnav{
		 	width: 1080px;
			height: 140px;
			margin: auto;
			padding: 0;
			clear : both; 
		}
		#boardnav> #menu > div{ 
            padding: 40px;
            color: #00264B;
            display:block;
            float:left;
            border-radius: 5px;
          	/* border: 1px solid black; */
          	
            
            
        }
        #menu > div:hover{
            text-decoration: none;
            color: rgb(53, 12, 236);
        }
        #menu{
       /*  padding-top:30px; */
       margin-top: 35px;
       margin-left:70px;
       padding:0;
       padding-botton:5px;
        }
       
        
	</style>
</head>
<body>
	<nav id="boardnav">
		<article id="menu">
	    	<div id="total" onclick="goBoard(0);">전체 게시판</div>
	    	
	        <div id="samsung" onclick="goBoard(1);">삼성게시판</div>
	       
	        <div id="lg" onclick="goBoard(2);">LG게시판</div>
	        
	        <div id="apple" onclick="goBoard(3);">Apple게시판</div>
	      
	        <div id="etc" onclick="goBoard(4);">타브랜드게시판</div>
	        
	        <div id="free" onclick="goBoard(5);">자유게시판</div>
	        
	    </article>
    </nav>
    <script>
    	function goBoard(num){
    		location.href="<%=request.getContextPath()%>/maintotal.bo?bno="+num;
    		
    	$(function(){
    		$("#menu div").click(function(){
    			$(this).css({"background-color": "#00264B", "color" : "white"});
    		}).mouseout(function(){
    			$(this).css({"background-color": "#00264B", "color" : "white"});
    		});
    	});
    			
    		
    	}
    
    	<%-- function goTotal(){
    		var boardType = 1
    		location.href="<%=request.getContextPath()%>/maintotal.bo";
    	}
    	function goApple(){
    		location.href="<%=request.getContextPath()%>/mainapform.bo";
    	}
    	function goLg(){
    		location.href="<%=request.getContextPath()%>/mainlgform.bo";
    	}
    	function goSamsung(){
    		location.href="<%=request.getContextPath()%>/mainsamform.bo";
    	}
    	function goEtc(){
    		location.href="<%=request.getContextPath()%>/mainetcform.bo";
    	}
    	function goFree(){
    		location.href="<%=request.getContextPath()%>/mainfrform.bo";
    	}
    	 --%>
    </script>
   
</body>
</html>