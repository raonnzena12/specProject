<%@page import="board.model.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Reply content = (Reply)request.getAttribute("content");
	int cno = (int)request.getAttribute("cno");
	int dwriter = (int)request.getAttribute("dwriter");
	
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
	#dangerbtn, #dangerReplyBtn{
		display:inline-block;
		float:right;
		margin: 20px 10px 10px 10px;
		
	}
	#dangerContent{
		resize:none;
	}
</style>
</head>
<body style="overflow-x:hidden; overflow-y:hidden;">
		<div class="card border-light mb-3" id="card" style="max-width: 50rem;">
		  <div class="card-header">신고</div>
		  <div class="card-body">
		  	
		  	<p>신고 댓글</p>
		    <textarea rol="3" col="2" id="text" readonly></textarea>
		    
		    <div class="form-group">
			  <label class="col-form-label" for="inputDefault">신고 유저</label>
			  <input type="text" id="dangerUser" value="<%=content.getBcWriter()%>" readonly>
			</div>
		    
		    <div class="form-group">
		      <label for="exampleTextarea">신고 내용</label>
		      <textarea class="form-control" id="dangerContent" rows="3" placeholder="신고 사유를 적어주세요."></textarea>
		    </div>
		    
		    <pre>※ 허위신고 / 신고 기능 오남용시 아이디 정지등의 제재 조치를 받을 수 있습니다.</pre>
		    
		    <button type="reset" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" data-original-title="Tooltip on bottom" id="dangerbtn"  onclick="javascript:self.close();">취소</button>
		    <button type="button" class="btn btn-primary" id="dangerReplyBtn">신고</button>
		  </div>
		</div>
	
	<script>
	
		$(document).ready(function(){
			var replycontent = "<%=content.getcContent()%>".replace(/(<br>|<br\/>|<br \/>)/g, "\n");
		    $("#text").val(replycontent);
		});

		$("#dangerReplyBtn").on("click", function(){
			var text = $("#dangerContent").val().replace("\n", "<br>");// 신고 내용
			var dwriter = <%=dwriter%>; // 신고글 작성 한 사람
			var user = <%=content.getcWriter()%>; // 댓글 신고 당한 사람
			var cno = <%=content.getcNo()%>;
			if(text.trim().length == 0){
				alert("신고 사유를 작성해주세요.");
				return false;
			}
			
			$.ajax({
				url : "replyDanger.bo",
				type : "POST",
				data : {text:text, dwriter:dwriter, user:user, cno:cno},
				success : function(result){
					if(result > 0){
						alert("신고 완료");
						if (opener!= null) {
	                        opener.dangerReplyForm = null;
	                        self.close();
	                    }
	                    opener.location.href="javascript:selectRlist();"
					}else{
						console.log("신고 에러");
						alert("신고 실패");
					}
				},
				error : function(e){
	                console.log(e);
	            }
			});
			
		});
	
	</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>