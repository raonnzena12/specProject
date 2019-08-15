<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
    #deviceReview {
        width: 900px;
        margin: auto;
    }
    .reviewCon {
        width: 900px;
        min-height: 200px;
        height: auto;
        margin: 15px auto;
        padding: 0 20px;
    }
    .reviewTitle div {
        display: inline-block;
        /* border: 1px solid salmon; */
    }
    .reviewTitle>.userName, .reviewTitle .starScore {
        font-weight: bolder;
        font-size: 25px;
        margin: 0 15px 0 10px;
    }
    .reviewTitle>.date {
        font-size: 11px;
        color:#666;
    }
    .reviewTitle>.star {
        float: right;
    }
    .star {
        height: 35px;
        min-width: 100px;
    }
    .starScore {
        line-height: 35px;
        float: right;
    }
    .starIcon {
        float: right;
    }
    .star i {
        color: goldenrod;
        font-size: 35px;
        text-shadow: 0px, 0px, 10px, #666;
    }
    .reviewCon>.modify {
        text-align: right;
        margin-top: 10px;
    }
    .modify i {
        font-size: 18px;
        cursor: pointer;
    }
    .long-Ad {
        clear: both;
        width: 900px;
        height: 200px;
        background-color: antiquewhite;
        margin: 25px auto;
    }
    .like-btn {
        cursor: pointer;
        color: #dc3545;
        font-size: 23px;
        margin-right: 5px;
    }
    .like-cnt {
        text-align: right;
    }
    #deviceReview .wirteReview {
        text-align: right;
        padding: 20px 20px 50px 0;

    }
    .reported {
        color: #aaa;
    }
</style>
<%@ include file ="/views/common/menubar.jsp" %>
<script>
    // url에 있는 파라메터 받아오기
    $.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results[1] || 0;
    }   
	loadReivew();
    $(function() {
        // 리뷰 좋아요 체크하는 함수
        $(document).on("click",".like-cnt", function(){
            <% if ( loginUser == null ) { %>
                Swal.fire( '로그인이 필요합니다!', '좋아요를 누르기 전 로그인을 해주세요!', 'warning' );
                return false;
            <% } %>
            var icheck = $(this).children().eq(0).text();
            var rno = $(this).parent().parent().attr("id");
            if ( icheck == 'favorite_border') {
                $(this).children().eq(0).text('favorite');
                likeCount(rno, 1);
            } else {
                $(this).children().eq(0).text('favorite_border');
                likeCount(rno, 0);
            }
        });
    });
    // 리뷰 로드해오는 함수
    function loadReivew(){
        var mno = $.urlParam("mno");
        var uno = -1;
        <% if( loginUser != null ) { %> uno = <%=loginUser.getUserNo()%>;<% } %>
        $.ajax({
            url: "loadReview.mo",
            type: "POST",
            data: { mno : mno,
                    uno : uno},
            dataType: "json",
            error: function(e){
                console.log(e);
            },
            success: function(rList){
                printReview(rList);
            }
        });
    }
    // 좋아요 증감 함수
    function likeCount(rno, num){
        var userNo = 0;

        <% if( loginUser != null ) { %> userNo = <%=loginUser.getUserNo()%>;<% } %>

        $.ajax({
            url: "reviewLike.mo",
            type: "POST",
            data: { rno : rno,
                    uno : userNo,
                    num : num },
            error: function(e){
                console.log(e);
            },
            success: function(result) {
                if ( result > 0 && num > 0 ) {
                    $("#" + rno + " span.likes").text(($("#" + rno + " span.likes").text()*1)+1);
                } else if ( result > 0 && num == 0 ) {
                    $("#" + rno + " span.likes").text(($("#" + rno + " span.likes").text()*1)-1);
                    // String을 number로 변환하기 위해 임시방편으로 1곱해줬음... 야매...
                }
            }
        });
        
    }
    // 리뷰 삭제 함수
    function delReview(rno){

        $.ajax({
            url: "updateReview.mo",
            data: { rno : rno },
            type: "GET",
            error: function(e){
                console.log(e);
            },
            success: function(result){
                if ( result > 0 ) {
                    loadReivew();
                    Swal.fire( 'Deleted!', 'Your review has been deleted.', 'success' );
                } else {
                    Swal.fire({
                    type: 'error',
                    title: 'Oops...',
                    text: 'Something went wrong!',
                    footer: '<a href>Why do I have this issue?</a>'
                    });
                }
            }
        });
    }
    // 리뷰 수정 함수
    function updateReview(rno){
        window.open("modifyReview.mo?rno="+rno, "updateReviewForm", "width=1200px, height=500px, resizable = no, scrollbars = no");
    }
    // 리뷰 신고창 호출 함수
    <%if ( loginUser != null ) { %>
    function reportComment(id) {
        window.open("reportComment.mo?mcNo="+id+"&type=3&num=<%=loginUser.getUserNo()%>", "reportForm", "width=680px, height=700px, resizable = no, scrollbars = no")
    }
    <% } %>
    // 리뷰 프린트용
    function printReview(rList){
        var userNo = 0;
        <% if( loginUser != null ) { %> userNo = <%=loginUser.getUserNo()%>;<% } %>
        var listLength = Object.keys(rList).length;
        var $reviewPrint = $(".reviewPrint");
        $reviewPrint.html("");
        if ( listLength == 0 ) { // 넘어온 리스트의 사이즈가 0일 때 ( 리뷰가 없을때 출력 )
            var $reviewCon = $("<div>").addClass("border rounded reviewCon");
            var $noneP = $("<p>").addClass("noneP").html("등록된 리뷰가 없습니다.<br>이 핸드폰의 첫 리뷰어가 되어보세요!");
            $reviewCon.append($noneP);
            $reviewPrint.append($reviewCon);
        } else {
            $.each(rList, function(i){
                if ( listLength < 3 && i == 1 ) {
                    $longAd = $("<div>").addClass("long-Ad");
                    $reviewPrint.append($longAd);
                } else if ( listLength > 3 && i%3 == 0 ) {
                    $longAd = $("<div>").addClass("long-Ad");
                    $reviewPrint.append($longAd);
                }
                var $reviewCon = $("<div>").addClass("border rounded reviewCon").attr("id",rList[i].rNo);
                var $modify = $("<div>").addClass("modify");
                if ( <%=loginUser == null%> || rList[i].rStatus == 2 || rList[i].rStatus == 3 ) {
                    // 로그인 유저가 아니거나 / 신고/삭제된 리뷰일 경우 아이콘을 출력하지 않는다.
                } else if ( rList[i].rWriterNo == userNo ) { // 내 리뷰일 경우 수정/삭제 출력
                    $modify.html("<i class='material-icons editReview'>create</i><i class='material-icons delReview'>clear</i>");
                } else { // 내 리뷰가 아닐 경우 신고 출력
                console.log(rList[i].rIreport);
                    $modify.html('<i class="material-icons reportReview">error</i>');
                    if ( rList[i].rIreport == 1 ) {
                        $modify.addClass("reported");
                    }
                }
                var $reviewTitle = $("<div>").addClass("reviewTitle");
                var $userName = $("<div>").addClass("userName").text(rList[i].rWriterName);
                if ( <%= loginUser != null %> && rList[i].rWriterNo == userNo ) { // 내 리뷰일 경우 클래스 추가 (이름 색 변경용)
                    $userName.addClass("myReivew");
                }
                var $date = $("<div>").addClass("date").text(rList[i].rModiDate);
                var $star = $("<div>").addClass("star");
                var $starIcon = $("<div>").addClass("starIcon");
                for ( var j = 0 ; j < Math.floor(rList[i].rStar) ; j++ ) { // 1개짜리 별 출력하는 부분
                    $starIcon.append("<i class='material-icons'>star</i>");
                }
                if ( rList[i].rStar%1 > 0 ) { // 반개짜리 별 출력하는 부분
                    $starIcon.append("<i class='material-icons'>star_half</i>");
                }
                $starScore = $("<div>").addClass("starScore").text(rList[i].rStar);
                $star.append($starIcon, $starScore);
                $reviewTitle.append($userName, $date, $star);
                var $likeCon = $("<div>").addClass("like-container");
                var $likeCnt = $("<div>").addClass("like-cnt unchecked");
                if ( rList[i].rIlike == 0) { // 내가 하트찍은 내역이 없으면 빈 하트♡
                    $likeCnt.append("<i class='like-btn material-icons'>favorite_border</i>");
                } else {    // 내가 하트찍은 내역이 있으면 하트♥
                    $likeCnt.append("<i class='like-btn material-icons'>favorite</i>");
                }
                var $likes = $("<span>").addClass("likes").text(rList[i].rLike);
                $likeCnt.append($likes);
                $likeCon.append($likeCnt);
                var $reviewText = $("<div>").addClass("reviewText").html(rList[i].rContent);
                $reviewCon.append($modify, $reviewTitle, $likeCon, $reviewText);
                $reviewPrint.append($reviewCon);
            });
        }
    }
</script>
</head>
<body>
    <%@ include file = "mobileSpecTop.jsp"%>
    <section id="deviceReview">
    <div class="reviewPrint">
    <!-- <%-- <% for ( int i = 0 ; i < size ; i++ ) { %> --%>
    <%-- <div class="border rounded reviewCon">
        <div class="modify"><% if( myReview ) { %><i class="material-icons">create</i><i class="material-icons">clear</i><% } else { %><i class="material-icons">error</i><% } %></div>
        <div class="reviewTitle">
            <div class="userName">유저<%=i+1%></div><div class="date">2019.07.28</div><div class="star"><div class="starIcon"><% for ( int j = 0 ; j < (int)(starScore*i) ; j++ ) { %><i class="material-icons">star</i><% } %><% if ( (starScore*i)%1 > 0 ) { %><i class="material-icons">star_half</i><% } %></div><div class="starScore"><%=starScore*i%></div></div> 
        </div>
        <div class="like-container">
            <div class="like-cnt unchecked">
                <i class="like-btn material-icons">favorite_border</i>
                <span class="likes"></span>
            </div>
        </div>
        <div class="reviewText">
            <%=i+1%>번째 리뷰
        </div>
    </div>
    <% if( i%3==0 ) { %><div class="long-Ad">광고영역<%=i/3+1%></div><% } %>
    <% } %> --%> -->    
    </div>
    <div class="wirteReview">
        <button type="button" class="border btn btn-light" id="wirteReview"> 리뷰 작성하기</button>
    </div>
    </section>
<script>
    $(function(){
        $("#wirteReview").click(function() {
            <% if ( loginUser == null ) { %>
                Swal.fire( '로그인이 필요합니다!', '리뷰를 작성하시기 전 로그인을 해주세요!', 'warning' );
                return false;
            <% } %>
            location.href='<%=request.getContextPath()%>/writeReview.mo?mno=<%=mo.getmNo()%>';
        });
        $(document).on("click", ".delReview", function(){
            var rno = $(this).parent().parent().attr("id");
            Swal.fire({
                title: '삭제 하시겠습니까?',
                text: "등록된 리뷰가 삭제됩니다!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                cancelButtonText: '취소',
                confirmButtonText: '삭제'
                }).then((result) => {
                if (result.value) {
                    delReview(rno);
                }
            });
        });
        $(document).on("click", ".editReview", function(){
            var rno = $(this).parent().parent().attr("id");
            updateReview(rno);
        });
        // 댓글 신고 눌렀을때의 동작
        $(document).on("click", ".reportReview", function(){
            if ( $(this).parent().hasClass("reported") ) {
                Swal.fire( '신고 불가!', '이미 신고한 리뷰입니다!', 'warning' );
                return false;
            }
            var id = $(this).parent().parent().attr("id");
            reportComment(id);
        });
    });
</script>
</body>
</html>