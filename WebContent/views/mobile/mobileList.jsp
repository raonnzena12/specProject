<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smartphone</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    .sidenav div {
        display: none;
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
            </ul>
        </div>
        <!-- Page content -->
    </section>
</body>
</html>