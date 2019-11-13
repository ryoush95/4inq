<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Admin item view</title>

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

.oriImg {
	width: 500px;
	height: auto;
}

.thumbImg {
	
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
				<c:forEach items="${member }" var="member">
					<form role="form" method="post" autocomplete="off">
						<input type="hidden" name="n" value="${member.mnum}" />

						<div class="inputArea">
							<label for="name">이름</label> <span>${member.name }</span>
						</div>
						<div class="inputArea">
							<label for="mid">ID</label> <span>${member.mid }</span>
						</div>

						<div class="inputArea">
							<label for="address1">주소</label> <span>${member.address1 }</span>
						</div>
						<div class="inputArea">
							<label for="address2"></label> <span>${member.address2 }</span>
						</div>
						<div class="inputArea">
							<label for="address3"></label> <span>${member.address3 }</span>
						</div>
						<div class="inputArea">
							<label for="phone">이름</label> <span>${member.phone }</span>
						</div>

						<div class="inputArea">
							
							<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
						</div>

						<script>
						var formObj = $("form[role='form']");
						
							$("#delete_Btn").click(
									function() {
										var con = confirm("정말로 탈퇴시키시겠습니까?");

										if (con) {
											formObj.attr("action",
													"/admin/member/delete");
											formObj.submit();
										}
									});
						</script>


					</form>
				</c:forEach>
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