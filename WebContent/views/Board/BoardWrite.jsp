<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>

        <!-- include libraries(jQuery, bootstrap) -->
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
        <!-- include summernote css/js -->
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
        <!-- include summernote-ko-KR -->
        <script src="lang/summernote-ko-KR.js"></script>

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
       section{
           	border: 1px solid black;
       	}
            #name{
                width: 1080px;
                height: 100px;
                margin: auto;
                padding: 0;
            }
            #title{
                width: 1080px;
                height: 50px;
                margin: auto;
                padding: 0;
            }
            #content{
                width:  1080px;
                height: 600px;
                margin: auto;
                padding: 0;  
            }
            #btn{
                width:  1080px;
                height: 100px;
                margin: auto;
                padding: 0;
            }
            /*---------------------------------------------*/
            #title-1{
                width: 810px;
                height: 50%;
                display: block;
                float: left;
                margin-top: 13px;
                margin-left: 20px;
                margin-right: 0;
                padding: 0;
            }
            #writetitle{
                font-size: 30px;
                padding: 0;
                margin-left: 10px;
                margin-top: 30px;
            }
            
            #brand, #category{
               height: 50%;
               display: block;
               float: left;
               margin-top: 13px; 
               margin-right: 5px;
               margin-left: 15px; 
            }
            .btn1{
                height: 60%;
                width: 10%;
                margin-top: 20px;
                padding: 5px 0 5px 0;
                background-color: #00264B;
                color: white;

            }
            #preveal{
                margin-left: 400px;
            }
            #cancel{
                float: right;
                margin-right: 10px;
            }
            /* #summernote{
                width: 100%;
                height: 100%;
                clear: both;
            } */
	</style>
</head>
<body>
	<header id="header">
			<%@include file="/views/common/menubar.jsp"%>
	</header>
	<section id="name">
           <h1>글쓰기</h1>
    </section>
    <section id="title"> 
    	<select name="brand" id="brand">
     		<option value="lg">LG게시판</option>
     		<option value="ss">삼성게시판</option>
     		<option value="ap">애플게시판</option>
     		<option value="fr" selected>자유게시판</option>
     	</select>
            
     	<select name="category" id="category">
    		<option value="issue">이슈</option>
   			<option value="talk">잡담</option>
   			<option value="category" selected>카테고리</option>
  		</select>
  		<input type="text" name="title-1" id="title-1" placeholder="제목을 입력하세요.">    
  	</section>

  	<section id="content">
  		<div id="summernote"><p>Hello Summernote</p></div>
   			<script>
	              $(document).ready(function() {
	                  $('#summernote').summernote();
	              });
            </script>
 	</section>
	<section id="btn">
		<button type="button" class="btn btn-secondary btn1" id="preveal">미리보기</button>
		<button type="submit" class="btn btn-secondary btn1" id="write">글쓰기</button>
		<button type="reset" class="btn btn-secondary btn1" id="cancel">취소</button>
	</section>
</body>
</html>