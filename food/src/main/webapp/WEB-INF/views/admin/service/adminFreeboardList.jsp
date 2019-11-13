<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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

label[for='iDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#iDes {
	width: 400px;
	height: 180px;
}
</style>
<style>
#container_box table td {
	width: 100px;
}
</style>
<style>
#container_box table {
	width: 900px;
}

#container_box table th {
	font-size: 20px;
	font-weigth: bold;
	text-align: center;
	padding: 10px;
	boder-botton: 2px solid #666;
}

#container_box table tr:hover {
	background: #eee;
}

#container_box table td {
	padding: 10px;
	text-align: center;
}

#container_box table img {
	width: 150px;
	height: auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.href = "/board/write";
		});
	});

	function list(page) {
		location.href = "/board/list?curPage=" + page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>

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
				<div class="page-wrapper">
					<div class="container-fluid">
						<div class="col-lg-8">
							<!--게시판 넓이 -->
							<div class="col-lg-12">
								<h1 class="page-header">자유게시판 관리</h1>
							</div>
							<div class="row">
								<div class="col-lg-12"></div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">자유게시판</div>
								<h2>
									<span class="h">자유게시판</span>
								</h2>
								<br> <br>
								<form name="form1" method="post" action="/board/list">
									<select name="searchOption">
										<option value="all"
											<c:out value="${map.searchOption == 'all'?'selected':'' }"/>>제목+이름+내용</option>
										<option value="writer"
											<c:out value="${map.searchOption == 'writer'?'selected':'' }"/>>이름</option>
										<option value="content"
											<c:out value="${map.searchOption == 'content'?'selected':'' }"/>>내용</option>
										<option value="title"
											<c:out value="${map.searchOption == 'title'?'selected':'' }"/>>제목</option>
									</select> <input name="keyword" value="${map.keyword }"> <input
										type="submit"
										style="background-color: #C0C0C0; color: #FFFFFF" value="조회">
								</form>
								<!-- 레코드 갯수 출력  -->
								${map.count }개의 게시물이 있습니다.
								<table class="type10">
									<colgroup>
										<col width="10%">
										<col width="45%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">이름</th>
											<th scope="col">작성일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<c:forEach var="row" items="${map.list}">
										<tr>
											<td>${row.fno}</td>
											<td style="text-align: left"><a
												href="/admin/service/adminFreeboardView?fno=${row.fno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
													<font size="3.5em">${row.title}</font> <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
													<c:if test="${row.replycnt > 0}">
														<span style="color: red;">(${row.replycnt}) </span>
													</c:if>
											</a></td>
											<td>${row.writer}</td>
											<td>
												<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
													value="${row.regdate}" pattern="yyyy-MM-dd" />
											</td>
											<td>${row.viewcnt}</td>
										</tr>
									</c:forEach>


								</table>

								<table class="box-footer" style="float: center">
									<tr>
										<td>
											<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> <c:if
												test="${map.boardPager.curBlock > 1}">
												<th><a href="javascript:list('1')">[처음]</a></th>
											</c:if> <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
											<c:if test="${map.boardPager.curBlock > 1}">
												<th><a
													href="javascript:list('${map.boardPager.prevPage}')">[이전]</a></th>
											</c:if> <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 --> <c:forEach
												var="num" begin="${map.boardPager.blockBegin}"
												end="${map.boardPager.blockEnd}">
												<!-- **현재페이지이면 하이퍼링크 제거 -->
												<c:choose>
													<c:when test="${num == map.boardPager.curPage}">
														<span style="color: red">${num}</span>&nbsp;
                        </c:when>
													<c:otherwise>
														<th><a href="javascript:list('${num}')">${num}</a></th>&nbsp;
                        </c:otherwise>
												</c:choose>
											</c:forEach> <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
											<c:if
												test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
												<th><a
													href="javascript:list('${map.boardPager.nextPage}')">[다음]</a></th>
											</c:if> <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
											<c:if
												test="${map.boardPager.curPage <= map.boardPager.totPage}">
												<th><a
													href="javascript:list('${map.boardPager.totPage}')">[끝]</a></th>
											</c:if>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
</html>