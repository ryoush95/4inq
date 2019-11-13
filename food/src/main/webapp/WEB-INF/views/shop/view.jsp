<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../include/header.jsp"%>

<style>
table.type01 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    margin : 20px 10px;
}
table.type01 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border: 1px solid #ccc;
}
table.type01 td {
    width: 100px;
    padding: 10px;
    vertical-align: top;
    border: 1px solid #ccc;
}

</style>


<script>
function reviewList(){ 
   var inum =${view.inum};
   $.getJSON("/shop/view/reviewList" + "?n=" + inum, function(data){
      var str ="";
      
      $(data).each(function(){
         
         console.log(data);
         
         var revdate = new Date(this.revdate);
         revdate = revdate.toLocaleDateString("ko-US")
         
         str +="<li data-revnum='" + this.revnum + "'> "
            +"<div class='userInfo'>"
            +"<span class= 'userName'> " + this.name + "</span>"
            +"<span class= 'date'> " + revdate   + "</span></div>"
            +"<div class='reviewContent' >" + this.revcon + "</div>"
            
            +"<c:if test ='${member !=null}'>"
            
            +"<div class = 'reviewFooter'>"
            +"<button type='button' class='modify' data-revnum='"+ this.revnum + "'>수정</button>"
            +"<button type='button' class='delete' data-revnum='"+ this.revnum + "'>삭제</button>"
            +"</div>"
            
            +"</c:if>"
            
            +"</li>"
      });
      
      $("section.reviewList ol").html(str);
      
      console.log(str);
   });
   
}
</script>


<div class="single-product-area section-padding-100 clearfix">
<h1>상품정보</h1>
   <div class="container-fluid">
      <!-- <div class="row">
         <div class="col-12">
            <nav aria-label="breadcrumb">
               <ol class="breadcrumb mt-50">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item"><a href="#">Furniture</a></li>
                  <li class="breadcrumb-item"><a href="#">Chairs</a></li>
                  <li class="breadcrumb-item active" aria-current="page">white
                     modern chair</li>
               </ol>
            </nav>
         </div>
      </div> -->

      <div class="row">
         <div class="col-12 col-lg-7">
            <div class="single_product_thumb">
               <img src="${view.ipicture }">
               <%-- <div id="product_details_slider" class="carousel slide"
                  data-ride="carousel">
                  <ol class="carousel-indicators">
                     <li class="active" data-target="#product_details_slider"
                        data-slide-to="0"
                        style="background-image: url(${view.ipicture});">
                     </li>
                     <li data-target="#product_details_slider" data-slide-to="1"
                        style="background-image: url(img/product-img/pro-big-2.jpg);">
                     </li>
                     <li data-target="#product_details_slider" data-slide-to="2"
                        style="background-image: url(img/product-img/pro-big-3.jpg);">
                     </li>
                     <li data-target="#product_details_slider" data-slide-to="3"
                        style="background-image: url(img/product-img/pro-big-4.jpg);">
                     </li>
                  </ol>
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <a class="gallery_img" href="img/product-img/pro-big-1.jpg">
                           <img class="d-block w-100" src="img/product-img/pro-big-1.jpg"
                           alt="First slide">
                        </a>
                     </div>
                      <div class="carousel-item">
                        <a class="gallery_img" href="img/product-img/pro-big-2.jpg">
                           <img class="d-block w-100" src="img/product-img/pro-big-2.jpg"
                           alt="Second slide">
                        </a>
                     </div>
                     <div class="carousel-item">
                        <a class="gallery_img" href="img/product-img/pro-big-3.jpg">
                           <img class="d-block w-100" src="img/product-img/pro-big-3.jpg"
                           alt="Third slide">
                        </a>
                     </div>
                     <div class="carousel-item">
                        <a class="gallery_img" href="img/product-img/pro-big-4.jpg">
                           <img class="d-block w-100" src="img/product-img/pro-big-4.jpg"
                           alt="Fourth slide">
                        </a>
                     </div>
                  </div>
               </div> --%>
            </div>
         </div>
         <div class="col-12 col-lg-5">
            <div class="single_product_desc">
               <!-- Product Meta Data -->
               <div class="product-meta-data">
                  <div class="line"></div>
                  <p class="product-price">${view.price }</p>
                  <a href="product-details.html">
                     <h6>${view.iname }</h6>
                  </a>
                  <!-- Ratings & Review -->
                  <div
                     class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                     <div class="ratings">
                        <i class="fa fa-star" aria-hidden="true"></i> <i
                           class="fa fa-star" aria-hidden="true"></i> <i
                           class="fa fa-star" aria-hidden="true"></i> <i
                           class="fa fa-star" aria-hidden="true"></i> <i
                           class="fa fa-star" aria-hidden="true"></i>
                     </div>
                     <!-- <div class="review">
                        <a href="#">리뷰작성</a>
                     </div> -->
                  </div>
                  <!-- Avaiable -->
                  <p class="avaibility">
                     <i class="fa fa-circle"></i> 재고있음
                  </p> 
               </div>
               <div class="short_overview my-5">
                  <p><a href="/producter/view?n=${view.pnum }">${view.pname }</a></p>
               </div>

               <div class="short_overview my-5">
                  <p>${view.iintroduce }</p>
               </div>

               <!-- Add to Cart Form -->
               <form class="cart clearfix">
                  <div class="cart-btn d-flex mb-50">
                     <p>수량</p>
                      <div class="quantity" >
                        <span class="qty-minus"
                           onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
                           class="fa fa-caret-down" aria-hidden="true"></i></span> 
                           <input   type="number" class="qty-text" id="qty" step="1" min="1" max="999" name="quantity" value="1"> 
                           <span class="qty-plus"   onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
                           class="fa fa-caret-up" aria-hidden="true"></i></span>
                           
                           <!-- <script>
                              $(".qty-plus").click(function(){
                                 var num = $(".qty-text").val();
                                 var plusNum  = Number(num) +1;
                                 
                                 if(plusNum >= ${max}){
                                    $(".qty-text").val(num);
                                 }else {
                                    $(".qty-text").val(minusNum);
                                 }
                              });
                              $(".qty-minus").click(function(){
                                 var num = $(".qty-text").val();
                                 var plusNum  = Number(num) -1;
                                 
                                 if(plusNum <= 0){
                                    $(".qty-text").val(num);
                                 }else {
                                    $(".qty-text").val(minusNum);
                                 }
                              });
                              
                           </script> -->
                     </div>
                     
                  </div>
                  
                  <button type="button" id="addtocart_btn" value="5"
                     class="btn amado-btn">장바구니</button>
                  <script>
                        $("#addtocart_btn").click(function(){
                           var inum =$("#inum").val();
                           var cartstock =$("#qty").val();
                           
                           var data ={
                                 inum : inum,
                                 cartstock : cartstock
                           };
                           
                           $.ajax({
                              url : "/shop/view/addCart",
                              type : "post",
                              data : data,
                              success : function(result){
                                 
                                 if(result ==1){
                                    alert("카트 담기 성공");
                                    $("#qty").val("1");
                                 } else {
                                    alert("로그인 해주세요");
                                    $("#qty").val("1");
                                 }
                                 
                              },
                              error : function(){
                                 alert("카트 담기 실패");
                              }
                           });
                        });
                     </script>
                  
                     
                     
                  
                  <script>
                        $("#buynow_btn").click(function(){
                           var inum =$("#inum").val();
                           var cartstock =$("#qty").val();
                           
                           var data ={
                                 inum : inum,
                                 cartstock : cartstock
                           };
                           
                           $.ajax({
                              url : "/shop/view/addCart",
                              type : "post",
                              data : data,
                              success : function(result){
                                 
                                 if(result == 1){
                                    $("#qty").val("1");
                                    location.href="/shop/cartList";
                                 } else {
                                    alert("로그인 해주세요");
                                    $("#qty").val("1");
                                 }
                                 
                              },
                              error : function(){
                                 alert("카트 담기 실패");
                              }
                           });
                        });
                     </script>
               </form>

            </div>
         </div>
      </div>
   </div>
</div>



<h2>소감등록</h2>

<div id="reply">

   <c:if test="${member == null }">
      <p>
         후기을 남기려면 <a href="/member/signin"> 로그인 </a> 해주세요
      </p>
   </c:if>
   <c:if test="${member != null }">
      <section class="replyForm">
      
      
      
      
      
      <table class="type01">
         <form role="form" method="post" autocomplete="off">

            <input type="hidden" name="inum" id="inum" value="${view.inum }">


<tr>
<th>
            <div class="input_area">
               <textarea name="revcon" id="revcon" rows="5" cols="95"></textarea>
            </div>
            </th>


<td>
            <div class="input_area">
               <button type="button" id="review_btn"
               style= "background-color:black;
              color:white; widht: 300px
              text-align: center; margin:auto; ">후기 등록</button>

               <script>
                  $("#review_btn").click(function(){
                     var formObj = $(".reviewForm form[role='form']");
                     var inum = $("#inum").val();
                     var revcon = $("#revcon").val();
                     
                     var data = {
                        inum : inum,
                        revcon : revcon
                     };
                     
                     $.ajax({
                        url : "/shop/view/registerReview",
                        type : "post",
                        data: data,
                        success : function(){
                           reviewList();
                           $("#revcon").val("");
                        }
                     });
                  });
               </script>

            </div>
            </td>
            </tr>
         </form>
         </table>
      </section>
   </c:if>

   <section class="reviewList">
      <ol>
         <%-- <c:forEach items="${review}" var="review">
            <li>
               <div class="userInfo">
                  <span class="userName">${review.name}</span> <span class="date"><fmt:formatDate
                        value="${review.revdate}" pattern="yyyy-MM-dd" /></span>
               </div>
               <div class="reviewContent">${review.revcon}</div>
            </li>
         </c:forEach> --%>
      </ol>
      
      <script>
         reviewList()
      </script>
      <script>
      $(document).on("click", ".modify", function(){
         //$(".reviewModal").attr("style", "display:block;");
         $(".reviewModal").fadeIn(200);
         
          var revnum = $(this).attr("data-revnum");
          var revcon = $(this).parent().parent().children(".reviewContent").text();
          
          $(".modal_revcon").val(revcon);
          $(".modal_modify_btn").attr("data-revnum", revnum);
      });
      </script>


      <script>
         $(document).on("click" , ".delete", function(){
            var deleteConfirm=confirm("삭제하시겠습니까?");
            
            if(deleteConfirm){
            
            var data ={revnum : $(this).attr("data-revnum")};
            
            $.ajax({
               url:"/shop/view/deleteReview",
               type : "post",
               data : data,
               success : function(result){
                  if(result ==1){
                  reviewList();
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
<div class="reviewModal">
	<div class="modalContent">

		<div>
			<textarea class="modal_revcon" name="modal-revcon"></textarea>
		</div>

		<div>
			<button type="button" class="modal_modify_btn">수정</button>
			<button type="button" class="modal_cancel">취소</button>
		</div>
	</div>
</div>
<script>
	$(".modal_modify_btn").click(function() {
		var modifyConfirm = confirm("수정하시겠습니까?");

		if (modifyConfirm) {

			var data = {
				revnum : $(this).attr("data-revnum"),
				revcon : $(".modal_revcon").val()
			}; // ReviewVO형태로 데이터생성

			$.ajax({
				url : "/shop/view/modifyReview",
				type : "post",
				data : data,
				success : function(result) {

					console.log(result);
					//result 값에따라 동작
					if (result == 1) {
						
						reviewList();
						$(".reviewModal").fadeOut(200);
					} else {
						alert("본인이 아닙니다.")
					}
				},
				error : function() {
					alert("로그인 하셔야합니다.")
				}
			});
		}
	});
</script>

<script>
	$(".modal_cancel").click(function() {
		//$(".reviewModal").attr("style", "display:none;");
		$(".reviewModal").fadeOut(200);
	});
</script>


<%@ include file="../include/footer.jsp"%>