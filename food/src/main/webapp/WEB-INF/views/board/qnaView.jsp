<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>1:1문의 보기</title>

<!-- 제이쿼리 -->

<%@ include file="../include/header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>

<script>
function replyList(){ 
   var qno =${qnaView.qno};
   $.getJSON("answerList" + "?qno=" + qno, function(data){
      var str ="";
      
      $(data).each(function(){
         
         console.log(data);
         
         var replydate = new Date(this.replydate);
         replydate = replydate.toLocaleDateString("ko-US")
         
         str +="<table class='type03'>"
            
           +"<li data-qrno='" + this.qrno + "'> "

            +"<tr>"
            +"<th>"
            +"<span class= 'userName'>답변작성자"
            +"</th>" 
            +"<td>" 
            + this.replyer + "</span>"
            +"</td>"
            +"</tr>"
            
            
            +"<tr>"
            +"<th>"
            +"<span class= 'date'>답변작성일"
            +"</th>"
            +"<td>" 
            + replydate + "</span></div>"
            +"</td>"
            +"</tr>"

            
            +"<tr>"
            +"<th>"
            +"<div class='reviewContent' >답변내용"
            +"</th>"
            +"<td class='replyContent'>"
            +""+ this.reply + "</div>"
            +"</li>"
            +"</td>"
            +"</tr>"

            
            +"</table>"
      });
      
      $("section.replyList ol").html(str);
      
      console.log(str);
   });
   
}
</script>




<script>
   $(document).ready(function() {

      $("#btnDelete").click(function() {
         if (confirm("삭제하시겠습니까?")) {
            document.form1.action = "/board/qnaDelete";
            document.form1.submit();
         }
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




table.type03 {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  margin : 20px 10px;
  display: table;
}

table.type03 th {
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

table.type03 td {
    width: 1090px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

table.type03 td.replyContent {
     width: 800px;
     height: 250px;
}

</style>

</head>
<body>
<br><br><br><br>
   <h2> 1:1 문의 내용</h2>
   
   <table class="type02">
   <form name="form1" method="post">
      
      
      
      <tr>
         <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
         <th scope="row">작성일자</th>
         
         
         <td><fmt:formatDate value="${qnaView.qna_regdate}"
            pattern="yyyy-MM-dd" /></td>
         <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
      </tr>
      
      
      
      
      <tr>
      <th scope="row">
      제목
      </th>
      <td><input name="title" id="title" size="80" value="${qnaView.qna_title}" readonly></td>
      </tr>
      
      
      
      <tr >
      <th scope="row">
      내용
      </th>
      <td><textarea name="content" id="content" rows="15" cols="100" readonly>${qnaView.qna_content}</textarea></td>
      </tr>
      
      <tr>
      <th scope="row">
      작성자
      </th>
      <td>
      ${qnaView.qna_writer}
      </td>
      </tr>
      
      
      
      <tr>
      <td colspan="2">
      <div style="width: 650px; text-align: center; margin:auto;">
         <!-- 게시물번호를 hidden으로 처리 -->
         
         <input type="hidden" name="qno" value="${qnaView.qno}">
         <c:if test="${sessionScope.name == qnaView.qna_writer }">
            <a href="/board/qnaModify?qno=${qnaView.qno }">
            
            <button type="button" style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
              color:white;"
            ><font size="3.5em">수정</font></button></a>
            
            <button type="button" id="btnDelete"style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
              color:white;"
            >삭제</button>
         </c:if>
      </div>
      </td>
      </tr>
   </form>
   </table>


<br><br><br>
<h2>답변</h2>
<table class="type03">
<tr>
<td colspan="2">

<div id="reply">

   <section class="replyList">
   <ol>
   
   </ol>   
      <script>
         replyList()
      </script>   
</section>
</div>
</td>
</tr>
</table>


</body>
</html>
<%@ include file="../include/footer.jsp"%>