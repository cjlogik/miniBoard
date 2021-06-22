<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
<div class="container">
	<h2>게시글 작성</h2>
	<form action="<c:url value='/board/writeBoard' />" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				<th>게시판</th>
				<td><input type="text" name="boardID" value="${boardID}" readonly></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${sessionScope.userID}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" required></textarea></td>
			</tr>
			<tr>
				<th>첨부 파일</th>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인" onclick="return writeBoard()">
					<a href="<c:url value='/' />"><input type="button" value="취소"></a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
<script>
function writeBoard() {
	return confirm("등록 하시겠습니까?");
}
</script>
</html>