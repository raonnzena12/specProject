<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardContent</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
		#header{
        	
        	margin : 0;
        	padding : 0;
        	clear : both;
        }
        
        #boardcontent{/* 바디 */
        	height:auto;
        	margin: auto;
        	padding: 0;
        	
        }
        #ad, #content, #conbtn, #sub, #subwrite, #listbtn, #contentlist{
        	/* border: 1px solid black; */
        	width:1080px;
        	margin:auto;
        	padding:0;
        }
        #ad{
            height: 140px;
        }
        #content{
        	height: 500px;
        }
        #conbtn{
        	height: 60px;
        }
        #sub{
        	height: 300px;
        }
        #subwrite{
        	height : 130px;
        	background-color: #dee2e6;
        	border-radius: 5px;
        	border: 1px solid black;
        }
        #listbtn{
        	height:50px;
        }
        /* ---- section---- */
       #ad2{
            width: 1000px;
            height: 100px;
            margin-top: 20px;
            margin-left: 38px;
            background-color: gray;
            color : white;
        }
        #text{
        	width: 900px;
        	height:80px;
        	margin:25px 0 0 30px;
        }
       #subwritebtn{
       		background-color : white;
       		color: black;
       		font-weight: bold;
       		width: 100px;
       		height:80px;
       		margin: 24px 20px 20px 20px;
       		float: right;
       }
       #listbtnbtn{
       		float:left;
        	margin: 4px;
        	display:block;
        	background-color : white;
        	color: black;
        	font-weight: bold;
        	width: 60px;
        	height:40px;
       }
       #contentarea{
       		width: 100%;
       		height: 420px;
       		margin: 0;
       		padding:0;
       }
       #contenttable{
       		margin:0;
       		padding:0;
       }
      #contenttable tr{
      		text-align: center;
      }
      
       #deletebtn, #motifybtn{
       		background-color : white;
       		color: black; 
       		font-weight: bold;
       		float:right;
        	margin: 10px;
        	display:block;
        	width: 60px;
        	height:40px;
       }
       .num{
       		float:right;
       		display:block;
       		/* border: 1px solid black; */
       		width:50px;
       }
       .num > p{
       		margin:5px 0 5px 0;
       }
       #subdiv{
       		background-color: #dee2e6;
       		width: 100%;
       		height: 20px;
       }
       .conth{
       		text-align: left;
       }
       .contd1{
       		text-align: center;
       }
       .contd2{
       		text-align: right;
       }
       .subdanger{
       		width: auto;
       		height:30px;
       		float: right;
       		font-size: 20px;
       }
      
        
        
	</style>
</head>
<body id="boardcontent">
	<header id="header">
			<%@include file="/views/common/menubar.jsp"%>
	</header>
	
	<section id="ad">
     	<article id="ad2">광고</article>
   	</section>
   	
   	<section id="content">
	   	<table class="table" id="contenttable">
		  	<thead>
			    <tr>
			      <th scope="col" class="conth">잡담</th>
			      <th scope="col" colspan="3" class="contd1">제목</th>
			      <th scope="col" class="contd2">작성일</th>
			    </tr>
		 	</thead>
		</table>
		<article>
			<div class="num">
				<p>조회10</p>
			</div>
			<div class="num">
				<p>댓글5</p>
			</div>
		</article>
		
		<textarea row="50" col="15" name="content" id="contentarea" style="resize:none;" readonly></textarea>
   	</section>
   	
   	<section id="conbtn">
   		<button type="button" class="btn btn-secondary" id="deletebtn" >삭제</button>
   		<button type="button" class="btn btn-secondary" id="motifybtn" >수정</button>
   	</section>

	<section id="sub">
		<article>
			<div id="subdiv">
				
			</div>
		</article>
		<table class="table" id="subtable">
			<tr>
               <th scope="row">작성자</th>
               <td>
               		<pre>댓글댓글</pre>
               </td>
               <td>
               		<button type="button" class="btn btn-link subdanger" style="color: red; font-weight:bold;">신고</button>
               </td>
            </tr>	
			<tr>
               <th scope="row">작성자2</th>
               <td>
               		<pre>
               		댓글댓글2
               		ㅁ
               		ㅁ
               		ㅁ
               		ㅁ	
               		</pre>
               </td>
               <td>
               	<button type="button" class="btn btn-link subdanger" style="color: red; font-weight:bold;">신고</button>	
               </td>
            </tr>	
            <tr>
               <th scope="row">작성자3</th>
               <td>
               		<pre>댓글댓글3</pre>
               </td>
               <td>
               	<button type="button" class="btn btn-link subdanger" style="color: red; font-weight:bold;">신고</button>
               </td>
            </tr>
		</table>
	</section>   	
	<br>
	<br>
	<section id="subwrite">
		<textarea rol="3" col="2" id="text" placeholder="댓글을 입력해주세요."></textarea>
		<button type="button" class="btn btn-secondary" id="subwritebtn" >댓글<br>등록</button>
	</section>
	<br>
	<br>
	<section id="listbtn">
		<button type="button" class="btn btn-secondary" id="listbtnbtn">목록</button>
	</section>
	<br>
	<br>
	<section id="contentlist">
		<%@include file="/views/Board/BoardList.jsp" %>
	</section>
	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
</body>
</html>