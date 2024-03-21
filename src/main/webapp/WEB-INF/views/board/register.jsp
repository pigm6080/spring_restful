<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form action="/board/register" method="post" role="form">
					<div class="form-group"><label>Title</label><input class="form-control" name="title"></div>

					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" name='content'></textarea>
					</div>

					<div class="form-group">
						<label>Writer</label><input class="form-control" name="writer">
					</div>

					<button type="submit" class="btn btn-default">Submit
						Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>

				</form>

			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-6 -->
<script>
	window.onpageshow = function(event) {
	//back 이벤트 일 경우
		if (event.persisted) {
			location.reload(true);
		}
	
	}
</script>

<%@include file="../includes/footer.jsp"%>