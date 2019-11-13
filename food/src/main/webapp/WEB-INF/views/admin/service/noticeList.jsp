<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>

table.type10 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.type10 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #191919;
    margin: 20px 10px;
}
table.type10 tbody th {
    width: 150px;
    padding: 10px;
}
table.type10 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type10 .even {
    background: #fdf3f5;
}



table.box-footer tr {
   list-style: none;
   float: left;
   display: inline;
}

table.box-footer tr th {
   float: left;
}

table.box-footer tr th a {
   float: left;
   padding: 4px;
   margin-right: 3px;
   width: 55px;
   color: #000;
   font: bold 12px tahoma;
   border: 1px solid #eee;
   text-align: center;
   text-decoration: none;
}

table.box-footer tr th a:hover, tr th a:focus {
   color: #fff;
   border: 1px solid #f40;
   background-color: #f40;
}



</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<%@ include file="../../include/header.jsp"%>

<script>
	function list(page) {
		location.href = "/board/noticeList?curPage=" + page
				+ "&searchOption-${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>
</head>
<body>
<br><br><br>
	<h2>공지사항 목록</h2>
<br><br>	
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
	<table class="type10">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>	
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.nno}</td>
				<td><a href="/board/noticeView?nno=${row.nno}">${row.notice_title}</a></td>
				<td>관리자</td>
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
</body>
</html>
<%@ include file="../../include/footer.jsp"%>