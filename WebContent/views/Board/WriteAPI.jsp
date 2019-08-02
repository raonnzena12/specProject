<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <!-- include libraries(jQuery, bootstrap) -->
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
         
        <!-- include summernote css/js -->
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
        <script
				  src="https://code.jquery.com/jquery-3.4.1.js"
				  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
				  crossorigin="anonymous">
        </script>
       <style>
       		.note-editing-area{
       			height:550px;
       		}
       </style>
	
</head>
<body>
	
	<div id="summernote" style="height: 550px;"><p>Hello Summernote</p></div>
   			<script>
	              $(document).ready(function() {
	                  $('#summernote').summernote();
	                  
	              });
            </script>


	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <!-- include summernote-ko-KR -->
    <!-- <script src="lang/summernote-ko-KR.js"></script> -->

</body>
</html>