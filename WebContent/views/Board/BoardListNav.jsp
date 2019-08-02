<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList Nav</title>
 
 	<style>
		 #bnav{
		 	width: 1080px;
			height: 100px;
			margin: auto;
			padding: 0;
			clear : both; 
		}
		#menu > a{
            text-decoration: none;
            padding: 40px;
            color: #00264B;
            
            
        }
        #menu > a:hover{
            text-decoration: none;
            color: rgb(53, 12, 236);
        }
        #menu{
        padding-top:30px;
        }
        
	</style>
</head>
<body>
	<nav id="bnav">
		<article id="menu">
	    	<a href="">전체게시판</a>|
	        <a href="">Apple게시판</a>|
	        <a href="">LG게시판</a>|
	        <a href="">삼성게시판</a>|
	        <a href="">타브랜드게시판</a>|
	        <a href="">자유게시판</a>
	    </article>
    </nav>
</body>
</html>