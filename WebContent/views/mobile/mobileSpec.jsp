<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mobile.model.vo.Mobile"%>
<%
	/* Mobile mo = (Mobile)request.getAttribute("device"); */
%>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title>mobileSpec</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
    .Mobilecontainer {
        width: 1080px;
        margin: 0 auto;
        clear: both;
    }
    .Mobilecontainer .table td:nth-of-type(odd) {
        width: 150px;
        text-align: center;
        font-weight: bold;
    }
    .Mobilecontainer .table td:nth-of-type(even) {
        width: 300px;
    }
    .mobileMid {
    	clear: both;
    }
    #specSummary {
        height: 310px;
        background-color: #eee;
        margin: 30px auto;
        border-radius: 5px;
        padding: 5px;
        width: 590px;
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
    #brand {
        width: 200px;
        height: 200px;
    }
    #size {
        width: 180px;
        height: 80px;
    }
    #weight {
        width: 80px;
        height: 80px;
    }
    #gb {
        width: 80px;
        height: 80px;
        float: right;
    }
    #ap {
        width: 110px;
        height: 110px;
    }
    #os {
        width: 110px;
        height: 110px;
    }
    #battery {
        clear: both;
        width: 200px;
        height: 80px;
    }
    #display {
        width: 80px;
        height: 80px;
    }
    #ram {
        width: 140px;
        height: 80px;
    }
    #disSize {
        position: absolute;
        right: 5px;
        bottom: 5px;
        width: 120px;
        height: 200px;
    }
    .long-Ad {
        clear: both;
        width: 900px;
        height: 200px;
        background-color: antiquewhite;
        margin: 0 auto 50px auto;
    }
    .mobile-label {
        margin: 50px 0 20px 0;
    }
    .insertMobileBottom {
        width: 900px;
        margin: 0 auto;
    }
</style>
</head>
<body>
 	<%@ include file ="/views/common/menubar.jsp" %>
    <%@ include file = "mobileSpecTop.jsp"%>
	<section class="Mobilecontainer">
        <div id="specSummary">
            <div id="brand"><%= mo.getmBrandName() %></div>
            <div id="size"><%= mo.getmSize() %></div>
            <div id="weight"><%= mo.getmWeight() %></div>
            <div id="gb"><%= mo.getmInnerMemory() %></div>
            <div id="ap"><%= mo.getmAp() %></div>
            <div id="os"><%= mo.getmOsName() %></div>
            <div id="battery"><%= mo.getmBattery() %></div>
            <div id="display"><%= mo.getmDisplayType() %></div>
            <div id="ram"><%= mo.getmRam() %></div>
            <div id="disSize"><%= mo.getmInch() %></div>
        </div>
        <div class="long-Ad">
            가로광고란
        </div>
        <div class="mobileMid">
            <h2 class="mobile-label">제품 스펙</h2>
            <div>
                <table class="table border-bottom">
                    <tr>
                        <td>모델명</td>
                        <td><%= mo.getmCode() %></td>
                        <td>모델이름</td>
                        <td><%= mo.getmNameEn() %></td>
                    </tr>
                    <tr>
                        <td>출시일</td>
                        <td><% if ( mo.getmReleaseDate() != null ) { %><%= mo.getmReleaseDate() %><% } %></td>
                        <td>출시OS</td>
                        <td><% if ( mo.getmOsName() != null ) { %><%= mo.getmOsName() %> <%= mo.getmOsVersion()%><% } %></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">외형</h3>
                <table class="table border-bottom">
                    <tr>
                        <td>주요재질</td>
                        <td><% if ( mo.getmMaterial() != null ) { %><%= mo.getmMaterial() %><% } %></td>
                        <td>크기(WxHxD, mm)</td>
                        <td><% if ( mo.getmSize() != null ){ %><%= mo.getmSize() %><% } %></td>
                    </tr>
                    <tr>
                        <td>무게(g)</td>
                        <td><% if ( mo.getmWeight() != null){ %><%= mo.getmWeight() %><% } %></td>
                        <td>연결단자</td>
                        <td><% if ( mo.getmLink() != null ){ %><%= mo.getmLink() %><% } %></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">디스플레이</h3>
                <table class="table border-bottom">
                    <tr>
                        <td>액정크기(인치)</td>
                        <td><% if ( mo.getmInch() != 0 ){ %><%= mo.getmInch() %><% } %></td>
                        <td>화면해상도</td>
                        <td><% if ( mo.getmResolution() != null ){ %><%= mo.getmResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <td>Pixel/Inch</td>
                        <td><% if ( mo.getmPixel() != null ){ %><%= mo.getmPixel() %><% } %></td>
                        <td>화면 타입</td>
                        <td><% if ( mo.getmDisplayType() != null ){ %><%= mo.getmDisplayType() %><% } %></td>
                    </tr>
                    <tr>
                        <td>화면 폭</td>
                        <td><% if ( mo.getmDisWidth() != null ){ %><%= mo.getmDisWidth() %><% } %></td>
                        <td>화면 높이</td>
                        <td><% if ( mo.getmDisHeight() != null ){ %><%= mo.getmDisHeight() %><% } %></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">성능</h3>
                <table class="table border-bottom">
                    <tr>
                        <td>AP</td>
                        <td><% if ( mo.getmAp() != null ){ %><%= mo.getmAp() %><% } %></td>
                        <td>CPU</td>
                        <td><% if ( mo.getmCpu() != null ){ %><%= mo.getmCpu() %><% } %></td>
                    </tr>
                    <tr>
                        <td>CPU코어</td>
                        <td><% if ( mo.getmCpuCore() != null ){ %><%= mo.getmCpuCore() %><% } %></td>
                        <td>CPU클럭</td>
                        <td><% if ( mo.getmCpuClock() != null ){ %><%= mo.getmCpuClock() %><% } %></td>
                    </tr>
                    <tr>
                        <td>GPU</td>
                        <td><% if ( mo.getmGpu() != null ){ %><%= mo.getmGpu() %><% } %></td>
                        <td>메모리(RAM)</td>
                        <td><% if ( mo.getmRam() != null ){ %><%= mo.getmRam() %><% } %></td>
                    </tr>
                    <tr>
                        <td>내장메모리</td>
                        <td><% if ( mo.getmInnerMemory() != null ){ %><%= mo.getmInnerMemory() %><% } %></td>
                        <td>외장메모리</td>
                        <td><% if ( mo.getmOuterMemory() != null ){ %><%= mo.getmOuterMemory() %><% } %></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">카메라</h3>
                <table class="table border-bottom">
                    <tr>
                        <td>카메라 센서</td>
                        <td><% if ( mo.getmSensor() != null ){ %><%= mo.getmSensor() %><% } %></td>
                        <td>카메라 조리개</td>
                        <td><% if ( mo.getmIris() != null ){ %><%= mo.getmIris() %><% } %></td>
                    </tr>
                    <tr>
                        <td>Flash</td>
                        <td><% if ( mo.getmFlash() != null ){ %><%= mo.getmFlash() %><% } %></td>
                        <td>사진촬영 해상도</td>
                        <td><% if ( mo.getmPicResolution() != null ){ %><%= mo.getmPicResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <td>동영상녹화 해상도</td>
                        <td><% if ( mo.getmVidResolution() != null ){ %><%= mo.getmVidResolution() %><% } %></td>
                        <td>동영상녹화 프레임</td>
                        <td><% if ( mo.getmVidFrame() != null ){ %><%= mo.getmVidFrame() %><% } %></td>
                    </tr>
                    <tr>
                        <td>전면 해상도</td>
                        <td><% if ( mo.getmFrontResolution() != null ){ %><%= mo.getmFrontResolution() %><% } %></td>
                        <td>전면 동영상 해상도</td>
                        <td><% if ( mo.getmFrontVidResolution() != null ){ %><%= mo.getmFrontVidResolution() %><% } %></td>
                    </tr>
                    <tr>
                        <td>전면 비디오 프레임</td>
                        <td><% if ( mo.getmFrontVidFrame() != null ){ %><%= mo.getmFrontVidFrame() %><% } %></td>
                        <td>카메라 특징</td>
                        <td><% if ( mo.getmCamera() != null ){ %><%= mo.getmCamera() %><% } %></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">배터리</h3>
                <table class="table border-bottom">
                    <tr>
                        <td>배터리(mAH)</td>
                        <td><% if ( mo.getmBattery() != 0 ){ %><%= mo.getmBattery() %><% } %></td>
                        <td>배터리타입</td>
                        <td><% if ( mo.getmBatteryType() != null ){ %><%= mo.getmBatteryType() %><% } %></td>
                    </tr>
                    <tr>
                        <td>고속 충전</td>
                        <td><% if ( mo.getmFastCharsing() != null ){ %><%= mo.getmFastCharsing() %><% } %></td>
                        <td>배터리 탈착</td>
                        <td><% if ( mo.getmRemovableBat() != null ){ %><%= mo.getmRemovableBat() %><% } %></td>
                    </tr>
                    <tr>
                        <td>무선 충전</td>
                        <td><% if ( mo.getmWireless() != null ){ %><%= mo.getmWireless() %><% } %></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">통신</h3>
                <table class="table border-bottom">
                    <tr>
                        <td>대기 시간</td>
                        <td><% if ( mo.getmStandBy() != null ){ %><%= mo.getmStandBy() %><% } %></td>
                        <td>통신규격</td>
                        <td><% if ( mo.getmProtocol() != null ){ %><%= mo.getmProtocol() %><% } %></td>
                    </tr>
                    <tr>
                        <td>WiFi</td>
                        <td><% if ( mo.getmWifi() != null ){ %><%= mo.getmWifi() %><% } %></td>
                        <td>블루투스 버전</td>
                        <td><% if ( mo.getmBluetooth() != null ){ %><%= mo.getmBluetooth() %><% } %></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">특징</h3>
                <table class="table border-bottom">
                    <tr>
                        <td>USB버전</td>
                        <td><% if ( mo.getmUsb() != null ){ %><%= mo.getmUsb() %><% } %></td>
                        <td>생체인식</td>
                        <td><% if ( mo.getmBio() != null ){ %><%= mo.getmBio() %><% } %></td>
                    </tr>
                    <tr>
                        <td>모바일결제</td>
                        <td><% if ( mo.getmPayment() != null ){ %><%= mo.getmPayment() %><% } %></td>
                        <td>인증</td>
                        <td><% if ( mo.getmVerify() != null ){ %><%= mo.getmVerify() %><% } %></td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td><% if ( mo.getmEtc() != null ){ %><%= mo.getmEtc() %><% } %></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="insertMobileBottom">
            <br><br>
            <%@ include file ="mobileComment.jsp" %>
        </div>
    </section>
</body>
</html>