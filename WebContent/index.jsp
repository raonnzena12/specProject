<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPEC</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%-- <%@ include file ="/views/common/menubar.jsp" %> --%>
</head>
<body>
	<%-- <%@ include file ="/views/common/file.jsp" %> --%>
	
	<script>
		$(document).ready(function(){
			location.href="<%=request.getContextPath()%>/main.spec";
		});
	</script>
</body>
</html>