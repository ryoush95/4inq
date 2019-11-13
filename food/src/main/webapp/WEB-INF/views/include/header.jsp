<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Home</title>

<!-- Favicon  -->
<link rel="icon" href="/resources/img/core-img/favicon.ico">
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
	
</script>
<!-- Core Style CSS -->
<link rel="stylesheet" href="/resources/css/core-style.css">
<link rel="stylesheet" href="/resources/style.css">
<style>
/* 댓글리스트 */
section.reviewForm {
	padding: 30px 0;
}

section.reviewForm div.input_area {
	margin: 10px 0;
}

section.reviewForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.reviewForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.reviewList {
	padding: 30px 0;
}

section.reviewList ol {
	padding: 0;
	margin: 0;
}

section.reviewList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.reviewList div.userInfo {
	
}

section.reviewList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.reviewList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.reviewList div.reviewContent {
	padding: 10px;
	margin: 20px 0;
}

section.reviewList div.reviewFooter button {
	font-size: 14px;
	border: 1px solid #999;
	background: none;
	margin-right: 10px;
}

/* 댓글수정창 */
div.reviewModal {
	position: relative;
	z-index: 1;
	display: none;
}


div.modalBackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

div.modalContent {
	position: fixed;
	top: 20%;
	left: calc(50% - 250px);
	width: 525px;
	height: 290px;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

div.modalContent textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;
	height: 200px;
}

div.modalContent button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

div.modalContent button.modal_cancel {
	margin-left: 20px;
}

/* 카트리스트 스타일 */
section#content ul li {
	margin: 10px 0;
}

section#content ul li img {
	width: 250px;
	height: 250px;
}

section#content ul li::after {
	content: "";
	display: block;
	clear: both;
}

section#content div.thumb {
	float: left;
	width: 250px;
}

section#content div.gdsInfo {
	float: right;
	width: calc(100% - 270px);
}

section#content div.gdsInfo {
	font-size: 20px;
	line-height: 2;
}

section#content div.gdsInfo span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 10px;
}

section#content div.gdsInfo .delete {
	text-align: right;
}

section#content div.gdsInfo .delete button {
	font-size: 22px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

section#content button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

/* 체크박스 */
.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}

.delBtn {
	float: right;
	width: 300px;
	text-align: right;
}

.delBtn button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.checkBox {
	float: left;
	width: 30px;
}

.checkBox input {
	width: 16px;
	height: 16px;
}

/* 장바구니 하단부분 */
.listResult {
	padding: 20px;
	background: #eee;
}

.listResult .sum {
	float: left;
	width: 45%;
	font-size: 22px;
}

.listResult .orderOpne {
	float: right;
	width: 45%;
	text-align: right;
}

.listResult .orderOpne button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #999;
	background: #fff;
}

.listResult::after {
	content: "";
	display: block;
	clear: both;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}

#userAddr2, #userAddr3 {
	width: 250px;
}

.orderInfo .inputArea:last-child {
	margin-top: 30px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}
</style>

</head>

<body>
	<!-- Search Wrapper Area Start -->
	<div class="search-wrapper section-padding-100">
		<div class="search-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="search-content">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type your keyword...">
							<button type="submit">
								<img src="/resources/img/core-img/search.png" alt="">
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Search Wrapper Area End -->

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<!-- Mobile Nav (max width 767px)-->
		<div class="mobile-nav">
			<!-- Navbar Brand -->
			<div class="amado-navbar-brand">
				<a href="index.html"><img src="/resources/img/core-img/logo1.png"
					alt=""></a>
			</div>
			<!-- Navbar Toggler -->
			<div class="amado-navbar-toggler">
				<span></span><span></span><span></span>
			</div>
		</div>

		<!-- Header Area Start -->
		<header class="header-area clearfix">
			<!-- Close Icon -->
			<div class="nav-close">
				<i class="fa fa-close" aria-hidden="true"></i>
			</div>
			<!-- Logo -->
			<div class="logo">
				<a href="http://localhost:8090/"><img
					src="/resources/img/core-img/logo1.png" alt=""></a>
			</div>

			<!-- Button Group -->
			<div class="amado-btn-group mt-30 mb-100">


				<ul>
					<c:if test="${member == null}">
						<li><a class="btn amado-btn mb-15" href="/member/signin">로그인</a>
						</li>
						<li><a class="btn amado-btn active" href="/member/signup">회원가입</a>
						</li>
					</c:if>
					<c:if test="${member != null}">

						<c:if test="${member.auth == 9}">
							<li><a href="/admin/index">관리자 화면</a></li>
						</c:if>

						<li><a class="btn amado-btn mb-15" href="/member/mypage_home">${member.name}님 환영합니다.</a></li>
						<li><a class="btn amado-btn mb-15" href="/member/signout">로그아웃</a>

						</li>
					</c:if>

				</ul>



				<!--          <sec:authorize access="isAuthenticated()">
               <a class="btn amado-btn mb-15" href="/customLogout"><i
                  class="fas 
fa - sign - out - alt fa - sm fa - fw mr - 2 text - gray - 400"></i>로그아웃</a>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
               <a class="btn amado-btn mb-15" href="/customLogin"><i
                  class="fas 
fa - sign - out - alt fa - sm fa - fw mr - 2 text - gray - 400"></i>로그인
               </a>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
               <a class="btn amado-btn active" href="#"><i
                  class="fas 
fa - sign - out - alt fa - sm fa - fw mr - 2 text - gray - 400"></i>
               <sec:authentication property="principal.username" /></a>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
               <a class="btn amado-btn active" href="/memberRegister"><i
                  class="fas 
fa - sign - out - alt fa - sm fa - fw mr - 2 text - gray - 400"></i>회원가입
               </a>
            </sec:authorize> -->

				<!-- <a href="/customLogin" class="btn amado-btn mb-15">로그인</a> -->


				<%-- <a href="/memberRegister" class="btn amado-btn active">회원가입</a>
            <sec:authorize access="isAuthenticated()">
               <span class="mr - 2 d - none d - lg - inline text gray - 600 small">
                  <sec:authentication property="principal.username" /> <!-- 프린서펄 : 세션의 일종, 접속자 계정 정보 -->
               </span>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
               <i class="fas fa - cogs fa - sm fa - fw mr - 2 text - gray - 400">
               </i>
            </sec:authorize> --%>
			</div>

			<!-- Amado Nav -->
			<nav class="amado-nav">

				<ul>
					<!--  <li class="active"><a href="index.html">농산물</a></li> -->
					<li class="nav-item"><a class="nav-link collapsed"
						href="index" data-toggle="collapse" data-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo"> <span><strong><h5>
										<strong>상품</strong>
									</h5></strong></span>
					</a>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordionSidebar"
							style="">
							<div class="bg-white py-2 collapse-inner rounded">

								<a class="collapse-item" href="/shop/listPage">전체상품</a> <a
									class="collapse-item" href="/shop/list?c=100&l=1">농산물</a> <a
									class="collapse-item" href="/shop/list2?c=200&l=1">축산물</a> <a
									class="collapse-item" href="/shop/list3?c=300&l=1">수산물</a>
							</div>
						</div></li>
					<!-- <li><a href="shop.html">수산물</a></li>
                    <li><a href="product-details.html">축산물</a></li> -->
					<li class="nav-item"><a class="nav-link collapsed" href="/producter/list"
						> <span><strong><h5>
										<strong>생산자</strong>
									</h5></strong></span>
					</a>
						<!--<div id="collapse4" class="collapse" aria-labelledby="heading4"
							data-parent="#accordionSidebar" style="">
							<div class="bg-white py-2 collapse-inner rounded">

								<a class="collapse-item" href="/producter/list">전체 생산자</a>
								 <a
									class="collapse-item" href="/board/producer">우리동네 생산자</a> -->
								<!--         <li><a href="checkout.html">category</a></li> -->
							
						
					<li class="nav-item"><a class="nav-link collapsed" href="#"
						data-toggle="collapse" data-target="#collapse3"
						aria-expanded="false" aria-controls="collapse3"> <span><strong><h5>
										<strong>고객센터</strong>
									</h5></strong></span>
					</a>
						<div id="collapse3" class="collapse" aria-labelledby="heading3"
							data-parent="#accordionSidebar" style="">
							<div class="bg-white py-2 collapse-inner rounded">

								<a class="collapse-item" href="/board/qnaList">1:1질문</a> <a
									class="collapse-item" href="/board/faq">FAQ</a> <a
									class="collapse-item" href="/board/list">자유게시판</a> <a
									class="collapse-item" href="/board/noticeList">공지사항</a>
							</div>
						</div></li>
					<!--  <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> 
                    <i class="fas fa-fw fa-cog"></i> <span>상품</span>
         </a>
            <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar" style="">
               <div class="bg-white py-2 collapse-inner rounded">
                  
                  <a class="collapse-item" href="buttons.html">농산물</a>
                  <a class="collapse-item" href="cards.html">수산물</a>
                  <a class="collapse-item" href="cards.html">축산물</a>
                  
               </div>
            </div></li>
                </ul>
            </nav> -->


					<!-- Cart Menu -->
					<div class="cart-fav-search mb-100">
						<a href="/shop/cartList" class="cart-nav"><img
							src="/resources/img/core-img/cart.png" alt=""> 장바구니 </a> <a
							href="/shop/orderList" class="fav-nav"><img
							src="/resources/img/core-img/search.png" alt=""> 주문내역</a> <a
							href="/company" class="fav-nav"><img
							src="/resources/img/core-img/favorites.png" alt=""> 회사소개</a>
							<!-- <img
										src="/resources/img/core-img/favorites.png" alt="">
										관리자페이지</a> -->
					</div>
					<!-- Social Button -->
					<div class="social-info d-flex justify-content-between">
						<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
					</div>
		</header>

		<div class="products-catagories-area clearfix">
			<!-- Header Area End -->

			<!-- Product Catagories Area Start -->
			<!--  <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix"> -->



			<!-- Single Catagory -->
			<!-- <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/1.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $180</p>
                            <h4>Modern Chair</h4>
                        </div>
                    </a>
                </div> -->

			<!-- Single Catagory -->
			<!--  <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/2.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $180</p>
                            <h4>Minimalistic Plant Pot</h4>
                        </div>
                    </a>
                </div> -->

			<!-- Single Catagory -->
			<!-- <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/3.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $180</p>
                            <h4>Modern Chair</h4>
                        </div>
                    </a>
                </div>
 -->
			<!-- Single Catagory -->
			<!--  <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/4.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $180</p>
                            <h4>Night Stand</h4>
                        </div>
                    </a>
                </div> -->

			<!-- Single Catagory -->
			<!--  <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/5.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $18</p>
                            <h4>Plant Pot</h4>
                        </div>
                    </a>
                </div>
 -->
			<!-- Single Catagory -->
			<!--  <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/6.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $320</p>
                            <h4>Small Table</h4>
                        </div>
                    </a>
                </div>
 -->
			<!-- Single Catagory -->
			<!-- <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/7.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $318</p>
                            <h4>Metallic Chair</h4>
                        </div>
                    </a>
                </div> -->

			<!-- Single Catagory -->
			<!-- <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/8.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $318</p>
                            <h4>Modern Rocking Chair</h4>
                        </div>
                    </a>
                </div> -->

			<!-- Single Catagory -->
			<!-- <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="resources/img/bg-img/9.jpg" alt="">
                        Hover Content
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $318</p>
                            <h4>Home Deco</h4>
                        </div>
                    </a>
                </div> -->




			<!-- ##### Main Content Wrapper End ##### -->

			<!-- ##### Newsletter Area Start ##### -->

			<!-- ##### Newsletter Area End ##### -->