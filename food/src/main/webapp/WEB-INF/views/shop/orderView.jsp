<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../include/header.jsp"%>
<style>

 .orderIn { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderIn span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .iInfo { float:right; width:calc(95% - 220px); line-height:2; }
 .iInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>

<section id="container">
	<div id="container_box">
		<section id="content">
		
			<div class="orderIn">
			
				<c:forEach items="${orderView}" var="orderView" varStatus="status">

					<c:if test="${status.first }">
						<p>
							<span>수령인 :</span>${orderView.orderRec }</p>
						<p>
							<span>주소 : </span>(${orderView.userAddr1 }) ${orderView.userAddr2 }
							${orderView.userAddr3 }
						</p>
						<p>
							<span>가격 :</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${orderView.amount }"/>원
						</p>
						<p><span>상태 :</span>${orderView.delivery }</p>
					</c:if>
				</c:forEach>
			</div>

			<ul class="orderView">
			
				<c:forEach items="${orderView }" var="orderView">
					<li>
						<div class="thumb">
							<img src="${orderView.ithumbimg}" />
						</div>
						<div class="iInfo">
							<p>
								<span>상품명 :</span>${orderView.iname }<br /> <span>개당 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.price}"/>원 <br/>
								<span>구입수량 :</span>${orderView.cartStock } 개<br /> <span>최종
									가격 :</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.price * orderView.cartStock }"/>원<br/>
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>
	</div>
</section>




<%@ include file="../include/footer.jsp"%>