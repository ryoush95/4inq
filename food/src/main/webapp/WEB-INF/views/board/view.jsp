<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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



table.type01 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    margin : 20px 10px;
}
table.type01 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border: 1px solid #ccc;
}
table.type01 td {
    width: 100px;
    padding: 10px;
    vertical-align: top;
    border: 1px solid #ccc;
}
</style>



<style>
/* 댓글리스트 */
 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:80px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
 section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
 
 /* 댓글수정창 */
 div.replyModal { position:relative; z-index:1; display:none;  }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
</style>




<title>게시글 보기</title>

<!-- 제이쿼리 -->

<%@ include file="../include/header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>





<script>
function replyList(){ 
   var fno =${view.fno};
   $.getJSON("replyList" + "?fno=" + fno, function(data){
      var str ="";
      
      $(data).each(function(){
         
         console.log(data);
         
         var replydate = new Date(this.replydate);
         replydate = replydate.toLocaleDateString("ko-US")
         
         str +="<li data-rno='" + this.rno + "'> "
            +"<div class='userInfo'>"
            +"<span class= 'userName'> " + this.replyer + "</span>"
            +"<span class= 'date'> " + replydate + "</span></div>"
            +"<div class='reviewContent' >" + this.reply + "</div>"
            
            +"<c:if test ='${member !=null}'>"
            
            +"<div class = 'replyFooter'>"
            +"<button type='button' class='modify' data-rno='"
            + this.rno + "'>수정</button>"
            
            
            +"<button type='button' class='delete' data-rno='"+ this.rno + "'>삭제</button>"
            +"</div>"
            
            +"</c:if>"
            
            +"</li>"
      });
      
      $("section.replyList ol").html(str);
      
      console.log(str);
   });
   
}
</script>


<script>
   $(document).ready(function() {
      
      $("#btnList").click(function(){
               location.href="/board/list?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
           });
      
      $("#btnDelete").click(function() {
         if (confirm("삭제하시겠습니까?")) {
            document.form1.action = "/board/delete";
            document.form1.submit();
         }
      });
   });
</script>
</head>
<body>

<br><br><br><br>

   <h2>게시글 보기</h2>
   
   
   <table class="type02">
   <form name="form1" method="post">
   
      <tr>
         <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
         <th scope="row">작성일자</th>
         
         <td><fmt:formatDate value="${view.regdate}"
            pattern="yyyy-MM-dd a HH:mm:ss" /></td>
         <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
      </tr>
      
      <tr>
      <th scope="row">
      조회수 </th> 
      <td>${view.viewcnt}</td>
      </tr>
      
      <tr>
      <th scope="row">제목 </th>
      <td><input name="title" id="title" size="80" value="${view.title}" readonly></td>
      </tr>
      
      
      <tr>
      <th scope="row">내용</th>
      <td><textarea name="content" id="content" rows="5" cols="100" readonly>${view.content}</textarea></td>
      </tr>
      
      
      <tr>
      <th scope="row">
      작성자</th>
      <td>${view.writer} 
      </td> 
      </tr>
      
      
      <tr>
       <td colspan="2">
      <div style="width: 650px; text-align: center; margin:auto;">
         <!-- 게시물번호를 hidden으로 처리 -->
         
         <input type="hidden" name="fno" value="${view.fno}">
         <c:if test="${sessionScope.name == view.writer }">
            <a href="/board/modify?fno=${view.fno }"><button type="button"
        style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
        color:white;"><font size="3.5em">수정</font></button></a>
            <button type="button" id="btnDelete" style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
        color:white;">삭제</button>
         </c:if>
             <button type="button" id="btnList"style= "WIDTH: 50pt; HEIGHT: 20pt; background-color:black;
        color:white;">목록</button>
             
             
      </div>
      </td>
      </tr>
   </form>
   </table>
   
   
   
   
   <div id="reply">
   <c:if test="${member == null }">
      <p>
         댓글을 남기려면 <a href="/member/signin"> 로그인 </a> 해주세요
      </p>
   </c:if>
   <c:if test="${member != null }">
      <section class="replyForm">
      
      
      <table class="type01">
         <form role="form" method="post" autocomplete="off">

            <input type="hidden" name="fno" id="fno" value="${view.fno }">
   <tr>
   <th>
            <div class="input_area">
               <textarea name="insertReply" id="insertReply"></textarea>
            </div>
    </th>
            
            
            
            
            <td>
            <div class="input_area">
               <button type="button" id="reply_btn"
               style= "background-color:black;
        color:white">댓글 등록</button>

               <script>
                  $("#reply_btn").click(function(){
                     var formObj = $(".replyForm form[role='form']");
                     var fno = $("#fno").val();
                     var reply = $("#insertReply").val();
                     
                     var data = {
                        fno : fno,
                        reply : reply
                     };
                     
                     $.ajax({
                        url : "/board/replyInsert",
                        type : "post",
                        data: data,
                        success : function(){
                           replyList();
                           $("#insertReply").val("");
                        }
                     });
                  });
               </script>

            </div>
         
            </td>
         
            </tr>
         </form>
         </table>
      </section>
   </c:if>

   <section class="replyList">
   <ol>
   
   </ol>
      <script>
         replyList()
      </script>   
      
      <script>
      $(document).on("click", ".modify", function(){
         $(".replyModal").fadeIn(200);
         
          var rno = $(this).attr("data-rno");
          var reply = $(this).parent().parent().children(".replyContent").text();
          
          $(".modal_reply").val(reply);
          $(".modal_modify_btn").attr("data-rno", rno);
      });
      </script>


      <script>
         $(document).on("click" , ".delete", function(){
            var deleteConfirm=confirm("삭제하시겠습니까?");
            
            if(deleteConfirm){
            
            var data ={rno : $(this).attr("data-rno")};
            
            $.ajax({
               url:"/board/replyDelete",
               type : "post",
               data : data,
               success : function(result){
                  if(result ==1){
                  replyList();
                  }else{
                     alert("본인이 아닙니다.")
                  }
               },
               error : function(){
                  alert("로그인 하셔야합니다.")
               }
            });
            }
         });
      </script>
   </section>
</div>





<div class="replyModal">
      <div class="modalContent">
         <div>
            <textarea class="modal_reply" name="modal-reply"></textarea>
         </div>

         <div>
            <button type="button" class="modal_modify_btn">수정</button>
            <button type="button" class="modal_cancel">취소</button>
         </div>
      </div>
      <div class="modalBackground"></div>
   </div>

   
   <script>
   $(".modal_modify_btn").click(function() {
      var modifyConfirm = confirm("수정하시겠습니까?");

      if (modifyConfirm) {
         var data = {
            rno : $(this).attr("data-rno"),
            reply : $(".modal_reply").val()
         }; // ReviewVO형태로 데이터생성

         $.ajax({
            url : "/board/replyModify",
            type : "post",
            data : data,
            success : function(result) {

               console.log(result);
               //result 값에따라 동작
               if (result == 1) {
                  
                  replyList();
                  $(".replyModal").fadeOut(200);
               } else {
                  alert("본인이 아닙니다.")
               }
            },
            error : function() {
               alert("로그인 하셔야합니다.")
            }
         });
      }
   });
</script>

<script>
   $(".modal_cancel").click(function() {
      //$(".reviewModal").attr("style", "display:none;");
      $(".replyModal").fadeOut(200);
   });
</script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>