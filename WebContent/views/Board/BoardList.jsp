<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <style>
 	body{
          /*   width: 1080px; */
            height: auto;
            margin: auto;  
        }
  /*  #btn, #page, #list{
        	border: 1px solid black;
        }  */
	#list{
            width: 1080px;
            height: 500px;
            margin: auto;
            padding: 0;
        }
	#btn{
            width: 1080px;
            height: 60px;
            margin: auto;
            padding-top: 10px;
            
        }
   	#page{
            width: 1080px;
            height: 100px;
            margin: auto;
            padding: 0;
            padding-left: 450px;
        }
    #searchselect{
    	margin:0;
    	padding: 0;
    	float:left;
    	display: block;
    	padding-top: 5px;
    	padding-bottom: 8px;
    	
    	
    }
    .form-inline{
           display: block;
           float: left;
           margin-right: 10px;
           margin-top:0;
       }
    #listtable{
    	text-align: center;
    }
    
    
 </style>
</head>
<body>
	<section id="list">
      	<table class="table table-hover" id="listtable">
        	<thead>
            	<tr>
                    <th scope="col" width="10%">번호</th>
                    <th scope="col" width="10%">분류</th>
                    <th scope="col" width="55%">제목</th>
                    <th scope="col" width="15%">날짜</th>
                    <th scope="col" width="10%">조회</th>
                </tr>
            </thead>
            <tbody>
            	<%-- <% if(list.isEmpty()){ %>
            	<tr>
            		<td colspan="5">등록된 게시글이 없습니다.</td>
            	</tr>
            	
            	<% }else{ %>
	            	<% for(Board b : list){ %>
	                <tr>
	                    <td><%= %></td>
	                    <td><%= %></td>
	                    <td><%= %></td>
	                    <td><%= %></td>
	                    <td><%= %></td>
	                </tr>
	              	<% } %>
				<% } %> --%>
            </tbody>   
       	</table>
   	</section>
    <section id="btn">
       	<button type="button" class="btn btn-secondary"style="background-color : white; color : black; display : block; font-weight:bold; float : left; margin: 0 10px 0 5px;" onclick="location.href='<%=request.getContextPath()%>/list.bo'">목록</button>
        <form class="form-inline my-2 my-lg-0">
	        <input class="form-control mr-sm-2" type="text" placeholder="Search">
	        <button type="button" class="btn btn-secondary"style="background-color : white; color : black; font-weight:bold; margin:0;">검색</button>
        </form>
		<select id="searchselect">
			<option value="title" selected>제목</option>
			<option value="titlecontent">제목 + 내용</option>
			<option value="content">내용</option>
			<option value="head">말머리</option>
		</select>
		
			<button type="button" class="btn btn-secondary"style="background-color : white; color : black; display : block; font-weight:bold; float : right; margin: 0 10px 0 5px;" onclick="location.href='<%=request.getContextPath()%>/write.bo'">글쓰기</button>
    </section>
    
    <!-- 페이징바 -->
    <section id="page">
		<div>
	         <ul class="pagination pagination-sm">
	   			<li class="page-item disabled">
	   				<a class="page-link" href="#">&laquo;</a>
	   			</li>
	   			<li class="page-item active">
	   				<a class="page-link" href="#">1</a>
	    		</li>
	            <li class="page-item">
	                 <a class="page-link" href="#">2</a>
	      		</li>
	     		<li class="page-item">
	    			<a class="page-link" href="#">3</a>
	   			</li>
	   			<li class="page-item">
	    			<a class="page-link" href="#">4</a>
	    		</li>
	    		<li class="page-item">
	     			<a class="page-link" href="#">5</a>
	     		</li>
	    		 <li class="page-item">
	     			<a class="page-link" href="#">&raquo;</a>
	     		</li>
   			</ul>
   		</div> 
  	</section>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
</body>
</html>