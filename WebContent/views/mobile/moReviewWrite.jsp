<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
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
		background: url(../../image/star.png) no-repeat 0 0; 
		background-size: 60px; 
		/* margin-right: -3px; */
	}
	.star_right{
		background: url(../../image/star.png) no-repeat -30px 0; 
		background-size: 60px; 
		margin-left: -3.5px;
	}
	.star.on{
	  	background-image: url(../../image/star_onn.png);
	}
	#reviewText {
		clear: both;
		margin: 50px 0 0 0;
	}
</style>
<script>
	$(function() {
		$(".star").on('click',function(){
			   var idx = $(this).index();
			   $(".star").removeClass("on");
			     for(var i=0; i<=idx; i++){
			        $(".star").eq(i).addClass("on");
			   }
			 });
	});
</script>
</head>
<body>
    <%@ include file="/views/common/menubar.jsp"%>
    <section class="reviewWrite">
        <h1>리뷰 작성</h1>
        <form action="#" method="post">
        <div class="border rounded" id="reviewWCon">
            <input type="text" name="reviewTitle" id="reviewTitle" class="form-control form-control-lg" placeholder="제목을 입력해주세요">
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
            <textarea name="reviewText" id="reviewText" class="form-control" rows="3" placeholder="리뷰 내용을 입력해주세요(1000자 이내)"></textarea>
        </div><br>

        </form> 
    </section>
</body>
</html>