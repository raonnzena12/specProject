<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMPARE RESULT</title>
<style>
    * {
        box-sizing: border-box;
        border: 1px solid salmon;
    }
    .compareRe {
        width: 1080px;
        margin: 0 auto;
        clear: both;
        margin-top: 70px;
    }
    .compareTop {
        height: 400px;
    }
    .mobile1, .mobile2 {
        float: left;
        width: 50%;
        height: 100%;
    }
    .mo1Count {
        width: 25%;
        height: 100%;
        float: left;
    }
    .mo2Count {
        width: 25%;
        height: 100%;
        float: right;
    }
    .compareMid {
        height: 400px;
    }
    #specSummary1, #specSummary2 {
        height: 310px;
        background-color: #eee;
        margin: 30px auto;
        border-radius: 5px;
        padding: 5px;
        width: 90%;
        position: relative;
    }
    #specSummary div {
        display: inline-block;
        border-radius: 5px;
        border: 1px solid #ccc;
        background-color: white;
        margin: 5px;
        float: left;
    }
</style>
</head>
<body>
    <%@ include file ="/views/common/menubar.jsp" %>
    <section class="compareRe">
        <div class="compareTop">
            <div class="mobile1">mobile1
                <div class="mo1Count">좋아요/소지수</div>
            </div>
            <div class="mobile2">mobile2
                <div class="mo2Count">좋아요/소지수</div>
            </div>
        </div>
        <div class="compareMid">
            <div class="mobile1">
                <div id="specSummary1">
                    <div id="brand">브랜드</div>
                    <div id="size">크기</div>
                    <div id="weight">무게</div>
                    <div id="gb">gb</div>
                    <div id="ap">AP</div>
                    <div id="os">OS</div>
                    <div id="battery">배터리</div>
                    <div id="display">액정</div>
                    <div id="ram">램</div>
                    <div id="disSize">disSize</div>
                </div>
            </div>
            <div class="mobile2">
                <div id="specSummary2">
                    <div id="brand">브랜드</div>
                    <div id="size">크기</div>
                    <div id="weight">무게</div>
                    <div id="gb">gb</div>
                    <div id="ap">AP</div>
                    <div id="os">OS</div>
                    <div id="battery">배터리</div>
                    <div id="display">액정</div>
                    <div id="ram">램</div>
                    <div id="disSize">disSize</div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>