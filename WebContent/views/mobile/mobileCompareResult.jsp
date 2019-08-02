<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMPARE RESULT</title>
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
</style>
</head>
<body>
    <%@ include file ="/views/common/menubar.jsp" %>
    <section class="compareRe">
        <div class="compareTop">
            <div class="mobile1">mobile1
                <div class="mo1Count">좋아요/소지수</div>
            </div>
            <div class="mobile2">mobile2
                <div class="mo2Count">좋아요/소지수</div>
            </div>
        </div>
        <div class="compareMid">
            <div class="mobile1">
                <div id="specSummary1">
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
            </div>
            <div class="mobile2">
                <div id="specSummary2">
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
            </div>
            <div class="clear"></div>
            <div class="long-Ad">
                ad
            </div>
            <div class="mobile1 detailSpec">
                <table class="table">
                    <tr>
                        <th scope="row">제조사</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">모델명</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">출시일</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">출시OS</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">주요재질</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">크기(WxHxD, mm)</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">무게(g)</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">연결단자</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">액정크기(인치)</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면해상도</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">Pixel/Inch</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면 타입</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면 폭</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면 높이</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">AP</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">CPU</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">CPU코어</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">CPU클럭</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">GPU</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">메모리(RAM)</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">내장메모리</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">외장메모리</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">카메라 센서</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 조리개</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">Flash</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">사진촬영 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 프레임</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 동영상 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 비디오 프레임</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 특징</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">배터리(mAH)</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리타입</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리 특징</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">무선 충전</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">대기 시간</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">통신 규격</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">WiFi</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">블루투스 버전</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">USB버전</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">생체 인식</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">모바일 결제</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">인증</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">기타</th>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="mobile2 detailSpec">
                <table class="table">
                    <tr>
                        <th scope="row">제조사</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">모델명</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">출시일</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">출시OS</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">주요재질</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">크기(WxHxD, mm)</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">무게(g)</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">연결단자</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">액정크기(인치)</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면해상도</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">Pixel/Inch</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면 타입</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면 폭</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">화면 높이</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">AP</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">CPU</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">CPU코어</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">CPU클럭</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">GPU</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">메모리(RAM)</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">내장메모리</th>
                        <td></td>
                    </tr><tr>
                        <th scope="row">외장메모리</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">카메라 센서</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 조리개</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">Flash</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">사진촬영 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">동영상 녹화 프레임</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 동영상 해상도</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">전면 비디오 프레임</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">카메라 특징</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">배터리(mAH)</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리타입</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">배터리 특징</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">무선 충전</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">대기 시간</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">통신 규격</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">WiFi</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">블루투스 버전</th>
                        <td></td>
                    </tr>
                </table>
                <table class="table">
                    <tr>
                        <th scope="row">USB버전</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">생체 인식</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">모바일 결제</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">인증</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">기타</th>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="clear"></div>

        </div>
        <div class="compareBot">
            <%@ include file="mobileComment.jsp"%>
        </div>
    </section>
</body>
</html>