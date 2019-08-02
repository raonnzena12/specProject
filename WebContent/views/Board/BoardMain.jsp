<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardMain</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

        <style>
       body{
           	width: 1080px;
         	height: 1000px;
           	margin: auto;
          	padding: 0;
       	}
       	#header{
        	width: 100%;
        	height : 80px;
        	margin : 0;
        	paddin : 0;
        	clear : both;
        }
       /*  body{
            width: 1080px;
            height: auto;
        	margin: auto;
        }
       article, section,nav{
          border: 1px solid black;
            margin: 0;
            padding: 0;
            width: 1080px;
        } */
      #header{
        	width: 100%;
        	height : 80px;
        	margin : 0;
        	paddin : 0;
        	clear : both;
        } */
        #bnav{
            width: 1080px;
            height: 100px;
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
        #list{
            width: 1080px;
            height: 500px;
            margin: auto;
            padding: 0;
        }
        #btn{
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
        }
        /* -----틀잡기----- */
       
       
       #ad-2{
            width: 1000px;
            height: 80%;
           /*  margin-top: 20px; */
            margin-left: 38px;
            background-color: gray;
            color : white;
        }
        #menu{
            width: 1080px;
            height: 100px;
            padding-top: 15px;
            margin : auto;
        }
        #page{
            padding-left: 450px; 
        } 
        </style>
</head>
<body>
	<header id="header">
			<%@include file="/views/common/menubar.jsp"%>
	</header>
	<nav id="bnav">
		<%@include file="/views/Board/BoardListNav.jsp"%>
	</nav>
    <section id="ad">
     <article id="ad-2">광고</article>
   	</section>
   	<section id="list">
   		<%@include file="/views/Board/BoardList.jsp" %>
   	</section>
    
	
</body>
</html>