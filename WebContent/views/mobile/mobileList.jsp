<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, mobile.model.vo.*"%>
<% 
	ArrayList<Mobile> list = (ArrayList<Mobile>)request.getAttribute("list");
	PageInfo pInf = (PageInfo)request.getAttribute("pInf");
    int randomAd = (int)(Math.random()*(list.size()-1))+1;
    
    boolean admin = true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smartphone</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<style>
    #mobileList ul {
        list-style-type: none;
    }
    #mobileList .sidenav>ul>div {
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
    .brandName input {
        display: none;
    }
    .brandName input:checked +label{
        font-weight: 900;
    }
    #amount {
  		border: 0px;
  		font-weight: bold;
  		background-color: #eee;
  	}
    #countBanner {
        display: inline-block;
        margin-right: 10px;
    }
</style>
<script>
    // 주소창 변경용 기본함수
    function ChangeUrl(page, url) {
        if (typeof (history.pushState) != "undefined") {
            // var obj = { Page: null, Url: null };
            history.pushState({page: page, url:url}, page, ""+url);
        } else {
            alert("Browser does not support HTML5.");
        }
    }
    // 주소창 변경용 함수
    function assembleUrl(urlName, urlString) {
        var url = document.location.href;
        var checkUrl = url.split("?");
        if ( checkUrl.length == 1 ) { // 아무것도 추가가 안 되어있는 상황
            ChangeUrl(urlName, '?' + urlString);
            return;
        } 
        var checkVals = checkUrl[1].split(",");
        if ( checkVals.length == 1 ) {
            if ( checkVals[0].includes(urlName) ) {
                ChangeUrl(urlName, '?' + urlString)
            } else {
                ChangeUrl(urlName, '?' + checkVals[0] + ',' + urlString);
            }
        } else {
            for ( var i = 0 ; i < checkVals.length ; i++ ) {
                if ( checkVals[i].includes(urlName) ) {
                    checkVals[i] = urlString
                }
            }
            var newUrl = checkVals.join(",");
            ChangeUrl(urlName, '?' + newUrl);
        }
    }
    function deleteUrl(urlString) {
        var url = document.location.href;
        var checkUrl = url.split("?");
        if ( checkUrl.length == 1 ) {
            return false;
        } 
        var checkVals = checkUrl[1].split(",");
        var newUrl = "";
        if ( checkVals.length == 1 ) {
            ChangeUrl("origin", "./devicelist.mo");
        } else {
            var newArr = checkVals.filter(function(e){
                return !e.includes(urlString);
            })
            newUrl = newArr.join(",");
            ChangeUrl("ch", '?'+newUrl);
        }
    }
    $(function() {
        // 사이드바 필터메뉴 수납
        $(".sideOpen").click(function(){
            $(this).next().slideToggle();
        });
        // 사이드바 브랜드 체크값 받기
        $("input:checkbox").change(function(){
            var brand="brand";
            $("input:checkbox[name=brand]").each(function(){
                if ($(this).is(":checked")) {
                    brand += ":"+($(this).val());
                }
            });
            var text = document.location.href;
            if ( brand.split(":").length != 1) {
            // ChangeUrl('brand', '?' + brand);
            assembleUrl('brand', brand);
            currentPage = 1;
            $.ajax({
                url: "devicelist.mo",
                type: "GET",
                data: { brand: brand,
                        currentPage: currentPage,
                        limit: limit,
                        input: 1 },
                dataType: "json",
                success: function(dList) {
                    console.log("I'm start");   
                    $("#listArea").html("");
                    printList(dList);
                },
                error: function(e){
                    console.log(e);
                }
            });
            } else {
                deleteUrl('brand');  
                $.ajax({
                url: "listUpdate.mo",
                type: "POST",
                data: { currentPage: currentPage,
                    limit: limit },
                dataType: "json",
                success: function(dList){
                    printList(dList);
                    if ( currentPage == maxPage ) {
                        $("#loadBtn").attr("disabled","disabled");
                    }
                },
                error: function(e){
                	console.log(e);
                }
            });
            }
        });
        // 사이드바 배터리 슬라이더 설정
        $( "#slider-range" ).slider({
        range: true,
        min: 1000,
        max: 5000,
        values: [ 1500, 4000 ],
        step: 100,
        slide: function( event, ui ) {
            $( "#amount" ).val( ui.values[ 0 ] + " mAh - " + ui.values[ 1 ] + " mAh");
            // console.log(ui.values[0]);
            // console.log(ui.values[1]);
            // 슬라이더 변화값 확인
        },
        stop: function(event, ui){
            console.log(ui.values[0]);
            console.log(ui.values[1]);
            var slider="slider:"+ui.values[0]+":"+ui.values[1];
            assembleUrl('slider',slider);

            // $.ajax({
            //     url: "listUpdate.mo",
            //     type: "GET",
            //     data: { minB: brand },
            //     dataType: "json",
            //     success: function(dList) {
            //         $("#listArea").html("");
            //         printList(dList);
            //     },
            //     error: function(e){
            //         console.log(e);
            //     }
            // });
        }
        });
        $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
        " mAh - " + $( "#slider-range" ).slider( "values", 1 ) + " mAh" );
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
                <div class="brandName">
                    <input type="checkbox" name="brand" id="samsung" value="samsung"><label for="samsung">삼성전자</label>
                    <input type="checkbox" name="brand" id="lgelec" value="lgelec"><label for="lgelec">LG전자</label>
                    <input type="checkbox" name="brand" id="apple" value="apple"><label for="apple">애플</label>
                    <input type="checkbox" name="brand" id="pantech" value="pantech"><label for="pantech">팬택</label>
                    <input type="checkbox" name="brand" id="htc" value="htc"><label for="htc">HTC</label>
                    <input type="checkbox" name="brand" id="motorola" value="motorola"><label for="motorola">모토로라</label>
                    <input type="checkbox" name="brand" id="kttech" value="kttech"><label for="kttech">KT Tech</label>
                    <input type="checkbox" name="brand" id="sktelesys" value="sktelesys"><label for="sktelesys">SK 텔레시스</label>
                    <input type="checkbox" name="brand" id="sonymobile" value="sonymobile"><label for="sonymobile">소니 모바일</label>
                    <input type="checkbox" name="brand" id="nokia" value="nokia"><label for="nokia">노키아</label>
                </div>
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
                <div>
                	<p>
					  <label for="amount">Price range:</label>
					  <input type="text" id="amount" readonly style="border:0; font-weight:bold;">
					</p>
					<div id="slider-range"></div>
                </div>
            </ul>
            <input type="button" value="Page1" id="button1" />
            <input type="button" value="Page2" id="button2" />
            <input type="button" value="Page3" id="button3" />
        </div>
        <!-- Page content -->
        <section class="main">
            <div class="comment">
                <p class="lead font-weight-bolder" id="printComment">당신에게 딱 맞는, 당신을 위한 핸드폰</p>
            </div>
            <div class="resultsCont">
                <% if ( true ) { %>
                <div>
                    <button class="btn btn-primary float-right">등록</button>
                </div>
                    <% } %>
                <h3 id="countBanner" class="font-weight-bolder">Search Results</h3>
                <span id="countNum"><%=pInf.getListCount()%></span>
            </div>
            <div class="listArea" id="listArea">
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
            <button type="button" onclick="listLoading()" id="loadBtn">로딩</button>
        </section>
    </section>
    <script>
        var currentPage = 1;
        var limit = <%=pInf.getLimit()%>;
        var maxPage = <%=pInf.getMaxPage()%>;
        <%-- 리스트 갱신 함수
         처음 접속했을때는 모든 리스트를 받아오고
         필터링 했을때는 필터링한 리스트를 받아옴(그렇게 동작했으면 좋겠다) --%>
        function listLoading() {
            currentPage += 1;
            var check = document.location.href.split("?");
            if ( check.length == 1 ) {
            $.ajax({
                url: "listUpdate.mo",
                type: "POST",
                data: { currentPage: currentPage,
                    limit: limit },
                dataType: "json",
                success: function(dList){
                    printList(dList);
                    if ( currentPage == maxPage ) {
                        $("#loadBtn").attr("disabled","disabled");
                    }
                },
                error: function(e){
                	console.log(e);
                }
            });
            } else {
                $.ajax({
                    url: "listUpdate.mo",
                    type: "GET",
                    data: { currentPage: currentPage,
                            limit: limit,
                            input: 1,
                            qString: check[1] },
                    dataType: "json",
                    success: function(dList){
                        printList(dList);
                        if ( currentPage == maxPage ) {
                            $("#loadBtn").attr("disabled","disabled");
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                });
            }
        }

        function printList(dList){
            var $listArea = $("#listArea");
            var $addiv = $("<div>");
            var $adCon = $("<div>").addClass("deviceCon").text("AD");
            $addiv.append($adCon);
            $listArea.append($addiv);
            $.each(dList, function(i){
                var $div = $("<div>");
                    var $deviceCon = $("<div>").addClass("deviceCon");
                var $item1 = $("<div>").addClass("item1");
                var $img = $("<img>").attr("src","<%=request.getContextPath()%>/image/testImgV50.png");
                $item1.append($img);
                var $item2 = $("<div>").addClass("item2");
                var $item3 = $("<div>").addClass("item3").text(dList[i].mNameEn);
                    $deviceCon.append($item1, $item2, $item3);
                $div.append($deviceCon);
                $listArea.append($div);
            });
        }
    </script>
</body>
</html>