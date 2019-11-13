<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>

table.type10 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.type10 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #191919;
    margin: 20px 10px;
}
table.type10 tbody th {
    width: 150px;
    padding: 10px;
}
table.type10 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type10 .even {
    background: #fdf3f5;
}

thead tr th{
	text-align:center;
}

table tr td{
	text-align:center;
}
h2 { font:bold 24pt;
	 text-align:center;
 }


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 목록</title>
<!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<%@ include file="../include/header.jsp" %>
<script>

    $(document).ready(function(){
        $("#btnWrite").click(function(){
            location.href = "/board/qnaRegister";
        });
    });
</script>

</head>
<body>
<br><br><br>
<h2><span class="h">1:1문의 내역</span></h2>
<br><br>
<table class=type10>
<colgroup>
<col width="60%" >
<col width="20%" >
<col width="20%" >
</colgroup>
<thead>
    <tr>
        <th scope="col">제목</th>
        <th scope="col">이름</th>
        <th scope="col">작성일</th>
    </tr>
</thead>    
    <c:forEach var="list" items="${qList}">
    <tr>
        <td><a href="/board/qnaView?qno=${list.qno}">${list.qna_title}
      <  <!-- 답변대기, 답변완료 추가 -->
      	<c:choose>
      		<c:when test="${list.qna_answer == 0}">
      			<span style="color: gray;">답변대기</span>
      		</c:when>
      		
			<c:when test="${list.qna_answer > 0}">
      			<span style="color: red;">답변완료</span>
      		</c:when>
      	</c:choose>
        </a></td>
        <td>${list.qna_writer}</td>
        <td>
            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            <fmt:formatDate value="${list.qna_regdate}" pattern="yyyy-MM-dd"/>
        </td>
    </tr>    
    </c:forEach>
</table>
<button type="button" class="btn btn-outline btn-info" id="btnWrite" style="float:right; WIDTH: 60pt; HEIGHT: 30pt; background-color:black">문의하기</button>
</body>
</html>
<%@ include file="../include/footer.jsp" %>