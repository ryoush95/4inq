<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 작성</title>
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
            var title = $("#qna_title").val();
            var content = $("#qna_content").val();
 
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
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
}
table.type02 td {
    width: 300px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<%@ include file="../include/header.jsp"%>
<body>
<br><br><br><br>
<h2>1:1문의 작성</h2>

<table class="type02">
<form name="form1" method="post" action="/board/qnaRegister">

<tr>
    <th scope="row">제목</th>
    <td><input name="qna_title" id="qna_title" size="80" placeholder="제목을 입력해주세요"></td>
    </tr>

<tr>
    <th scope="row">내용</th>
    <td><textarea name="qna_content" id="qna_content" rows="24" cols="80" placeholder="내용을 입력해주세요"></textarea></td>
</tr>

<tr>
    <td colspan="2">
    <div style="width:650px; text-align: center;
    margin:auto;"> 
        <button type="button" id="btnSave"
        style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
        color:white">확인</button>
        <button type="reset" onclick="history.back()"
        style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
        color:white">취소</button>
    </div>
    </td>
    </tr>
    
    
</form>
</table>
</body>
</html>
<%@ include file="../include/footer.jsp"%>