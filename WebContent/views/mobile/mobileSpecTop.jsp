<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPEC TOP</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
    * {
        /* border: 1px solid salmon; */
    }
    .mobileTop {
        width: 1080px;
        margin: 0 auto;
        clear: both;
        margin-top: 70px;
    }
    #mobileView {
        width: 300px;
        height: 500px;
        float: left;
    }
    #mobileName {
        float: right;
        height: 350px;
        width: 780px;
        text-align: right;
    }
    #mobileName label {
        font-size: 50px;
        font-weight: 900;
        margin-right: 20px;
    }
    #mobileTab {
        float: left;
        width: 780px;
        height: 150px;
        cursor: pointer;
    }
    .tab {
        display: inline-block;
        width: 30.4%;
        height: 100%;
        line-height: 140px;
        font-size: 50px;
        color: #999;
        text-align: center;
        /* border: 10px solid white; */
    }
    .bar {
        width: 100%;
        background-color: #fff;
        height: 10px;
    }
    .clear {
        clear: both;
        border: 1px solid #ccc;
        margin-bottom: 50px;
    }
</style>
<script>
        $(function() {
            $(".tab").mouseenter(function(){
                $(this).css({color:"#00264B", "font-weight":"600"});
                $(this).children().css("background-color","#00264B")
            }).mouseleave(function() {
                $(this).css({color:"#999", "font-weight":"400"});
                $(this).children().css("background-color","#fff")
            });
        });
    </script>
</head>
<body>
    <%@ include file ="WEB-INF/views/common/menubar.jsp" %>
    <div class="mobileTop">
        <div id="mobileView">
        </div>
        <div id="mobileName">
            <label>브랜드</label>
            <br><br>
            <label>모델명</label>
        </div>
        <div id="mobileTab">
            <div class="tab">SPEC<div class="bar"></div>
            </div>
            <div class="tab">REVIEW<div class="bar"></div></div>
            <div class="tab">COMPARE<div class="bar"></div></div>
        </div>
        <div class="clear"></div>
    </div>
    <%@ include file="mobileReview.jsp"%>
</body>
</html>