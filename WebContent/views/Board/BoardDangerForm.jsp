<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("board");
	int dwriter = (int)request.getAttribute("dwriter");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신고</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
	 body{
           	width: 1080px;
         	/* height: auto; */
           	margin: auto;
          	padding: 0;
          	/* border: 1px solid black; */
       	}
       #header{
        	width: 100%;
        	/* height : 80px; */
        	margin : 0;
        	padding : 0;
        	clear : both;
        }
        #dangerBoard section{
        	/* border:1px solid black; */
        	width: 1080px;
         	/* height: auto; */
           	margin: auto;
          	padding: 0;
        }
        #dangertitlesection{
        	height:170px;
        	margin-top: 50px;
        }
        #contentsection{
        	height:auto;
        }
        #usersection{
        	height:70px;
        }
        #dangersection{
        	height:150px;
        }
        #btnsection{
        	height:150px;
        }
        /* ---------------------------------------- */
		#danger{
			padding:10px;
		}
		#text{
			min-height:400px;
			border:1px solid #ced4da;
		}
		#dangertitle{
			width:997px;
			display:inline-block;
			float:left;
			margin:40px 0 0 5px;
		}
		#dangerUser{
			width:300px;
			display:inline-block;
			float:left;
			margin:20px 0 0 5px;
		}
		#dangerContent{/* 신고내용 */
			width:1080px;
			height:100px;
			resize:none;
			display:block;
			margin:0;
			resize:none;
			
		}
		.dangerBtn{/* 버튼 */
			display:inline-block;
			float:right;
			margin: 20px 10px 10px 10px;
		}
		#dangerBoard p{
			font-weight: bold;
		}
		
</style>
</head>
<body>
	<header id="header">
			<%@include file="/views/common/menubar.jsp"%>
	</header>
	<form action="<%= request.getContextPath()%>/danger.bo" method="post" id="dangerBoard">
		  <section id="dangertitlesection">
		  	<h1 id="danger">신고</h1>
		  	<p style="display:inline-block; float:left; margin-top:40px;">신고 글 제목</p>
		  	<input type="text" id="dangertitle" value="<%=b.getbTitle()%>" readonly>
		  </section>
		  
		  <section id="contentsection">	
		  	<p>신고 글 내용</p>
		    <div id="text"></div>
		  </section>
		    <script>
			    $(document).ready(function(){
			        $("#text").html("<%=b.getbContent() %>");
				});
		    </script>
		    
		    <section id="usersection">
			  <p style="display:inline-block; float:left; margin-top:20px;">신고 유저</p> 
			  <input type="text" name="dangerUserName" id="dangerUser" value="<%=b.getbUser() %>" readonly>
			</section>
		    
		    <section id="dangersection">
		      <p>신고 사유</p>
		      <textarea name="dangerContent" id="dangerContent" rows="3" placeholder="신고 사유를 적어주세요."></textarea>
		    </section>
		    <section id="btnsection">
			    <pre>※ 허위신고 / 신고 기능 오남용시 아이디 정지등의 제재 조치를 받을 수 있습니다.</pre>
			    
			    <input type="hidden" name="bno" value="<%=b.getbNo()%>">
				<input type="hidden" name="dwriter" value="<%=dwriter%>">
				<input type="hidden" name="dangerUser" value="<%=b.getbWriter()%>">
				
			    <button type="reset" class="btn btn-secondary dangerBtn" data-toggle="tooltip" data-placement="bottom" data-original-title="Tooltip on bottom" onclick="javascript:history.back();">취소</button>
			    <button type="submit" class="btn btn-primary dangerBtn" id="dangerBtn">신고</button>
		  	</section>
		  	<input type="hidden" name="bcode" value="<%=b.getbCode()%>">
	</form>
	<script>
		$("#dangerBtn").on("click", function(){
			if($("#dangerContent").val().trim().length == 0){
				alert("신고 사유를 작성해주세요.");
				return false;
			}
		});	
	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>