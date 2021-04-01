<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>



	<script>
      	$(function(){
      		var fileCnt = 1;
        	$('#summernote').summernote({
        		height: 700
        		
        	});	
        	
        	$("#perAppLine").on("click", function() {
         		var win = window.open("${cp}/app/selectAppLineInfo?emp_no=${S_USER.emp_no}", "PopupWin", "width=600,height=500");
			})
        	
        	$("#appLine").on("click", function() {
         		var win = window.open("${cp}/app/empInfoList", "PopupWin", "width=900,height=500");

			})
			
			$("#registApp").on("click", function() {
				var title = $("#title").val();
				if(title == ""){
					alert("제목은 필수입력 사항입니다.");
					return false;
				}
				if($("#empList2").val()==""){
					alert("결재선을 지정해주세요");
					return false;
				}
				
				var to_dt = "<fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/>";

				var s_dt = $("#s_dt").val();
		
				if(s_dt==""){
					alert("날짜를 지정해주세요");
					return false;
				}
				
				var s_year = s_dt.substr(0,4);
				var to_year = to_dt.substr(0,4);				 
				var s_month = s_dt.substr(5,2);
				var to_month = to_dt.substr(5,2);
				var s_day = s_dt.substr(8,2);
				var to_day = to_dt.substr(8,2);
				
				var s_total = s_year+ "" + s_month + "" + s_day;
				var to_total = to_year+ "" + to_month + "" + to_day;

				
				
				if(to_total > s_total){
					alert("오늘날짜보다 이전일 수 없습니다.");
					return false;
				}
				
				var vac_cnt =  ${empInfo.vac_cnt};
				if(0.5 > vac_cnt){
					alert("잔여연차를 초과하였습니다.");
					return false;
				}
				
				$("#e_dt").val(s_dt);
				
				$("#appfrm").attr("method","POST");
				$("#appfrm").attr("action","${cp}/app/registALApp");
				$("#appfrm").submit();
			})
			
			$("#tempApp").on("click", function() {
				
				$("#appfrm").attr("method","POST");
				$("#appfrm").attr("action","${cp}/app/tempApp");
				$("#appfrm").submit();
			})
			
			// 개인 결재선 만들기
        	$("#addAppLine").on("click", function() {
        		var win = window.open("${cp}/app/addAppLine", "PopupWin", "width=900,height=500");
        	})
			
			$("#cancleApp").on("click", function(){
				
				$("#appfrm").attr("method","GET");
				$("#appfrm").attr("action","${cp}/app/appView");
				$("#appfrm").submit();
			});
		});
    </script>
		

	
	<form id="appfrm" enctype="multipart/form-data">
		<input type="hidden" name="e_dt" id="e_dt">
		<input type="hidden" name="appLineList" id="empList1" value="${S_USER.emp_no}">
		<input type="hidden" name="appLineList" id="empList2">
		<input type="hidden" name="appLineList" id="empList3">
		<input type="hidden" name="appLineList" id="empList4">
		<input type="hidden" name="appLineList" id="empList5">
		<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
		<input type="hidden" name="app_det_no" value="${app_det_no}">
		<input type="hidden" name="app_div_no" value="${app_div_no}">
		
		
		
		<div style="width: 100%; padding: 10px; background: white;"  >
			<h2 style="text-align: center;">반차휴가계</h2>
			<hr style="border: solid 0.3px black;">
			<br>
			<div style="float: right;">
				<table border="1">
					<tr style="height: 30px;">
						<th rowspan="2" style="height: 90px;width: 80px; text-align: center; background-color: #CECEF6;">결재</th>
						<td style="width:  90px; background-color: #CECEF6; text-align: center;"><span id="co_nm1">${empInfo.po_nm}</span></td>
						<td style="width:  90px; background-color: #CECEF6; text-align: center;"><span id="co_nm2"></span></td>
						<td style="width:  90px; background-color: #CECEF6; text-align: center;"><span id="co_nm3"></span></td>
						<td style="width:  90px; background-color: #CECEF6; text-align: center;"><span id="co_nm4"></span></td>
						<td style="width:  90px; background-color: #CECEF6; text-align: center;"><span id="co_nm5"></span></td>
					</tr>
					<tr style="height: 80px;">
						<td style="width:  90px; text-align: center;"><span id="name1">${empInfo.ko_nm}</span></td>
						<td style="width:  90px; text-align: center;"><span id="name2"></span></td>
						<td style="width:  90px; text-align: center;"><span id="name3"></span></td>
						<td style="width:  90px; text-align: center;"><span id="name4"></span></td>
						<td style="width:  90px; text-align: center;"><span id="name5"></span></td>
					</tr>
				</table>
				<br>
				
			</div>
			<br style="clear:both;">
			<div style="float: right;">
			
				<input style="float: right;" id="perAppLine" type="button" value="개인 결재선">
				<input style="float: right;" id="appLine" type="button" value="결재선 지정">
				<button type="button" id="addAppLine" >개인결재선 생성</button>
		
			</div>
			
			<br style="clear:both;"><br><br>
			<div>
			<table border="1" style="width: 100%;">
				
				
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; width: 10%; height: 30px;"  colspan="1"><strong>기안부서</strong></th>
					<td colspan="7">${empInfo.dept_nm}</td>
				</tr>
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;" height="20"><strong>기안자</strong></th>
					<td colspan="7">${empInfo.ko_nm}</td>
				</tr>
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;" height="20"><strong>기안날짜</strong></th>
					<td colspan="7"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></td>
				</tr>
				
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;" height="20"><strong>날짜</strong></th>
					<td colspan="7">시작일 : <input type="date" id="s_dt" name="s_dt"> 잔여연차 : ${empInfo.vac_cnt}</td>
				</tr>
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;"><strong>제목</strong></th>
					<td colspan="7"><input id="title" name="title" style="width: 100%; line-height: 25px;" type="text">	</td>
				</tr>
				<tr>
					<td colspan="8">
						<textarea id="summernote" name="cont"></textarea>
						<br>
						<input type="file" name="fileName" multiple="multiple">
					</td>
				</tr>
				
			</table>
			
				
			
			<br>
			</div>
			<div style="float: right;">
				<input class="btn btn-info btn-sm" type="button" id="registApp" value="등록">
				<input class="btn btn-primary btn-sm" type="button" id="tempApp" value="임시저장">
				<input class="btn btn-warning btn-sm" type="button" id="cancleApp" value="취소">
			</div>
			<br><br>
			
		</div>
	</form>

