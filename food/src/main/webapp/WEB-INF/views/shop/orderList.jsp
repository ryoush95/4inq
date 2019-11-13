<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../include/header.jsp"%>
<style>
section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
<section id="container">
	<div id="container_box">
		<section id="content" style="">

			<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div>
							<p>
								<span>주문번호:</span><a
									href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
							</p>
							<p>
								<span>수령인 :</span>${orderList.orderRec}</p>
							<p>
								<span>주소 :</span>(${orderList.userAddr1}) ${orderList.userAddr2}
								${orderList.userAddr3}
							</p>
							<p>
								<span>가격 :</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" />
								원
							</p>
							<p><span>상태 :</span>${orderList.delivery }</p>
						</div>
					</li>
				</c:forEach>
			</ul>

		</section>
	</div>
</section>




<%@ include file="../include/footer.jsp"%>