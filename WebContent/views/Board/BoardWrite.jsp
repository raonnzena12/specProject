<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <!-- include libraries(jQuery, bootstrap) -->
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
        <!-- include summernote css/js --> 
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
       <!--  <script src="../../dist/lang/summernote-ko-KR.js"></script> -->
         
        <!-- include summernote-ko-KR -->
        
        <!-- <script
				  src="https://code.jquery.com/jquery-3.4.1.js"
				  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
				  crossorigin="anonymous">
        </script> -->

	<style>
        body{
           	width: 1080px;
         	/* height: auto; */
           	margin: auto;
          	padding: 0;
       	}
       #header{
        	width: 100%;
        	/* height : 80px; */
        	margin : 0;
        	padding : 0;
        	clear : both;
        }
     	/* .sec{
           	border: 1px solid black;
       	} */
        #nametitle{
			width: 1080px;
			height: 100px;
			margin: auto;
			padding: 0;
		}
		#title{
			width: 1080px;
			height: 50px;
			margin: auto;
       		padding: 0;
     	}
		#content{
     		width:  1080px;
     		height: 600px;
   		 	margin: auto;
  		  	padding: 0;  
   		}
  		#btn{
       		width:  1080px;
     		height: 100px;
      		margin: auto;
      		padding: 0;
    	}
            /*---------------------------------------------*/
            #bname{
            	line-height: 100px;
            }
            #title-1{
                width: 810px;
                height: 50%;
                display: block;
                float: left;
                margin-top: 13px;
                margin-left: 20px;
                margin-right: 0;
                padding: 0;
            }
            /* #writetitle{
             	font-size: 30px;
                padding: 0;
                margin-left: 10px;
                margin-top: 30px;
            } */
            
            #brand, #category{
               height: 50%;
               display: block;
               float: left;
               margin-top: 13px; 
               margin-right: 5px;
               margin-left: 15px; 
            }
            .btn1{
                height: 60%;
                width: 10%;
                margin-top: 20px;
                padding: 5px 0 5px 0;
                background-color: #00264B;
                color: white;

            }
            #preveal{
                margin-left: 400px;
            }
            #cancel{
                float: right;
                margin-right: 10px;
            }
            /* #summernote{
                width: 100%;
                height: 100%;
                clear: both;
            } */
           /*  
            .note-editable{
            	height: 550px;
            }
            
            
            .popover-content, .note-popover {
            	display: none; 
            } */
	</style>
</head>
<body>
	<header id="header">
			<%@include file="/views/common/menubar.jsp"%>
	</header>
	<section id="nametitle" class="sec">
           <h1 id="bname">글쓰기</h1>
    </section>
     <form action="<%= request.getContextPath()%>/write.bo" method="post" id="writeBoard">
    <section id="title" class="sec"> 
    	<select name="brand" id="brand">
     		<option value="1">LG게시판</option>
     		<option value="2">삼성게시판</option>
     	 	<option value="3">애플게시판</option>
     		<option value="4">타브랜드게시판</option>
     		<option value="5" selected>자유게시판</option>
     	</select>
            
     	<select name="category" id="category">
    		<option value="1">이슈</option>
   			<option value="2">잡담</option>
   			<option value="category" selected>카테고리</option>
  		</select>
  		<input type="text" name="title-1" id="title-1" placeholder="제목을 입력하세요.">    
  	</section>

  	<section id="content" class="sec">
  		<!-- <div id="summernote"><p>Hello Summernote</p></div>
   			<script>
	              $(document).ready(function() {
	                  $('#summernote').summernote({
	                	  height: 300,                 
		                  minHeight: null,            
		                  maxHeight: null,            
		                  focus: true 
	                  });
	              
	              });
            </script> -->
            <%@ include file="/views/Board/WriteAPI.jsp" %>
            <script>
	        $(document).ready(function() {
	              $('#summernote').summernote({
	            	  lang:'ko-KR',
	            	  toolbar: [
	            		    // [groupName, [list of button]]
	            		    ['style', ['bold', 'italic', 'underline', 'clear']],
	            		    ['font', ['strikethrough', 'superscript', 'subscript']],
	            		    ['fontsize', ['fontsize']],
	            		    ['color', ['color']],
	            		    ['para', ['ul', 'ol', 'paragraph']],
	            		    ['height', ['height']]
	            		    ]
	              });
	                  
		        $("#write").click(function(){
		        	var markupStr = $('#summernote').summernote('code');
		        	console.log(markupStr);
		        	/* return false; */
		        	if(markupStr.trim() == "<p><br></p>"){
		        		alert("내용을 입력하세요.");
		        		return false;
		        	}
		        	$("#writeBoard").submit();
		        	
		        	
		        });
	        });
	        
	             
    </script>
            
 	</section>
	<section id="btn" class="sec">
		<button type="button" class="btn btn-secondary btn1" id="preveal">미리보기</button>
		<button type="button" class="btn btn-secondary btn1" id="write">글쓰기</button>
		<button type="reset" class="btn btn-secondary btn1" id="cancel" onclick="javascript:history.back();">취소</button>
	</section>
	
	
	</form>
	
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<script>
		$("#preveal").click(function(){
			var writeBoard = document.getElementById("writeBoard");
			writeBoard.target = "preview";
			writeBoard.action = "<%=request.getContextPath()%>/preview.bo";
			/* console.log(content); */
			window.open("","preview","width=900px, height=600px");
			writeBoard.submit();
			writeBoard.action = "<%= request.getContextPath()%>/write.bo";
		});
		
  		
			$("#writeBoard").submit(function(){
				if($("#category").val() == "category"){ 
		  			alert("카테고리를 선택하세요.");
		  			return false;
		  		}
				/* console.log("제목 : "+$("#title-1").val()); */
				if($("#title-1").val() == ""){
					alert("제목을 입력하세요.");
					return false;
				}
				
			});
	

	</script>
	
</body>
</html>