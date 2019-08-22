<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mobile.model.vo.CompareT" import="java.util.ArrayList" import="mobile.model.vo.MoImage" import="mobile.model.vo.Mobile" import="mobile.model.vo.MoImage"%>
<%
	ArrayList<CompareT> rankList = (ArrayList<CompareT>)request.getAttribute("rankList");
	ArrayList<MoImage> img = (ArrayList<MoImage>)request.getAttribute("img");
	ArrayList<Mobile> hList = (ArrayList<Mobile>)request.getAttribute("hList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPEC</title>
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Open+Sans" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<style type="text/css">
		body {
			font-family: "Open Sans", sans-serif;
			width:1080px;
			/* height:auto; */
		}
		header{
			clear:both;
		}
		
		/* h2 {
			color: #333;
			text-align: center;
			text-transform: uppercase;
			font-family: "Roboto", sans-serif;
			font-weight: bold;
			position: relative;
			margin: 30px 0 60px;
		}
		h2::after {
			content: "";
			width: 100px;
			position: absolute;
			margin: 0 auto;
			height: 3px;
			background: #8fbc54;
			left: 0;
			right: 0;
			bottom: -10px;
		} */
		.col-center {
			margin: 0 auto;
			float: none !important;
		}
		.carousel {
			margin: 50px auto;
			padding: 0 70px;
		}
		.carousel .item {
			color: #999;
			font-size: 14px;
		    text-align: center;
			overflow: hidden;
		    min-height: 290px;
		}
		.carousel .item .img-box {
			width: 590px;
			height: 300px;
			margin: 0 auto;
			/* padding: 5px; */
			/* border: 1px solid #ddd; */
			/* border-radius: 50%; */
		}
		.carousel .img-box img {
			width: 100%;
			height: 100%;
			display: block;
			margin:0;
			padding:0;
			/* border-radius: 50%; */
		}
		.carousel .testimonial {
			padding: 30px 0 10px;
		}
		.carousel .overview {	
			font-style: italic;
		}
		.carousel .overview b {
			text-transform: uppercase;
			color: #7AA641;
		}
		.carousel .carousel-control {
			width: 40px;
		    height: 40px;
		    margin-top: -20px;
		    top: 50%;
			background: none;
		}
		.carousel-control i {
		    font-size: 68px;
			line-height: 42px;
		    position: absolute;
		    display: inline-block;
			color: rgba(0, 0, 0, 0.8);
		    text-shadow: 0 3px 3px #e6e6e6, 0 0 0 #000;
		}
		.carousel .carousel-indicators {
			bottom: -40px;
		}
		.carousel-indicators li, .carousel-indicators li.active {
			width: 15px;
			height: 15px;
			border:1px;
			margin: 1px 3px;
			border-radius: 50%;
		}
		.carousel-indicators li {	
			background: #999;
			border-color: transparent;
			box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
		}
		.carousel-indicators li.active {	
			background: #555;		
			box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
		}
		/* ----------------------------------------------------- */
		 #main > section, article{
		/* 	border:1px solid black; */
			width:1080px;
			margin:auto;
		}
		.container{
			width:1080px;
			height:400px;
			clear:both;
			/* border:1px solid black; */
			
		}
		/* .container div{
			border:1px solid black;
		} */
		#ranking{
			height:300px;
			clear:both;
			width:1080px;
			margin:auto;
		}
		#mainAd1{
			height:220px;
			width:1080px;
			margin:auto;
			clear:both;
			
		}
		#updated{
			height:290px;
			clear:both;
			width:1080px;
			margin:auto;
		}
		#brand{
			height:auto;
			clear:both;
			width:1080px;
			margin:auto;
		}
		#brandLogo {
			padding: 0 60px;
		}
		#mainAd2{
			height:200px;
			clear:both;
			width:1080px;
			margin:auto;
		}
		
		/* ------------------------------ */
		
		#mainAd1-1{
			width:800px;
			height:190px;
			display:inline-block;
			float:left;
			margin: 4px 0 0 0;
			background-color:#4F90CC;
			font-size: 50px;
			color:white;
			text-align: center;
			padding-top:50px;
		}
		#mainAd1-2{
			width:270px;
			height:190px;
			display:inline-block;
			float:right;
			margin: 4px 0 0 0;
			background-color:#4F90CC;
			font-size: 50px;
			color:white;
			text-align: center;
			padding-top:50px;
			
		}
		.updated{
			width:200px;
			height:220px;
			display: block;
			float:left;
			margin:20px 7px 5px 8px;
			padding-left:20px;
			cursor: pointer;
			
		}
		.updatedtitle{
			width:1080px;
			height:30px;
			display:inline;
			float:left;
			margin-top:20px;
		}
		#updated a, #brand a{
			display:block;
			float:left;
			padding:10px 5px 0 0;
			color: gray;
			font-weight:bold;
			text-decoration: none;
			
		}
		#updated h4, #brand h4{
			display:block;
			float:left;
			padding:10px 10px 0 0;
			color: #00264B;
			font-weight:bold;
		}
		.brandimg{
			width:200px;
			height:150px;
			float:left;
			display:block;
			margin: 20px;

			cursor: pointer;
			position: relative;
			/* background-color:gray; */
			box-shadow: 0px 0px 5px rgba(0,0,0,0.2);
		}
		.logoimg {
			width : 150px;
			height: auto;
			position: absolute;
			margin: auto;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
		}
		.xiaomi {
			width: 100px;
			height: auto;
		}
		#subAd{
			width:1060px;
			height:200px;
			margin: 15px 0 0 9px;
			background-color:#4F90CC;
			font-size: 50px;
			color:white;
			text-align: center;
			padding-top:60px;
		}
		#rank1{
			width:400px;
			height:250px;
			float:left;
			display:block;
			margin: 25px 60px 0 100px;
			/* border:1px solid black; */
		}
		#rank2{
			width:400px;
			height:250px;
			float:left;
			display:block; 
			margin: 25px 0 0 0;
			/* border:1px solid black; */
		}
		#ranking p{
			text-align:center;
			font-size: 25px;
			font-weight: bold;
		}
		#ranking tr{
			text-align:center;
		}
		#ranking td,th{
			text-align:center;
			font-weight:bold;
		}
		#ranking .name{
			cursor: pointer;
		}
	</style>

</head>
<body>
	<header id="header">
			<%@include file="/views/common/menubar.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-center m-auto div">
				<h2></h2>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>   
					<!-- Wrapper for carousel items -->
					<div class="carousel-inner">
						<div class="item carousel-item active">
							<div class="img-box"><img src="image/mobileImages/galaxynote10.jpg" title="GALAXY NOTE 10" alt=""></div>
							<!-- <p class="testimonial"></p>
							<p class="overview"><b>Paula Wilson</b>, Media Analyst</p> -->
						</div>
						<div class="item carousel-item">
							<div class="img-box"><img src="image/mobileImages/lgv50.png" title="LG V50" alt=""></div>
							<!-- <p class="testimonial"></p>
							<p class="overview"><b>Antonio Moreno</b>, Web Developer</p> -->
						</div>
						<div class="item carousel-item">
							<div class="img-box"><img src="image/mobileImages/iphone.jpg" title="LG V50" alt=""></div>
							<!-- <p class="testimonial"></p>
							<p class="overview"><b>Michael Holz</b>, Seo Analyst</p> -->
						</div>
					</div>
					<!-- Carousel controls -->
					<a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
						<i class="fa fa-angle-left"></i>
					</a>
					<a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
						<i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	<section id="main">
		<section id="ranking">
			<article id="rank1">
				<p class="text-primary">TOP MATCHING</p>
				<table class="table table-condensed">
				<thead>
					<tr>
						<th scope="col" width="30%">순위</th>
						<th colspan="2" scope="col" width="70%">모델명</th>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0 ; i < rankList.size() ; i++ ) { %>
						<tr class="name" onclick="location.href='<%=request.getContextPath()%>/compareSpec.mo?com1=<%=rankList.get(i).getComDevice1()%>&com2=<%=rankList.get(i).getComDevice2()%>'">
							<td><%= i+1 %></td>
							<td><%= rankList.get(i).getComDevice1Name()%></td>
							<td><%= rankList.get(i).getComDevice2Name()%></td>
						</tr>
					<% } %>
				</tbody>
				</table>
			</article>
			<article id="rank2">
				<p class="text-warning">HOT SEARCH</p>
				<table class="table table-condensed">
					<thead>
					<tr>
						<th scope="col" width="30%">순위</th>
						<th scope="col" width="70%">모델명</th>
					</tr>
					</thead>
					<tbody>
						<%for(int i = 0 ; i < hList.size(); i++ ) { %>
							<tr>
								<td><%= i+1 %></td>
								<td class="name" onclick="location.href='<%=request.getContextPath()%>/spec.mo?currentPage=1&mno=<%=hList.get(i).getmNo()%>&page=1'"><%= hList.get(i).getmName()%></td>
							</tr>
						<% } %>
					</tbody>
				</table>
			</article>
		</section>
		
		<section id="mainAd">
			<article id="mainAd1-1">AD</article>
			<article id="mainAd1-2">AD</article>
		</section>
		<section id="updated">
		
			<article class="updatedtitle">
					<h4>LAST RELEASED</h4>
					<a href='<%=request.getContextPath()%>/devicelist.mo'>More ></a>
			</article>
			<%for(int i = 0; i < 5; i++){ %>
				<% if (img.get(i).getMiFrontImage() == null) { %>
	                 <article class="updated"><img class="img-rounded" src="<%=request.getContextPath()%>/image/smartphoneG.png" width="150px" height="200px" onclick="location.href='<%=request.getContextPath()%>/spec.mo?currentPage=1&mno=<%=img.get(i).getRefMno()%>&page=1'"></article>
	            <% } else { %>
	                 <article class="updated"><img class="img-rounded" src="<%=request.getContextPath()%>/image/mobileImages/<%=img.get(i).getMiFrontImage()%>" width="150px" height="200px" class="deviceFImage" onclick="location.href='<%=request.getContextPath()%>/spec.mo?currentPage=1&mno=<%=img.get(i).getRefMno()%>&page=1'"></article>
	            <% } %>
			<%} %>
			
			<%-- <article class="updated"><img class="img-rounded" src="image/mobileImages/spec_19081910181324809.png" title="Galaxy Note 10" alt="" width="150px" height="200px" onclick="location.href='<%=request.getContextPath()%>/spec.mo?currentPage=1&mno=5&page=1'"></article>
			<article class="updated"><img class="img-rounded" src="image/mobileImages/spec_19081910181324809.png" title="Galaxy Note 10" alt="" width="150px" height="200px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:samsung'"></article>
			<article class="updated"><img class="img-rounded" src="image/mobileImages/spec_19081910181324809.png" title="Galaxy Note 10" alt="" width="150px" height="200px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:samsung'"></article>
			<article class="updated"><img class="img-rounded" src="image/mobileImages/spec_19081910181324809.png" title="Galaxy Note 10" alt="" width="150px" height="200px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:samsung'"></article>
			<article class="updated"><img class="img-rounded" src="image/mobileImages/spec_19081910181324809.png" title="Galaxy Note 10" alt="" width="150px" height="200px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:samsung'"></article> --%>
		</section>
		<section id="brand">
			<article class="updatedtitle">
					<h4>BRAND</h4>
					<a href='<%=request.getContextPath()%>/devicelist.mo'>More ></a>
			</article>
			<section id="brandLogo">
				<article class="brandimg"><img class="img-rounded logoimg" src="image/logo/logo-samsung.png" title="SAMSUNG" alt="SAMSUNG" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:samsung'"></article>
				<article class="brandimg"><img class="img-rounded logoimg" src="image/logo/logo-lg.png" title="LG" alt="LG" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:lgelec'"></article>
				<article class="brandimg"><img class="img-rounded logoimg" src="image/logo/logo-apple.png" title="APPLE" alt="APPLE" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:apple'"></article>
				<article class="brandimg"><img class="img-rounded logoimg" src="image/logo/logo-sony.png" title="SONY" alt="SONY" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:sonymobile'"></article>
				<article class="brandimg"><img class="img-rounded logoimg" src="image/logo/logo-nokia.png" title="NOKIA" alt="NOKIA" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:nokia'"></article>
				<article class="brandimg"><img class="img-rounded logoimg" src="image/logo/logo-motorola.png" title="MOTOROLA" alt="MOTOROLA" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:motorola'"></article>
				<article class="brandimg"><img class="img-rounded logoimg" src="image/logo/logo-Pantech.png"title="PANTECH" alt="PANTECH" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:pantech'"></article>
				<article class="brandimg"><img class="img-rounded logoimg xiaomi" src="image/logo/logo-Xiaomi.png"title="XIAOMI" alt="XIAOMI" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?'"></article>
			</section>
		</section>
		
		<section id="mainAd2">
			<article id="subAd">AD</article>
		</section>
	</section>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>