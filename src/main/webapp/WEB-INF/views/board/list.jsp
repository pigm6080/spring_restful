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
			<div class="panel-heading">
				BoardList Page
				<button id="regBtn" type="button" class="btn btn-xs pull-right">Register
					New Board</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno }" /></td>

							<td>
							
							<a class="move" href='<c:out value="${board.bno }"/>'>
									<c:out value="${board.title }" />
							
							</a>
							</td>
							<td><c:out value="${board.writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regDate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updatedate }" /></td>
						</tr>

					</c:forEach>

				</table>
				
 					<div class="row">
	                	<div class="col-lg-12">
	                		<form id='searchForm' action="/board/list" method="get">
	                			<select name='type'>
	                				<option value='' <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>--</option>
	                				<option value='T' <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
	                				<option value='C' <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
	                				<option value='W' <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
	                				<option value='TC' <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 or 내용</option>
	                				<option value='TW' <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 or 작성자</option>
	                				<option value='TWC' <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}"/>>제목 or 내용 or 작성자</option>
	                			</select>
	                			
	                			<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
	                			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
	                			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
	                			<button class='btn btn-default'>Search</button>
	                		</form>
	                	</div>
	                </div>
	                
				
					<div class="pull-right">
	                	<ul class="pagination">
	                		<c:if test="${pageMaker.prev}">
	                			<li class="paginate_button previous">
	                				<a href="${pageMaker.startPage-1 }">Previous</a>
	                			</li>
	                		</c:if>
	                		
	                		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
	                			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active": ""}">
	                				<a href="${num }">${num }</a>
	                			</li>
	                		</c:forEach>
	                		
	                		<c:if test="${pageMaker.next}">
	                			<li class="paginate_button next">
	                				<a href="${pageMaker.endPage + 1 }">Next</a>
	                			</li>
	                		</c:if>
	                	</ul>
	                	
	                	
	                </div>
	                <!-- end Pagination -->
				
				<form id="actionForm"action="/board/list"method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
	                <input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
				</form>
			
			
			
			
			
			
			
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">
							
							<p>
							처리가 완료되었습니다.
							</p>
							
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->




			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-6 -->
<script type="text/javascript">
		   // 문서가 완전히 로드 되면 실행되는 함수 정의
	       $(document).ready(function(){
	    	   
	    	   var result ='<c:out value="${result}"/>';
	    	   //result 값을 가져와서 전달
	    	   checkModal(result);
			   //checkModal에 전달	    	   
	       		history.replaceState({},null,null);
	    	   //리로드하지 않고 이전페이지로 돌아갈수있게 해준다.
	    	   //model 출력되게 하는 메서드
	       		

	       
	    	   function checkModal(result){
	    		   
	    		   if(result === '' || history.state){
	    			   //값이 비어있거나 블우저 이전 상태 있는경우 함수종료
	    			   return;
	    		   }
	    		   
	    		   if(parseInt(result) > 0){
	    			   //result 값이 양수이면 model창 메세지 출력
	    			   $(".modal-body").html("게시글 " + parseInt(result) + "빈이 등록되었습니다.");
	    		   }
	    		   
	    		   //모달창화면에 출력
	    		   $("#myModal").modal("show");
	    	   }
	    	   
	    	   
	       
	       		$("#regBtn").on("click", function(){
	       			
	       			self.location = "/board/register";
	       			//regBtn 요소 클릭시 /board/register페이지로 이동
	       		});
	       		
	       		var actionForm = $("#actionForm");
	       		
	       		
	       		$(".paginate_button a").on("click" , function(e){
	       			e.preventDefault();
	       			
	       			console.log('click');
	       			
	       			actionForm.find("input[name='pageNum']") // name = pageNum 인걸 찾아서
	       								.val($(this).attr("href")); //페이지 링크의 href 속성값을 가져온다.
	       								//.val은 input요소의 값을 변경한다.
	       			actionForm.submit();
	       		});
	       		
	       		
	       		$(".move").on("click",function(e){
	       			e.preventDefault();
	       			
	       			actionForm.append("<input  name='bno' value='"+$(this).attr("href")+"'>");
	       			//input hidden 값을 설정한다.
	       			actionForm.attr("action","/board/get");
	       			//action 속성을 /board.get으로 이동하도록 설정한다.
	       			actionForm.submit();
	       			// 다음페이지로 이동시킨다.
	       		});
	       			
	       		var searchForm = $('#searchForm');
	    		$('#searchForm button').on('click', function(e){
	    			if(!searchForm.find('option:selected').val()){
	    				alert("검색종류를 선택하세요.");
	    				return false;
	    			}

	    			if(!searchForm.find("input[name='keyword']").val()){
	    				alert("키워드를 입력하세요");
	    				return false;
	    			}

	    			searchForm.find("input[name='pageNum']").val("1");
	    			e.preventDefault();
	    			searchForm.submit();
	    		});
	       		
	    	   
	       });
	       //addFlashAttribute()로 저장한다.
	       
	       
       </script>

		



<%@include file="../includes/footer.jsp"%>