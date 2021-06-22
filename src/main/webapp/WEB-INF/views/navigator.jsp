<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-primary navbar-dark fixed-top">
	<a class="navbar-brand" href="<c:url value='/' />">miniBoard</a>
	<ul class="navbar-nav mr-auto">
		<li class="nav-item"><a class="nav-link" href="<c:url value='/board/getBoardList?boardID=notice' />">공지</a></li>
		<li class="nav-item"><a class="nav-link">인기글</a></li>
		<li class="nav-item"><a class="nav-link">최신글</a></li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">게시판</a>
			<div class="dropdown-menu">
				<a class="dropdown-item">비밀 게시판</a>
				<a class="dropdown-item">자유 게시판</a>
				<a class="dropdown-item">내 댓글</a>
			</div>
		</li>
	</ul>
	<form class="form-inline my-2 my-lg-0">
		<c:choose>
			<c:when test="${empty sessionScope.userID}">
				<input class="form-control mr-sm-2" type="text" placeholder="아이디" id="userID">
				<input class="form-control mr-sm-2" type="password"	placeholder="비밀번호" id="password">
				<button class="btn btn-success" type="button" id="login">로그인</button>&ensp;
				<button class="btn btn-success" type="button" id="signup">회원가입</button>
			</c:when>
			<c:otherwise>
				<span class="navbar-brand">${sessionScope.userID}님 환영합니다.</span>
				<button class="btn btn-secondary my-2 my-sm-0" type="button" id="logout">로그아웃</button>
			</c:otherwise>
		</c:choose>
	</form>
</nav>
<br>
<br>
<br>
<script>
$(function() {
	$('a').css('cursor', 'pointer');

	$('#signup').click(function() {
		var width = '800';
		var height = '850';
		var left = Math.ceil((screen.width - width) / 2);
		var top = Math.ceil((screen.height - height) / 2);

		open('<c:url value="/member/signupForm" />', '_blank',
				'width=' + width + ', height=' + height + ', left='
						+ left + ', top=' + top);
	});

	$('#password').keyup(function(event) {
		if (event.keyCode === 13)
			$('#login').click();
	});

	$('#login').click(function() {
		$.ajax({
			url : "<c:url value='/member/login' />",
			type : "post",
			data : {
				userID : $('#userID').val(),
				password : $('#password').val()
			},
			success : function(result) {
				if (result)
					location.reload();
				else
					alert("아이디나 비밀번호를 확인해 주세요");
			},
			error : function(e) {
				console.log(e);
			}
		});
	});

	$('#logout').click(function() {
		$.ajax({
			url : "<c:url value='/member/logout' />",
			type : "get",
			success : function() {
				location.reload();
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
});
</script>