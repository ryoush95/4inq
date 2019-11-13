<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

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
 width: 650px;
 height: 720px;
 border-radius: 25px;
 border: 5px double #999;
 margin: 30px auto;
}

.form2 {
 width: 550px;
 min-width: 400px;
 height: 300px;
 margin: 60px auto;
 margin-left:20px;
}

.form3 {
 float: left;
 /*   background:#f00;  */
}

.form3 label {
 width: 120px;
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

button[type="submit"] {
 float: center;
 /*  display:block; */
 height: 50px;
 width: 600px;
 background: #191919;
 color: #fff;
 border: none;
 font-family: "맑은 고딕";
 font-size: 22px;
}

input[type="button"] {
 height: 30px;
 background: #FFBB00;
 border-radius: 5px;
 border: none;
 width: 120px; 
 font-family:"맑은 고딕";
}

button[type="button"] {
 height: 30px;
 background: #FFBB00;
 border-radius: 5px;
 border: none;
 width: 120px; 
 font-family:"맑은 고딕";
}


input[type="checkbox"] {
 margin-top:20px;
}

</style>


   <title>회원가입</title>
   <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>

<%@ include file="../include/header.jsp"%>

<body>

<form role="form" method="post" autocomplete="off">
  <div id="wrap">
  <br><br><br>
   <h1 class="member">파밍존 회원가입</h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
      <div class="input_area">
         <p>
         <label for="mId">아이디</label>
         <input type="text" id="mid" name="mid" required="required" />                  
         <button type="button" class="idCheck">아이디 확인</button>
         </p>
         <p class ="result">
          <span class="msg">아이디를 확인해주세요</span> 
      </p>
      </div>
      
      <div class="input_area">
         <label for="mPw">패스워드</label>
         <input type="password" id="mpw" name="mpw" placeholder="숫자+영문+특수문자 8자리 이상" required="required" />
         <br>
         <br>
   <label for="mPw2">패스워드 확인</label>
   <input type="password" id="mpw2" name="mpw2" value="1234" required="required" />
         
      </div>
      <br>
      <div class="input_area">
         <label for="name">이름</label>
         <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" required="required" />                  
      </div>
      <br>
      <div class="input_area">
         <label for="email">이메일</label>
         <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요" required="required" />    
         <button type="button" class="emailCheck">이메일 확인</button>
         </p>
         <p class ="resulty">
          <span class="msgy">이메일을 확인해주세요</span> 
      </p>              
      </div>
      <br>
      <!-- <div class="input_area">
         <label for="address">주소</label>
         <input type="text" id="address" name="address" placeholder="주소를 입력해주세요" required="required" />                  
      </div> -->
      <div class="input_area">
      <label for="address">우편번호</label>
      <input type="text" id="sample6_postcode" placeholder="우편번호"> <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	  <br>
	  <label for="address1">주소</label>
	  <input type="text" name="address1" id="sample6_address" placeholder="주소"><br>
	  <br>
	  <label for="address2">상세주소</label>
	  <input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소">
	  <input type="text" name="address3" id="sample6_extraAddress">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
      </div>
      <br>
      <div class="input_area">
         <label for="Phone">연락처</label>
         <input type="text" id="Phone" name="Phone" placeholder="연락처를 입력해주세요" required="required" />                  
      </div>
      
      <br>
      <button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
      </div>
    </div>
   </div>
  </div>
 </form>       

<%@ include file="../include/footer.jsp"%>
   <script> 
   /* id 중복체크 */
$(".idCheck").click(function(){
 
 var query = {mid : $("#mid").val()};
 
 $.ajax({
  url : "/member/idCheck",
  type : "post",
  data : query,
  success : function(data) {
  
   if(data == 1) {
    $(".result .msg").text("이미 사용중인 아이디입니다.");
    $(".result .msg").attr("style", "color:#f00");  
    $("#submit").attr("disabled", "disabled");
   } else {
    $(".result .msg").text("사용 가능");
    $(".result .msg").attr("style", "color:#00f");
    $("#submit").removeAttr("disabled");
   }
  }
 });  // ajax 끝
 $("#mid").keyup(function(){
    $(".result .msg").text("아이디를 확인해주십시오.");
    $(".result .msg").attr("style", "color:#000");
    
    $("#submit").attr("disabled", "disabled");
    
   });

 });
   
   /* 이메일 중복체크 */
$(".emailCheck").click(function(){
	 
	 var query = {email : $("#email").val()};
	 
	 $.ajax({
	  url : "/member/emailCheck",
	  type : "post",
	  data : query,
	  success : function(data) {
	  
	   if(data == 1) {
	    $(".resulty .msgy").text("이미 등록된 이메일입니다.");
	    $(".resulty .msgy").attr("style", "color:#f00");  
	    $("#submit").attr("disabled", "disabled");
	   } else {
	    $(".resulty .msgy").text("사용 가능");
	    $(".resulty .msgy").attr("style", "color:#00f");
	    $("#submit").removeAttr("disabled");
	   }
	  }
	 });  // ajax 끝
	 $("#email").keyup(function(){
	    $(".resulty .msgy").text("이메일을 확인해주세요");
	    $(".resulty .msgy").attr("style", "color:#000");
	    
	    $("#submit").attr("disabled", "disabled");
	    
	   });

	 });
   
   
   
   
 
/* 비밀번호 유효성 검사 */ 
$("#mpw").change(function(){
    checkPassword($('#mpw').val(),$('mid').val());
});
function checkPassword(mpw,mid){
    
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(mpw)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#mpw').val('').focus();
        return false;
    }    
    var checkNumber = mpw.search(/[0-9]/g);
    var checkEnglish = mpw.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#mpw').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(mpw)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#mpw').val('').focus();
        return false;
    }
    return true;
}


$(function(){

   //비밀번호 확인
      $('#mpw2').blur(function(){
         if($('#mpw').val() != $('#mpw2').val()){
             if($('#mpw2').val()!=''){
             alert("비밀번호가 일치하지 않습니다.");
                 $('#mpw2').val('');
                $('#mpw2').focus();
             }
          }
      })        
   });


</script>
</body>
</html>