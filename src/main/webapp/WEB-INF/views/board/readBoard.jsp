<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/navigator.jsp"%>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<td><h3>${board.title}</h3></td>
				<td style="text-align:right">${board.inputDate}</td>
			</tr>
			<tr>
				<td>${board.userID}</td>
				<td style="text-align:right">조회수 ${board.hits}</td>
			</tr>
			<tr>
				<td colspan="2">${board.content}</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<button type="button" class="btn btn-primary" value="1" id="like">${board.likes} 좋아요</button>
					<button type="button" class="btn btn-danger" value="0" id="dislike">싫어요 ${board.dislikes}</button>
				</td>
			</tr>
			<c:if test="${board.originalFileName != null}">
				<tr>
					<td>첨부파일</td>
					<td><a href="<c:url value='/board/download?originalFileName=${board.originalFileName}&savedFileName=${board.savedFileName}' />">${board.originalFileName}</a></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" style="text-align:right">
					<c:if test="${sessionScope.userID == board.userID}">
						<button type="button" class="btn btn-warning btn-sm" id="boardUpdate">수정</button>
						<button type="button" class="btn btn-danger btn-sm" id="boardDelete">삭제</button>
					</c:if>
					<button type="button" class="btn btn-info btn-sm" id="boardList">목록</button>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/board/reply.jsp"%>
</body>
<script>
$(function () {
	$('#boardUpdate').click(function() {
		location.href = "<c:url value='/board/updateBoardForm?boardNum=${board.boardNum}' />";
	});

	$('#boardDelete').click(function() {
		location.href = "<c:url value='/board/deleteBoard?boardNum=${board.boardNum}' />";
	});

	$('#boardList').click(function() {
		location.href = "<c:url value='/board/getBoardList?boardID=${board.boardID}' />";
	});

	$('#like, #dislike').click(function() {
		if (${sessionScope.userID == null}) {
			alert("로그인 후 이용해 주세요");
			$('#userID').focus();
			return;
		}
		$.ajax({
			url : "<c:url value='/board/like' />",
			type : "post",
			data : {
				boardNum : ${board.boardNum},
				button : $(this).val()
			},
			success : function(result) {
				if (result.result) {
					$('#like').html(result.likes + ' 좋아요');
					$('#dislike').html('싫어요 ' + result.dislikes);
				} else
					alert("이미 누르셨습니다.");
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
});
</script>
</html>