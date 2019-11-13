<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->


<style>
table.type11 {
   border-collapse: separate;
   border-spacing: 1px;
   text-align: center;
   line-height: 1.5;
   margin: auto;
}

table.type11 th {
   width: 155px;
   padding: 20px;
   font-weight: bold;
   vertical-align: top;
   color: #fff;
   background: #1F995E;
}

table.type11 td {
   width: 155px;
   padding: 10px;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
   background: #eee;
}


.title {
   margin: auto;
   text-align: center;
}

.titleName h2 {
   display: inline-block;
}
   
</style>



<%@ include file="../include/header.jsp"%>

<br>
<br>
<br>



<div class="amado-pro-catagory clearfix">
<div class="title">
   <a class="titleName" href="http://localhost:8090/shop/list?c=100&l=1"><h2>농산물</h2></a>
</div>

   <section>
      <table class="type11">
         <thead>
            <tr>
               <th onClick="location.href='/shop/list?c=101&l=2'"
                  style="cursor: pointer;">곡물</th>
               <th onClick="location.href='/shop/list?c=102&l=2'"
                  style="cursor: pointer;">과일</th>
               <th onClick="location.href='/shop/list?c=103&l=2'"
                  style="cursor: pointer;">채소</th>

            </tr>
         </thead>
      </table>
   </section>

   <br>
   <br>
   <br>







   <div class="products-catagories-area clearfix">
      <div class="amado-pro-catagory clearfix">
         <!-- Single Catagory -->
         <c:forEach items="${list }" var="list">
            <div class="single-products-catagory clearfix">
               <a href="/shop/view?n=${list.inum }"> <img
                  src="${list.ithumbimg }" alt=""> <%-- ${list.cateName } --%>
                  <div class="hover-content">
                     <div class="line"></div>
                     <p>${list.price }원</p>
                     <h4>${list.iname }</h4>
                  </div>
               </a>
            </div>
         </c:forEach>
      </div>
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
   
</div>


<%@ include file="../include/footer.jsp"%>