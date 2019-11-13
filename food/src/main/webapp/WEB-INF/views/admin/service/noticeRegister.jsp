<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
            var title = $("#notice_title").val();
            var content = $("#notice_content").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.notice_title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.notice_content.focus();
                return;
            }
			alert("등록이 완료되었습니다.")
            document.form1.submit();
        });
    });
</script>


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
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">공지사항 관리</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                  
                  </div>
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">공지사항 </div>
                <div class="panel-body">
                    <form id="boardFrm" name="form1" action="/admin/service/noticeRegister" method="post">
                        <div class="row form-group">
                            <label class="col-lg-2">제목</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="notice_title" name="notice_title" min="1" max="3">
                             </div>
                        </div>
                           <div class="row form-group">
                           <label class="col-lg-2">내용</label>
                           <div class="col-lg-8">
                               <textarea class="form-control" id="notice_content" name="notice_content"></textarea>
                           </div>
                       </div>
                  </form>
                       <button class="btn btn-outline btn-info" id="btnSave">저장하기</button>
                          <button class="btn btn-outline btn-primary" onclick="location.href='/admin/index'">취소</button>
                </div>
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