<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
   href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<style>
body {
   font-family: '맑은 고딕', verdana;
   padding: 0;
   margin: 0;
}

ul {
   padding: 0;
   margin: 0;
   list-style: none;
}

div#root {
   width: 90%;
   margin: 0 auto;
}

header#header {
   font-size: 60px;
   padding: 20px 0;
}

header#header h1 a {
   color: #000;
   font-weight: bold;
}

nav#nav {
   padding: 10px;
   text-align: right;
}

nav#nav ul li {
   display: inline-block;
   margin-left: 10px;
}

section#container {
   padding: 20px 0;
   border-top: 2px solid #eee;
   border-bottom: 2px solid #eee;
}

section#container::after {
   content: "";
   display: block;
   clear: both;
}

aside {
   float: left;
   width: 200px;
}

div#container_box {
   float: right;
   width: calc(100% - 200px - 20px);
}

aside ul li {
   text-align: center;
   margin-bottom: 10px;
}

aside ul li a {
   display: block;
   width: 100%;
   padding: 10px 0;
}

aside ul li a:hover {
   background: #eee;
}

footer#footer {
   background: #f9f9f9;
   padding: 20px;
}

footer#footer ul li {
   display: inline-block;
   margin-right: 10px;
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
            +"<button type='button' class='delete' data-rno='"+ this.rno + "'>삭제</button>"
            
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
               location.href="admin/service/adminFreeboard?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
           });
      
      $("#btnDelete").click(function() {
         if (confirm("삭제하시겠습니까?")) {
            document.form1.action = "/admin/boardDelete";
            document.form1.submit();
         }
      });
   });
</script>
</head>
<body>

   <div id="root">
      <header id="header">
         <div id="header_box">
            <%@ include file="../include/header.jsp"%>
         </div>
      </header>

      <nav id="nav">
         <div id="nav_box">
            <%@ include file="../include/nav.jsp"%>
         </div>
      </nav>

      <section id="container">
         <aside>
            <%@ include file="../include/aside.jsp"%>
         </aside>
         <div id="container_box">
            <div class="page-wrapper">
               <div class="container-fluid">
                  <div class="col-lg-8">

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
            <button type="button" id="btnDelete">삭제</button>
             <button type="button" onclick="location.href='/admin/service/adminFreeboardList'" >목록</button>
      </div>
      </td>
      </tr>
   </form>
   </table>
  </div>
               
   
   
   
   <div id="reply">

   <section class="replyList">
   <ol>
   
   </ol>
      <script>
         replyList()
      </script>   

      <script>
         $(document).on("click" , ".delete", function(){
            var deleteConfirm=confirm("삭제하시겠습니까?");
            
            if(deleteConfirm){
            
            var data ={rno : $(this).attr("data-rno")};
            
            $.ajax({
               url:"/admin/replyDelete",
               type : "post",
               data : data,
               success : replyList(),
               error : function(){
                  alert("로그인 하셔야합니다.")
               }
            });
            }
         });
      </script>
   </section>
</div>

</div>
            </div>
         </div>
      </section> 

</body>
</html>
<%@ include file="../include/footer.jsp"%>