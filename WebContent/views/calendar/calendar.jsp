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
<title>Calendar: SPEC</title>
<%@ include file ="/views/common/menubar.jsp" %>
<link href='<%= request.getContextPath() %>/css/fullcalendar.min.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src='<%= request.getContextPath() %>/js/moment.min.js'></script>
<script src='<%= request.getContextPath() %>/js/fullcalendar.min.js'></script>
<script src='<%= request.getContextPath() %>/js/ko.js'></script>
<script>

	$(document).ready(function(){
		
		loadCalendar(3);  

 		$("#calendar").fullCalendar({
			// put your options and callbacks here
			
			selectable: true,
      		eventLimit: true, // allow "more" link when too many events
      		dayClick: function() {
      		},
      		lang: "ko"
    	});

	});
	
	function loadCalendar(code) {
		
		$.ajax({
			url :"<%=request.getContextPath()%>/loadCalendar.do",
			type : "get",
			dataType : "json",
			data : { code : code },
			success : function(map) {
				
				// 이미 불러왔던 이벤트 초기화
	            $("#calendar").fullCalendar('removeEvents', function(eventObject) {
	                return true;
	            });
				
				// code에 따라 이벤트 불러오기
				$.each(map, function(i) {
 					if(map[i].status == 'Y') {
 						var eventData;
 						if(map[i].code == 0) {
							eventData = {
									id : map[i].id,
	 								title : map[i].title,
	 								url : map[i].url,
	 								start : map[i].date,
	 								backgroundColor : '#ff7f00'
	 						};
 							
 						}else if(map[i].code == 1) {
 							eventData = {
 									id : map[i].id,
 	 								title : map[i].title,
 	 								url : map[i].url,
 	 								start : map[i].date,
		 							backgroundColor : 'green'
 	 						};
 						}else {
 							eventData = {
 									id : map[i].id,
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
	
</script>
<style>

  .outer {
    max-width: 900px;
    margin: 30px auto;
  }
  
  .header button {
  	margin-bottom: 20px;
  }
  
  .selectCode {
  	float: right;
  }
  
  .calendar {
  	float: left;
  }
  
</style>
</head>
<body>

	<!------------------------------------ Calendar ----------------------------------->
	
	<div class="outer">
		<div class="header">
			<div class="selectCode">
				<button type="button" class="btn btn-dark btn-sm" onclick="loadCalendar(3)">전체</button>
				<button type="button" class="btn btn-warning btn-sm" onclick="loadCalendar(0)">기사</button>
				<button type="button" class="btn btn-success btn-sm" onclick="loadCalendar(1)">발매</button>
				<button type="button" class="btn btn-primary btn-sm" onclick="loadCalendar(2)">예약</button>
			</div>
		</div>
		<div id="calendar" class="calendar"></div>
	</div>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>