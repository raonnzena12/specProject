<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sort = "no";
	int sortNum = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-content</title>
<%@ include file ="/views/common/menubar.jsp" %>
<style>
	#adminContent {
		width: 1200px;
		min-height: 600px;
		height: auto;
		margin: auto;
	}    
    .menu-outer {
    	width : 20%;
    	min-height : 600px;
    	height: auto;
    	border-right: 1px solid gray;
    	float: left;
    }
    .menu-ul {
    	width: 150px;
    	height: 100%;
    	margin: 30% 0 0 20%;
    	list-style-type: none;
    	float: left;
    }
    .menu-ul li {
    	font-size: 25px;
    	line-height: 200%;
    	margin-bottom: 10px;
    }
    .menu-ul a {
    	color: gray;
    }
    .content-outer {
    	width: 70%;
    	height: 100%;
    	float: left;
    	padding: 50px 50px;
    }
	.control span {
		font-size: 12px;
		color: crimson;
		margin: 0 5px;
		cursor: pointer;
	}
	#adminContent table {
		text-align: center;
	}
	.cnoNum {
		font-size: 12px;
	}
	.space {
		width: 200px;
	}
</style>
</head>
<body>
	<section id="adminContent">
		<div class="menu-outer">
			<ul class="menu-ul">
				<li><a href="<%=request.getContextPath() %>/adminSelectMember.do?sort=<%=sort%>&sortNum=<%=sortNum%>">회원관리</a></li>
				<li><a href="#">글 관리</a></li>
				<li><a href="#">댓글 관리</a></li>
				<li><a href="#">리뷰 관리</a></li>
				<li><a href="#">신고 관리</a></li>
				<li><a href="#">일정 관리</a></li>
			</ul>
		</div>
		<div class="content-outer">
			<h2>전체 글 관리</h2>
			<p>Total : <span id="total-count"></span></p>
			<form class="form-inline">
			<table class="table table-sm table-hover">
				<thead>
					<tr>
					<th scope="col" style="width:15px"><input type="checkbox" id="selectAll"></th>
					<th scope="col" style="width:80px">No</th>
					<th scope="col">글 제목</th>
					<th scope="col" style="width:100px">닉네임</th>
					<th scope="col" style="width:80px">조회수</th>
					<th scope="col" style="width:120px">작성일</th>
					<th scope="col" style="width:80px;">글관리</th>
					</tr>
				</thead>
				<tbody>
					<% { %>
					<tr>
						<th scope="row"><input type="checkbox" name="selectContent"></th>
						<th scope="row cnoNum">글번호</th>
						<td><a>글제목</a></td>
						<td>닉네임</td>
						<td>조회수</td>
						<td>2019/08/10</td>
						<td class="control"><span class="report">경고</span><span class="delete">삭제</span></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<div class="input-group input-group-sm mb-3">
			<label class="my-1 mr-2" for="inlineFormCustomSelectPref">선택한&nbsp;<span id="selectCount"></span>개 글 편집 : </label>
			<select class="custom-select my-1 mr-sm-2 custom-select-sm" id="inlineFormCustomSelectPref">
				<option value="1">경고</option>
				<option value="2">삭제</option>
			</select> 
			<button type="button" class="btn btn-light my-1 border btn-sm">확인</button>
			<div class="space"></div>
			<select class="custom-select my-1 mr-sm-2 custom-select-sm" id="searchSelect">
				<option value="1">닉네임</option>
				<option value="2">글제목</option>
			</select> 
			<input type="text" class="form-control inputGroup-sizing-sm" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
			  <button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon2">검색</button>
			</div>
			</div>
		</form>
		</div>
		<div class="clear"></div>
	</section>
</body>
</html>