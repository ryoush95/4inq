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

<title>1:1문의 보기</title>

<script>
function replyList(){ 
	var qno =${qnaView.qno};
	$.getJSON("answerList" + "?qno=" + qno, function(data){
		var str ="";
		
		$(data).each(function(){
			
			console.log(data);
			
			var replydate = new Date(this.replydate);
			replydate = replydate.toLocaleDateString("ko-US")
			
			str +="<li data-qrno='" + this.qrno + "'> "
				+"<div class='userInfo'>"
				+"<span class= 'userName'> " + this.replyer + "</span>"
				+"<span class= 'date'> " + replydate + "</span></div>"
				+"<div class='reviewContent' >" + this.reply + "</div>"
				
				+"<c:if test ='${member !=null}'>"
				
				+"<div class = 'replyFooter'>"
				+"<button type='button' class='delete' data-qno='"+ this.qno + "'>답변삭제</button>"
				+"</div>"
				
				+"</c:if>"
				
				+"</li>"
		});
		
		$("section.replyList ol").html(str);
		
		console.log(str);
	});
	
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
	<h2>1:1문의 보기</h2>
	<form name="form1" method="post">
		<div>
			<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
			작성일자 :
			<fmt:formatDate value="${qnaView.qna_regdate}"
				pattern="yyyy-MM-dd" />
			<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
		</div>
		
		<div>제목 
		<input name="title" id="title" size="1000" value="${qnaView.qna_title}" readonly>
		</div>
		
		<div>내용
		<textarea name="content" id="content" rows="5" cols="100" readonly>${qnaView.qna_content}</textarea>
		</div>
		
		<div>작성자  : ${qnaView.qna_writer}</div>
		
	</form>

<br><br><br>
<div id="reply">
	<c:if test="${member != null }">
		<section class="replyForm">
			<form role="form" method="post" autocomplete="off">

				<input type="hidden" name="qno" id="qno" value="${qnaView.qno }">

				<div class="input_area">
					<textarea name="insertReply" id="insertReply"></textarea>
				</div>

				<div class="input_area">
					<button type="button" id="reply_btn">답변 등록</button>

					<script>
						$("#reply_btn").click(function(){
							var formObj = $(".replyForm form[role='form']");
							var qno = $("#qno").val();
							var reply = $("#insertReply").val();
							
							var data = {
								qno : qno,
								reply : reply
							};
							
							$.ajax({
								url : "/admin/answerInsert",
								type : "post",
								data: data,
								success : function(){
									replyList();
									$("#insertReply").val("");
								}
							});
						});
					</script>

				</div>
			</form>
		</section>
	</c:if>

	<section class="replyList">
	<ol>
	
	</ol>
		<script>
			replyList()
		</script>	


		<script>
			$(document).on("click" , ".delete", function(){
				var deleteConfirm=confirm("삭제하시겠습니까?");
				
				if(deleteConfirm){
				
				var data ={qrno : $(this).attr("data-qrno")};
				
				$.ajax({
					url:"/admin/answerDelete",
					type : "post",
					data : data,
					success : function(result){
						if(result ==1){
						replyList();
						}else{
							alert("본인이 아닙니다.")
						}
					},
					error : function(){
						alert("로그인 하셔야합니다.")
					}
				});
				}
			});
		</script>
	</section>
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