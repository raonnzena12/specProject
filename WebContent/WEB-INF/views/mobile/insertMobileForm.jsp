<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Mobile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
    .Mobilecontainer {
        width: 1080px;
        margin: 0 60px;
    }
    body *{
        border: 1px solid salmon;
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
    }
    div {
        min-height: 100px;
    }
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
    .insertMobileBottom .Btn {
        text-align: center;
    }
    .Mobilecontainer button {
        margin: 0 10px;
        width: 100px;
    }
    .nameInsert .form-control {
        
    }
</style>
</head>
<body>
	<%@ include file ="../common/menubar.jsp" %>
	<section class="Mobilecontainer">
        <form action="" method="POST">
        <div class="insertMobileTop">
            <div></div>
            <div></div>
            <div class="nameInsert">
                <label>브랜드<select name="brand" id="brand"  class="form-control">
                    <option selected>-----</option>
                    <option value="samsung">삼성</option>
                    <option value="apple">apple</option>
                    <option value="lg">LG전자</option>
                    <option value="xiaomi">샤오미</option>
                </select></label>
                <br><br>
                <label>모델명<input type="text" name="modelName" id="modelName" class="form-control" placeholder="모델명 입력"></label>
            </div>
        </div>
        <div class="insertMobileMid">
            <h2>제품 스펙</h2>
            <div>
                <table class="table">
                    <tr>
                        <td>제조사</td>
                        <td><input type="text" class="form-control"></td>
                        <td>모델명</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>출시일</td>
                        <td><input type="text" class="form-control"></td>
                        <td>출시OS</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>외형</h3>
                <table class="table">
                    <tr>
                        <td>주요재질</td>
                        <td><input type="text" class="form-control"></td>
                        <td>크기(WxHxD, mm)</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>무게(g)</td>
                        <td><input type="text" class="form-control"></td>
                        <td>연결단자</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>디스플레이</h3>
                <table class="table">
                    <tr>
                        <td>액정크기(인치)</td>
                        <td><input type="text" class="form-control"></td>
                        <td>화면해상도</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Pixel/Inch</td>
                        <td><input type="text" class="form-control"></td>
                        <td>화면 타입</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>화면 폭</td>
                        <td><input type="text" class="form-control"></td>
                        <td>화면 높이</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>성능</h3>
                <table class="table">
                    <tr>
                        <td>AP</td>
                        <td><input type="text" class="form-control"></td>
                        <td>CPU</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>CPU코어</td>
                        <td><input type="text" class="form-control"></td>
                        <td>CPU클럭</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>GPU</td>
                        <td><input type="text" class="form-control"></td>
                        <td>메모리(RAM)</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>내장메모리</td>
                        <td><input type="text" class="form-control"></td>
                        <td>외장메모리</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>카메라</h3>
                <table class="table">
                    <tr>
                        <td>카메라 센서</td>
                        <td><input type="text" class="form-control"></td>
                        <td>카메라 조리개</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Flash</td>
                        <td><input type="text" class="form-control"></td>
                        <td>사진촬영 해상도</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>동영상녹화 해상도</td>
                        <td><input type="text" class="form-control"></td>
                        <td>동영상녹화 프레임</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>전면 해상도</td>
                        <td><input type="text" class="form-control"></td>
                        <td>전면 동영상 해상도</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>전면 비디오 프레임</td>
                        <td><input type="text" class="form-control"></td>
                        <td>카메라 특징</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>배터리</h3>
                <table class="table">
                    <tr>
                        <td>배터리(mAH)</td>
                        <td><input type="text" class="form-control"></td>
                        <td>배터리타입</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>배터리 특징</td>
                        <td><input type="text" class="form-control"></td>
                        <td>무선 충전</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>통신</h3>
                <table class="table">
                    <tr>
                        <td>대기 시간</td>
                        <td><input type="text" class="form-control"></td>
                        <td>통신규격</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>WiFi</td>
                        <td><input type="text" class="form-control"></td>
                        <td>블루투스 버전</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>특징</h3>
                <table class="table">
                    <tr>
                        <td>USB버전</td>
                        <td><input type="text" class="form-control"></td>
                        <td>생체인식</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>모바일결제</td>
                        <td><input type="text" class="form-control"></td>
                        <td>인증</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="insertMobileBottom">
            <br><label><input type="checkbox" name="hidden" id="hidden"> 비밀글로 올리기</label>
            <br><br>
            <div class="Btn">
                <button type="button" class="btn btn-default btn-lg">취소</button>
                <button type="button" class="btn btn-primary btn-lg">등록</button>
            </div>
        </div>
        </form>
    </section>
</body>
</html>