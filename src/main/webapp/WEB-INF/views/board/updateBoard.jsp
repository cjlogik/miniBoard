<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
<div class="container">
	<h2>게시글 수정</h2>
	<form action="<c:url value='/board/updateBoard' />" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardNum" value="${board.boardNum}">
		<table class="table table-striped">
			<tr>
				<th>게시판</th>
				<td><input type="text" name="boardID" value="${board.boardID}" readonly></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${sessionScope.userID}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${board.title}" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" required>${board.content}</textarea></td>
			</tr>
			<tr>
				<th>첨부 파일</th>
				<td>${board.originalFileName}<input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right">
					<button type="submit" class="btn btn-warning" onclick="return update()">수정</button>
					<button type="button" class="btn btn-info" onclick="javascript: history.back()">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
<script>
function update() {
	return confirm("수정하시겠습니까?");
};
</script>
</html>