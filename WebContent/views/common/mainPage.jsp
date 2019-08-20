<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		h2 {
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
		}
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
			width: 135px;
			height: 135px;
			margin: 0 auto;
			padding: 5px;
			border: 1px solid #ddd;
			border-radius: 50%;
		}
		.carousel .img-box img {
			width: 100%;
			height: 100%;
			display: block;
			border-radius: 50%;
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
			border:1px solid black;
			width:1080px;
			margin:auto;
		}
		.container{
			width:1080px;
			height:400px;
			clear:both;
			/* border:1px solid black; */
			
		}
		#ranking{
			height:300px;
			clear:both;
			width:1080px;
			margin:auto;
		}
		#mainAd1{
			height:200px;
			width:1080px;
			margin:auto;
			
		}
		#updated{
			height:250px;
			clear:both;
			width:1080px;
			margin:auto;
		}
		#brand{
			height:200px;
			clear:both;
			width:1080px;
			margin:auto;
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
			background-color:gray;
			
			
		}
		#mainAd1-2{
			width:270px;
			height:190px;
			display:inline-block;
			float:right;
			margin: 4px 0 0 0;
			background-color:gray;
			
		}
		.updated{
			width:200px;
			height:200px;
			display: block;
			float:left;
			margin:10px 7px 5px 8px;
			background-color:gray;
			
		}
		.updatedtitle{
			width:1080px;
			height:30px;
			display:inline;
			float:left;
			
			
		}
		#updated p, #brand p{
			display:block;
			float:left;
			padding:10px 5px 0 0;
			color: gray;
			font-weight:bold;
			
		}
		#updated h4, #brand h4{
			display:block;
			float:left;
			padding:10px 10px 0 0;
			color: #00264B;
			font-weight:bold;
		}
		.brandimg{
			width:150px;
			height:120px;
			float:left;
			display:block;
			margin: 20px 2px 0 2px;
			cursor: pointer;
			
			/* background-color:gray; */
		}
		
		#subAd{
			width:1060px;
			height:180px;
			margin: 8px 0 0 9px;
			background-color:gray;
		}
		#rank1{
			width:400px;
			height:250px;
			float:left;
			display:block;
			margin: 25px 50px 0 110px;
		}
		#rank2{
			width:400px;
			height:250px;
			float:left;
			display:block;
			margin: 25px 0 0 0;
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
				<h2>Testimonials</h2>
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
							<div class="img-box"><img src="/examples/images/clients/1.jpg" alt=""></div>
							<p class="testimonial"></p>
							<p class="overview"><b>Paula Wilson</b>, Media Analyst</p>
						</div>
						<div class="item carousel-item">
							<div class="img-box"><img src="/examples/images/clients/2.jpg" alt=""></div>
							<p class="testimonial"></p>
							<p class="overview"><b>Antonio Moreno</b>, Web Developer</p>
						</div>
						<div class="item carousel-item">
							<div class="img-box"><img src="/examples/images/clients/3.jpg" alt=""></div>
							<p class="testimonial"></p>
							<p class="overview"><b>Michael Holz</b>, Seo Analyst</p>
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
					<tr>
						<th scope="col" width="30%">순위</th>
						<th scope="col" width="70%">모델명</th>
					</tr>
					<tr>
						<td>1.</td>
						<td>phone</td>
					</tr>
				</table>
			</article>
			<article id="rank2">
				<p class="text-warning">TOP S-USER HAVE</p>
				<table class="table table-condensed">
					<tr>
						<th scope="col" width="30%">순위</th>
						<th scope="col" width="70%">모델명</th>
					</tr>
					<tr>
						<td>1.</td>
						<td>phone</td>
					</tr>
				</table>
			</article>
		</section>
		
		<section id="mainAd">
			<article id="mainAd1-1">ad</article>
			<article id="mainAd1-2">ad</article>
		</section>
		<section id="updated">
		
			<article class="updatedtitle">
					<h4>LAST UPDATED</h4>
					<p>More ></p>
			</article>
			<article class="updated"></article>
			<article class="updated"></article>
			<article class="updated"></article>
			<article class="updated"></article>
			<article class="updated"></article>
		</section>
		<section id="brand">
			<article class="updatedtitle">
					<h4>BRAND</h4>
					<p>More ></p>
			</article>
			<article class="brandimg"><img class="img-rounded" src="../../image/logo/logo-samsung.png" alt="" width="150px" height="120px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:samsung'"></article>
			<article class="brandimg"><img class="img-rounded" src="../../image/logo/logo-lg.png" alt="" width="150px" height="120px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:lgelec'"></article>
			<article class="brandimg"><img class="img-rounded" src="../../image/logo/logo-apple.png" alt="" width="150px" height="120px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:apple'"></article>
			<article class="brandimg"><img class="img-rounded" src="../../image/logo/logo-sony.png" alt="" width="150px" height="120px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:sonymobile'"></article>
			<article class="brandimg"><img class="img-rounded" src="../../image/logo/logo-nokia.png" alt="" width="150px" height="120px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:nokia'"></article>
			<article class="brandimg"><img class="img-rounded" src="../../image/logo/logo-motorola.png" alt="" width="150px" height="120px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:motorola'"></article>
			<article class="brandimg"><img class="img-rounded" src="../../image/logo/logo-Pantech.png" alt="" width="150px" height="120px" onclick="location.href='<%=request.getContextPath()%>/devicelist.mo?brand:pantech'"></article>
		</section>
		
		<section id="mainAd2">
			<article id="subAd">ad</article>
		</section>
	</section>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>