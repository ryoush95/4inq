<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
	
</script>

<script>
$(document).ready(function() {
	

	$("#btnUpdate").click(function() {
		var title = $("#notice_title").val();
		var content = $("#notice_content").val();
		if (title == "") {
			alert("제목을 입력하세요");
			document.form1.title.focus();
			return;
		}
		if (content == "") {
			alert("내용을 입력하세요");
			document.form1.content.focus();
			return;
		}

		document.form1.action = "admin/service/noticeModify"
		// 폼에 입력한 데이터를 서버로 전송
		document.form1.submit();
	});
	
});	
</script>
</head>
<%@ include file="../include/header.jsp"%>
<body>

	<h2>게시글 수정</h2>
	<form name="form1" method="post">

		<div>
			제목 <input name="notice_title" id="notice_title" size="80"
				placeholder="수정 할 제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="notice_content" id="notice_content" rows="4" cols="80"
				placeholder="수정 할 내용을 입력해주세요"></textarea>
		</div>
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnUpdate">수정</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>
<%@ include file="../include/footer.jsp"%>