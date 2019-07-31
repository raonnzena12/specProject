<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       
        <style>
        body{
            width: 1080px;
            height: auto;
            margin: auto;
        }
        article, section,nav{
            /* border: 1px solid black; */
            margin: 0;
            padding: 0;
            width: 1080px;
        }
        #header{
        	width: 100%;
        	height : 80px;
        	margin : 0;
        	paddin : 0;
        	clear : both;
        }
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
        #menu > a{
            text-decoration: none;
            padding: 40px;
            color: #00264B;
            
        }
        #menu > a:hover{
            text-decoration: none;
            color: rgb(53, 12, 236);
        }
        
       
       #ad-2{
            width: 1000px;
            height: 80%;
            margin-top: 20px;
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
		<article id="menu">
	    	<a href="">전체게시판</a>|
	        <a href="">Apple게시판</a>|
	        <a href="">LG게시판</a>|
	        <a href="">삼성게시판</a>|
	        <a href="">타브랜드게시판</a>|
	        <a href="">자유게시판</a>
	    </article>
    </nav>
    <section id="ad">
     <article id="ad-2">광고</article>
   	</section>
    <section id="list">
      	<table class="table table-hover">
        	<thead>
            	<tr>
                    <th scope="col">Type</th>
                    <th scope="col">Column heading</th>
                    <th scope="col">Column heading</th>
                    <th scope="col">Column heading</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">Default</th>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                </tr>
                <tr>
                    <th scope="row">Default</th>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                </tr>
            </tbody>   
       	</table>
   	</section>
    <section id="btn">
       	<button type="button" class="btn btn-secondary"style="background-color : white; color : black; display : block; float : left; margin-right : 10px;">목록</button>
        <form class="form-inline my-2 my-lg-0">
	        <input class="form-control mr-sm-2" type="text" placeholder="Search">
	        <button type="button" class="btn btn-secondary"style="background-color : white; color : black; display : block; float : left;">Secondary</button>
        </form>

    </section>
    <section id="page">
		<div>
	         <ul class="pagination pagination-sm">
	   			<li class="page-item disabled">
	   				<a class="page-link" href="#">&laquo;</a>
	   			</li>
	   			<li class="page-item active">
	   				<a class="page-link" href="#">1</a>
	    		</li>
	            <li class="page-item">
	                 <a class="page-link" href="#">2</a>
	      		</li>
	     		<li class="page-item">
	    			<a class="page-link" href="#">3</a>
	   			</li>
	   			<li class="page-item">
	    			<a class="page-link" href="#">4</a>
	    		</li>
	    		<li class="page-item">
	     			<a class="page-link" href="#">5</a>
	     		</li>
	    		 <li class="page-item">
	     			<a class="page-link" href="#">&raquo;</a>
	     		</li>
   			</ul>
   		</div> 
  	</section>
        
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
	
</body>
</html>