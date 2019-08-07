<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, mobile.model.vo.*"%>
<% 
	ArrayList<Mobile> list = (ArrayList<Mobile>)request.getAttribute("list");
	PageInfo pInf = (PageInfo)request.getAttribute("pInf");
	int randomAd = (int)(Math.random()*list.size());
%>
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
        padding: 20px;
    }
    #mobileList .listArea {
        display: inline-flex;
        width: 100%;
        flex-wrap: wrap;
        justify-content: space-around;
        align-content: space-around;
    }
    #mobileList .listArea>div {
        margin: 10px;
        min-width: 300px;
        height: 300px;
        flex: 1;
        flex-basis: 20%;
        padding: 10px;
    }
    #mobileList .deviceCon {
        width: 300px;
        height: 100%;
        margin: 30px auto;
        display: grid;
        grid-template-columns: 52% 48%;
        grid-template-rows: 50% 50%;
    }
    #mobileList .item1 {
        grid-row-start: 1;
        grid-row-end: 3;
    }
    #mobileList .item1 img {
        height: 100%;
    }
    #mobileList .item3 {
        padding-left: 10px;
        float: left;
        text-align: left;
        font-weight: bolder;
        font-size: 35px;
        line-height: 35px;
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
            <div class="comment">
                <p>당신에게 딱 맞는, 당신을 위한 핸드폰</p>
            </div>
            <div class="listArea">
            <% if ( list.isEmpty() ) { %>
                <p> 등록된 기기가 없습니다. </p>
            <% } else { 
                for ( int i = 0 ; i < list.size() ; i++ ) {
                	if ( i == randomAd ) { %>
                <div>
                	<div class="deviceCon">AD</div>
                </div>
            <% randomAd = 0; i--; } else { %>
                <div>
                    <div class="deviceCon">
                        <div class="item1">
                            <img src="<%=request.getContextPath()%>/image/testImgV50.png">
                        </div>
                        <div class="item2"></div>
                        <div class="item3"><%= list.get(i).getmNameEn() %></div>
                    </div>
                </div>
            <% } } } %>
            </div>
        </section>
    </section>
    <script>
        function listLoading() {
        	var currentPage = <%=pInf.getCurrentPage()%> + 1;
        	var maxPage = <%=pInf.getMaxPage()%>;
        	
        	if ( currentPage > maxPage ) {
        		currentPage = maxPage;
        		return false;
        	}
        	
            $.ajax({
                url: "/listUpdate.mo",
                type: "POST",
                data: { currentPage: currentPage },
                dataType: "json",
                success: function(dList){
                	var $listArea = $("#listArea");
                	$.each(dList, function(i){
                		var $div = $("<div>");
                		var $deviceCon = $("<div>").addClass("deviceCon");
                		var $item1 = $("<div>").addClass("item1");
                		var $img = $("<img>").addAttr("src","<%=request.getContextPath()%>/image/testImgV50.png");
                		$item1.append($img);
                		var $item2 = $("<div>").addClass("item2");
                		var $item3 = $("<div>").addClass("item3").text(dList[i].getNameEn());
                		$deviceCon.append($item1, $item2, $item3);
                		$div.append($deviceCon);
                		$listArea.append($div);
                	});
                },
                error: function(e){
                	console.log(e);
                }
            });
        }
    </script>
</body>
</html>