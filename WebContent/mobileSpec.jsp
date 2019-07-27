<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mobileSpec</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
    * {
        box-sizing: border-box;
    }
	div {
		/* border: 1px solid red; */
	}
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
    #mobileView {
        width: 300px;
        height: 500px;
        float: left;
    }
    #mobileName {
        float: right;
        height: 350px;
        width: 780px;
    }
    #mobileTab {
        float: left;
        width: 780px;
        height: 150px;
    }
    .clear {
        clear: both;
        border: 1px solid #ccc;
    }
    .tab {
        display: inline-block;
        width: 33%;
        height: 100%;
        line-height: 150px;
        font-size: 50px;
        color: #999;
        text-align: center;
        border: 10px solid white;
    }
    #specSummary {
        height: 300px;
        background-color: #eee;
        margin: 30px 0;
        border-radius: 5px;
    }
</style>
<script>
    $(function() {
        $(".tab").mouseenter(function(){
            $(this).css({color:"#00264B", "font-weight":"600", "border-bottom":"10px solid #00264B"});
        }).mouseleave(function() {
            $(this).css({color:"#999", "font-weight":"400", "border":"10px solid white"});
        });
    });
</script>
</head>
<body>
    <%@ include file ="WEB-INF/views/common/menubar.jsp" %>
	<section class="Mobilecontainer">
        <div class="mobileTop">
            <div id="mobileView">
            </div>
            <div id="mobileName">
                <label>브랜드</label>
                <br><br>
                <label>모델명</label>
            </div>
            <div id="mobileTab">
                <div class="tab">SPEC</div>
                <div class="tab">REVIEW</div>
                <div class="tab">COMPARE</div>
            </div>
            <div class="clear"></div>
        </div>
        <div id="specSummary">

        </div>
        <div class="mobileMid">
            <h2>제품 스펙</h2>
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
                <h3>외형</h3>
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
                <h3>디스플레이</h3>
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
                <h3>성능</h3>
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
                <h3>카메라</h3>
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
                <h3>배터리</h3>
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
                <h3>통신</h3>
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
                <h3>특징</h3>
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
</body>
</html>