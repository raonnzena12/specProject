<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    int size = 10;
%>
<!DOCTYPE html>
<html>
<head>
<style>
    body {
        width: 900px;
        margin: 0 auto;
    }
    .comment>.borderLine, .comment .commWriteA {
        border: 1px solid #aaa;
        border-radius: 4px;
        padding: 1px 10px;
        font-size: 11px;
        font-weight: bold;
        background-color: #eee;
        margin: 20px 0;
    }
    .commentArea .userName {
        font-weight: bolder;
        margin: 0 10px;
    }
    .commentArea span {
        display: inline-block;
    }
    .userInfo>.date, .userInfo a {
        font-size: 11px;
        color: #666;
    }
    .userInfo>.controll {
        float: right;
        margin: 0 10px;
    }
    .commCon {
        margin: 2px 15px;
    }
    .commentArea hr {
        margin: 10px 0;
    }
    #commWriteA {
        padding: 5px 10px;
    }
</style>
</head>
<body>
    <section class="comment">
        <div class="borderLine">
            <span class="count"> Comments</span>
        </div>
        <div class="commentArea">
            <% if (true) { %>
                <% for ( int i = 0 ; i < size ; i++ ) { %>
                    <div class="userInfo">
                        <span class="userName">유저<%=i+1%></span><span class="date">2019.07.28 11:10</span><span class="controll"><a href="#">신고</a></span>
                    </div>
                    <div class="commCon"><%=i+1%>번째 코멘트</div>
                    <hr>
                <% } 
             } %>
        </div>
        <form action="" method="POST">
        <div class="commWriteA input-group mb-3" id="commWriteA">
            <textarea name="commCon" id="commCon" rows="3" class="form-control" aria-describedby="button-addon2"placeholder="댓글을 입력해주세요"></textarea>
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">댓글 입력</button>
            </div>
        </div>
        </form>
    </section>
</body>
</html>