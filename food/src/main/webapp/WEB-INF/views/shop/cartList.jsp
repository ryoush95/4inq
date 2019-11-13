<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../include/header.jsp"%>

<h2>장바구니</h2>
<section id="container">

	<div id="container_box">
		<section id="content">
			<ul>
				<li>
					<div class="allCheck">
						<input type="checkbox" name="allCheck" id="allCheck" /><label
							for="allCheck">모두 선택</label>

						<script>
							$("#allCheck").click(function() {
								var chk = $("#allCheck").prop("checked");
								if (chk) {
									$(".chBox").prop("checked", true);
								} else {
									$(".chBox").prop("checked", false);
								}
							});
						</script>
					</div>

					<div class="delBtn">
						<button type="button" class="selectDelete_btn">선택삭제</button>

						<script>
							$(".selectDelete_btn")
									.click(
											function() {
												var confirm_val = confirm("정말 삭제하시겠습니까?");

												if (confirm_val) {
													var checkArr = new Array();

													$(
															"input[class='chBox']:checked")
															.each(
																	function() {
																		checkArr
																				.push($(
																						this)
																						.attr(
																								"data-cartNum"));
																	});

													$
															.ajax({
																url : "/shop/deleteCart",
																type : "POST",
																data : {
																	chbox : checkArr
																},
																success : function(
																		result) {
																	if (result == 1) {
																		location.reload();
																		alert("삭제성공");
																	} else {
																		location.reload();
																		alert("삭제실패");
																	}
																}

															});
												}
											});
						</script>

					</div>
				</li>

				<c:set var="sum" value="0" />

				<c:forEach items="${cartList }" var="cartList">
					<li>
						<div class="checkBox">
							<input type="checkBox" name="chBox" class="chBox"
								data-cartNum="${cartList.cartnum }" />
						</div>
						<div class="thumb">
							<img src="${cartList.ithumbimg }" />
						</div>
						<div class="iInfo">
							<p>
								<span>상품명</span>${cartList.iname }<br /> <span>개당 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${cartList.price }" />
								원<br /> <span>구입 수량</span>${cartList.cartstock } 개<br /> <span>최종
									가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${cartList.price * cartList.cartstock}" />
							</p>
							<div class="delete">
								<button type="button" class="delete_${cartList.cartnum}_btn"
									data-cartNum="${cartList.cartnum }">삭제</button>
								<script>
	$(".delete_${cartList.cartnum}_btn").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");

		if (confirm_val) {
			var checkArr = new Array();

			checkArr.push($(this).attr("data-cartNum"));

			$.ajax({
				url : "/shop/deleteCart",
				type : "POST",
				data : {
					chbox : checkArr
				},
				success : function(result) {
					console.log(result);
					if (result == 1) {
						console.log(result);
						location.reload();
						alert('삭제되었습니다');
					} else {
						location.reload();
						alert("삭제실패");
					}
				}
			});
		}
	});
</script>
							</div>
						</div>
					</li>

					<c:set var="sum"
						value="${sum + (cartList.price * cartList.cartstock )}"></c:set>

				</c:forEach>
			</ul>
			<div class="listResult">
				<div class="sum">
					총합계 :
					<fmt:formatNumber pattern="###,###,###" value="${sum }" />
					원
				</div>
				<div class="orderOpen">
					<button type="button" class="orderOpen_bnt">주문정보 입력</button>
					<script>
						$(".orderOpen_bnt").click(function() {
							$(".orderInfo").slideDown();
							$(".orderOpen_bnt").slideUp();
						});
					</script>
				</div>
			</div>

			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="amount" value="${sum }" />

					<div class="inputArea">
						<label for="">수령인</label> <input type="text" name="orderRec"
							id="orederRec" required="required" />
					</div>

					<div class="inputArea">
						<label for="orderPhon">수령인 연락처</label> <input type="text"
							name="orderPhon" id="orderPhon" required="required" />
					</div>

					<!-- <div class="inputArea">
						<label for="userAddr1">우편번호</label> <input type="text"
							name="userAddr1" id="userAddr1" required="required" />
					</div>
					<div class="inputArea">
						<label for="userAddr2">1차주소</label> <input type="text"
							name="userAddr2" id="userAddr2" required="required" />
					</div>
					<div class="inputArea">
						<label for="userAddr3">2차주소</label> <input type="text"
							name="userAddr3" id="userAddr3" required="required" />
					</div> -->
					<p><div class ="inputArea">
					<input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></p>
<p><input type="text" name ="userAddr1"id="sample6_address" placeholder="주소"><br>
<p><input type="text" name ="userAddr2"id="sample6_detailAddress" placeholder="상세주소"></p>
<input type="text" name ="userAddr3"id="sample6_extraAddress" placeholder="참고항목">
</p>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</div>
					
					<div class="inputArea">
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="cancel_btn">취소</button>
						<script>
							$(".cancel_btn").click(function() {
								$(".orderInfo").slideUp();
								$(".orderOpen_bnt").slideDown();
							});
						</script>
						
					</div>
				</form>
			</div>


		</section>
	</div>
</section>


<%@ include file="../include/footer.jsp"%>