<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<script type="text/javascript">
	//form 의 action의 값을 바꿔주는 메소드이다.
    $(document).ready(function() {
        var formObj = $("form");
        
        $('button').on("click", function(e) {
           
        	e.preventDefault(); 

	            // 버튼의 데이터 속성에서 operation 값을 가져온다.
            var operation = $(this).data("oper");
            console.log(operation);

            if (operation === 'remove') {
                formObj.attr("action", "/board/remove");
                
            } else if (operation === 'list') {
             	 formObj.attr("action", "/board/list").attr("method", "get");
                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                var keywordTag = $("input[name='keyword']").clone();
                var typeTag = $("input[name='type']").clone();
                
             	formObj.empty();
             	formObj.append(pageNumTag);
             	formObj.append(amountTag);
             	formObj.append(keywordTag);
             	formObj.append(typeTag);
             	
            }
			//이걸 주석 처리 해야한다. 나중에 주석 뺴고그전에 위에 코드로 인해form post 값이 바뀌는 지 봐야한다. 
            formObj.submit();
        });
    });
</script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">


			<div class="panel-heading">Board Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<form action="/board/modify" method="post" role="form">
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
					<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
					
				<div class="form-group">
					<label>Bno</label><input class="form-control" name='bno'
						value='<c:out value="${board.bno }" />' readonly="readonly">
				</div>
				<div class="form-group">
					<label>Title</label><input class="form-control" name='title'
						value='<c:out value="${board.title }" />'>
				</div>

				<div class="form-group">
					<label>Text area</label>
					<textarea rows="3" class="form-control" name='content'><c:out value="${board.content }" /></textarea>
				</div>

				<div class="form-group">
					<label>Writer</label><input class="form-control" name='writer'
						value='<c:out value="${board.writer }" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>RegDate</label> <input class="form-control" name='regDate'
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regDate}" />'
						readonly="readonly">
				</div>

				<div class="form-group">
					<label>Update Date</label> <input class="form-control"
						name='updatedate'
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updatedate}" />'
						readonly="readonly">
				</div>

				<button type="submit" data-oper='modify' class="btn btn-default">modify</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
				<button type="submit" data-oper='list' class="btn btn-info">List</button>
					
					
				</form>

			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-6 -->



<%@include file="../includes/footer.jsp"%>