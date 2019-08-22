<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Terms of service</title>
<%@include file="/views/common/menubar.jsp"%>
<style>
	#ToStext {
		width: 1080px;
		height: auto;
		margin: auto;
		padding-top: 50px;
	}
	#ToStitle {
		text-align: center;
	}
	iframe {
		width : 1080px;
		height: 4800px;
		padding: 50px;
	}
</style>
</head>
<body>
	<section id="ToStext">
		<h1 id="ToStitle">홈페이지 이용약관</h1>
	<iframe src="text.html" frameborder="0"></iframe>
	</section>
</body>
</html>