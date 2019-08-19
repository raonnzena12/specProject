<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mobile.model.vo.Mobile"%>
<%
    Mobile mo = (Mobile)request.getAttribute("device");
%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>SPEC TOP</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
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
    #mobileView img {
        height: 350px;
        width: auto;
    }
    #deviceFront{
        height: 400px;
        width: auto;        
    }
    #mobileName {
        float: right;
        height: 180px;
        width: 780px;
        text-align: right;
    }
    #mobileName label {
        font-size: 50px;
        font-weight: 900;
        margin-right: 20px;
    }
    #clear {
        float: right;
        height: 110px;
        width: 780px;
    }
    #mobileCount {
        text-align: right;
        float: right;
        width: 780px;
        height: 60px;
    }
    #mobileTab {
        float: left;
        width: 780px;
        height: 120px;
        cursor: pointer;
    }
    .tab, .page {
        display: inline-block;
        width: 30.4%;
        height: 100%;
        line-height: 140px;
        font-size: 50px;
        color: #999;
        text-align: center;
        /* border: 10px solid white; */
        position: relative;
    }
    .bar {
        width: 100%;
        background-color: #fff;
        height: 10px;
        position: absolute;
        bottom: 0px;
    }
    .clear {
        clear: both;
        border: 1px solid #ccc;
        margin-bottom: 50px;
    }
    .page, .on {
        color: #00264B;
        font-weight: 600;
    }
    .page div, .on div {
        background-color: #00264B;
    }
</style>
<script>
        // url에 있는 파라메터 받아오기
        $.urlParam = function(name){
            var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            return results[1] || 0;
        }   
        $(function() {
            $(".tab").mouseenter(function(){
                $(this).addClass("page");
            }).mouseleave(function() {
                $(this).removeClass("page");
            });
            var page = $.urlParam("page")
            var pageNum = 0;
            switch (page) {
                case "1" : pageNum = 0; break;
                case "2" : pageNum = 1; break;
                case "3" : pageNum = 2; break;
            }
            $("#mobileTab").children().eq(pageNum).addClass("on");
        });
</script>
</head>
<body>
	<%-- <%@ include file ="/views/common/menubar.jsp" %> --%>
    <div class="mobileTop">
        <% if ( loginUser != null && loginUser.getUserName().equals("admin") ) { %>
        <div>
            <button class="btn btn-primary float-right" id="mofidyDevice">수정</button>
        </div>
        <% } %>
        <div id="mobileView">
            <% if ( mo.getmFrontImage() == null ) { %>
            <img src="<%=request.getContextPath()%>/image/smartphoneG.png" id="deviceFront">
            <% } else { %>
            <img src="<%=request.getContextPath()%>/image/mobileImages/<%=mo.getmFrontImage()%>" id="deviceFront">
            <% } %>
        </div>
        <div id="mobileName">
            <label><%= mo.getmBrandName() %></label>
            <br><br>
            <label><%= mo.getmName() %></label>
        </div>
        <div id="mobileCount">좋아요 / 소지수</div>
        <div id="clear"></div>
        <div id="mobileTab">
            <div class="tab" id="1"><a>SPEC</a><div class="bar"></div></div>
            <div class="tab" id="2"><a>REVIEW</a><div class="bar"></div></div>
            <!-- <div class="tab" id="3"><a>COMPARE</a><div class="bar"></div></div> -->
        </div>
        <div class="clear"></div>
    </div>
    <script>
        $(function(){
            var currentPage = $.urlParam("currentPage");
            var mno = $.urlParam("mno");
            $(document).on("click", ".tab", function(){
                location.href = "<%=request.getContextPath()%>/spec.mo?currentPage="+currentPage+"&mno="+mno+"&page="+$(this).attr("id");
            });
            $("#mofidyDevice").on("click", function(){
                <% if ( loginUser != null && loginUser.getUserName().equals("admin")) { %>
                location.href="<%=request.getContextPath()%>/updateForm.mo?mno=<%=mo.getmNo()%>";
                <% } %>
            });
        });
    </script>
</body>
</html>