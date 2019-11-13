<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>마이페이지</title>



</head>
<%@ include file="../include/header.jsp"%>
<script>
 $(document).ready(function(){
	 $("#memberban").click(function(){
		 if(confirm("탈퇴하시겠습니까?")){
			 document.form1.action ="/member/withdrawal";
			 document.form1.submit();
		 }
	 });
 });
</script>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>

				<form role="mid" method="post" autocomplete="off" name="form1">
					<p>
						<label for="mid">아이디</label> <input type="text" id="mid"
							name="mid" value="${member.mid }" />
					</p>
					<p>
						<label for="mpw">패스워드</label> <input type="password" id="mpw"
							name="mpw" />
					</p>
					<p>
						<button type="submit" id="memberban"
						style= "background-color:black; color:white;">회원탈퇴</button>
						
					
					
						<button type="button"
						style= "background-color:black; color:white;"
							onclick="location.href='/member/mypage_home'">취소</button>
					</p>
				</form>
				<c:if test="${msg ==false }">
					<script>
						alert("비밀번호가 다릅니다")
					</script>
				</c:if>
				<br />
			</div>
		</div>
	</div>
</body>
</html>

