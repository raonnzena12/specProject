<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<script>
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
			<div class="btnArea">
				<button type="button" class="btn btn-light border" id="insertCancel">취소</button><button type="button" class="btn btn-primary" id="insertReview">리뷰 등록</button>
			</div>
        </div><br>
        </form> 
	</section>
</body>
</html>