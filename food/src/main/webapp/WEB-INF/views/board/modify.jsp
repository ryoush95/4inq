<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
	
</script>

<script>
$(document).ready(function() {
	

	$("#btnUpdate").click(function() {
		var title = $("#title").val();
		var content = $("#content").val();
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

		document.form1.action = "/board/modify"
		// 폼에 입력한 데이터를 서버로 전송
		document.form1.submit();
	});
	
});	
</script>

<style>
table.type02 {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  margin : 20px 10px;
  display: table;
}
table.type02 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    color: #fff;
    background: #191919;
    display:table-cell;
    vertical-align:middle;
    text-align:center;
}

table.type02 td {
    width: 600px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>



</head>
<body>
<br><br><br><br>
<table class="type02">
	<h2>게시글 수정</h2>
	
	<form name="form1" method="post">

		<tr>
			<th scope="row">제목</th>
			 <td><input name="title" id="title" size="80"
				placeholder="수정 할 제목을 입력해주세요"></td>
		</tr>
		
		
		<tr>
			<th scope="row">내용</th>
			<td><textarea name="content" id="content" rows="10" cols="80"
				placeholder="수정 할 내용을 입력해주세요"></textarea></td>
		</tr>
		
		
		
		<tr>
		<td colspan="2">
		<div style="width: 650px; text-align: center; margin:auto;">
			
			<button type="button" id="btnUpdate"
			style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
              color:white;">수정</button>
			
			<button type ="reset" onclick="history.go(-1);"
			style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
              color:white;">취소</button>
		</div>
		</td>
		</tr>
	</form>
	</table>
</body>
</html>
<%@ include file="../include/footer.jsp"%>