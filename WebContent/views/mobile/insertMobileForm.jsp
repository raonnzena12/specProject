<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Mobile</title>
<style>
    .Mobilecontainer {
        width: 1080px;
        margin: 0 auto;
    }
    /* .Mobilecontainer div {
        min-height: 100px;
    } */
    .insertMobileTop>div {
        display: inline-block;
        width: 32%;
    }
    .nameInsert {
        text-align: right;
    }
    .Mobilecontainer .table {
        margin-top: 15px;
    }
    .Mobilecontainer .table td:nth-of-type(odd) {
        width: 150px;
        text-align: center;
    }
    .Mobilecontainer .table td:nth-of-type(even) {
        width: 300px;
    }
    #osVersion {
        width: 205px;
    }
    .insertMobileBottom .Btn {
        text-align: center;
    }
    .btn button {
        margin: 0 10px;
        width: 100px;
    }
</style>
</head>
<body>
	<%@ include file ="../common/menubar.jsp" %>
	<section class="Mobilecontainer">
        <form action="<%=request.getContextPath()%>/insertForm.mo" method="POST" enctype="multipart/form-data">
        <div class="insertMobileTop">
            <div>
                <input type="file" name="frontImg" multiple="multiple" id="frontImg">
            </div>
            <div>
                <input type="file" name="backImg" multiple="multiple" id="backImg">
            </div>
            <div class="nameInsert">
                <label>브랜드<select name="brand" id="brand"  class="form-control">
                    <option selected>-----</option>
                    <option value="1">삼성</option>
                    <option value="2">apple</option>
                    <option value="3">LG전자</option>
                    <option value="4">샤오미</option>
                </select></label>
                <br><br>
                <label>모델번호<input type="text" name="moCode" id="moCode" class="form-control" placeholder="모델번호 입력"></label>
            </div>
        </div>
        <div class="insertMobileMid">
            <h2>제품 스펙</h2>
            <div>
                <table class="table">
                    <tr>
                        <td>제품명(한글)</td>
                        <td><input type="text" class="form-control" name="moName"></td>
                        <td>제품명(영문)</td>
                        <td><input type="text" class="form-control" name="moNameEn"></td>
                    </tr>
                    <tr>
                        <td>출시일</td>
                        <td><input type="text" class="form-control" name="releaseDate" placeholder="2000-01-01"></td>
                        <td>출시OS</td>
                        <td>
                        <div class="form-row align-items-center">
                            <div class="col-auto my-1">
                            <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
                            <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="osCode">
                                <option value="0">OS선택</option>
                                <option value="1">안드로이드</option>
                                <option value="2">iOS</option>
                                <option value="3">etc</option>
                            </select>
                            </div>
                            <input type="text" class="form-control" name="osVersion" id="osVersion">
                        </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>외형</h3>
                <table class="table">
                    <tr>
                        <td>주요재질</td>
                        <td><input type="text" class="form-control" name="material"></td>
                        <td>크기(WxHxD, mm)</td>
                        <td><input type="text" class="form-control" name="size"></td>
                    </tr>
                    <tr>
                        <td>무게(g)</td>
                        <td><input type="text" class="form-control" name="weight"></td>
                        <td>연결단자</td>
                        <td><input type="text" class="form-control" name="link"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>디스플레이</h3>
                <table class="table">
                    <tr>
                        <td>액정크기(인치)</td>
                        <td><input type="text" class="form-control" name="inch"></td>
                        <td>화면해상도</td>
                        <td><input type="text" class="form-control" name="resolution"></td>
                    </tr>
                    <tr>
                        <td>Pixel/Inch</td>
                        <td><input type="text" class="form-control" name="pixelInch"></td>
                        <td>화면 타입</td>
                        <td><input type="text" class="form-control" name="displayType"></td>
                    </tr>
                    <tr>
                        <td>화면 폭</td>
                        <td><input type="text" class="form-control" name="disWidth"></td>
                        <td>화면 높이</td>
                        <td><input type="text" class="form-control" name="disHeight"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>성능</h3>
                <table class="table">
                    <tr>
                        <td>AP</td>
                        <td><input type="text" class="form-control" name="ap"></td>
                        <td>CPU</td>
                        <td><input type="text" class="form-control" name="cpu"></td>
                    </tr>
                    <tr>
                        <td>CPU코어</td>
                        <td><input type="text" class="form-control" name="cpuCore"></td>
                        <td>CPU클럭</td>
                        <td><input type="text" class="form-control" name="cpuClock"></td>
                    </tr>
                    <tr>
                        <td>GPU</td>
                        <td><input type="text" class="form-control" name="gpu"></td>
                        <td>메모리(RAM)</td>
                        <td><input type="text" class="form-control" name="ram"></td>
                    </tr>
                    <tr>
                        <td>내장메모리</td>
                        <td><input type="text" class="form-control" name="innerMemory"></td>
                        <td>외장메모리</td>
                        <td><input type="text" class="form-control" name="outerMemory"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>카메라</h3>
                <table class="table">
                    <tr>
                        <td>카메라 센서</td>
                        <td><input type="text" class="form-control" name="cameraSensor"></td>
                        <td>카메라 조리개</td>
                        <td><input type="text" class="form-control" name="iris"></td>
                    </tr>
                    <tr>
                        <td>Flash</td>
                        <td><input type="text" class="form-control" name="flash"></td>
                        <td>사진촬영 해상도</td>
                        <td><input type="text" class="form-control" name="picResolution"></td>
                    </tr>
                    <tr>
                        <td>동영상녹화 해상도</td>
                        <td><input type="text" class="form-control" name="vidResolution"></td>
                        <td>동영상녹화 프레임</td>
                        <td><input type="text" class="form-control" name="vidFrame"></td>
                    </tr>
                    <tr>
                        <td>전면 해상도</td>
                        <td><input type="text" class="form-control" name="frontResolution"></td>
                        <td>전면 동영상 해상도</td>
                        <td><input type="text" class="form-control" name="frontVidResolution"></td>
                    </tr>
                    <tr>
                        <td>전면 비디오 프레임</td>
                        <td><input type="text" class="form-control" name="frontVidFrame"></td>
                        <td>카메라 특징</td>
                        <td><input type="text" class="form-control" name="camera"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>배터리</h3>
                <table class="table">
                    <tr>
                        <td>배터리(mAH)</td>
                        <td><input type="text" class="form-control" name="battery"></td>
                        <td>배터리타입</td>
                        <td>
                            <select id="batteryType" class="form-control" name="batteryType">
                            <option>-----</option>
                            <option value="Lithium">Lithium</option>
                            <option value="Li-Polymer">Li-Polymer</option>
                            <option value="Li-Ion">Li-Ion</option>
                            <option value="Li-Ion Polymer">Li-Ion Polymer</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>배터리 고속충전</td>
                        <td>
                            <select id="fastCharging" class="form-control" name="fastCharging">
                            <option>-----</option>
                            <option value="고속충전">지원</option>
                            <option value="미지원">미지원</option>
                            </select>
                        </td>
                        <td>배터리 탈착여부</td>
                        <td>
                            <select id="removableBattery" class="form-control" name="removableBattery">
                            <option>-----</option>
                            <option value="일체형">일체형</option>
                            <option value="분리형">분리형</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>무선 충전</td>
                        <td>
                            <select id="wirelessCharging" class="form-control" name="wirelessCharging">
                            <option>-----</option>
                            <option value="무선충전">지원</option>
                            <option value="미지원">미지원</option>
                            </select>
                        </td>
                        </tr>
                </table>
            </div>
            <div>
                <h3>통신</h3>
                <table class="table">
                    <tr>
                        <td>대기 시간</td>
                        <td><input type="text" class="form-control" name="standBy"></td>
                        <td>통신규격</td>
                        <td><input type="text" class="form-control" name="protocol"></td>
                    </tr>
                    <tr>
                        <td>WiFi</td>
                        <td><input type="text" class="form-control" name="wifi"></td>
                        <td>블루투스 버전</td>
                        <td><input type="text" class="form-control" name="bluetooth"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>특징</h3>
                <table class="table">
                    <tr>
                        <td>USB버전</td>
                        <td><input type="text" class="form-control" name="usb"></td>
                        <td>생체인식</td>
                        <td><input type="text" class="form-control" name="bio"></td>
                    </tr>
                    <tr>
                        <td>모바일결제</td>
                        <td>
                            <select id="payment" class="form-control" name="payment">
                            <option>-----</option>
                            <option value="유">유</option>
                            <option value="무">무</option>
                            </select>
                        </td>
                        <td>인증</td>
                        <td><input type="text" class="form-control" name="verify"></td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td><input type="text" class="form-control" name="etc"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="insertMobileBottom">
            <br><label><input type="checkbox" name="status" id="status"> 비밀글로 올리기</label>
            <br><br>
            <div class="Btn">
                <button type="button" class="btn btn-default btn-lg border">취소</button>
                <button type="submit" class="btn btn-primary btn-lg">등록</button>
            </div>
        </div>
        </form>
    </section>
</body>
</html>