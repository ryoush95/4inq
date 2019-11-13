<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>공지사항 조회</title>

<%@ include file="../include/header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>

<script>
   $(document).ready(function() {

      $("#btnDelete").click(function() {
         if (confirm("삭제하시겠습니까?")) {
            document.form1.action = "/board/delete";
            document.form1.submit();
         }
      });

    /* $("#btnUpdete").click(function() {
      
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
      
         document.form1.submit();

      });  */
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
<body>
<br><br><br><br>
   <h2>공지사항 보기</h2>
   
   <table class="type02">
   <form name="form1" method="post">
      <tr>
         <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
         <th scope="row">작성일자</th>
         
         <td><fmt:formatDate value="${noticeView.notice_regdate}"
            pattern="yyyy-MM-dd a" />
         <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
         </td>
      </tr>
      
      
      
      <tr>
      <th scope="row">조회수</th>
      <td>${noticeView.notice_viewcnt}</td>
      </tr>
      
      
      <tr>
      <th scope="row">제목</th>
      <td>
      <input name="title" id="title" size="80" value="${noticeView.notice_title}" readonly>
      </td>
      </tr>
      
      <tr>
      <th scope="row">내용</th>
      <td>
      <textarea name="content" id="content" rows="5" cols="100" readonly>${noticeView.notice_content}</textarea>
      </td>
      </tr>
      
      <tr>
      <th scope="row">작성자</th>
      <td>
      ${noticeView.notice_writer}
      </td>
      </tr>
      
      
      
      <tr>
      <td colspan="2">
      <button type="reset" onclick="history.back()"
      style= "WIDTH: 100pt; HEIGHT: 30pt; background-color:black;
              color:white; ">목록으로</button>
              
      <div style="width: 650px; text-align: center;">
      
         <!-- 게시물번호를 hidden으로 처리 -->
         
         <input type="hidden" name="nno" value="${noticeView.nno}">
         <c:if test="${sessionScope.adminName == noticeView.notice_writer }">
            <a href="/board/noticeModify?nno=${noticeView.nno }">
            
            <button type="button"
            style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
              color:white;">공지사항 수정</button></a>
            
            
            <button type="button" id="btnDelete"
            style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
              color:white;"
            >공지사항 삭제</button>
         </c:if>
      </div>
      </td>
      </tr>
      
   </form>
   </table>
   
   
</body>
</html>
<%@ include file="../include/footer.jsp"%>