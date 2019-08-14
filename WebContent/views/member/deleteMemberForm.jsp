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
    
    #info{
    	padding-bottom : 10px;
		border-bottom: 2px solid #00264B;   
    }
    
    #pwdInputLayer{
    	margin:auto !important;
    	width: 500px !important;
    }
    
    #pwdInputLayer button{
    	
    	font-size: 18px;
    }
    
    .center{
    	padding-left:180px !important;
    }
    
    .alert{
    	text-align: center;
    	color: red;
    	font-size: 15px;
    }
    
    .form-group>ul{
    	padding: 20px;
    	font-size: 15px;
    }
</style>
<title>회원탈퇴</title>
<script>
    $(function(){

        $("a").mouseenter(function(){
            $(this).css("color","#00264B");
        }).mouseleave(function(){
            $(this).css("color","gray");
        });
    });
</script>
	<%@ include file ="/views/common/menubar.jsp" %>
</head>
<body>
	<nav id="mypageNav">
		<ul>
			<li><a href="<%=request.getContextPath()%>/mypage.me" id="info">회원정보</a></li>
			<li><a href="#">작성글보기</a></li>
			<li><a href="#">작성리뷰보기</a></li>
			<li><a href="#">작성댓글보기</a></li>
		</ul>
    </nav>
    
    
    <div id="pwdInputLayer">
    	<form id="checkPwdFormBeforeDelete" action="<%=request.getContextPath()%>/delete.me" method="POST">
	    	<div id="pwdText">
	    		<p style="font-size:40px; text-align: center;">회원 탈퇴</p>
	            <p class="alert">※ 신청 전 아래 안내 사항을 반드시 확인하여 주십시오</p>
	    	</div>
	    	<div class="form-group">
	    		<ul>
	    			<li>현재 사용하고 있는 계정 탈퇴시, <br>
	    				현 이메일 주소로 재가입 하실 수 없습니다.
	    			</li>
	    			<li>탈퇴 이후 게시판 내 글/댓글 삭제 요청이 불가합니다.<br>
	    				탈퇴 후에는 본인 여부 확인이 어려우므로, <br>
	    				관리자가 임의로 삭제할 수 없습니다.
	    			</li>
	    		</ul>
	    	</div>
	    	<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="infoCheck" name="infoCheck">
			    <label class="form-check-label" for="infoCheck">모든 안내 사항을 숙지하고 탈퇴를 신청합니다.</label>
		  	</div>
			  <div class="form-group">
			    <label for="email">Email address</label>
			    <input type="email" class="form-control" id="email" name="userEmail" aria-describedby="emailHelp" readonly value="<%=loginUser.getUserEmail()%>">
			  </div>
			  <div class="form-group" style="font-size: 15px">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
			  </div>
			  <div class="form-group center">
			    <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='<%=request.getContextPath()%>/mypage.me'">취소</button>
			  	<button type="button" class="btn btn-info btn-lg" id="check" >확인</button>
			  </div>
			  
		</form>
    		
    	
    </div>
    <script>
    	
    	/* $("#infoCheck").on("input", function(){
    		console.log($("#infoCheck").is(":checked"));
    		console.log(!$("#infoCheck").is(":checked"));
    	}); */
    	$("#check").click(function(){
    		
    		Swal.fire({
    			  title: '정말 탈퇴하시겠습니까?',
    			  text: "확인을 누르면 탈퇴처리로 넘어갑니다!",
    			  type: 'warning',
    			  showCancelButton: true,
    			  confirmButtonColor: '#3085d6',
    			  cancelButtonColor: '#d33',
    			  confirmButtonText: '예, 삭제합니다!'
    			}).then((result) => {
    			  if (result.value) {
    				  Swal.fire({
    					  title: 'Auto close alert!',
    					  html: '탈퇴합니다~',
    					  timer: 2000,
    					  onBeforeOpen: () => {
    					    Swal.showLoading()
    					    timerInterval = setInterval(() => {
    					    }, 100)
    					  },
    					  onClose: () => {
    					    clearInterval(timerInterval)
    					    if(!$("#infoCheck").is(":checked")){
    			    			Swal.fire({
    			    				  type: 'error',
    			    				  title: 'Oops...',
    			    				  text: '안내사항을 확인하고 체크해주세요!',
    			    				  /* footer: '<a href>Why do I have this issue?</a>' */
    			    				});
    			    			
    			    			return false;
    			    			
    			    		} else if($("#checkPwdFormBeforeDelete input[name=pwd]").val().trim() == ""){
    			    			Swal.fire({
    			    				  type: 'error',
    			    				  title: 'Oops...',
    			    				  text: '비밀번호를 확인해주세요!',
    			    				  /* footer: '<a href>Why do I have this issue?</a>' */
    			    				});
    			    			return false;
    			    		} else{
    			    			
    			    			$("#checkPwdFormBeforeDelete").submit();
    			    		}
    					  }
    					})
    			  } else {
    			  }
    			})
    	});
    </script>
</body>
</html>