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

<script>
	$(function(){
		if(${msg ne null});{
			
		};
		
		if($("#pwForm").submit(function(){
			if($("#mpw").val() !== $("#mpw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#mpw").val("").focus();
				$("#mpw2").val("");
				return false;
			}else if ($("#mpw").val().length < 2) {
				alert("비밀번호는 2자 이상으로 설정해야 합니다.");
				$("#mpw").val("").focus();
				return false;
			}else if($.trim($("#mpw").val()) !== $("#mpw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
		
		if($("#wdForm").submit(function(){
			if(!confirm("정말 탈퇴하시겠습니까?")){
				return false;
			}
		}));
	})
</script>

</head>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="../member/update_mypage" method="post">
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="mid"
							name="mid" readonly value="${member.mid}">
					</p>


					<p>
						<label>이름</label> <input class="w3-input" type="text" id="name"
							name="name" readonly value="${ member.name }">
					</p>
					<p>
						<label>이메일</label> <input class="w3-input" type="text"
							id="email" name="email" readonly
							value="${ member.email }">
					</p>
					<p>
						<label>주소</label> <input class="w3-input" type="text"
							id="address1" name="address1" readonly
							value="${ member.address1 }">
					</p>
					<p>
						<input class="w3-input" type="text" id="address2" name="address2"
							readonly value="${ member.address2 }">
					</p>
					<p>
						<input class="w3-input" type="text" id="address3" name="address3"
							readonly value="${ member.address3 }">
					</p>
					<p>
						<label>전화번호</label> <input class="w3-input" type="text" id="phone"
							name="phone" readonly value="${ member.phone }">
					</p>



				</form>
				<p class="w3-center">
					<button onclick="location.href='/member/mypage'"
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보
						변경</button>
				</p>
				<p class="w3-center">
						<button onclick="location.href='/member/withdrawal'"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원 탈퇴</button>
					</p>
				<!-- <button class="btn btn-outline btn-info"
					onclick="location.href='/member/mypage'">수정하기</button>
				<button class="btn btn-outline btn-primary" onclick="history.back()">취소</button> -->

				<br />
			</div>
		</div>
	</div>

</body>
</html>

