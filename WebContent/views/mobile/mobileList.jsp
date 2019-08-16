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
        cursor: pointer;
    }
    #mobileList .item1 {
        grid-row-start: 1;
        grid-row-end: 3;
    }
    #mobileList .item1 img {
        height: 100%;
    }
    #mobileList .item2 {
        position: relative;
    }
    .item2 img {
        width: 30px;
        height: 30px;
        opacity: 0.3;
    }
    .item2.comPP img {
        opacity: 1;
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
    #batAmount, #ScreenAmount {
  		border: 0px;
  		font-weight: bold;
  		background-color: #eee;
  	}
    #countBanner {
        display: inline-block;
        margin-right: 10px;
    }
    .compare-drawer-con {
        position: fixed;
        bottom: -200px;
        right: 60px;
        z-index: 90;
        width: 250px;
        min-height: 200px;
        background-color: #fff;
        z-index: 200;
        transition: 400ms;
        padding: 20px;
    }
    .open {
        transform: translateY(-200px);
        /* bottom: 100px; */
    }
    .comTitle {
        align-items: baseline;
        position: relative;
        text-align: center;
        padding: 5px;
    }
    .comTitle h3 {
        display: inline-block;
        /* margin: 0; */
    }
    .comTitle i {
        font-size: 20px;
        color: #666;
        /* margin: 10px auto; */
        padding: 0px 0;
        top: 11px;
        right: 5px;
        position: absolute;
    }
    .comPhone {
        position: relative;
    }
    .comPhone i {
        position: absolute;
        font-size: 15px;
        /* line-height: 20px; */
        margin-top: 3px;
        right: 5px;
    }
    #mySidenav button{
        line-height: 20px;
        margin: 20px 0 0 0;
    }
    .deviceFImage {
        width: 150px;
        height: auto;
    }
    .compareBtn {
        display: inline-block;
        width: 30px;
        height: 30px;
        position: absolute;
        top : 10px;
        right: 10px;
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
    // 주소창 쿼리스트링 조립용 함수
    function assembleUrl(urlName, urlString) {
        var url = document.location.href;
        var checkUrl = url.split("?");
        if ( checkUrl.length == 1 ) { // 아무것도 추가가 안 되어있는 상황
            ChangeUrl(urlName, '?' + urlString);
            return;
        } 
        var checkVals = checkUrl[1].split(",");
        if ( checkVals.length == 1 ) { // 하나만 추가가 되어있는 상황
            if ( checkVals[0].includes(urlName) ) { // 추가되어있는 값이 이미 있는 값과 같은 카테고리 일때
                ChangeUrl(urlName, '?' + urlString)
            } else { // 추가되어있는 값이 다른 카테고리일때
                ChangeUrl(urlName, '?' + checkVals[0] + ',' + urlString);
            }
        } else { // 여러개가 추가 되어있는 상황
            for ( var i = 0 ; i < checkVals.length ; i++ ) {
                if ( checkVals[i].includes(urlName) ) {
                    checkVals[i] = urlString
                } // 해당 카테고리의 값만 입력된 스트링으로 대체 한 뒤
            }
            var newUrl = checkVals.join(","); // 해당 배열을 문자열로 만들어 주소값으로 대체한다
            ChangeUrl(urlName, '?' + newUrl);
        }
    }
    // 주소창 쿼리스트링 삭제용 함수
    function deleteUrl(urlString) {
        var url = document.location.href;
        var checkUrl = url.split("?");
        if ( checkUrl.length == 1 ) { // (그럴일은 없겠지만) 쿼리스트링이 없을경우 리턴
            return false;
        } 
        var checkVals = checkUrl[1].split(",");
        var newUrl = "";
        if ( checkVals.length == 1 ) { // 추가된 값이 하나였을 경우 주소값을 디폴트로 되돌린다
            ChangeUrl("origin", "./devicelist.mo");
        } else { // 추가된 값이 여러개였을 경우
            var newArr = checkVals.filter(function(e){ // 필터로 해당 값만 걸러내고 만든 새 배열을
                return !e.includes(urlString);
            })
            newUrl = newArr.join(","); // 조인하여 스트링으로 주소창에 붙인다
            ChangeUrl("ch", '?'+newUrl);
        }
    }
    // ajax 호출 -> 리스트 업데이트용! 
    function filtering(){
        var address = document.location.href.split("?");
        var qString = "";
        if ( address.length != 1 ) {
            qString = address[1];
        }
        currentPage = 1;
        $.ajax({
            url: "devicelist.mo",
            type: "GET",
            data: { qString: qString,
                    currentPage: currentPage},
            dataType: "json",
            error: function(e) {
                console.log(e);
            },
            success: function(dList){
                if ( dList.return == false ) return false;
                filteringCount();
                $("#listArea").html("");
                printList(dList);
            }
        });
    }
    // 리스트 출력용
    function printList(dList){
        var $listArea = $("#listArea");
        var $addiv = $("<div>");
        $.each(dList, function(i){
            var $div = $("<div>");
            var $deviceCon = $("<div>").addClass("deviceCon").attr("id",dList[i].mNo);
            var $item1 = $("<div>").addClass("item1");
            var $img = $("<img>").addClass("deviceFImage");
            if ( dList[i].mFrontImage == null ) {
                $img.attr("src","<%=request.getContextPath()%>/image/smartphoneG.png");
            } else {
                $img.attr("src","<%=request.getContextPath()%>/image/mobileImages/"+dList[i].mFrontImage);
            }
            $item1.append($img);
            var $item2 = $("<div>").addClass("item2");
            var $span = $("<span>").addClass("compareBtn");
            var $compareImg = $("<img>").attr("src","<%=request.getContextPath()%>/image/compare.png");
            $item2.append($span.append($compareImg));
            var $item3 = $("<div>").addClass("item3").text(dList[i].mNameEn);
                $deviceCon.append($item1, $item2, $item3);
            $div.append($deviceCon);
            $listArea.append($div);
            if ( i == 4 ) {
                var $adCon = $("<div>").addClass("deviceCon").text("AD");
                $addiv.append($adCon);
                $listArea.append($addiv);
            }
        });
    }
    // 검색결과 값 출력용 함수
    function filteringCount(){
        var address = document.location.href.split("?");
        var qString = "";
        if ( address.length != 1 ) {
            qString = address[1];
        }
        $.ajax({
            url: "count.mo",
            type: "GET",
            data: { qString: qString },
            error: function(e) {
                console.log(e);
            },
            success: function(listCount){
                $("#countNum").html(listCount);
            }
        });
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
                assembleUrl('brand', brand);
                filtering();
            } else {
                deleteUrl('brand');  
                filtering();    
            }
        });
        // 슬라이더바 배터리 슬라이더 설정
        $( "#slider-battery" ).slider({
        range: true,
        min: 1000,
        max: 5000,
        values: [ 1000, 5000 ],
        step: 100,
        slide: function( event, ui ) {
            $( "#batAmount" ).val( ui.values[ 0 ] + " mAh - " + ui.values[ 1 ] + " mAh");
        },
        stop: function(event, ui){
            if ( ui.values[0] == 1000 && ui.values[1]== 5000 ) {
                deleteUrl('battery')
                filtering();
            } else {
                var slider="battery:"+ui.values[0]+":"+ui.values[1];
                assembleUrl('battery',slider);
                filtering();
            }
        }
        });
        $( "#batAmount" ).val( $( "#slider-battery" ).slider( "values", 0 ) +
        " mAh - " + $( "#slider-battery" ).slider( "values", 1 ) + " mAh" );
        // 슬라이더바 스크린 설정
        $( "#slider-screen" ).slider({
        range: true,
        min: 2,
        max: 8,
        values: [ 2, 8 ],
        step: 0.1,
        slide: function( event, ui ) {
            $( "#ScreenAmount" ).val( ui.values[ 0 ] + " Inch - " + ui.values[ 1 ] + " Inch");
        },
        stop: function(event, ui){
            if ( ui.values[0] == 2 && ui.values[1]== 8 ) {
                deleteUrl('screen')
                filtering();
            } else {
                var screen="screen:"+ui.values[0]+":"+ui.values[1];
                assembleUrl('screen',screen);
                filtering();
            }
        }
        });
        $( "#ScreenAmount" ).val( $( "#slider-screen" ).slider( "values", 0 ) +
        " Inch - " + $( "#slider-screen" ).slider( "values", 1 ) + " Inch" );
        // 리스트 상세 조회용 함수!
        $(document).on("click",".item1",function(){
            var mno = $(this).parent().attr("id");
            console.log(mno);
            location.href="<%=request.getContextPath()%>/spec.mo?currentPage="+currentPage+"&mno="+mno+"&page="+1;
        });
        $(document).on("click",".item3",function(){
            var mno = $(this).parent().attr("id");
            console.log(mno);
            location.href="<%=request.getContextPath()%>/spec.mo?currentPage="+currentPage+"&mno="+mno+"&page="+1;
        });
        // 비교 서랍메뉴 출력용
        $(document).on("click",".item2>span", function(){
            var $this = $(this).parent();
            if ( $this.hasClass("comPP") ) return false;
            if ( $(".comP").length == 2 ) return false;
            var mno = $this.parent().attr("id");
            $.ajax({
                url: "spec.mo",
                type: "POST",
                data: {mno : mno},
                dataType: "json",
                error: function(e){
                    console.log(e);
                },
                success: function(device){
                    var $comPhone = $(".comPhone");
                    var $comP = $("<div>").attr("comp",device.mNo).addClass("comP");
                    var $devieceN = $("<span>").text(device.mName);
                    var $clear = $("<span>").html('<i class="material-icons removeDevice">clear</i>');
                    $comP.append($devieceN, $clear);
                    $comPhone.append($comP);
                    if ( $(".comP").length == 2 ) { // comP 갯수 세어서 버튼 사용가능하게 하기
                        $("#specCompare").removeAttr("disabled");
                    }
                }
            });
            // 리스트 추가에 성공할 경우 해당 핸드폰에 comPP 라는 클래스를 덧붙인다
            $this.addClass("comPP");
            $("#mySidenav").addClass("open");
        });
        // 비교 서랍메뉴 비우고 서랍메뉴 닫기
        $("#flushDevice").on("click", function(){
            $(".item2").each( function(){ // item2 클래스를 가진 요소에 개별 접근하여
            // 임의로 붙여둔 comPP를 지워준다~
                if ( $(this).hasClass("comPP") ) $(this).removeClass("comPP");
            });
            $("#mySidenav").removeClass("open");
            $("#specCompare").attr("disabled", "disabled");
            $(".comPhone").html("");
        });
        // X 표시 클릭시 해당 내용만 지우기
        $(document).on("click", ".removeDevice", function(){
            if ( $(".comP").length == 1 ) {
                $("#mySidenav").removeClass("open");
            }
            var id = $(this).parent().parent().attr("comp");
            $(this).parent().parent().remove();
            $("#"+id).children().eq(1).removeClass("comPP");
            $("#specCompare").attr("disabled", "disabled");
        });
        // 비교 서랍에 핸드폰을 2개 담고 버튼을 누르면 비교화면으로 이동
        $(document).on("click", "#specCompare", function(){
            if ( $(".comP").length < 2 ) return false;
            // 그럴일은 없겠지만 핸드폰이 2개 이하인 상태에서 버튼을 누르면 동작 안함
            var com1 = $(".comP").eq(0).attr("comp");
            var com2 = $(".comP").eq(1).attr("comp");
            // 비교 서랍에 담겨있는 id값 2개 받아오기
            if ( com1 == com2 ) return false; 
            // 그럴일은 없겠지만 같은 핸드폰이 2번 담겼을 경우 동작 안함

            location.href='<%=request.getContextPath()%>/compareSpec.mo?com1='+com1+'&com2='+com2;
        }); 
        $("#insertDevice").on("click", function(){
            location.href = "<%=request.getContextPath()%>/insertForm.mo";
        });
    });

    // 시작시 함수 한번 호출 (주소창 값으로 필터링 하기 위해)
    filtering();
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
                    Screen
                </li>
                <div>
                    <p>
                        <label for="ScreenAmount">Price range:</label>
                        <input type="text" id="ScreenAmount" readonly style="border:0; font-weight:bold;">
                    </p>
                    <div id="slider-screen"></div>
                </div>
                <li class="sideOpen">
                    Color
                </li>
                <div>색상</div>
                <li class="sideOpen">
                    Battery
                </li>
                <div>
                	<p>
					  <label for="batAmount">Price range:</label>
					  <input type="text" id="batAmount" readonly style="border:0; font-weight:bold;">
					</p>
					<div id="slider-battery"></div>
                </div>
            </ul>
        </div>
        <!-- Page content -->
        <section class="main">
            <div class="comment">
                <p class="lead font-weight-bolder" id="printComment">당신에게 딱 맞는, 당신을 위한 핸드폰</p>
            </div>
            <div class="resultsCont">
                <% if ( loginUser != null && loginUser.getUserName().equals("admin") ) { %>
                <div>
                    <button class="btn btn-primary float-right" id="insertDevice">등록</button>
                </div>
                    <% } %>
                <h4 id="countBanner" class="font-weight-bolder">Search Results</h4>
                <span id="countNum"><%=pInf.getListCount()%></span>
            </div>
            <div class="listArea" id="listArea">
            <% if ( list.isEmpty() ) { %>
                <p> 검색된 기기가 없습니다. </p>
            <% } else { 
                for ( int i = 0 ; i < list.size() ; i++ ) {
                	if ( i == randomAd ) { %>
                <div>
                	<div class="deviceCon">AD</div>
                </div>
            <% randomAd = 0; i--; } else { %>
                <div>
                    <div class="deviceCon" id="<%= list.get(i).getmNo() %>">
                        <div class="item1">
                            <% if (list.get(i).getmFrontImage() == null ) { %>
                            <img src="<%=request.getContextPath()%>/image/smartphoneG.png" class="deviceFImage">
                            <% } else { %>
                                <img src="<%=request.getContextPath()%>/image/mobileImages/<%=list.get(i).getmFrontImage()%>" class="deviceFImage">
                            <% } %>
                        </div>
                        <div class="item2"></div>
                        <div class="item3" id="<%=list.get(i).getmNo()%>"><%= list.get(i).getmNameEn() %></div>
                    </div>
                </div>
            <% } } } %>
            </div>
            <button type="button" onclick="listLoading()" id="loadBtn">로딩</button>
        </section>
    </section>
    <div class="compare-drawer-con border rounded" id="mySidenav">
            <div class="comTitle">
                <h3>COMPARE</h3>
                <i class="material-icons" id="flushDevice">delete</i>
            </div>
            <div class="comPhone">
                <!-- <div class="comP">
                    <span>휴대폰 1</span> <span><i class="material-icons removeDevice">clear</i></span>
                </div> -->
            </div>
            <button type="button" class="btn btn-primary btn-lg btn-block" id="specCompare" disabled>SPEC<br>COMPARE</button>
        </div>
    <script>
        var currentPage = 1;
        var limit = <%=pInf.getLimit()%>;
        var maxPage = <%=pInf.getMaxPage()%>;
        <%-- 리스트 갱신 함수
         처음 접속했을때는 모든 리스트를 받아오고
         필터링 했을때는 필터링한 리스트를 받아옴(그렇게 동작했으면 좋겠다) --%>
        function listLoading() {
            if ( currentPage == maxPage ) {
                // $("#loadBtn").attr("disabled","disabled");
                console.log(currentPage);
                return false;
            }
            var address = document.location.href.split("?");
            var qString = "";
            if ( address.length != 1 ) qString = address[1];
            currentPage += 1;
            console.log(currentPage);
            
            $.ajax({
                url: "listUpdate.mo",
                type: "GET",
                data: { qString : qString,
                        currentPage: currentPage,
                        limit: limit },
                dataType: "json",
                error: function(e){
                    console.log(e);
                },
                success: function(dList){
                    // console.log(dList);
                    // console.log(dList.return)
                    // console.log(Object.keys(dList).length);
                    printList(dList);
                }
            });
            
        }
        $(function(){
            $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
                console.log($(window).scrollTop());
                console.log($(document).height());
                console.log($(window).height());
                console.log($(document).height() - $(window).height());
                console.log($(window).scrollTop() >= ($(document).height() - $(window).height() - 1));
                if($(window).scrollTop() >= ($(document).height() - $(window).height() - 0.1) ){
                    listLoading();
                } 
            });
        })
    </script>
</body>
</html>