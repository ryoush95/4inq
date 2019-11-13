<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>로그인</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script>
	$(function() {
		$("#find_id_btn").click(function() {
			location.href = '../member/find_id_form';
		})
	});
	$(function() {
		$("#find_pw_btn").click(function() {
			location.href = '../member/find_pw_form';
		})
	});
</script>

<style>

.member {
 font-size: 50px;
 text-shadow: 0 0 10px #666;
 color: #191919;
 margin: 0 auto;
 text-align: center;
 text-transform: capitalize;
 font-family: "맑은 고딕";
 font-style: italic;
}

body {
 font-family: "맑은 고딕";
 font-size: 12px;
}

.form {
 width: 498px;
 height: 250px;
 border-radius: 25px;
 border: 5px double #999;
 margin: 30px auto;
}

.form2 {
 width: 380px;
 min-width: 320px;
 height: 200px;
 margin: 60px auto;
 margin-left:20px;
}

.form3 {
 float: left;
 /*   background:#f00;  */
}

.form3 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;
}

.form4 {
 padding: 0px 0px 0px 70px;
}

#wrap {
 width: 600px;
 height: 500px;
 margin: 0 auto;
}

.clear {
 clear: both;
}

input[type="submit"] {
 float: left;
 /*  display:block; */
 height: 56px;
 width: 85px;
 background: #FFBB00;
 border: none;
 font-family: "맑은 고딕";
}
input[type="button"] {
 height: 30px;
 background: #FFBB00;
 border-radius: 5px;
 width: 120px; 
 font-family:"맑은 고딕";
 margin-top:10px;
 margin-right:20px;
}
input[type="checkbox"] {
 margin-top:20px;
}

</style>

</head>

<%@ include file="../include/header.jsp"%>

<br><br><br><br><br>
<form role="form" method="post" autocomplete="off">
  <div id="wrap">
   <h1 class="member">파밍존 로그인</h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
      <label for="userId">아이디</label> <input type="text" id="mid"
						name="mid" required="required" value="" />
      <div class="clear"></div>
      <label for="userPass">패스워드</label> <input type="password" id="mpw"
						name="mpw" required="required" value="" />
		<c:if test="${msg == false}">
					<p style="color: #f00;">비밀번호를 확인해주세요.</p>
				</c:if>					
     </div>
     <input type="submit" value="Login">
     <div class="clear"></div>
     <div class="form4">
      <div class="clear"></div>
      <br>
 	  <label><input type="button" id="find_id_btn" value="아이디 찾기"></label>
 	  <label><input type="button" id="find_pw_btn" value="비밀번호 찾기"></label>
     </div>
    </div>
   </div>
  </div>
 </form>

<%@ include file="../include/footer.jsp"%>

</body>
</html>
