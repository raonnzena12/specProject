<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    double starScore = 0.5;
    boolean myReview = true;
    int size = 10;
%>
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
</style>
<script>
    $(function() {
        $(".like-cnt").click(function(){
            var icheck = $(this).children().text();
            if ( icheck == 'favorite_border') {
                $(this).children().text('favorite');

            } else {
                $(this).children().text('favorite_border');
            }
        });
    });
</script>
</head>
<body>
    <% for ( int i = 0 ; i < size ; i++ ) { %>
    <div class="border rounded reviewCon">
        <div class="modify"><% if( myReview ) { %><i class="material-icons">create</i><i class="material-icons">clear</i><% } else { %><i class="material-icons">error</i><% } %></div>
        <div class="reviewTitle">
            <div class="userName">유저<%=i+1%></div><div class="date">2019.07.28</div><div class="star"><div class="starIcon"><% for ( int j = 0 ; j < (int)(starScore*i) ; j++ ) { %><i class="material-icons">star</i><% } %><% if ( (starScore*i)%1 > 0 ) { %><i class="material-icons">star_half</i><% } %></div><div class="starScore"><%=starScore*i%></div></div> 
        </div>
        <div class="like-container">
            <div class="like-cnt unchecked" id="like-cnt">
                <i class="like-btn material-icons">favorite_border</i>
            </div>
        </div>
        <div class="reviewText">
            <%=i+1%>번째 리뷰
        </div>
    </div>
    <% if( i%3==0 ) { %><div class="long-Ad">광고영역<%=i/3+1%></div><% } %>
    <% } %>
    <% if ( myReview ) { %>
    <div class="wirteReview"></div>
    <% }%>
</body>
</html>