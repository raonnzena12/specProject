<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mobile.model.vo.*"%>
    
<%
	Mobile mo = (Mobile)request.getAttribute("mo");
	String mCode = mo.getmCode();
	String mName = mo.getmName();
	String mNameEn = mo.getmNameEn();
	String mBrandName = mo.getmBrandName();
	String mReleaseDate = mo.getmReleaseDate();
    String mOsName = mo.getmOsName();
	String mOsVersion = mo.getmOsVersion();
	String mMaterial = mo.getmMaterial();
	String mSize = mo.getmSize();
	String mWeight = mo.getmWeight();
	String mLink = mo.getmLink();
	double mInch = mo.getmInch();
	String mResolution = mo.getmResolution();
	String mPixel = mo.getmPixel();
	String mDisplayType = mo.getmDisplayType();
	String mDisWidth = mo.getmDisWidth();
	String mDisHeight = mo.getmDisHeight();
	String mAp = mo.getmAp();
	String mCpu = mo.getmCpu();
	String mCpuCore = mo.getmCpuCore();
	String mCpuClock = mo.getmCpuClock();
	String mGpu = mo.getmGpu();
	String mRam = mo.getmRam();
	String mInnerMemory = mo.getmInnerMemory();
	String mOuterMemory = mo.getmOuterMemory();
	String mSensor = mo.getmSensor();
	String mIris = mo.getmIris();
	String mFlash = mo.getmFlash();
	String mPicResolution = mo.getmPicResolution();
	String mVidResolution = mo.getmVidResolution();
	String mVidFrame = mo.getmVidFrame();
	String mFrontResolution = mo.getmFrontResolution();
	String mFrontVidResolution = mo.getmFrontVidResolution();
	String mFrontVidFrame = mo.getmFrontVidFrame();
	String mCamera = mo.getmCamera();
	int mBattery = mo.getmBattery();
	String mBatteryType = mo.getmBatteryType();
    String mFastCharsing = mo.getmFastCharsing();
    String mRemovableBat = mo.getmRemovableBat();
    
	String mWireless = mo.getmWireless();
	String mStandBy = mo.getmStandBy();
	String mProtocol = mo.getmProtocol();
	String mWifi = mo.getmWifi();
	String mBluetooth = mo.getmBluetooth();
	String mUsb = mo.getmUsb();
	String mBio = mo.getmBio();
	String mPayment = mo.getmPayment();
	String mVerify = mo.getmVerify();
	String mEtc = mo.getmEtc();
	String mStatus = mo.getmStatus();
	String mFrontImage = mo.getmFrontImage();
	String mBackImage = mo.getmBackImage();
	String mImagePath = mo.getmImagePath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Mobile</title>
<%@ include file ="../common/menubar.jsp" %>
<style>
    .Mobilecontainer {
        width: 1080px;
        margin: 30px auto;
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
    #frontImg, #backImg {
        height: 380px;
        width: auto;
        margin: auto;
    }
    .imgCon {
        text-align: center;
    }
</style>
<script>
	$(function(){
		if ( <%=mFrontImage != null%> ) {
            $("#frontImg").attr("src","<%=request.getContextPath()%>/image/mobileImages/<%=mFrontImage%>");
        }
        if ( <%=mBackImage !=null%> ) {
            $("#backImg").attr("src","<%=request.getContextPath()%>/image/mobileImages/<%=mBackImage%>");
        }
        $(".clearBtn").on("click", function(){
            var $hidden = $(this).prev().prev();
            $hidden.val($hidden.val()+"#");
            $(this).parent().children(0).attr("src","<%=request.getContextPath()%>/image/smartphoneG.png");
        });
	});
</script>
</head>
<body>
	<section class="Mobilecontainer">
        <form action="<%=request.getContextPath()%>/updateForm.mo" method="POST" enctype="multipart/form-data">
        <div class="insertMobileTop">
            <input type="hidden" name="mno" value="<%=mo.getmNo()%>">
            <div class="imgCon">
                <img id="frontImg" src="<%=request.getContextPath()%>/image/smartphoneG.png">
                <input type="file" multiple="multiple" name="newFrontImg">
                <input type="hidden" name="frontImg" <% if( mFrontImage != null ) { %>value="<%=mFrontImage%>" <% } %>><br>
                <button type="button" class="clearBtn">이미지 삭제</button>
            </div>
            <div class="imgCon">
                <img id="backImg" src="<%=request.getContextPath()%>/image/smartphoneG.png">
                <input type="file" multiple="multiple" name="newBackImg">
                <input type="hidden" name="backImg" <% if( mBackImage != null ) { %>value="<%=mBackImage%>" <% } %>><br>
                <button type="button" class="clearBtn">이미지 삭제</button>
            </div>
            <div class="nameInsert">
                <label>브랜드<select name="brand" id="brand"  class="form-control">
                    <option>-----</option>
                    <option value="1" <% if ( mBrandName.equals("삼성전자") ) { %>selected<% } %>>삼성</option>
                    <option value="2" <% if ( mBrandName.equals("LG전자") ) { %>selected<% } %>>LG전자</option>
                    <option value="3" <% if ( mBrandName.equals("애플") ) { %>selected<% } %>>apple</option>
                    <option value="4" <% if ( mBrandName.equals("팬택") ) { %>selected<% } %>>팬택</option>
                    <option value="5" <% if ( mBrandName.equals("HTC") ) { %>selected<% } %>>HTC</option>
                    <option value="6" <% if ( mBrandName.equals("모토로라") ) { %>selected<% } %>>모토로라</option>
                    <option value="7" <% if ( mBrandName.equals("KT Tech") ) { %>selected<% } %>>KT Tech</option>
                    <option value="8" <% if ( mBrandName.equals("SK 텔레시스") ) { %>selected<% } %>>SK 텔레시스</option>
                    <option value="9" <% if ( mBrandName.equals("소니 모바일") ) { %>selected<% } %>>소니 모바일</option>
                    <option value="10" <% if ( mBrandName.equals("노키아") ) { %>selected<% } %>>노키아</option>
                </select></label>
                <br><br>
                <label>모델번호<input type="text" name="moCode" id="moCode" class="form-control" placeholder="모델번호 입력" value="<%=mCode%>"></label>
            </div>
        </div>
        <div class="insertMobileMid">
            <h2>제품 스펙</h2>
            <div>
                <table class="table">
                    <tr>
                        <td>제품명(한글)</td>
                        <td><input type="text" class="form-control" name="moName" value="<%=mName%>"></td>
                        <td>제품명(영문)</td>
                        <td><input type="text" class="form-control" name="moNameEn" value="<%=mNameEn%>"></td>
                    </tr>
                    <tr>
                        <td>출시일</td>
                        <td><input type="text" class="form-control" name="releaseDate" placeholder="2000-01-01" <% if( mReleaseDate != null ) { %>value="<%=mReleaseDate%>" <% } %>></td>
                        <td>출시OS</td>
                        <td>
                        <div class="form-row align-items-center">
                            <div class="col-auto my-1">
                            <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
                            <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="osCode">
                                <option value="0">OS선택</option>
                                <option value="1" <% if ( mOsName != null && mOsName.equals("안드로이드") ) { %>selected<% } %>>안드로이드</option>
                                <option value="2" <% if ( mOsName != null && mOsName.equals("iOS") ) { %>selected<% } %>>iOS</option>
                                <option value="3" <% if ( mOsName != null && mOsName.equals("ETC") ) { %>selected<% } %>>ETC</option>
                            </select>
                            </div>
                            <input type="text" class="form-control" name="osVersion" id="osVersion" <% if( mOsVersion != null ) { %>value="<%=mOsVersion%>" <% } %>>
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
                        <td><input type="text" class="form-control" name="material" <% if( mMaterial != null ) { %>value="<%=mMaterial%>" <% } %>></td>
                        <td>크기(WxHxD, mm)</td>
                        <td><input type="text" class="form-control" name="size" <% if( mSize != null ) { %>value="<%=mSize%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>무게(g)</td>
                        <td><input type="text" class="form-control" name="weight" <% if( mWeight != null ) { %>value="<%=mWeight%>" <% } %>></td>
                        <td>연결단자</td>
                        <td><input type="text" class="form-control" name="link" <% if( mLink != null ) { %>value="<%=mLink%>" <% } %>></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>디스플레이</h3>
                <table class="table">
                    <tr>
                        <td>액정크기(인치)</td>
                        <td><input type="text" class="form-control" name="inch" <% if( mInch != 0 ) { %>value="<%=mInch%>" <% } %>></td>
                        <td>화면해상도</td>
                        <td><input type="text" class="form-control" name="resolution" <% if( mResolution != null ) { %>value="<%=mResolution%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>Pixel/Inch</td>
                        <td><input type="text" class="form-control" name="pixelInch" <% if( mPixel != null ) { %>value="<%=mPixel%>" <% } %>></td>
                        <td>화면 타입</td>
                        <td><input type="text" class="form-control" name="displayType" <% if( mDisplayType != null ) { %>value="<%=mDisplayType%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>화면 폭</td>
                        <td><input type="text" class="form-control" name="disWidth" <% if( mDisWidth != null ) { %>value="<%=mDisWidth%>" <% } %>></td>
                        <td>화면 높이</td>
                        <td><input type="text" class="form-control" name="disHeight" <% if( mDisHeight != null ) { %>value="<%=mDisHeight%>" <% } %>></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>성능</h3>
                <table class="table">
                    <tr>
                        <td>AP</td>
                        <td><input type="text" class="form-control" name="ap" <% if( mAp != null ) { %>value="<%=mAp%>" <% } %>></td>
                        <td>CPU</td>
                        <td><input type="text" class="form-control" name="cpu" <% if( mCpu != null ) { %>value="<%=mCpu%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>CPU코어</td>
                        <td><input type="text" class="form-control" name="cpuCore" <% if( mCpuCore != null ) { %>value="<%=mCpuCore%>" <% } %>></td>
                        <td>CPU클럭</td>
                        <td><input type="text" class="form-control" name="cpuClock" <% if( mCpuClock != null ) { %>value="<%=mCpuClock%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>GPU</td>
                        <td><input type="text" class="form-control" name="gpu" <% if( mGpu != null ) { %>value="<%=mGpu%>" <% } %>></td>
                        <td>메모리(RAM)</td>
                        <td><input type="text" class="form-control" name="ram" <% if( mRam != null ) { %>value="<%=mRam%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>내장메모리</td>
                        <td><input type="text" class="form-control" name="innerMemory" <% if( mInnerMemory != null ) { %>value="<%=mInnerMemory%>" <% } %>></td>
                        <td>외장메모리</td>
                        <td><input type="text" class="form-control" name="outerMemory" <% if( mOuterMemory != null ) { %>value="<%=mOuterMemory%>" <% } %>></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>카메라</h3>
                <table class="table">
                    <tr>
                        <td>카메라 센서</td>
                        <td><input type="text" class="form-control" name="cameraSensor" <% if( mSensor != null ) { %>value="<%=mSensor%>" <% } %>></td>
                        <td>카메라 조리개</td>
                        <td><input type="text" class="form-control" name="iris" <% if( mIris != null ) { %>value="<%=mIris%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>Flash</td>
                        <td><input type="text" class="form-control" name="flash" <% if( mFlash != null ) { %>value="<%=mFlash%>" <% } %>></td>
                        <td>사진촬영 해상도</td>
                        <td><input type="text" class="form-control" name="picResolution" <% if( mPicResolution != null ) { %>value="<%=mPicResolution%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>동영상녹화 해상도</td>
                        <td><input type="text" class="form-control" name="vidResolution" <% if( mVidResolution != null ) { %>value="<%=mVidResolution%>" <% } %>></td>
                        <td>동영상녹화 프레임</td>
                        <td><input type="text" class="form-control" name="vidFrame" <% if( mVidFrame != null ) { %>value="<%=mVidFrame%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>전면 해상도</td>
                        <td><input type="text" class="form-control" name="frontResolution" <% if( mFrontResolution != null ) { %>value="<%=mFrontResolution%>" <% } %>></td>
                        <td>전면 동영상 해상도</td>
                        <td><input type="text" class="form-control" name="frontVidResolution" <% if( mFrontVidResolution != null ) { %>value="<%=mFrontVidResolution%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>전면 비디오 프레임</td>
                        <td><input type="text" class="form-control" name="frontVidFrame" <% if( mFrontVidFrame != null ) { %>value="<%=mFrontVidFrame%>" <% } %>></td>
                        <td>카메라 특징</td>
                        <td><input type="text" class="form-control" name="camera" <% if( mCamera != null ) { %>value="<%=mCamera%>" <% } %>></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>배터리</h3>
                <table class="table">
                    <tr>
                        <td>배터리(mAH)</td>
                        <td><input type="text" class="form-control" name="battery" <% if( mBattery != 0 ) { %>value="<%=mBattery%>" <% } %>></td>
                        <td>배터리타입</td>
                        <td>
                            <select id="batteryType" class="form-control" name="batteryType">
                            <option>-----</option>
                            <option value="Lithium" <% if ( mBatteryType != null && mBatteryType.equals("Lithium") ) { %>selected<% } %>>Lithium</option>
                            <option value="Li-Polymer" <% if ( mBatteryType != null && mBatteryType.equals("Li-Polymer") ) { %>selected<% } %>>Li-Polymer</option>
                            <option value="Li-Ion" <% if ( mBatteryType != null && mBatteryType.equals("Li-Ion") ) { %>selected<% } %>>Li-Ion</option>
                            <option value="Li-Ion Polymer" <% if ( mBatteryType != null && mBatteryType.equals("Li-Ion Polymer") ) { %>selected<% } %>>Li-Ion Polymer</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>배터리 고속충전</td>
                        <td>
                            <select id="fastCharging" class="form-control" name="fastCharging">
                            <option>-----</option>
                            <option value="고속충전"<% if ( mFastCharsing != null ) { %>selected<% } %>>고속충전 지원</option>
                            </select>
                        </td>
                        <td>배터리 탈착여부</td>
                        <td>
                            <select id="removableBattery" class="form-control" name="removableBattery">
                            <option>-----</option>
                            <option value="일체형" <% if ( mRemovableBat != null && mRemovableBat.equals("일체형")) { %>selected<% } %>>일체형</option>
                            <option value="분리형" <% if ( mRemovableBat != null && mRemovableBat.equals("분리형")) { %>selected<% } %>>분리형</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>무선 충전</td>
                        <td>
                            <select id="wirelessCharging" class="form-control" name="wirelessCharging">
                            <option>-----</option>
                            <option value="무선충전 지원" <% if ( mWireless != null ) { %>selected<% } %>>무선충전 지원</option>
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
                        <td><input type="text" class="form-control" name="standBy" <% if( mStandBy != null ) { %>value="<%=mStandBy%>" <% } %>></td>
                        <td>통신규격</td>
                        <td><input type="text" class="form-control" name="protocol" <% if( mProtocol != null ) { %>value="<%=mProtocol%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>WiFi</td>
                        <td><input type="text" class="form-control" name="wifi" <% if( mWifi != null ) { %>value="<%=mWifi%>" <% } %>></td>
                        <td>블루투스 버전</td>
                        <td><input type="text" class="form-control" name="bluetooth" <% if( mBluetooth != null ) { %>value="<%=mBluetooth%>" <% } %>></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>특징</h3>
                <table class="table">
                    <tr>
                        <td>USB버전</td>
                        <td><input type="text" class="form-control" name="usb" <% if( mUsb != null ) { %>value="<%=mUsb%>" <% } %>></td>
                        <td>생체인식</td>
                        <td><input type="text" class="form-control" name="bio" <% if( mBio != null ) { %>value="<%=mBio%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>모바일결제</td>
                        <td>
                            <select id="payment" class="form-control" name="payment">
                            <option>-----</option>
                            <option value="유" <% if ( mPayment != null && mPayment.equals("유") ) { %>selected<% } %>>유</option>
                            <option value="무" <% if ( mPayment != null && mPayment.equals("무") ) { %>selected<% } %>>무</option>
                            </select>
                        </td>
                        <td>인증</td>
                        <td><input type="text" class="form-control" name="verify" <% if( mVerify != null ) { %>value="<%=mVerify%>" <% } %>></td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td><input type="text" class="form-control" name="etc" <% if( mEtc != null ) { %>value="<%=mEtc%>" <% } %>></td>
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