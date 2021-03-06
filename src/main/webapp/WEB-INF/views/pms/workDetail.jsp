<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	// 문서로딩이 완료되고 나서 실행되는 영역
	$(function(){
		//일담 리스트 뒤로 가기
		$("#returntBtn").on("click",function(){
			$("#frm").attr("method","get");
			$("#frm").attr("action","${cp}/pms/pmsView");
			$("#frm").submit();
		});	
		//일감 수정
		$("#modifyBtn").on("click",function(){
			$("#frm").attr("method","post");
			$("#frm").attr("action","${cp}/pms/modifyPmsForm");
			$("#frm").submit();
		});	
		//하위 일감 등록
		$("#registBtn").on("click",function(){
			$("#frm").attr("method","post");
			$("#frm").attr("action","${cp}/pms/registLowerWorkForm");
			$("#frm").submit();
		});	
		//일감 삭제
		$("#deleteBtn").on("click",function(){
			var flag = confirm("정말 삭제하겠습니다?");
			if (flag) {
				var emp_no = $(this).data("emp_no");
				$("#emp_no").val(emp_no);
				$("#frm").attr("method","post");
				$("#frm").attr("action","${cp}/pms/deleteWork");
				$("#frm").submit();
			}else{
				return ;
			}
		});	
	})
</script>

<style>
.titW1{
	height : 50px;
	text-align: center;
}
.titW2{
	height : 50px;
	text-align: center;
}
.tAr{
 	text-align: right; 
 	padding-right: 17%; 
	
}
</style>


<form  id="frm" class="form-horizontal form-border">
	<input type="hidden" name="s_dt" value="${workVo.s_dt}"/>
	<input type="hidden" name="e_dt" value="${workVo.e_dt}"/>
	<input type="hidden" name="work_nm" value="${workVo.work_nm}"/>
	<input type="hidden" name="work_no" value="${workVo.work_no}"/>
	<input type="hidden" name="cont" value="${workVo.cont}"/>
	<input type="hidden" name="prog" value="${workVo.prog}"/>
	<input type="hidden" name="est_time" value="${workVo.est_time}"/>
	<input type="hidden" name="pri_order" value="${workVo.pri_order}"/>
	<input type="hidden" name="sta_cd" value="${workVo.sta_cd}"/>
	<input type="hidden" name="pms_no" value="${workVo.pms_no}"/>
	<input type="hidden" name="attend_emp_no" value="${S_USER.emp_no}"/>
</form>



<div class="col-md-12" 	style="min-width: 1000px;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">일감 상세정보 조회</h3>
			<div class="actions pull-right">
				<i class="fa fa-chevron-down"></i> <i class="fa fa-times"></i>
			</div>
		</div>
		<div class="panel-body" style="display: block; min-height: 400px;">
			<form class="form-horizontal" role="form">

				<div class="tablWrap" style="padding-left: 200px; padding-top: 30px;">

					<div class="tablWrap" >
						<table style="min-width: 800px;" width="81%" border="3" cellspacing="0" cellpadding="0" class="data1 data3 tLf">
							<colgroup>
								<col width="130px;">
								<col>
								<col width="130px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th class="titW1">일자<!-- 일자 --></th>
									<td class="titW2"> <fmt:formatDate
												value="${workVo.s_dt}" pattern="yyyy-MM-dd" /> 
							        ~         <span id="edate"> <fmt:formatDate
												value="${workVo.e_dt}" pattern="yyyy-MM-dd" />
									</span></td>
									<th class="titW1">작성자<!-- 작성자 --></th>
									<td colspan="3"  class="titW2"><span> ${workVo.ko_nm} </span></td>
								</tr>
								<tr>
									<th class="titW1">제목<!-- 제목 --></th>
									<td colspan="3"><span id="title">${workVo.work_nm}</span></td>
								</tr>
								<tr>
									<th class="titW1">내용<!-- 내용 --></th>
									<td colspan="3"  style="text-align: left;">
									<div >
										<span id="location">
										${workVo.cont}</span>
									</div> 
									</td>
								</tr>
								<tr>
									<th class="titW1">우선순위<!-- 일정타입 --></th>
									<td class="titW2" >
									<span style="background-color: #72a881; color: #ffffff;">
											${workVo.pri_order_nm} </span></td>
									<th class="titW1">상태<!-- 장소 --></th>
									<td class="titW2"><span> ${workVo.sta_cd_nm} </span></td>
								</tr>


								<tr>
									<th class="titW1">진척도<!-- 캘린더 --></th>
									<td class="titW2">
										<span id="calendarName"
										style="color: white; background-color: #72A881;">${workVo.prog}%</span>
									</td>
									<th class="titW1">추정시간</th>
									<td class="titW2"><span id="repeatStr">${workVo.est_time}시간</span></td>
								</tr>

<!-- 										<div class="progress"> -->
<%--                                     <div class="progress-bar progress-bar-default" style="width:${workVo.prog}%">${workVo.prog}%</div> --%>
<!--                                 </div> -->
							</tbody>
						</table>
					</div>
					</div>
					<div class="tAr pT10" style="min-width: 700px;">
						<br> 
						<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no }"> 
						<input type="button" id="returntBtn" class="btn btn-primary btn-square" value="목록">
						<input type="button" id="registBtn" class="btn btn-primary btn-square" value="하위일감 등록">
						<input type="button" id="modifyBtn" class="btn btn-primary btn-square" value="수정"> 
						<input type="button" id="deleteBtn" data-emp_no="${S_USER.emp_no }" class="btn btn-primary btn-square" value="삭제">
					</div>
					<br><br>
					
					<!-- 리스트 템플릿 -->
					<div class="panel panel-default" style="width: 83%; padding-left: 200px; min-width: 700px;">
					<div class="panel-heading">
                            <h3 class="panel-title">하위일감 목록</h3>
                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <i class="fa fa-times"></i>
                            </div>
                          </div>
                          <div class="panel-body">
                        <table class="table table-hover">
                          <thead>
                            <tr>
                              <th>일자</th>
                              <th>제목</th>
<!--                               <th>내용</th> -->
                              <th>진척도</th>
                              <th>우선순위</th>
                              <th>작성자</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${workList}" var="workList" varStatus="loop">
                            <tr>
                              <td><span id="sdate"> 
	                              <fmt:formatDate value="${workList.s_dt}" pattern="yyyy-MM-dd" />
										</span> ~ 
									<span id="edate"> 
									<fmt:formatDate value="${workList.e_dt}" pattern="yyyy-MM-dd" />
									</span>
								</td>
                              <td><span id="title">${workList.work_nm}</span></td>
<%--                               <td>${workList.cont}</td> --%>
                              <td>${workList.prog}</td>
                              <td>${workList.pri_order_nm}</td>
                              <td>${workList.ko_nm}</td>
                            </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                          </div>
                        </div>
                        
                    <!-- 리스트 템플릿 -->
			</form>
			
			
		</div>
	</div>
</div>



