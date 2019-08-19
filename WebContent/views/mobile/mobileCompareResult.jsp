<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mobile.model.vo.*"%>
<%
    Mobile device1 = (Mobile)request.getAttribute("device1");
    Mobile device2 = (Mobile)request.getAttribute("device2");

%> 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>COMPARE RESULT</title>
<%@ include file ="/views/common/menubar.jsp" %>
<style>
    * {
        box-sizing: border-box;
        /* border: 1px solid salmon; */
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
        text-align: center;
    }
    #device1Front, #device2Front {
        height: 350px;
        width: auto;
    }
    .compareTop span {
        font-size: 40px;
        font-weight: 900;
        color: #fff;
        text-shadow: 0px 0px 5px rgba(0,0,0,0.7), 0px 0px 10px rgba(0,0,0,0.3);
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
    #specSummary1, #specSummary2 {
        height: 310px;
        background-color: #eee;
        margin: 30px auto;
        border-radius: 5px;
        padding: 5px;
        width: 90%;
        display: grid;
        grid-template-columns: 30% 22.5% 22.5% 25%;
        grid-template-rows: 30% 10% 20% 10% 30%;
    }
    #specSummary1 div,#specSummary2 div {
        display: inline-block;
        border-radius: 5px;
        border: 1px solid #ccc;
        background-color: white;
        margin: 5px;
    }
    /* summary 위치잡기 */
    #mobile1brand, #mobile2brand {
        grid-row-start: 1;
        grid-row-end: 3;
        position: relative;
    }
    #mobile1os, #mobile2os{
        grid-column-start: 4;
        grid-column-end: 5;
        grid-row-start: 1;
        grid-row-end: 3;
    }
    #mobile1disSize, #mobile2disSize {
        grid-column-start: 4;
        grid-column-end: 5;
        grid-row-start: 3;
        grid-row-end: 6;
    }
    #mobile1size, #mobile2size{
        grid-column-start: 2;
        grid-column-end: 4;
    }
    #mobile1weight, #mobile1gb, #mobile2weight, #mobile2gb {
        grid-row-start: 2;
        grid-row-end: 4;
    }
    #mobile1ap, #mobile2ap {
        grid-row-start: 3;
        grid-row-end: 5;
    }
    #mobile1battery, #mobile2battery {
        grid-column-start: 1;
        grid-column-end: 2;
        background: url(image/OS/battery.png) no-repeat center;
        background-size: 120px;

    }
    #mobile1display, #mobile1ram, #mobile2display, #mobile2ram {
        grid-row-start: 4;
        grid-row-end: 6;
    }
    .long-Ad {
        clear: both;
        width: 900px;
        height: 200px;
        background-color: antiquewhite;
        margin: 0 auto 50px auto;
    }
    .clear {
        clear: both;
        /* border: 10px solid #ccc; */
        margin-bottom: 50px;
    }
    .detailSpec table {
        width: 90%;
        margin: 10px auto 30px auto;
        border-bottom: 1px solid #ddd;
    }
    .detailSpec table th {
        width: 30%;
    }
    .compareBot {
        clear: both;
        width: 900px;
        margin: 0 auto;
    }
    #specSummary1 span, #specSummary2 span {
        background-color: #666;
        display: inline-block;
        border-radius: 20px;
        color: #fff;
        font-weight: 900;
        margin: 10px 0 0 0;
    }
    #mo2brand, #mo1brand {
        width: 100px;
        position: absolute;
        margin: auto;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }
    #mobile1osLogo, #mobile2osLogo {
        width: auto;
        height: 55px;
        margin: 5px auto 0 auto;
    }
    #mobile1disSize, #mobile2disSize {
        background: url(image/smartphoneDisSize.png) no-repeat center;
        background-size: 80px auto;
        line-height: 20px;
    }
</style>
<script>
        $(function(){
            <% switch ( device1.getmBrandName() ) { 
            case "삼성전자" : %> $("#mo1brand").attr("src","image/logo/logo-samsung.png"); <% break; 
            case "LG전자" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-lg.png");<% break; 
            case "애플" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-apple.png");<% break; 
            case "팬택" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-Pantech.png");<% break; 
            case "HTC" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-htc.png");<% break; 
            case "모토로라" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-motorola.png");<% break; 
            case "KT Tech" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-KT_Tech.png");<% break; 
            case "SK 텔레시스" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-sk telesys.png");<% break; 
            case "소니 모바일" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-sony.png");<% break; 
            case "노키아" : %> $("#mo1brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-nokia.png");<% break; 
            } %>
            <% switch ( device2.getmBrandName() ) { 
            case "삼성전자" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-samsung.png"); <% break; 
            case "LG전자" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-lg.png");<% break; 
            case "애플" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-apple.png");<% break; 
            case "팬택" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-Pantech.png");<% break; 
            case "HTC" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-htc.png");<% break; 
            case "모토로라" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-motorola.png");<% break; 
            case "KT Tech" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-KT_Tech.png");<% break; 
            case "SK 텔레시스" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-sk telesys.png");<% break; 
            case "소니 모바일" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-sony.png");<% break; 
            case "노키아" : %> $("#mo2brand").attr("src","<%=request.getContextPath()%>/image/logo/logo-nokia.png");<% break; 
            } %>
            <% switch ( device1.getmOsName() ) {
            case "안드로이드": %> $("#mobile1osLogo").attr("src","image/OS/And.png"); <%break;
            case "iOS" : %> $("#mobile1osLogo").attr("src","image/OS/iOS.png"); <%break;
            default : %> $("#mobile1osLogo").attr("alt","미확인"); <%break;
            } %>
            <% switch ( device2.getmOsName() ) {
            case "안드로이드": %> $("#mobile2osLogo").attr("src","image/OS/And.png"); <%break;
            case "iOS" : %> $("#mobile2osLogo").attr("src","image/OS/iOS.png"); <%break;
            default : %> $("#mobile2osLogo").attr("alt","미확인"); <%break;
            } %>
        });
    
    </script>
</head>
<body>
    <section class="compareRe">
        <div class="compareTop">
            <div class="mobile1">
                <% if ( device1.getmFrontImage() == null ) { %>
                <img src="<%=request.getContextPath()%>/image/smartphoneG.png" id="device1Front">
                <% } else { %>
                <img src="<%=request.getContextPath()%>/image/mobileImages/<%=device1.getmFrontImage()%>" id="device1Front">
                <% } %>
                <br><span><%=device1.getmName()%></span>
                <!-- <div class="mo1Count">좋아요/소지수</div> -->
            </div>
            <div class="mobile2">
                <% if ( device2.getmFrontImage() == null ) { %>
                <img src="<%=request.getContextPath()%>/image/smartphoneG.png" id="device2Front">
                <% } else { %>
                <img src="<%=request.getContextPath()%>/image/mobileImages/<%=device2.getmFrontImage()%>" id="device2Front">
                <% } %>
                <br><span><%=device2.getmName()%></span>
                <!-- <div class="mo2Count">좋아요/소지수</div> -->
            </div>
        </div>
        <div class="compareMid">
            <div class="mobile1">
                <div id="specSummary1">
                    <div id="mobile1brand">
                        <img id="mo1brand">
                    </div>
                    <div id="mobile1size"><span>&nbsp;&nbsp;Size&nbsp;&nbsp;</span><br><%=device1.getmSize()%></div>
                    <div id="mobile1weight"><span>&nbsp;&nbsp;Weight&nbsp;&nbsp;</span><br><%=device1.getmWeight()%></div>
                    <div id="mobile1gb"><span>&nbsp;&nbsp;Gb&nbsp;&nbsp;</span><br><%=device1.getmInnerMemory()%></div>
                    <div id="mobile1ap"><span>&nbsp;&nbsp;AP&nbsp;&nbsp;</span><br><%=device1.getmAp()%></div>
                    <div id="mobile1os"><span>&nbsp;&nbsp;OS&nbsp;&nbsp;</span><br>
                        <img id="mobile1osLogo">
                    </div>
                    <div id="mobile1battery"><span>&nbsp;&nbsp;Battery&nbsp;&nbsp;</span><br><%=device1.getmBattery()%></div>
                    <div id="mobile1display"><span>&nbsp;&nbsp;Display&nbsp;&nbsp;</span><br><%=device1.getmDisplayType()%></div>
                    <div id="mobile1ram"><span>&nbsp;&nbsp;Ram&nbsp;&nbsp;</span><br><%=device1.getmRam()%></div>
                    <div id="mobile1disSize"><span>&nbsp;&nbsp;DisplaySize&nbsp;&nbsp;</span><br><br><br><%=device1.getmInch()%></div>
                </div>
            </div>
            <div class="mobile2">
                <div id="specSummary2">
                    <div id="mobile2brand">
                        <img id="mo2brand">
                    </div>
                    <div id="mobile2size"><span>&nbsp;&nbsp;Size&nbsp;&nbsp;</span><br><%=device2.getmSize()%></div>
                    <div id="mobile2weight"><span>&nbsp;&nbsp;Weight&nbsp;&nbsp;</span><br><%=device2.getmWeight()%></div>
                    <div id="mobile2gb"><span>&nbsp;&nbsp;Gb&nbsp;&nbsp;</span><br><%=device2.getmInnerMemory()%></div>
                    <div id="mobile2ap"><span>&nbsp;&nbsp;AP&nbsp;&nbsp;</span><br><%=device2.getmAp()%></div>
                    <div id="mobile2os"><span>&nbsp;&nbsp;OS&nbsp;&nbsp;</span><br>
                        <img id="mobile2osLogo">
                    </div>
                    <div id="mobile2battery"><span>&nbsp;&nbsp;Battery&nbsp;&nbsp;</span><br><%=device2.getmBattery()%></div>
                    <div id="mobile2display"><span>&nbsp;&nbsp;Display&nbsp;&nbsp;</span><br><%=device2.getmDisplayType()%></div>
                    <div id="mobile2ram"><span>&nbsp;&nbsp;Ram&nbsp;&nbsp;</span><br><%=device2.getmRam()%></div>
                    <div id="mobile2disSize"><span>&nbsp;&nbsp;DisplaySize&nbsp;&nbsp;</span><br><br><br><%=device2.getmInch()%></div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="long-Ad">
                ad
            </div>
            <div class="mobile1 detailSpec">
                <table class="table">
                    <tr>
                        <th scope="row">제조사</th>
                        <td><%=device1.getmBrandName()%></td>
                    </tr>
                    <tr>
                        <th scope="row">모델명</th>
                        <td><%=device1.getmCode()%></td>
                    </tr>
                    <tr>
                        <th scope="row">출시일</th>
                        <td><% if ( device1.getmReleaseDate() != null ) { %><%= device1.getmReleaseDate() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">출시OS</th>
                        <td><% if ( device1.getmOsName() != null ) { %><%= device1.getmOsName() %> <%= device1.getmOsVersion()%><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">주요재질</th>
                        <td><% if ( device1.getmMaterial() != null ) { %><%= device1.getmMaterial() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">크기(WxHxD, mm)</th>
                        <td><% if ( device1.getmSize() != null ){ %><%= device1.getmSize() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">무게(g)</th>
                        <td><% if ( device1.getmWeight() != null){ %><%= device1.getmWeight() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">연결단자</th>
                        <td><% if ( device1.getmLink() != null ){ %><%= device1.getmLink() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">액정크기(인치)</th>
                        <td><% if ( device1.getmInch() != 0 ){ %><%= device1.getmInch() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면해상도</th>
                        <td><% if ( device1.getmResolution() != null ){ %><%= device1.getmResolution() %><% } %></td>
                    </tr><tr>
                        <th scope="row">Pixel/Inch</th>
                        <td><% if ( device1.getmPixel() != null ){ %><%= device1.getmPixel() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면 타입</th>
                        <td><% if ( device1.getmDisplayType() != null ){ %><%= device1.getmDisplayType() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면 폭</th>
                        <td><% if ( device1.getmDisWidth() != null ){ %><%= device1.getmDisWidth() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면 높이</th>
                        <td><% if ( device1.getmDisHeight() != null ){ %><%= device1.getmDisHeight() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">AP</th>
                        <td><% if ( device1.getmAp() != null ){ %><%= device1.getmAp() %><% } %></td>
                    </tr><tr>
                        <th scope="row">CPU</th>
                        <td><% if ( device1.getmCpu() != null ){ %><%= device1.getmCpu() %><% } %></td>
                    </tr><tr>
                        <th scope="row">CPU코어</th>
                        <td><% if ( device1.getmCpuCore() != null ){ %><%= device1.getmCpuCore() %><% } %></td>
                    </tr><tr>
                        <th scope="row">CPU클럭</th>
                        <td><% if ( device1.getmCpuClock() != null ){ %><%= device1.getmCpuClock() %><% } %></td>
                    </tr><tr>
                        <th scope="row">GPU</th>
                        <td><% if ( device1.getmGpu() != null ){ %><%= device1.getmGpu() %><% } %></td>
                    </tr><tr>
                        <th scope="row">메모리(RAM)</th>
                        <td><% if ( device1.getmRam() != null ){ %><%= device1.getmRam() %><% } %></td>
                    </tr><tr>
                        <th scope="row">내장메모리</th>
                        <td><% if ( device1.getmInnerMemory() != null ){ %><%= device1.getmInnerMemory() %><% } %></td>
                    </tr><tr>
                        <th scope="row">외장메모리</th>
                        <td><% if ( device1.getmOuterMemory() != null ){ %><%= device1.getmOuterMemory() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">카메라 센서</th>
                        <td><% if ( device1.getmSensor() != null ){ %><%= device1.getmSensor() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 조리개</th>
                        <td><% if ( device1.getmIris() != null ){ %><%= device1.getmIris() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">Flash</th>
                        <td><% if ( device1.getmFlash() != null ){ %><%= device1.getmFlash() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">사진촬영 해상도</th>
                        <td><% if ( device1.getmPicResolution() != null ){ %><%= device1.getmPicResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 해상도</th>
                        <td><% if ( device1.getmVidResolution() != null ){ %><%= device1.getmVidResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 프레임</th>
                        <td><% if ( device1.getmVidFrame() != null ){ %><%= device1.getmVidFrame() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 해상도</th>
                        <td><% if ( device1.getmFrontResolution() != null ){ %><%= device1.getmFrontResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 동영상 해상도</th>
                        <td><% if ( device1.getmFrontVidResolution() != null ){ %><%= device1.getmFrontVidResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 비디오 프레임</th>
                        <td><% if ( device1.getmFrontVidFrame() != null ){ %><%= device1.getmFrontVidFrame() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 특징</th>
                        <td><% if ( device1.getmCamera() != null ){ %><%= device1.getmCamera() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">배터리(mAH)</th>
                        <td><% if ( device1.getmBattery() != 0 ){ %><%= device1.getmBattery() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리타입</th>
                        <td><% if ( device1.getmBatteryType() != null ){ %><%= device1.getmBatteryType() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">고속 충전</th>
                        <td><% if ( device1.getmFastCharsing() != null ){ %><%= device1.getmFastCharsing() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리 탈착</th>
                        <td><% if ( device1.getmRemovableBat() != null ){ %><%= device1.getmRemovableBat() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">무선 충전</th>
                        <td><% if ( device1.getmWireless() != null ){ %><%= device1.getmWireless() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">대기 시간</th>
                        <td><% if ( device1.getmStandBy() != null ){ %><%= device1.getmStandBy() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">통신 규격</th>
                        <td><% if ( device1.getmProtocol() != null ){ %><%= device1.getmProtocol() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">WiFi</th>
                        <td><% if ( device1.getmWifi() != null ){ %><%= device1.getmWifi() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">블루투스 버전</th>
                        <td><% if ( device1.getmBluetooth() != null ){ %><%= device1.getmBluetooth() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">USB버전</th>
                        <td><% if ( device1.getmUsb() != null ){ %><%= device1.getmUsb() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">생체 인식</th>
                        <td><% if ( device1.getmBio() != null ){ %><%= device1.getmBio() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">모바일 결제</th>
                        <td><% if ( device1.getmPayment() != null ){ %><%= device1.getmPayment() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">인증</th>
                        <td><% if ( device1.getmVerify() != null ){ %><%= device1.getmVerify() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">기타</th>
                        <td><% if ( device1.getmEtc() != null ){ %><%= device1.getmEtc() %><% } %></td>
                    </tr>
                </table>
            </div>
            <div class="mobile2 detailSpec">
                <table class="table">
                    <tr>
                        <th scope="row">제조사</th>
                        <td><%=device2.getmBrandName()%></td>
                    </tr>
                    <tr>
                        <th scope="row">모델명</th>
                        <td><%=device2.getmCode()%></td>
                    </tr>
                    <tr>
                        <th scope="row">출시일</th>
                        <td><% if ( device2.getmReleaseDate() != null ) { %><%= device2.getmReleaseDate() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">출시OS</th>
                        <td><% if ( device2.getmOsName() != null ) { %><%= device2.getmOsName() %> <%= device1.getmOsVersion()%><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">주요재질</th>
                        <td><% if ( device2.getmMaterial() != null ) { %><%= device2.getmMaterial() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">크기(WxHxD, mm)</th>
                        <td><% if ( device2.getmSize() != null ){ %><%= device2.getmSize() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">무게(g)</th>
                        <td><% if ( device2.getmWeight() != null){ %><%= device2.getmWeight() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">연결단자</th>
                        <td><% if ( device2.getmLink() != null ){ %><%= device2.getmLink() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">액정크기(인치)</th>
                        <td><% if ( device2.getmInch() != 0 ){ %><%= device2.getmInch() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면해상도</th>
                        <td><% if ( device2.getmResolution() != null ){ %><%= device2.getmResolution() %><% } %></td>
                    </tr><tr>
                        <th scope="row">Pixel/Inch</th>
                        <td><% if ( device2.getmPixel() != null ){ %><%= device2.getmPixel() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면 타입</th>
                        <td><% if ( device2.getmDisplayType() != null ){ %><%= device2.getmDisplayType() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면 폭</th>
                        <td><% if ( device2.getmDisWidth() != null ){ %><%= device2.getmDisWidth() %><% } %></td>
                    </tr><tr>
                        <th scope="row">화면 높이</th>
                        <td><% if ( device2.getmDisHeight() != null ){ %><%= device2.getmDisHeight() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">AP</th>
                        <td><% if ( device2.getmAp() != null ){ %><%= device2.getmAp() %><% } %></td>
                    </tr><tr>
                        <th scope="row">CPU</th>
                        <td><% if ( device2.getmCpu() != null ){ %><%= device2.getmCpu() %><% } %></td>
                    </tr><tr>
                        <th scope="row">CPU코어</th>
                        <td><% if ( device2.getmCpuCore() != null ){ %><%= device2.getmCpuCore() %><% } %></td>
                    </tr><tr>
                        <th scope="row">CPU클럭</th>
                        <td><% if ( device2.getmCpuClock() != null ){ %><%= device2.getmCpuClock() %><% } %></td>
                    </tr><tr>
                        <th scope="row">GPU</th>
                        <td><% if ( device2.getmGpu() != null ){ %><%= device2.getmGpu() %><% } %></td>
                    </tr><tr>
                        <th scope="row">메모리(RAM)</th>
                        <td><% if ( device2.getmRam() != null ){ %><%= device2.getmRam() %><% } %></td>
                    </tr><tr>
                        <th scope="row">내장메모리</th>
                        <td><% if ( device2.getmInnerMemory() != null ){ %><%= device2.getmInnerMemory() %><% } %></td>
                    </tr><tr>
                        <th scope="row">외장메모리</th>
                        <td><% if ( device2.getmOuterMemory() != null ){ %><%= device2.getmOuterMemory() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">카메라 센서</th>
                        <td><% if ( device2.getmSensor() != null ){ %><%= device2.getmSensor() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 조리개</th>
                        <td><% if ( device2.getmIris() != null ){ %><%= device2.getmIris() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">Flash</th>
                        <td><% if ( device2.getmFlash() != null ){ %><%= device2.getmFlash() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">사진촬영 해상도</th>
                        <td><% if ( device2.getmPicResolution() != null ){ %><%= device2.getmPicResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 해상도</th>
                        <td><% if ( device2.getmVidResolution() != null ){ %><%= device2.getmVidResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 프레임</th>
                        <td><% if ( device2.getmVidFrame() != null ){ %><%= device2.getmVidFrame() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 해상도</th>
                        <td><% if ( device2.getmFrontResolution() != null ){ %><%= device2.getmFrontResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 동영상 해상도</th>
                        <td><% if ( device2.getmFrontVidResolution() != null ){ %><%= device2.getmFrontVidResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 비디오 프레임</th>
                        <td><% if ( device2.getmFrontVidFrame() != null ){ %><%= device2.getmFrontVidFrame() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 특징</th>
                        <td><% if ( device2.getmCamera() != null ){ %><%= device2.getmCamera() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">배터리(mAH)</th>
                        <td><% if ( device2.getmBattery() != 0 ){ %><%= device2.getmBattery() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리타입</th>
                        <td><% if ( device2.getmBatteryType() != null ){ %><%= device2.getmBatteryType() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">고속 충전</th>
                        <td><% if ( device2.getmFastCharsing() != null ){ %><%= device2.getmFastCharsing() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리 탈착</th>
                        <td><% if ( device2.getmRemovableBat() != null ){ %><%= device2.getmRemovableBat() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">무선 충전</th>
                        <td><% if ( device2.getmWireless() != null ){ %><%= device2.getmWireless() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">대기 시간</th>
                        <td><% if ( device2.getmStandBy() != null ){ %><%= device2.getmStandBy() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">통신 규격</th>
                        <td><% if ( device2.getmProtocol() != null ){ %><%= device2.getmProtocol() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">WiFi</th>
                        <td><% if ( device2.getmWifi() != null ){ %><%= device2.getmWifi() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">블루투스 버전</th>
                        <td><% if ( device2.getmBluetooth() != null ){ %><%= device2.getmBluetooth() %><% } %></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">USB버전</th>
                        <td><% if ( device2.getmUsb() != null ){ %><%= device2.getmUsb() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">생체 인식</th>
                        <td><% if ( device2.getmBio() != null ){ %><%= device2.getmBio() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">모바일 결제</th>
                        <td><% if ( device2.getmPayment() != null ){ %><%= device2.getmPayment() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">인증</th>
                        <td><% if ( device2.getmVerify() != null ){ %><%= device2.getmVerify() %><% } %></td>
                    </tr>
                    <tr>
                        <th scope="row">기타</th>
                        <td><% if ( device2.getmEtc() != null ){ %><%= device2.getmEtc() %><% } %></td>
                    </tr>
                </table>
            </div>
            <div class="clear"></div>

        </div>
        <div class="compareBot">
            <%@ include file="compareComment.jsp"%>
        </div>
    </section>
</body>
</html>