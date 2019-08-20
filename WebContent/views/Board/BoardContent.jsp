<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board" import="board.model.vo.Reply" import="java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("board");
	int replycount = (int)request.getAttribute("replycount");
	
	ArrayList<Reply> rList = (ArrayList<Reply>)request.getAttribute("rList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardContent</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	<style>
		#header{
        	
        	margin : 0;
        	padding : 0;
        	clear : both;
        }
        
        #boardcontent{/* 바디 */
        	/* height:auto; */
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
        	height: auto;
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
       		border: 1px solid #ced4da;
       		width: 100%;
       		height: 420px;
       		margin: 0;
       		margin-top:32px;
       		padding:0;
       	}
       	#contenttable{
       		margin:0;
       		padding:0;
       		text-align: center;
      	}
      	#contenttable tr{
      		text-align: center;
      	}
      
      	#deletebtn, #motifybtn, #dangerbtn{
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
       		width:auto;
       		
       	}
       	.num > p{
       		margin:5px 5px 5px 0;
       	}
       	#subdiv{
       		background-color: #dee2e6;
       		width: 100%;
       		height: 20px;
       	}
       	
       	#subdanger, #subupdate, #subdelete{
       		width: auto;
       		height:30px;
       		float: right;
       		font-size: 7px;
       	}
       	/* {
       		width: auto;
       		height:30px;
       		float: right;
       		font-size: 20px;
       		display:block;
       	} */
       	
       	#listbtnup{
       		float:right;
       		display:block;
       		margin-top: 13px;
       		
      	}
       	#listbtndown{
       		float:right;
       		display:block;
       		margin-top: 13px;
       		
      	}
      	.updown{
      		color: black;
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
			      <th scope="col" width="10%"><%=b.getCgCategory() %></th>
			      <th scope="col" width="75%"><%=b.getbTitle() %></th>
			      <th scope="col" width="15%"><%=b.getbRegdate() %></th>
			    </tr>
		 	</thead>
		</table>
		<article>
			<div class="num">
				<p>조회<%= b.getbCount()%></p>
			</div>
			<div class="num">
				<p>댓글<%= replycount %></p>
			</div>
		</article>
		<script>
		    $(function(){
		        $("#contentarea").html("<%=b.getbContent() %>");
		    });
		</script>
		<div id="contentarea"></div>
   	</section>
   	
   	
   	<section id="conbtn">
   	<%--  System.out.println("loginUser" + loginUser.getUserNo()); System.out.println("bWriter" + b.getbWriter());%> --%>
   	<% if(loginUser.getUserNo() == b.getbWriter()){ %>
   		<button type="button" class="btn btn-secondary" id="deletebtn" onclick="deleteBoard();">삭제</button>
   		<button type="button" class="btn btn-secondary" id="motifybtn" onclick="updateBoard();">수정</button>
   	<% }else if(b.getbWriter() != 0){ %>
   		<button type="button" class="btn btn-secondary" id="dangerbtn" onclick="dangerBoard();">신고</button>
   	<%}else{ %>
   	
   	
   	<%} %>
   	</section>

	<section id="sub">
		<article>
			<div id="subdiv"></div>
		</article>
		<table class="table" id="subtable">
			<%-- <tr>
               <th scope="row" width="10%"><%=b.getbWriter() %></th>
               <td width="75%">
               		<pre>댓글댓글</pre>
               </td>
               <td width="15%">
               		<button type="button" class="btn btn-link" id="subdanger" style="color: red; font-weight:bold;">신고</button> <br>
               		<button type="button" class="btn btn-link " id="subupdate" style="color: black; font-weight:bold;">수정</button>
               		<button type="button" class="btn btn-link" id="subdelete" style="color: black; font-weight:bold;">삭제</button>
               </td>
            </tr> --%>	
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
		<button type="button" class="btn btn-secondary" id="listbtnbtn" onclick="javascript:history.back();">목록</button>
		
		<a href="#boardcontent" class="updown"><i class="material-icons" id="listbtndown">arrow_upward</i></a>
		<a href="#footer" class="updown"><i class = "material-icons" id="listbtnup">arrow_downward</i></a>
	</section>
	<br>
	<br>
	<section id="contentlist">
		<%-- <%@include file="BoardList.jsp" %> --%>
	</section>
	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  <footer id="footer"></footer>
  
  <script>
  	//게시글 수정
  	function updateBoard(){
  		<%-- window.open("updateForm.bo?bno="+"<%=b.getbNo()%>", "updateBoardForm", "width=1150, height=880, resizable = no, scrollbars = no"); --%>
  		location.href='<%= request.getContextPath()%>/updateForm.bo?bno=<%=b.getbNo()%>';
  		/* window.open("replyUpdateForm.bo?cno="+cno, "updateReplyForm","width=805, height=260, resizable = no, scrollbars = no");
		 */
  	}
  	// 게시글 삭제
  	function deleteBoard(){
  		if(confirm('정말 삭제하시겠습니까?')){
  			location.href='<%= request.getContextPath()%>/delete.bo?bno=<%= b.getbNo()%>&bcode=<%= b.getbCode()%>';
  		}
  		
  	}
  	//게시글 신고
  	function dangerBoard(){
  		<%-- window.open("dangerForm.bo?bno=" + "<%=b.getbNo()%> &dwriter=<%=loginUser.getUserNo()%>", "boardDangerForm", "width=800, height=550, resizable = no , scrollbars =no"); --%>
  		location.href='<%= request.getContextPath()%>/dangerForm.bo?bno=<%=b.getbNo()%>&dwriter=<%=loginUser.getUserNo()%>';
  	}
  
  // 댓글 등록
  	$("#subwritebtn").click(function(){
  		var writer = <%=loginUser.getUserNo()%>;
  		var bno = <%= b.getbNo()%>;
  		var content = $("#text").val();
  		
  		if(content.trim() == ""){
  			alert("빈 댓글을 입력할수 없습니다. 댓글을 입력해주세요.");
  			return false;
  		}
  		
  		$.ajax({
  			url : "writeReply.bo",
  			type : "post",
  			data : {writer:writer, bno:bno, content:content},
  			success : function(result){
  				if(result > 0){
  					$("#text").val("");
  					selectRlist();
  				}else{
  					console.log("댓글 등록 에러 발생");
  				}
  			}
  			
  		});
  		
  	});
  	
  	// 댓글 출력용 함수
  	function selectRlist(){
  		var bno = <%=b.getbNo()%>;
  		
  		$.ajax({
  			url : "selectReply.bo",
  			tpe : "post",
  			dataType : "json",
  			data : {bno : bno},
  			success : function(rList){
  				console.log(rList);
  				var $replyTable = $("#subtable");
  				
  				$replyTable.html("");
  				
  				$.each(rList, function(i){
  					
  					if(Object.keys(rList).length == 0){
  						var $p = $("<p>").text("등록된 댓글이 없습니다.").css("textalign","center");
  					}else{
	  					var $tr = $("<tr>");
	  					var $writerTh = $("<th>").text(rList[i].bcWriter).css("width","10%").attr("scope", "row");
	  					var $contentTd = $("<td>").attr("id","contentTd").css("width","60%");
	  					
	  						if(rList[i].cStatus == "2"){
	  	  						$contentTd.text("유저에 의해 삭제된 글입니다.");
	  	  					}else if(rList[i].cStatus == "3"){
	  	  						$contentTd.text("신고 누적으로 운영자에 의하여 삭제된 댓글입니다.");
	  	  					}else{
	  	  						$contentTd.html(rList[i].cContent);
	  	  					}
  					
  					
  					
	  					var $buttonTd = $("<td>").attr("id", rList[i].cNo).css("width","15%");
	  					var $button1 = $("<button>").addClass("btn btn-link subdanger").attr({"type":"button", "id":"subdanger"}).text("신고").css({"color":"red", "font-weight":"bold"});
	  					var $button2 = $("<button>").addClass("btn btn-link subupdate").attr({"type":"button", "id":"subupdate"}).text("수정").css({"color":"black", "font-weight":"bold"});
		  				var $button3 = $("<button>").addClass("btn btn-link subdelete").attr({"type":"button", "id":"subdelete"}).text("삭제").css({"color":"black", "font-weight":"bold"});
		  				var $dateTd = $("<td>").text(rList[i].cRegdate).css("width","10%");
		  				
		  				if(rList[i].cStatus != 3){
		  					if( <%=loginUser.getUserNo()%> == rList[i].cWriter ){
		  						$buttonTd.append($button2);
		  	  					$buttonTd.append($button3);
		  					}else{
		  						$buttonTd.append($button1);
		  					}
		  				}
	  					
	  					$tr.append($writerTh);
	  					$tr.append($contentTd);
	  					$tr.append($buttonTd);
	  					$tr.append($dateTd);
	  					$replyTable.append($tr);
  					}
  				});
  			}
  		});
  	}
  	
  	selectRlist();
  	
  	/* setInterval(function(){
  		selectRlist();
  	}, 3000); */
  	
  	// 댓글 삭제
  	
  	$(document).on("click", ".subdelete", function(){
		var cno = $(this).parent().attr("id");
		deleteReply(cno);
		/* console.log("cno=" + cno); */
	});
	
	function deleteReply(cno){
		
		$.ajax({
			url: "replydelete.bo",
			type:"post",
			data:{cno:cno},
			success : function(result){
				if(result > 0){
					if(confirm("정말로 삭제 하시겠습니까?")){
						selectRlist();
					}
				}else{
					result = "댓글 삭제 실패";
				}
			}
			
		});
	}
	
	// 댓글 수정
	$(document).on("click", ".subupdate", function(){
		var cno = $(this).parent().attr("id");
		updateReply(cno);
		/* console.log("cno=" + cno); */
	});
	
	function updateReply(cno){
		window.open("replyUpdateForm.bo?cno="+cno, "updateReplyForm","width=805, height=260, resizable = no, scrollbars = no");
		
		
	}
	
	//댓글 신고
	
	$(document).on("click", ".subdanger", function(){
		var cno = $(this).parent().attr("id");
		dangerReply(cno);
		/* console.log("cno=" + cno); */
	});
	
	function dangerReply(cno){
		window.open("replyDangerForm.bo?cno="+ cno + "&dwriter=<%=loginUser.getUserNo()%>", "dangerReplyForm", "width=800, height=550, resizable = no , scrollbars =no");
		
	}
  	
  </script>
</body>
</html>