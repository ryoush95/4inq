<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->


<style>

table.type02 {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
     margin : left;
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
    background: #eee;
}
table.type02 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

</style>




<%@ include file="../include/header.jsp"%>

<h1>생산자정보</h1>
<section id="container">
   <div id="container_box">
      <form role="form" method="post" autocomplete="off">
         <input type="hidden" name="n" value="${view.pnum}" />
         
         
         
         <table class="title">
         <div class="inputArea">
            <label for="ppicture"></label> <img src="${view.ppicture}"
               class="oriImg" />
         </div>
         </table>
         
         
         <table class="type02">
         <tr>
         <!-- <div class="inputArea"> -->
            <th><label for="pname">생산자명</label></th> <td><span>${view.pname }</span></td>
         <!-- </div> -->
         </tr>
         
         
         
         <tr>
         <!-- <div class="inputArea"> -->
            <th><label for="pnum">생산자번호</label></th> <td><span>${view.pnum }</span></td>
         <!-- </div> -->
         </tr>
         
         
         <tr>
         <!-- <div class="inputArea"> -->
            <th><label for="paddress">생산자 주소</label></th> <td><span>${view.paddress }</span></td>
         <!-- </div> -->
         </tr>
         
         
         <tr>
         <!-- <div class="inputArea"> -->
            <th><label for="pintroduce">생산자 소개</label></th> <td><span>${view.pintroduce }</span></td>
         <!-- </div> -->
         </tr>
         
         
         </table>
      </form>
   </div>
   <br>
   <br>
<img src="/resources/img/product/producter.jpg">


</section>



<%@ include file="../include/footer.jsp"%>