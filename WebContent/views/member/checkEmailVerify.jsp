<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 확인 요청</title>
</head>
<body>
	<%@ include file ="/views/common/menubar.jsp" %>
	<div class="container">

	    <div class="alert alert-success mt-4" role="alert" style="text-align:center">

		  <%=msg %>

		</div>

    </div>

</body>
</html>