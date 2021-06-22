<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
  <table class="table table-bordered table-sm">
    <thead>
      <tr>
        <th>작성자</th>
        <th>내용</th>
        <th>작성일</th>
        <td><td>
      </tr>
    </thead>
    <tbody id="replyList">
		<c:set var="btnIndex" value="0" />
		<c:forEach items="${replyList}" var="reply" varStatus="status">
			<tr>
				<td>${reply.userID}</td>
				<td><textarea class="form-control replyText" readonly>${reply.replyText}</textarea></td>
				<td>${reply.inputDate}</td>
				<td style="text-align:right">
					<c:if test="${sessionScope.userID == reply.userID}">
						<button type="button" class="btn btn-warning btn-sm update" onclick="update(${status.index}, ${btnIndex}, ${reply.replyNum})">수정</button>
						<c:set var="btnIndex" value="${btnIndex + 1}" />
						<button type="button" class="btn btn-danger btn-sm delete" onclick="deleteReply(${reply.replyNum})">삭제</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
</div>
<c:if test="${sessionScope.userID != null}">
	<div class="container">
		<form>
			<div class="form-group">
				<label for="comment">댓글 입력:</label>
				<textarea class="form-control" rows="5" id="replyText"></textarea>
			</div>
			<button type="button" class="btn btn-secondary" id="writeReply">댓글 쓰기</button>
		</form>
	</div>
</c:if>
<script>
function refreshReply(result) {
	var html = '';
	if (result.result) {
		var btnIndex = 0;
		$.each(result.replyList, function(index, reply) {
			var userID = reply.userID;
			var replyNum = reply.replyNum;
			html += '<tr><td>' + userID + '</td>';
			html += '<td><textarea class="form-control replyText" readonly>' + reply.replyText + '</textarea></td>';
			html += '<td>' + reply.inputDate + '</td>'
			html += '<td style="text-align:right">';
			if (userID === '${sessionScope.userID}') {
				html += '<button type="button" class="btn btn-warning btn-sm update" onclick="update(' + index + ', ' + btnIndex++ + ', ' + replyNum + ')">수정</button>';
				html += '<button type="button" class="btn btn-danger btn-sm delete" onclick="deleteReply(' + replyNum + ')">삭제</button>';
			}
			html += '</td></tr>';
		});
		$('#replyList').html(html);
	} else
		alert("등록에 실패하였습니다.");
};

function update(index, btnIndex, replyNum) {
	var replyText = $('.replyText').eq(index).val();
	$('.update').css('visibility', 'hidden');
	$('.delete').css('visibility', 'hidden');
	$('.update').eq(btnIndex).css('visibility', 'visible');
	$('.delete').eq(btnIndex).css('visibility', 'visible');
	$('.replyText').eq(index).removeAttr('readonly');
	$('.update').eq(btnIndex).attr('class', 'btn btn-success btn-sm update');
	$('.update').eq(btnIndex).text('확인');
	$('.delete').eq(btnIndex).attr('class', 'btn btn-secondary btn-sm delete');
	$('.delete').eq(btnIndex).text('취소');
	$('.delete').eq(btnIndex).removeAttr('onclick');
	$('.delete').click(function() {
		$('.replyText').eq(index).val(replyText);
		$('.replyText').eq(index).attr('readonly', 'readonly');
		$('.update').eq(btnIndex).attr('class', 'btn btn-warning btn-sm update');
		$('.delete').eq(btnIndex).attr('class', 'btn btn-danger btn-sm delete');
		$('.update').eq(btnIndex).text('수정');
		$('.delete').eq(btnIndex).text('삭제');
		$('.update').css('visibility', 'visible');
		$('.delete').css('visibility', 'visible');
		$('.update').eq(btnIndex).attr('onclick', 'update(' + index + ', ' + btnIndex + ', ' + replyNum + ')');
		$('.delete').eq(btnIndex).attr('onclick', 'deleteReply(' + replyNum + ')');
	});
	$('.update').eq(btnIndex).attr('onclick', 'updateReply(' + index + ', ' + replyNum + ')');
};

function updateReply(index, replyNum) {
	var replyText = $('.replyText').eq(index).val();
	$.ajax({
		url : "<c:url value='/reply/updateReply' />",
		type : "post",
		data : {
			replyNum : replyNum,
			boardNum : ${board.boardNum},
			replyText : replyText
		},
		success : function(result) {
			refreshReply(result);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function deleteReply(replyNum) {
	if (confirm("댓글을 삭제하시겠습니까")) {
		$.ajax({
			url : "<c:url value='/reply/deleteReply' />",
			type : "get",
			data : {
				replyNum : replyNum,
				boardNum : ${board.boardNum}
			},
			success : function(result) {
				refreshReply(result);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
};

$(function() {
	$('#writeReply').click(function() {
		var replyText = $('#replyText').val();
		if (replyText.length < 1) {
			alert("댓글 내용을 입력해 주세요");
			return;
		}
		$.ajax({
			url : "<c:url value='/reply/writeReply' />",
			type : "post",
			data : {
				boardNum : ${board.boardNum},
				replyText : replyText
			},
			success : function(result) {
				refreshReply(result);
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
});
</script>