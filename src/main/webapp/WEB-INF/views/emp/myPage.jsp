<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
	$(function() {
		$('#passBtn').on('click', function() {
			var emp_no = '${S_USER.emp_no}';
			var pass = $('#pass').val().trim();
			var emp_id = '${S_USER.emp_id}';
			$.ajax({
				url : "${cp}/empController/selectPass",
				data : "emp_no=" + emp_no + "&pass=" + pass + "&emp_id=" + emp_id,
				method : 'POST',
				success : function(data) {
					if (data.pwdMatch == true) {
// 					if (data.passCnt == 1) {
						alert('password가 일치합니다.');
						location.href = "${cp}/empController/empModifyAjaxHtml?emp_no=" + emp_no;
					} else {
						alert('password가 일치하지 않습니다.')
					}
				},
				error : function(xhr) {
					alert('상태 : ' + xhr.status);
				}
			})
		})
	})
</script>

	<%@ include file="../../../common/include.jsp" %>
	
		
			<div class="panel panel-default" style="min-width: 1600px;">
				<div class="panel-heading">
					<h3 class="panel-title">상세정보</h3>
				
				</div>
				<div class="panel-body" style="height: 600px;">
					<div class="card">
						<div class="register-card-body" >
							<form style="margin-left: 27%;">
							<div class="input-group" style="float: left;">
								<div class="mailbox-attachments clearfix" style="text-align: center; width: 100%;">
									<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 150px; width: 120px; margin: 0 auto;">
										<img id="pictureViewImg" style="width: 100%; height: 100%;"	src="${cp }/empController/profile?emp_id=${empDetail.emp_id}" />
									</div>
								</div>
							</div>
							
							<div class="form-group row" >
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em; margin-top: 20px;"> 사원번호 </label>
								<div class="col-sm-2 input-group input-group-sm" style="margin-top: 20px;">
									<span class="input-group-append-sm">${empDetail.emp_no}</span>
								</div>

								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 사원id </label>
								<div class="col-sm-2 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.emp_id}</span>
								</div>
								
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 부서이름 </label>
								<div class="col-sm-2 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.dept_nm}</span>
								</div>
								
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 급여 </label>
								<div class="col-sm-2 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.sal}</span>
								</div>
								
							</div>
							
							<div class="form-group row">
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 한글이름 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${empDetail.ko_nm}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 영문이름 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.eg_nm}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 생년월일 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm"><fmt:formatDate value="${empDetail.birth }" pattern="yyyy.MM.dd"/></span>
								</div>
							
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 성별 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.gender}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 개인ph </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${empDetail.per_pn}</span>
								</div>

								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 부서ph </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.dept_pn}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> email </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${empDetail.per_email}</span>
								</div>

								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> d_email </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.dept_email}</span>
								</div>
							
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 주소 </label>
								<div class="col-sm-10 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.zipcode} / ${empDetail.addr1} , ${empDetail.addr2}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 입사일자 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm"><fmt:formatDate value="${empDetail.hire_dt}" pattern="yyyy-MM-dd"/></span>
								</div>

								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 퇴사일자 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">
										<c:choose>
											<c:when test="${empDetail.retire_dt == null}">
												<span class="input-group-append-sm"></span>
											</c:when>
											<c:otherwise>
												<span class="input-group-append-sm">${empDetail.retire_dt}</span>
											</c:otherwise>
										</c:choose>
										<br>
									</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 재직상태 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${empDetail.serve_nm}</span>
								</div>

								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 직급 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.po_nm}</span>
								</div>

								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 연차일수 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${empDetail.vac_cnt}일</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 직무 </label>
								<div class="col-sm-3 input-group input-group-sm"style="float: left;">
									<span class="input-group-append-sm">${empDetail.job_nm}</span>
								</div>
							</div>
							<br><br>
							</form>
						</div>
						
						<div class="row" >
							<input type="button" id="modifyBtn" class="btn btn-default" style="float: right; margin-right: 20px;" value="수정" data-emp_no="${detailUser.emp_no}" data-toggle="modal" data-target="#formModal">
						</div>
						

					<!-- Form Modal -->
					<div class="modal fade" id="formModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">본인확인</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" role="form">
										<div class="form-group">
											<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" id="pass" placeholder="Password">
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="passBtn">Sign in</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Modal -->


				</div>
				</div>
			</div>
