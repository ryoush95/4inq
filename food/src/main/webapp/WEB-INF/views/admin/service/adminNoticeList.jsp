<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
								<h1 class="page-header">공지사항 관리</h1>
							</div>
							<div class="row">
								<div class="col-lg-12"></div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">공지사항</div>
								<h2>공지사항 목록</h2>
								<form name="form1" method="post" action="/board/noticeList">
									<select name="searchOption">
										<option value="all"
											<c:out value="${map.searchOption == 'all'?'selected':'' }"/>>제목+이름+내용</option>
										<option value="writer"
											<c:out value="${map.searchOption == 'notice_writer'?'selected':'' }"/>>이름</option>
										<option value="content"
											<c:out value="${map.searchOption == 'notice_content'?'selected':'' }"/>>내용</option>
										<option value="title"
											<c:out value="${map.searchOption == 'notice_title'?'selected':'' }"/>>제목</option>
									</select> <input name="keyword" value="${map.keyword }"> <input
										type="submit" value="조회">
								</form>
								<!-- 레코드 갯수 출력  -->
								${map.count }개의 게시물이 있습니다.
								<table border="1" width="600px">
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>이름</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
									<c:forEach var="row" items="${map.noticeList}">
										<tr>
											<td>${row.nno}</td>
											<td><a href="/admin/adminNoticeView?nno=${row.nno}">${row.notice_title}</a></td>
											<td>${row.notice_writer}</td>
											<td>
												<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
													value="${row.notice_regdate}" pattern="yyyy-MM-dd" />
											</td>
											<td>${row.notice_viewcnt}</td>
										</tr>
									</c:forEach>
								<tr>
			<td colspan="5">
				<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력--> <c:if
					test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if> <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 --> <c:if
					test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if> <!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 --> <c:forEach var="num"
					begin="${map.boardPager.blockBegin}"
					end="${map.boardPager.blockEnd}">
					<!-- **현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach> <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if> <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 --> <c:if
					test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
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





		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
</body>
</html>