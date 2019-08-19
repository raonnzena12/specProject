<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board"%>
    
<%
	Board b = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <!-- include libraries(jQuery, bootstrap) -->
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
        <!-- include summernote css/js --> 
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
       
	<style>
        body{
           	width: 1080px;
         	/* height: auto; */
           	margin: auto;
          	padding: 0;
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
            
	</style>
</head>
<body>
	<script>
		$(document).ready(function(){
			var bcode = "<%=b.getbCode()%>";
			switch(bcode){
			case 1 : ($("#brand").val() == 1) = "selected"; break;
			case 2 : ($("#brand").val() == 2) = "selected"; break;
			case 3 : ($("#brand").val() == 3) = "selected"; break;
			case 4 : ($("#brand").val() == 4) = "selected"; break;
			case 5 : ($("#brand").val() == 5) = "selected"; break;
			}
			
			var bcategory = "<%=b.getbCategory()%>";
			switch(bcategory){
			case 1 : ($("#category").val() ==1) = "selected";break;
			case 2 : ($("#category").val() ==2) = "selected";break;
			}
			
			var title = "<%=b.getbTitle()%>";
			$("#title-1").val(title);
		});
	
	</script>
	<section id="nametitle" class="sec">
           <h1 id="bname">글 수정</h1>
    </section>
    <form action="<%= request.getContextPath()%>/update.bo" method="post" id="updateBoard">
    <input type="hidden" name="bno" value="<%=b.getbNo()%>">
    <section id="title" class="sec"> 
    	<select name="brand" id="brand">
     		<option value="1">LG게시판</option>
     		<option value="2">삼성게시판</option>
     	 	<option value="3">애플게시판</option>
     		<option value="4">타브랜드게시판</option>
     		<option value="5">자유게시판</option>
     	</select>
            
     	<select name="category" id="category">
    		<option value="1">이슈</option>
   			<option value="2">잡담</option>
   			<option value="category" selected>카테고리</option>
  		</select>
  		<input type="text" name="title-1" id="title-1">    
  	</section>

  	<section id="content" class="sec">
  		
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
	              var content = "<%=b.getbContent()%>";
	              $('#summernote').summernote('code', content);
	              
	                  
	        });
	        $("#write").click(function(){
	        	var markupStr = $('#summernote').summernote('code');
	        });
	        
	             
    </script>
            
 	</section>
	<section id="btn" class="sec">
		<button type="button" class="btn btn-secondary btn1" id="preveal">미리보기</button>
		<button type="submit" class="btn btn-secondary btn1" id="write">글쓰기</button>
		<button type="reset" class="btn btn-secondary btn1" id="cancel" onclick="javascript:self.close();">취소</button>
	</section>
	
	
	</form>
	
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<script>
		$("#preveal").click(function(){
			var writeBoard = document.getElementById("writeBoard");
			writeBoard.target = "preview";
			writeBoard.action = "<%=request.getContextPath()%>/preview.bo";
			console.log(content);
			window.open("","preview","width=900px, height=500px");
			writeBoard.submit();
			writeBoard.action = "<%= request.getContextPath()%>/write.bo";
		});
		
  		
			$("#writeBoard").submit(function(){
				if($("#category").val() == "category"){
		  			alert("카테고리를 선택하세요.");
		  			return false;
		  		}
				console.log("제목 : "+$("#title-1").val());
				if($("#title-1").val() == ""){
					alert("제목을 입력하세요.");
					return false;
				}
				
				
				
			});
			
			if (opener!= null) {
                opener.updateReplyForm = null;
                self.close();
            }
	

	</script>
</body>
</html>