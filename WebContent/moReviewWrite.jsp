<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<link href="path/to/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
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
        padding: 20px;
    }
    #reviewTitle {
        width: 700px;
    }
</style>
<script>
    $(document).on('ready', function(){
        $('.kv-ltr-theme-svg-star').rating({
            hoverOnClear: false,
            theme: 'krajee-svg'
        });
	    $("#input-3-ltr-star-md").rating();
    });
</script>
</head>
<body>
    <%@ include file="WEB-INF/views/common/menubar.jsp"%>
    <section class="reviewWrite">
        <h1>리뷰 작성</h1>
        <form action="#" method="post">
        <input id="input-3-ltr-star-md" name="input-3-ltr-star-md" class="kv-ltr-theme-svg-star rating-loading" value="2.5" dir="ltr" data-size="md">
        <div class="border rounded" id="reviewWCon">
            <input type="text" name="reviewTitle" id="reviewTitle" class="form-control form-control-lg" placeholder="제목을 입력해주세요"><br>
            <textarea name="reviewText" id="reviewText" class="form-control" rows="3" placeholder="리뷰 내용을 입력해주세요(1000자 이내)"></textarea>
        </div><br>

        </form> 
    </section>
</body>
</html>