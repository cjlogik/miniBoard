<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/navigator.jsp"%>
	<div class="container">
		<h2>공지</h2>
		<p>공지사항을 안내하는 게시판입니다.</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>게시판</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="board">
					<tr>
						<td>${board.boardID}</td>
						<td><a href="<c:url value='/board/readBoard?boardNum=${board.boardNum}' />">${board.title}</a></td>
						<td>${board.userID}</td>
						<td>${board.inputDate}</td>
						<td>${board.hits}</td>
						<td>${board.likes}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/pagination.jsp"%>
	</div>
</body>
</html>