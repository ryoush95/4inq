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
						<label>회원번호</label> <input class="w3-input" type="text" id="mnum"
							name="mnum" readonly value="${ member.mnum }">
					</p>
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="mid"
							name="mid" readonly value="${member.mid}">
					</p>
					<p>
						<label>비밀번호</label> <input class="w3-input" type="password" id="mpw"
							name="mpw" value="" required>
					</p>

					<p>
						<label>이름</label> <input class="w3-input" type="text" id="name"
							name="name" value="${ member.name }" required>
					</p>
					<p>
						<label>이메일</label> <input class="w3-input" type="eamil" id="email"
							name="email" value="${ member.email }" required>
					</p>
					<p>
						<label>주소1</label> <input class="w3-input" type="text"
							id="address1" name="address1" value="${ member.address1 }"
							required>
					</p>
					<p>
						<label>주소2</label> <input class="w3-input" type="text"
							id="address2" name="address2" value="${ member.address2 }"
							required>
					</p>
					<p>
						<label>주소3</label> <input class="w3-input" type="text"
							id="address3" name="address3" value="${ member.address3 }"
							required>
					</p>
					<p>
						<label>전화번호</label> <input class="w3-input" type="text" id="phone"
							name="phone" value="${ member.phone }" required>
					</p>

					<p class="w3-center">
						<button type="submit"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보
							변경</button>
					</p>
				</form>


				

				<!--<div>
				<br><br>
    <b><font size="6" color="gray">내 정보</font></b>
    <br><br><br>
 
    <form name="wdForm" method="post" action="../member/withdrawal"
        onsubmit="return withdrawal()">
 
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="mpw" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="javascript:window.location='/'">
        <input type="submit" value="탈퇴" /> 
    </form>
 -->

				<%-- <form id="pwForm" action="../member/update_pw" method="post">	
					<input type="hidden" name="mid" value="${ member.mid }">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="mpw" name="mpw" type="password" required>
					</p>
					
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="mpw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit"  class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					</p>
					</form>  --%>


				<br />
			</div>
		</div>
	</div>

</body>
</html>

