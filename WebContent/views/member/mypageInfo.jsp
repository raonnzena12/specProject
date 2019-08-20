<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = (Member)request.getAttribute("member");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<style>
	/* *{
		border: 1px solid black;
	} */
	#infoLayer{
		width:100%;
		height: 800px;
		margin:auto;
	}
	#mobile{
		width:35%;
		height: 100%;
	}
	#mobileImg{
		height: 70%;
	}
	
	#mobileImg img{
		width:100%;
		height: 100%;
	}
	#mobile>div{
		width:100%;
	}
	.max-small {
    width: auto; height: auto;
    max-width: 100%;
    max-height: 100%;
	}
	.fl{
		float:left;
	}
	.fts{
		width:100%;
		font-size: 2em;
		font-weight: bold;
		text-align:center;
	}
	.tableArea {
		width:40%;
		height:100%;
		
	}
	.infoNav{
		width: 15%;
		height: 100%;
	}
	#listArea {
		width:70%;
		height:70%;
		margin-left: 10%;
		margin-top: 5%;
		/* border:1px solid black; */
		
		border-collapse:collapse;
	}
	
	#listArea th{
		/* border-bottom: 1px solid black; */
		font-size: 18px;
	}
	
	.nav{
		width: 180px;
	}
	
	.menu {
		font-size: 2em;
		text-align:right;
		width:180px;
		height:50px;
	}
	
	.menu:hover {
		color:#00264B;
		font-weight:bold;
		cursor:pointer;
	}
	#mypageNav{
    	width:1000px;
    	height: 100px;
    	margin-top: 5%;
    }
	#mypageNav ul>li{
        width: 15%;
        float: left;
        list-style-type: none;
        line-height: 80px;
        
        margin: 0 10px;
        text-align: center;
    }

    #mypageNav ul a {
    	color: gray;
        text-decoration:none;
        font-size: 20px;
        font-weight: bold;
    }
    
    #info{
    	padding-bottom : 10px;
		border-bottom: 2px solid #00264B;    
    }
</style>
	<%@ include file="/views/common/menubar.jsp" %>
<script>
	$(function() {
		
		

		$("a").mouseenter(function() {
			$(this).css("color", "#00264B");
		}).mouseleave(function() {
			$(this).css("color", "gray");
		})
		
	});
</script>
</head>
<body>
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage.me" id="info">회원정보</a></li>
			<li><a href="<%=request.getContextPath()%>/myBoardList.me">작성글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReviewList.me">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/myReportList.me">신고내역보기</a></li>
		</ul>
    </nav>

	<div id="infoLayer">
		<div id="mobile" class="fl">
			<div id="mobileImg">
				<% if(member.getMiFrontName() != null){ %>
				<img class="max-small" alt="" src="<%=request.getContextPath()%>/image/mobileImages/<%=member.getMiFrontName()%>">
				<% } %>
			</div>
			<div class="fts">
				<%if(member.getUserDevice()!= null){ %>
				<%=member.getUserDevice() %>
				<%} else{ %>
				기기 정보가 없습니다.
				<%} %>
			</div>
		</div>
		<div class="tableArea fl">
		
			<!-- 공지사항 목록 -->
			<table align="center" id="listArea">
				<tr>
					<th>email</th>
				</tr>
				<tr>
                	<td width="275px"><input type="text" name="userEmail" class="form-control" value="<%=member.getUserEmail()%>" readonly></td>
                </tr>
                <tr>
					<th>name</th>
				</tr>
                <tr>
                	<td><input type="text" name="userName" class="form-control" value="<%=member.getUserName()%>" readonly></td>
                </tr>
				<tr>
					<th>가입일</th>
				</tr>
				<tr>
                	<td><input type="text" name="enrollDate" class="form-control" value="<%=member.getEnrollDate()%>" readonly></td>
                </tr>
                <tr>
					<th>phone</th>
				</tr>
                 <tr>
                	<td> <%if( member.getPhone() != null){ %>
                		<input type="text" name="phone" class="form-control" value="<%=member.getPhone()%>" readonly>
                		<% } else{ %>
                		<input type="text" name="phone" class="form-control" value="휴대폰 번호 정보가 없습니다." readonly>
                		<%} %>
                	</td>
                </tr>
				
				<tr>
					<th>기종</th>
				</tr>
				<tr>
                	<td> <%if( member.getMiProductName() != null){ %>
                		<input type="text" name="device" class="form-control" value="<%=member.getMiProductName()%>" readonly>
                		<% } else{ %>
                		<input type="text" name="device" class="form-control" value="휴대폰 기기 정보가 없습니다." readonly>
						<% } %>
                	</td>
                </tr>
			</table>
			
			
		</div>
		<div class="fl">
			<div class="menu" onclick="updateUserInfo();">회원정보 변경</div>
			<div class="menu" onclick="updateUserPwd();">비밀번호 변경</div>
			<div class="menu" onclick="deleteUser();">회원탈퇴</div>
		</div>
	</div>
	
	<script>
		function updateUserInfo(){
			location.href = "inputPwdForm.me?code=" + 1;
		}
		function updateUserPwd(){
			location.href = "inputPwdForm.me?code=" + 2;
		}
		function deleteUser(){
			
			location.href = "<%=request.getContextPath()%>/deleteMemberForm.me";
			
		}
		
		
	</script>
</body>
</html>
