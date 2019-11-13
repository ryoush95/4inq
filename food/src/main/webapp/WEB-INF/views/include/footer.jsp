<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

</div>
<!-- Product Catagories Area End -->
</div>
<!-- ##### Footer Area Start ##### -->
<footer class="footer_area clearfix">
	<div class="container">
		<div class="row align-items-center">
			<!-- Single Widget Area -->
			<div class="col-12 col-lg-4">
				<div class="single_widget_area">
					<!-- Logo -->
					<div class="footer-logo mr-50">
						<img
							src="/resources/img/core-img/logo32.png" alt="">
					</div>
					<!-- Copywrite Text -->
					<p class="copywrite">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
			<!-- Single Widget Area -->
			<div class="col-12 col-lg-8">
				<div class="single_widget_area">
					<!-- Footer Menu -->
					<div class="footer_menu">
						<nav class="navbar navbar-expand-lg justify-content-end">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#footerNavContent"
								aria-controls="footerNavContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="fa fa-bars"></i>
							</button>
							<div class="collapse navbar-collapse" id="footerNavContent">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item active"><a class="nav-link" href="/">홈</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="/shop/listPage">상품</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="/producter/list">생산자</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="/shop/cartList">장바구니</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="/board/noticeList">공지사항</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- ##### Footer Area End ##### -->

<div class="reviewModal">
	<div class="modalContent">

		<div>
			<textarea class="modal_revcon" name="modal-revcon"></textarea>
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
				revnum : $(this).attr("data-revnum"),
				revcon : $(".modal_revcon").val()
			}; // ReviewVO형태로 데이터생성

			$.ajax({
				url : "/shop/view/modifyReview",
				type : "post",
				data : data,
				success : function(result) {

					console.log(result);
					//result 값에따라 동작
					if (result == 1) {
						
						reviewList();
						$(".reviewModal").fadeOut(200);
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
		$(".reviewModal").fadeOut(200);
	});
</script>


<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
<script src="/resources/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="/resources/js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="/resources/js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="/resources/js/plugins.js"></script>
<!-- Active js -->
<script src="/resources/js/active.js"></script>


</body>

</html>