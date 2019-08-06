<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smartphone</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    #mobileList ul {
        list-style-type: none;
    }
    #mobileList .sidenav div {
        display: none;
    }
    #mobileList .sidenav {
        height: 100%; /* Full-height: remove this if you want "auto" height */
        width: 250px; /* Set the width of the sidebar */
        position: fixed; /* Fixed Sidebar (stay in place on scroll) */
        z-index: 1; /* Stay on top */
        top: 0; /* Stay at the top */
        left: 0;
        background-color: #eee; 
        overflow-x: hidden; /* Disable horizontal scroll */
        padding: 100px 10px 0 20px;
    }   
    #mobileList .main {
        margin-left: 250px; /* 사이드바 가로길이 변경 시 같이 바꿔줄 것 */
        margin-top: 0;
    }
</style>
<script>
    $(function() {
        $(".sideOpen").click(function(){
            $(this).next().slideToggle();
        });
    });
</script>
</head>
<body>
    <%@ include file ="../common/menubar.jsp" %>
    <section id="mobileList">
        <!-- side navigation -->
        <div class="sidenav">
            <span>Filter</span>
            <ul>
                <li class="sideOpen">
                    Brand
                </li>
                <div><span>APPLE</span><span>SAMSUNG</span><span>LG</span></div>
                <li class="sideOpen">
                    Price
                </li>
                <div>가격대~</div>
                <li class="sideOpen">
                    Screen
                </li>
                <div>스크린~</div>
                <li class="sideOpen">
                    Color
                </li>
                <div>색상</div>
                <li class="sideOpen">
                    Battery
                </li>
                <div>배터리</div>
            </ul>
        </div>
        <!-- Page content -->
        <section class="main">
            <p>adfadfdfad</p>

        </section>
    </section>
</body>
</html>