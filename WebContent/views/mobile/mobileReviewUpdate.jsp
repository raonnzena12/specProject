<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="mobile.model.vo.Review"%>
<%
	Review review = (Review)request.getAttribute("review");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- Google WebIcon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- Google WebFont -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Bootstrap 4.3.1 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<style>
    * {
        font-size: 14px;
        font-family: 'Noto Sans KR';
        box-sizing: border-box;
    }
	.reviewWrite {
        width: 1080px;
        margin: 50px auto;
		text-align: center;
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
	$("#reviewTitle").val("<%=review.getrTitle()%>");
	var rContent = "<%=review.getrContent()%>".replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
	$("#reviewText").val(rContent);
	$.each($(".star"),function(i){
		if ( i < <%=review.getrStar()%>*2 ) {
			$(this).addClass("on");
		} 
	})
	// 클릭시 별모양 들어오는 펑션
	$(".star").on('click',function(){
		var idx = $(this).index();
		$(".star").removeClass("on");
			for(var i=0; i<=idx; i++){
			$(".star").eq(i).addClass("on");
		}
	});
	$("input[name=rno]").val($.urlParam("rno"));
});
function updateReview(){
	console.log("im start");
        var rno = <%=review.getrNo()%>;
		var rTitle = $("#reviewTitle").val();
        var rContent = $("#reviewText").val().replace(/(\n|\r\n)/g, '<br>');
		var star = $(".on").length;
		if ( rTitle == 0 ) {
			$("#reviewTitle").focus();
			Swal.fire( 'Oops...!', '제목을 입력해주세요!', 'warning' );
			return false;
		} else if ( rContent.trim() == 0 ) {
			$("#reviewText").focus();
			Swal.fire( 'Oops...!', '리뷰 내용을 입력해주세요!', 'warning' );
			return false;
		} 

        $.ajax({
            url:"modifyReview.mo",
            type: "POST",
            data: { rno : rno,
					rTitle : rTitle,
					rContent : rContent,
					star : star },
            error: function(e){
                console.log(e);
            },
            success: function(result){
                if ( result > 0 ) {
                    let timerInterval
                    Swal.fire({
                    title: '리뷰 수정 성공!',
                    html: '리뷰 수정에 성공하였습니다',
                    timer: 1000,
                    onBeforeOpen: () => {
                        // Swal.showLoading()
                        timerInterval = setInterval(() => {
                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                    }).then((result) => {
                    if (
                        result.dismiss === Swal.DismissReason.timer
                    ) {
                        opener.location.href="javascript:loadReivew();"
                        if (opener!= null) {
                            opener.updateReviewForm = null;
                            self.close();
                        }
                    }
                    });
                } else {
                    Swal.fire({ type: 'error',
                    title: '수정 오류',
                    text: '댓글 수정에 실패하였습니다!'
                    });
                }
            }

        });
    }
</script>
</head>
<body>
    <section class="reviewWrite">
        <h1>리뷰 수정</h1>
        <div class="border rounded" id="reviewWCon">
			<input type="text" name="reviewTitle" id="reviewTitle" class="form-control form-control-lg" placeholder="제목을 입력해주세요">
            <div class="star-box">
				<span class="star star_left"></span>
				<span class="star star_right"></span>
				
				<span class="star star_left"></span>
				<span class="star star_right"></span>
				
				<span class="star star_left"></span>
				<span class="star star_right"></span>
				
				<span class="star star_left"></span>
				<span class="star star_right"></span>
				
				<span class="star star_left"></span>
				<span class="star star_right"></span>
			</div><br>
            <textarea name="reviewText" id="reviewText" class="form-control" rows="3" placeholder="리뷰 내용을 입력해주세요(1000자 이내)"></textarea><br>
			<div class="btnArea">
				<!-- <button type="button" class="btn btn-light border" id="insertCancel">취소</button> -->
				<button type="button" class="btn btn-primary" id="updateReview">리뷰 수정</button>
			</div>
        </div><br>
	</section>
	<script>
		$(function(){
			$("#updateReview").click(function() {
            	updateReview();
        	});
		});
	</script>
</body>
</html>