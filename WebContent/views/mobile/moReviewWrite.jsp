<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>Write Review</title>
		<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
		<%@ include file="/views/common/menubar.jsp"%>
		<style>
    .reviewWrite {
        width: 1080px;
        margin: 50px auto;
    } 
    #reviewWCon {
        width: 1080px;
        min-height: 200px;
        height: auto;
        margin: 15px auto;
        padding: 25px 20px;
        position: relative;
    }
    #reviewTitle {
        width: 700px;
        float: left;
    }
    .star-box {
    	display: inline-block;
    	position: absolute;
    	top: 15px;
    	right: 25px;
    }
    .star{
		display:inline-block;
		width: 30px;height: 60px;
		cursor: pointer;
	}
	.star_left{
		background: url(image/star.png) no-repeat 0 0; 
		background-size: 60px; 
		margin-right: -1px;
	}
	.star_right{
		background: url(image/star.png) no-repeat -30px 0; 
		background-size: 60px; 
		margin-left: -3px;
	}
	.star.on{
	  	background-image: url(image/star_onn.png);
	}
	#reviewText {
		clear: both;
		margin: 50px 0 0 0;
	}
	.reviewWrite .btnArea {
		text-align: right;
	}
	#insertReview {
		margin: 0 20px;
	}
</style>
<script>
	// url에 있는 파라메터 받아오기
	$.urlParam = function(name){
		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		return results[1] || 0;
    }   
	$(function() {
		// 클릭시 별모양 들어오는 펑션
		$(".star").on('click',function(){
			var idx = $(this).index();
			$(".star").removeClass("on");
				for(var i=0; i<=idx; i++){
				$(".star").eq(i).addClass("on");
			}
		});
		$("input[name=mno]").val($.urlParam("mno"));
	});
</script>
</head>
<body>
    <section class="reviewWrite">
        <h1>리뷰 작성</h1>
        <form action="<%=request.getContextPath()%>/reviewInsert.mo" method="post" name="reviewWriteForm" id="reviewWriteForm">
        <div class="border rounded" id="reviewWCon">
			<input type="hidden" name="mno">
			<input type="hidden" name="rWriter">
			<input type="text" name="reviewTitle" id="reviewTitle" class="form-control form-control-lg" placeholder="제목을 입력해주세요">
			<input type="hidden" name="star">
            <div class="star-box">
				<span class="star star_left on"></span>
				<span class="star star_right on"></span>
				
				<span class="star star_left on"></span>
				<span class="star star_right on"></span>
				
				<span class="star star_left on"></span>
				<span class="star star_right"></span>
				
				<span class="star star_left"></span>
				<span class="star star_right"></span>
				
				<span class="star star_left"></span>
				<span class="star star_right"></span>
			</div><br>
			<textarea name="reviewText" id="reviewText" class="form-control" rows="3" placeholder="리뷰 내용을 입력해주세요(1000자 이내)"></textarea><br>
			<input type="hidden" name="rContent">
			<div class="btnArea">
				<button type="button" class="btn btn-light border" id="insertCancel">취소</button><button type="button" class="btn btn-primary" id="insertReview">리뷰 등록</button>
			</div>
        </div><br>
        </form> 
	</section>
	<script>
		$(function(){
			$("#insertReview").on("click",function(){
				var rTitle = $("#reviewTitle").val().trim();
				var text = $("#reviewText").val();
				var rContent = text.replace(/(\n|\r\n)/g, '<br>');
				console.log(rContent);
				if ( rTitle == 0 ) {
					$("#reviewTitle").focus();
					Swal.fire( 'Oops...!', '제목을 입력해주세요!', 'warning' );
					return false;
				} else if ( rContent.trim() == 0 ) {
					$("#reviewText").focus();
					Swal.fire( 'Oops...!', '리뷰 내용을 입력해주세요!', 'warning' );
					return false;
				} 
				$("input[name=star]").val($(".on").length);
				$("input[name=rWriter]").val(<%=loginUser.getUserNo()%>);
				$("input[name=rContent]").val(rContent);
				$("#reviewWriteForm").submit();
			});
			$("#insertCancel").on("click", function(){
				javascript:history.go(-1);
			});
		});
	</script>
</body>
</html>