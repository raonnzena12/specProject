<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="calendar.model.vo.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Calendar> eventList = (ArrayList<Calendar>)request.getAttribute("eventList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='<%= request.getContextPath() %>/css/fullcalendar.min.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='<%= request.getContextPath() %>/js/jquery.min.js'></script>
<script src='<%= request.getContextPath() %>/js/moment.min.js'></script>
<script src='<%= request.getContextPath() %>/js/fullcalendar.min.js'></script>
<title>Calendar</title>
<script>

	$(document).ready(function(){
		
		loadCalendar(); 
/* 
 		$("#calendar").fullCalendar({
			// put your options and callbacks here
			/*
			selectable: true,
      		eventLimit: true, // allow "more" link when too many events
      		dayClick: function() {
      		},
      		eventClick: function(event) {
      			
      	    	if(confirm('삭제하시겠습니까?')) {
      	    		$("#calendar").fullCalendar('removeEvents', function(eventObject) {
      	    			return false;
      	    		});
      	    	}
      	    	return false;
      			
      	    },
       		select: function(start, end) {
       			
      	        var title = prompt('제목 입력 :');
      	        var url = prompt('주소 입력 : ');
      	        var eventData;
      	        if (title) {
      	          eventData = {
      	            title: title,
      	            url: url,
      	            start: start,
      	            end: end
      	          };
      	          $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
      	        }
      	     	
      	        $('#calendar').fullCalendar('unselect');
      	    }
      	    
    	});
*/
	});
	
	function loadCalendar() {
		var calendarEl = document.getElementById('calendar');
		$.ajax({
			url :"../../loadCalendar.do",
			type : "get",
			dataType : "json",
			success : function(map) {
				
				console.log(map);
				
				$.each(map, function(i) {
 					if(map[i].status == 'Y') {
 						var eventData;
 						if(map[i].code == 0) {
							eventData = {
	 								title : map[i].title,
	 								url : map[i].url,
	 								start : map[i].date,
	 								backgroundColor : '#ff7f00'
	 						};
 							
 						}else if(map[i].code == 1) {
 							eventData = {
 	 								title : map[i].title,
 	 								url : map[i].url,
 	 								start : map[i].date,
		 							backgroundColor : 'green'
 	 						};
 						}else {
 							eventData = {
 	 								title : map[i].title,
 	 								url : map[i].url,
 	 								start : map[i].date,
		 							backgroundColor : 'blue'
 	 						};
 						}
 						$('#calendar').fullCalendar('renderEvent', eventData, true);
					}
				});
			},
			error : function() {
				alert("일정을 불러오지 못했습니다.")
			}
		});
	}
	
	function closeBtn(){
		$(".registerModal").css("display", "none");
	}
	
	function registerEvent() {
		$(".registerModal").css("display", "block");
	}
	
	function deleteEvent() {
		$(".deleteModal").css("display", "block");
	}
	
	function saveBtn() {
		var title = $("input[name=title]").val();
		var url = $("input[name=url]").val().trim();
		var date = $("input[name=date]").val();
		var status = $("#status").val();
		var code = $("input[name=code]:checked").val();
		
		var modal = $(".registerModal").css("display", "none");
/*		
		var eventDate;
		eventData = {
				title : title,
				url : url,
				start : date,
				end :  date
		};
		$('#calendar').fullCalendar('renderEvent', eventData, true); */
		
		$.ajax({
			url : "../../insertCalendar.do",
			type : "get",
			data : {title : title, url : url, date : date, status : status, code : code},
			success : function(check) {
				if(check > 0) {
					alert("일정이 성공적으로 등록이 되었습니다");
					location.reload();	
				}
			},
			error : function() {
				alert("일정 등록 중 오류가 발생하였습니다.");
			}
		});
	}
	
</script>
<style>

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  
  .registerModal {
  	width : 100%;
  	height : 100%;
  	position : fixed;
  	z-index: 3;
  	background-color: rgba(0, 25, 0, 0.2);
  	top : 0;
  	left : 0;
  	display : none;
  	padding-top : 100px;
  }
  
  .modal-content{
    margin: auto;
    width: 400px;
    height: 300px;
    background-color: white;
    padding: 0;
    border-radius: 20px;
    position: relative;
  }
  
  #modal-content {
    width: 400px;
  }
  
  .modalRegister {
  	width: 320px;
  	height: 100%;
  	margin: auto;
	/* border: solid 1px black; */
  	padding: 0;
  }
  
  .modalRegister table {
  	width: 100%;
  	height: 80%;
  	padding-top : 40px;
  }
</style>
</head>
<body>
	<%@ include file ="/views/common/menubar.jsp" %>
	<button type="button" onclick="registerEvent();">일정 등록</button>

	<div id="calendar"></div>
	
		<div class="registerModal">
		   	<div class="modal-content" id="modal-content">
		   		<div class="modalRegister">
		   			<table id="registerTable">
		   				<tr>
		   					<td><label>일정 유형</label>
		   					<td>
		   						<input type="radio" id="news" name="code" value="0" checked>
		   						<label for="code">기사</label> &nbsp;
		   						<input type="radio" id="release" name="code" value="1" >
		   						<label for="release">발매</label> &nbsp;
		   						<input type="radio" id="reservation" name="code" value="2" >
		   						<label for="reservation">예약</label> &nbsp;
		   					</td>
		   				</tr>
			   			<tr>
			   				<td><label name="title">일정 등록</label></td>
			   				<td><input type="text" name="title" id="title"></td>
			   			</tr>
			   			<tr>
			   				<td><label name="url">url 등록</label></td>
			   				<td><input type="url" name="url" id="url"></td>
			   			</tr>
			   			<tr>
			   				<td><label name="date">날짜 지정</label></td>
			   				<td><input type="date" name="date" id="date"></td>
			   			</tr>
			   			<tr>
			   				<td>공개 여부</td>
			   				<td>
			   					<select id="status">
			   						<option value="Y">공개</option>
			   						<option value="N">비공개</option>
			   					</select>
			   				</td>
			   			</tr>
			   			<tr>
			   				<td colspan="2" style="text-align:center">
			   					<button type="button" id="saveBtn" onclick="saveBtn();">저장</button> &nbsp;&nbsp;
			   					<button type="button" id="closeBtn" onclick="closeBtn();">취소</button>
			   				</td>
			   			</tr>
			   		</table>
		   		</div>
		   	</div>
		</div>
	
</body>
</html>