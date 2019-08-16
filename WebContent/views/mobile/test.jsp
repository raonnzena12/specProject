<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Slider - Range slider</title>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script>
  $( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 1000,
      max: 5000,
      values: [ 1500, 4000 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.values[ 0 ] + " mAh - " + ui.values[ 1 ] + " mAh");
      }
    });
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      " mAh - " + $( "#slider-range" ).slider( "values", 1 ) + " mAh" );
  } );
  </script>
  <style>
  	* {
  		margin: 0px;
  		padding: 0px;
  	}
  	#amount {
  		border: 0px;
  		font-weight: bold;
  		background-color: #eee;
  	}
  	
  </style>
</head>
<body>
 
<p>
  <label for="amount">Price range:</label>
  <input type="text" id="amount" readonly style="border:0; font-weight:bold;">
</p>
 
<div id="slider-range"></div>
 
 
</body>
</html>