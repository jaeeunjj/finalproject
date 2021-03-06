
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Data Table JS
		============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">

<!--    메뉴 소개 영역 -->
<div class="breadcomb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="breadcomb-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="breadcomb-wp">
							<div class="breadcomb-icon">
										<i class="notika-icon notika-draft"></i>
									</div>
								<div class="breadcomb-ctn">
									<h2>성적조회</h2>
									<p>
										성적을 확인하실 수 있는 페이지 입니다. <span class="bread-ntd"></span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="data-table-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-list">
					<div class="table-responsive">
						<table id="data-table-basic">
							<thead>
								<tr>
									<th>학년도/학기</th>
									<th>학년</th>
									<th>총과목</th>
									<th>이수과목</th>
									<th>취득학점</th>
									<th>총점</th>
									<th>평점평균</th>
									<th>누적평점평균</th>
								</tr>
							</thead>
							<tbody id="listBody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Data Table JS
		============================================ -->
<script
	src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>
<script>
	$('#data-table-basic').DataTable({
		scrollY : '200px',
		scrollCollapse : true,
		paging : false,
		ajax : {
			type : 'get',
			url : '${pageContext.request.contextPath}/searchGrade/list/${user.user_id}',
			dataType : 'json'
		}
		, columns : [ {
			data : "seme"
		}, {
			data : "grade"
		}, {
			data : "totalLecture"
		}, {
			data : "completeLecture"
		}, {
			data : "completeCredit"
		}, {
			data : "totalGrade"
		},{
			data : "totalAverage"
		},{
			data : "accumulateAverage"
		} ]
		, order : []
	});
	
</script>