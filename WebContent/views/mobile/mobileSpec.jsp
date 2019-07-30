<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mobileSpec</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
    .Mobilecontainer {
        width: 1080px;
        margin: 0 60px;
        clear: both;
    }
    .Mobilecontainer .table td:nth-of-type(odd) {
        width: 150px;
        text-align: center;
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
</style>
</head>
<body>
	<section class="Mobilecontainer">
        <div id="specSummary">
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
        <div class="long-Ad">
            가로광고란
        </div>
        <div class="mobileMid">
            <h2 class="mobile-label">제품 스펙</h2>
            <div>
                <table class="table">
                    <tr>
                        <td>제조사</td>
                        <td></td>
                        <td>모델명</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>출시일</td>
                        <td></td>
                        <td>출시OS</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">외형</h3>
                <table class="table">
                    <tr>
                        <td>주요재질</td>
                        <td></td>
                        <td>크기(WxHxD, mm)</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>무게(g)</td>
                        <td></td>
                        <td>연결단자</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">디스플레이</h3>
                <table class="table">
                    <tr>
                        <td>액정크기(인치)</td>
                        <td></td>
                        <td>화면해상도</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Pixel/Inch</td>
                        <td></td>
                        <td>화면 타입</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>화면 폭</td>
                        <td></td>
                        <td>화면 높이</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">성능</h3>
                <table class="table">
                    <tr>
                        <td>AP</td>
                        <td></td>
                        <td>CPU</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>CPU코어</td>
                        <td></td>
                        <td>CPU클럭</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>GPU</td>
                        <td></td>
                        <td>메모리(RAM)</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>내장메모리</td>
                        <td></td>
                        <td>외장메모리</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">카메라</h3>
                <table class="table">
                    <tr>
                        <td>카메라 센서</td>
                        <td></td>
                        <td>카메라 조리개</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Flash</td>
                        <td></td>
                        <td>사진촬영 해상도</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>동영상녹화 해상도</td>
                        <td></td>
                        <td>동영상녹화 프레임</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>전면 해상도</td>
                        <td></td>
                        <td>전면 동영상 해상도</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>전면 비디오 프레임</td>
                        <td></td>
                        <td>카메라 특징</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">배터리</h3>
                <table class="table">
                    <tr>
                        <td>배터리(mAH)</td>
                        <td></td>
                        <td>배터리타입</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>배터리 특징</td>
                        <td></td>
                        <td>무선 충전</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">통신</h3>
                <table class="table">
                    <tr>
                        <td>대기 시간</td>
                        <td></td>
                        <td>통신규격</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>WiFi</td>
                        <td></td>
                        <td>블루투스 버전</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3 class="mobile-label">특징</h3>
                <table class="table">
                    <tr>
                        <td>USB버전</td>
                        <td></td>
                        <td>생체인식</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>모바일결제</td>
                        <td></td>
                        <td>인증</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="insertMobileBottom">
            <br><br>
        </div>
    </section>
    <%@ include file ="mobileComment.jsp" %>
</body>
</html>