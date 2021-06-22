<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br>
<div class="container mt-3 row">
	<form class="input-group mb-3 col-sm-7" action="<c:url value='/board/getBoardList' />" method="get">
		<select name="searchItem" class="custom-select mb-3 col-sm-3">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="userID">글쓴이</option>
		</select>
		<input type="text" class="form-control" name="searchKeyword" placeholder="검색">
		<input type="hidden" name="boardID" value="${boardID}">&nbsp;
		<button class="btn btn-primary" type="submit">찾기</button>
	</form>
		<div class="col-sm-2"></div>
		<c:if test="${sessionScope.userID != null}">
			<button class="btn btn-primary justify-content-end col-sm-3" type="button" onclick="writeBoard()">글쓰기</button>
		</c:if>
</div>
<br>
<div class="container">
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="javascript:pageProc(1, '${searchItem}', '${searchKeyword}')">처음</a></li>
		<li class="page-item"><a class="page-link" href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, '${searchItem}', '${searchKeyword}')">이전</a></li>
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<li class="page-item <c:if test="${counter == navi.currentPage}">active</c:if>">
				<a class="page-link" href="javascript:pageProc(${counter}, '${searchItem}', '${searchKeyword}')">${counter}</a>
			</li>
		</c:forEach>
		<li class="page-item"><a href="javascript:pageProc(${counter}, '${searchItem}', '${searchKeyword}')">${counter}</a></li>
		<li class="page-item"><a class="page-link" href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, '${searchItem}', '${searchKeyword}')">다음</a></li>
		<li class="page-item"><a class="page-link" href="javascript:pageProc(${navi.totalPageCount}, '${searchItem}', '${searchKeyword}')">&nbsp;끝&nbsp;</a></li>
	</ul>
</div>
<script>
function pageProc(currentPage, searchItem, searchKeyword) {
	location.href = "<c:url value='/board/getBoardList?boardID=${boardID}&currentPage=' />" + currentPage + "&searchItem=" + searchItem + "&searchKeyword=" + searchKeyword;
};

function writeBoard() {
	location.href = "<c:url value='/board/writeBoardForm?boardID=${boardID}' />";
};
</script>