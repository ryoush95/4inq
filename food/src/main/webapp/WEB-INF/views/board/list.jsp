<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

thead tr th{
	text-align:center;
}

table tr td{
	text-align:center;
}


h2 { 
text-align:center;
font:bold 24pt; }

</style>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>
<!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<%@ include file="../include/header.jsp" %>
<script>

    $(document).ready(function(){
        $("#btnWrite").click(function(){
            location.href = "/board/write";
        });
    });
    
    function list(page){
        location.href="/board/list?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }

</script>

</head>
<body>
<br><br><br>
<h2><span class="h">자유게시판</span></h2>
<br><br>
<form name="form1" method="post" action="/board/list">
   <select name="searchOption">
      <option value="all" <c:out value="${map.searchOption == 'all'?'selected':'' }"/>>제목+이름+내용</option>
      <option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':'' }"/>>이름</option>
      <option value="content" <c:out value="${map.searchOption == 'content'?'selected':'' }"/>>내용</option>
      <option value="title" <c:out value="${map.searchOption == 'title'?'selected':'' }"/>>제목</option>
   </select>
   <input name="keyword" value="${map.keyword }">
   <input type="submit" style="background-color:#C0C0C0; color:#FFFFFF" value="조회">
</form> 
<!-- 레코드 갯수 출력  -->
${map.count }개의 게시물이 있습니다.
<table class="type10">
<colgroup>
<col width="10%" >
<col width="55%" >
<col width="15%" >
<col width="15%" >
<col width="5%" >
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
        <td style="text-align:left"><a href="/board/view?fno=${row.fno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
        <font size="3.5em">${row.title}</font>
        <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                    <c:if test="${row.replycnt > 0}">
                    <span style="color: red;">(${row.replycnt})
                    </span>
                    </c:if>
        </a></td>
        <td>${row.writer}</td>
        <td>
            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/>
        </td>
        <td>${row.viewcnt}</td>
    </tr>    
    </c:forEach>
    
    
    </table>
      <button type="button" class="btn btn-outline btn-info" id="btnWrite" style="float: right; WIDTH: 100pt; HEIGHT: 50pt; background-color:black" >글쓰기</button>
   
    <table class="box-footer" style="float: center">
    <tr>
        <td>
                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <th><a href="javascript:list('1')">[처음]</a></th>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                   <th> <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a></th>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                           <th> <a href="javascript:list('${num}')">${num}</a></th>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <th><a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a></th>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <th><a href="javascript:list('${map.boardPager.totPage}')">[끝]</a></th>
                </c:if>
            </td>
        </tr>
</table>
</body>
</html>
<%@ include file="../include/footer.jsp" %>