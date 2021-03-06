<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 교육과정관리 (강좌관리)화면
 --%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<style>
	tfoot { 
    	display: table-header-group; 
	}
	select {
	    border: 1px solid #eee;
	    height: 35px;
	    padding: 7px 15px;
	    font-size: 13px;
	    border-radius: 2px;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    line-height: 100%;
	    background-color: #fff;
	    outline: none;
	}
	
	select :hover  {
		background-color: #00c292 !important;
	    color: #fff !important;
	}
	.selectSpan {
		font-size: 16px;
		font-weight: bold;
		margin : 0 5px 0 20px;
	}
	#grade, #credit, #course {
		width: 60px;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		var table = $('#data-table-basic').DataTable({
			ajax : {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/curriculum/curAllLectureList",
				"dataType" : "JSON"
			},
			columns : [
				{data : "openseme_year"}
				, {data : "openseme_semester"}
				, {data : "user_name"}
				, {data : "lecture_code"}
				, {data : "lecture_name"}
				, {data : "lecture_coursetype"}
				, {data : "lecture_credit"}
				, {data : "lecture_target"}
				, {data : "lecture_capacity"}
				, {data : "lecturePlanBtn"}
			],
			"order" : []
			,
			initComplete: function () {
				this.api().columns().every( function () {
					var column = this;
					var select = $('<select><option value=""></option></select>')
						.appendTo( $('#searchDiv') )
						.on( 'change', function () {
							var val = $.fn.dataTable.util.escapeRegex(
								$(this).val()
							);
							
							column
								.search( val ? '^'+val+'$' : '', true, false )
								.draw();
						});
	
					column.data().unique().sort().each( function ( d, j ) {
						select.append( '<option value="'+d+'">'+d+'</option>' )
					});
					
				});
				$('#searchDiv').find('select:eq(0)').attr('id', 'code').css('display', 'none');
				$('#searchDiv').find('select:eq(1)').attr('id', 'name').attr('class', 'selectpicker');
				$('#searchDiv').find('select:eq(2)').attr('id', 'course').attr('class', 'selectpicker');
				$('#searchDiv').find('select:eq(3)').attr('id', 'credit').attr('class', 'selectpicker');
				$('#searchDiv').find('select:eq(4)').attr('id', 'grade').attr('class', 'selectpicker');
				$('#searchDiv').find('select:eq(5)').attr('id', 'prof').css('display', 'none');
				$('#searchDiv').find('select:eq(6)').attr('id', 'capacity').css('display', 'none');
				$('#searchDiv').find('select:eq(7)').attr('id', 'lecplan').css('display', 'none');
				$("#grade").after($("#name"));
				$("#grade").after($("#course"));
				$("#grade").after($("#credit"));
				$("<span class='selectSpan'>학년</span>").insertBefore($('#grade'));
				$("<span class='selectSpan'>과목</span>").insertBefore($('#name'));
				$("<span class='selectSpan'>이수구분</span>").insertBefore($('#course'));
				$("<span class='selectSpan'>학점</span>").insertBefore($('#credit'));
			}
		});
		
	});
	
	function createLectureLocation() {
        window.location.href = "createLecture";
    }
	
	function page_link() {
		window.open("${pageContext.request.contextPath }/subjectPage/eduGoal", "상세강의보기", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=yes");
	}
</script>

<!--    메뉴 소개 영역 -->
<div class="breadcomb-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="breadcomb-list">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
							<div class="breadcomb-wp">
								<div class="breadcomb-ctn">
									<h2>교육과정관리</h2>
									<p>
										교육과정을 조회하고 관리하는 게시판입니다. <span class="bread-ntd"></span>
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
						<table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
							<div>
								<button type="button" class="btn btn-success notika-btn-success waves-effect" onclick="createLectureLocation();">강좌등록</button>
							</div>
							<div id="searchDiv"></div>
							<thead>
								<tr>
									<th>년도</th>
									<th>학기</th>
									<th>담당교수</th>
									<th>과목코드</th>
									<th>과목명</th>
									<th>이수구분</th>
									<th>학점</th>
									<th>학년</th>
									<th>수강인원</th>
									<th>강의계획서</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

