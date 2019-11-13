<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Admin item modify</title>

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
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='pdDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#pdDes {
	width: 400px;
	height: 180px;
}

.select_img img {
	width: 500px;
	margin: 20px 0;
}
</style>

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
				<h2>생산자 등록</h2>

				<form role="form" method="post" autocomplete="off"
					enctype="multipart/form-data">
					<input type="hidden" name="pnum" value="${producter.pnum}" />


					<div class="inputArea">
						<label for="pname">생산자명</label> <input type="text" id="pname"
							name="pname" value="${producter.pname }" />
					</div>


					<div class="inputArea">
						<label for="paddress">생산자가격</label> <input type="text"
							id="paddress" name="paddress" value="${producter.paddress }" />
					</div>


					<div class="inputArea">
						<label for="pintroduce">생산자소개</label>
						<textarea rows="5" cols="50" id="pintroduce" name="pintroduce">${producter.pintroduce }</textarea>
					</div>

					<div class="inputArea">
						<label for="ppicture">이미지</label> <input type="file" id="ppicture"
							name="file" />
						<div class="select_img">
							<img src="${producter.ppicture }" /> <input type="hidden"
								name="ppicture" value="${producter.ppicture }" /> <input
								type="hidden" name="pthumbimg" value="${producter.pthumbimg }" />
						</div>

						<script>
							$("#ppicture")
									.change(
											function() {
												if (this.files && this.files[0]) {
													var reader = new FileReader;
													reader.onload = function(
															data) {
														$(".select_img img")
																.attr(
																		"src",
																		data.target.result)
																.width(500);
													}
													reader
															.readAsDataURL(this.files[0]);
												}
											});
						</script>

						<%=request.getRealPath("/")%>

					</div>


					<div class="inputArea">
						<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
						<button type="button" onclick="history.back()"
							class="btn btn-warning">취소</button>
					</div>

				</form>

			</div>
		</section>

	</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>

	</div>


</body>
</html>