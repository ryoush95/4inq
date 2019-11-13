<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->



<style>
table.box-footer tr {
   list-style: none;
   float: left;
   display: inline;
}

table.box-footer tr th {
   float: left;
}

table.box-footer tr th a {
   float: left;
   padding: 4px;
   margin-right: 3px;
   width: 55px;
   color: #000;
   font: bold 12px tahoma;
   border: 1px solid #eee;
   text-align: center;
   text-decoration: none;
}

table.box-footer tr th a:hover, tr th a:focus {
   color: #fff;
   border: 1px solid #f40;
   background-color: #f40;
}

.title {
   margin: auto;
   text-align: center;
}

   
</style>


<%@ include file="../include/header.jsp"%>
<br><br><br>
<div class="title"><h2>전체생산자</h2></div>

<br>

<div class="amado-pro-catagory clearfix">


   <div class="products-catagories-area clearfix">
      <div class="amado-pro-catagory clearfix">
         <!-- Single Catagory -->
         <c:forEach items="${list }" var="list">
            <div class="single-products-catagory clearfix">
               <a href="/shop/view?n=${list.inum }"> <img
                  src="${list.ithumbimg }" alt=""> ${list.cateName }
                  <div class="hover-content">
                     <div class="line"></div>
                     <p>${list.price }원</p>
                     <h4>${list.iname }</h4>
                  </div>
               </a>
            </div>
         </c:forEach>

      </div>

      <%-- <table id="container">
   <div id="container_box">
      <tr>
         <c:forEach items="${list }" var="list">
            <td>
               <div class="productThumb">
                  <img src="${list.ithumbimg }">
               </div>


               <div class="productName">
                  <a href="/product/view?n=${list.inum }">${list.iname }</a>
               </div>
            </td>
         </c:forEach>
      </tr>
   </div>
</table> --%>


<br>

      <table class="box-footer">


         <tr>
            <c:if test="${pageMaker.prev}">
               <th><a
                  href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></th>
            </c:if>

            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
               var="idx">
               <th><a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a></th>
            </c:forEach>

            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
               <th><a
                  href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></th>
            </c:if>
         </tr>
      </table>
   </div>
</div>

<%@ include file="../include/footer.jsp"%>