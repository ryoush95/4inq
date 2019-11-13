<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../include/header.jsp"%>


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