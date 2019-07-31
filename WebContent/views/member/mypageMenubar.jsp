<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type='text/javascript' src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<style>
    #mypageNav{
    	width:1000px;
    	height: 100px;
    	margin-top: 5%;
    }
	#mypageNav ul>li{
        width: 20%;
        float: left;
        list-style-type: none;
        line-height: 80px;
        
        margin: 0 15px;
        text-align: center;
        
    }
    #mypageNav ul a {
    	color: gray;
        text-decoration:none;
        font-size: 20px;
        font-weight: bold;
    }
    
    
</style>
<title>회원정보 메뉴바</title>
<script>
    $(function(){

        $("a").mouseenter(function(){
            $(this).css("color","#00264B");
        }).mouseleave(function(){
            $(this).css("color","gray");
        })/* on("click", function(){
            $(this).css("border-bottom","2px solid #00264B");
        }).off("click") */;
    });
</script>
</head>
<body>
	
	<nav id="mypageNav">
		<ul>
			<li><a href="#<%-- <%=request.getContextPath()%>/views/member/mypageInfo.jsp --%>">회원정보</a></li>
			<li><a href="#">작성글보기</a></li>
			<li><a href="#">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    
</body>
</html>