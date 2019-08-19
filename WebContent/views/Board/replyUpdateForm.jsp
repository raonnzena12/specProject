<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Reply"%>
<%
	Reply content = (Reply)request.getAttribute("content");
	int cno = (int)request.getAttribute("cno");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
	
	#text{
		width:750px;
		height:100px;
		resize:none;
		display:block;
		margin:0;
		
	}
	#card{
		width:800px;
		height:200px;
	}
	#commentbtn{
		display:inline-block;
		float:right;
		margin: 20px 10px 10px 10px;
		
	}
	
	
</style>
</head>
<body  style="overflow-x:hidden; overflow-y:hidden;">
	<div class="card border-light mb-3" id="card" style="max-width: 50rem;">
	  <div class="card-header">댓글 수정</div>
	  <div class="card-body">
	    <textarea rol="3" col="2" id="text"><%=content.getcContent() %></textarea>
	    <button type="button" class="btn btn-primary" id="commentbtn" onclick="javascript:self.close();">취소</button>
	    <button type="button" class="btn btn-secondary" id="commentbtn" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom" id="updateReply">수정</button>
	  </div>
	</div>
<script>
	$(document).ready(function(){
		
	});
	
	$("#updateReply").click(function(){
		/* var cno = opener.document.rList[i].cNo;
		var con = $("#text").val(); */
		var modiCon = $("#text").val().trim();
		var cno = <%=cno%>;
		if( modiCon == ""){
			alert("댓글을 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"updateReply.bo",
			type : "post",
			data : {content:modiCon, cno:cno},
			success : function(result){
				if(result > 0){
					alert("댓글 수정 완료");
                    if (opener!= null) {
                        opener.updateReply = null;
                        self.close();
                    }
                    opener.location.href="javascript:selectRlist();"
				}else{
					alert("수정 에러");
				}
			}
			
		});
	});

</script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>