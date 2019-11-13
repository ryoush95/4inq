<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../views/include/header.jsp"%>

<table>
<li>
<!-- 메인 슬라이드 -->
<head>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
     <style media="screen">
/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{font-family: 'Anton', sans-serif;}


#wrapper{
    width:1583px;
    margin:50px auto;
    height:600px;
    position:relative;
    color:#fff;
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;    
}

#slider-wrap{
    width:1583px;
    height:600px;
    position:relative;
    overflow:hidden;
}

#slider-wrap ul#slider{
    width:100%px;
    height:100%;
    
    position:absolute;
    top:0;
    left:0;     
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:1583px;
    height:600px;   
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;   
}

#slider-wrap ul#slider li > div span{
    font-family: Neucha, Arial, sans serif;
    font-size:21px;
}

#slider-wrap ul#slider li img{
    display:block;
    width:100%;
  height: 100%;
}


/*이전 다음 버튼 부분*/
.btns{
    position:absolute;
    width:50px;
    height:160px;
    top:40%;
    margin-top:-25px;
    line-height:57px;
    text-align:center;
    cursor:pointer;
    background:rgba(0,0,0,0.1);
    z-index:100;
        
    -webkit-user-select: none;  
    -moz-user-select: none; 
    -khtml-user-select: none; 
    -ms-user-select: none;
    
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    -ms-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.btns:hover{
    background:rgba(0,0,0,0.3); 
}


/*사진 위에 1/5 부분  */
#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
    top: 30px; 
    right:35px; 
    width:auto;
    position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*이미지 선택 부분 바*/
#pagination-wrap{
    min-width:20px;
    margin-top:530px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
}

#pagination-wrap ul li{
    margin: 0 4px;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
    opacity:1;
    box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}




/*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 




/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}

     </style>
  </head>
  
  
  <body>
<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
          
          
             <li data-color="#1abc9c">           
<img src="resources/img/slide-img/name1.png">
             </li>

             
             <li data-color="#3498db">
<img src="resources/img/slide-img/name2.png">
             </li>

             
             <li data-color="#9b59b6">
<img src="resources/img/slide-img/name3.png">
             </li>

             
             <li data-color="#34495e">
<img src="resources/img/slide-img/name4.png">
             </li>

             
             <li data-color="#e74c3c">
<img src="resources/img/slide-img/name5.png">
             </li>
             
             
          </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->                 
      </div> 
   </div>
  </body>






  <script type="text/javascript"> 
//current position
  var pos = 0;
  //number of slides
  var totalSlides = $('#slider-wrap ul li').length;
  //get the slide width
  var sliderWidth = $('#slider-wrap').width();


  $(document).ready(function(){
      
      
      /*****************
       BUILD THE SLIDER
      *****************/
      //set width to be 'x' times the number of slides
      $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
      
      //next slide    
      $('#next').click(function(){
          slideRight();
      });
      
      //previous slide
      $('#previous').click(function(){
          slideLeft();
      });
      
      
      
      /*************************
       //*> OPTIONAL SETTINGS
      ************************/
      //automatic slider
      var autoSlider = setInterval(slideRight, 3000);
      
      //for each slide 
      $.each($('#slider-wrap ul li'), function() { 

         //create a pagination
         var li = document.createElement('li');
         $('#pagination-wrap ul').append(li);    
      });
      
      //counter
      countSlides();
      
      //pagination
      pagination();
      
      //hide/show controls/btns when hover
      //pause automatic slide when hover
      $('#slider-wrap').hover(
        function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
        function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
      );
      
      

  });//DOCUMENT READY
      


  /***********
   SLIDE LEFT
  ************/
  function slideLeft(){
      pos--;
      if(pos==-1){ pos = totalSlides-1; }
      $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
      
      //*> optional
      countSlides();
      pagination();
  }

  /************
   SLIDE RIGHT
  *************/
  function slideRight(){
      pos++;
      if(pos==totalSlides){ pos = 0; }
      $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
      
      //*> optional 
      countSlides();
      pagination();
  }

      
  /************************
   //*> OPTIONAL SETTINGS
  ************************/
  function countSlides(){
      $('#counter').html(pos+1 + ' / ' + totalSlides);
  }

  function pagination(){
      $('#pagination-wrap ul li').removeClass('active');
      $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
  }
  

</script>

</li>
</table>
<!-- 메인 슬라이드 End -->




<!-- 상품 안내 이미지  -->

<style>
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin-left:188px;
  margin-right:53px;
  min-width: 280px;
  max-width: 365px;
  width: 100%;
  float:left;
  color: #191919;
  text-align: left;
  font-size: 16px;
  background-color: #ffff;
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 1.1em;
  font-weight: 700;
  letter-spacing: 1px;
  color: #191919;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
</style>


<style>
figure.snip1385 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  float:left;
  margin-right:53px;
  min-width: 280px;
  max-width: 365px;
  width: 100%;
  color: #191919;
  text-align: left;
  font-size: 16px;
  background-color: #ffff;
}
figure.snip1385 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1385 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1385:after,
figure.snip1385 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1385:after {
  content: '';
  background-color: rgba(0, 0, 0, 0);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1385 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1385 h3,
figure.snip1385 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
  
}
figure.snip1385 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1385 p {
  font-size: 1.1em;
  font-weight: 700;
  letter-spacing: 1px;
  color: #191919;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1385 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1385 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1385:hover img,
figure.snip1385.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1385:hover:after,
figure.snip1385.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1385:hover h3,
figure.snip1385.hover h3,
figure.snip1385:hover p,
figure.snip1385.hover p,
figure.snip1385:hover i,
figure.snip1385.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
</style>


<style>
figure.snip1386 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  float:left;
  min-width: 280px;
  max-width: 365px;
  width: 100%;
  color: #191919;
  text-align: left;
  font-size: 16px;
  background-color: #ffff;
}
figure.snip1386 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1386 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1386:after,
figure.snip1386 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1386:after {
  content: '';
  background-color: rgba(0, 0, 0, 0);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1386 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1386 h3,
figure.snip1386 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1386 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1386 p {
  font-size: 1.1em;
  font-weight: 700;
  letter-spacing: 1px;
  color: #191919;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1386 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1386 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1386:hover img,
figure.snip1386.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1386:hover:after,
figure.snip1386.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1386:hover h3,
figure.snip1386.hover h3,
figure.snip1386:hover p,
figure.snip1386.hover p,
figure.snip1386:hover i,
figure.snip1386.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
</style>



<script>
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
</script>



<figure class="snip1384">
  <img src="resources/img/product-img/main1.jpg" alt="sample83" />
  <figcaption>
    <h3>최고기술명인의<br> 유기농 샤인머스켓</h3>
    <p>충청남도 천안<br>
    박용하 생산자.</p>
  </figcaption>
  <a href="/producter/view?n=43"></a>
</figure>


<figure class="snip1385">
<img src="resources/img/product-img/main2.jpg" alt="sample66" />
  <figcaption>
    <h3>사랑하는<br> 내 딸을 위한<br> 무항생제 목장</h3>
    <p>경기도 김포<br>이윤재 생산자.</p>
  </figcaption>
  <a href="/producter/view?n=42"></a>
</figure>


<figure class="snip1386">
<img src="resources/img/product-img/main3.jpg" alt="sample66" />
  <figcaption>
    <h3>손질 완료<br> 싱싱 참볼락</h3>
    <p>경상남도 통영<br>
    박희석  생산자.</p><i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href="/producter/view?n=4"></a>
</figure>


<!-- 상품 안내 이미지  end-->








<%@ include file="../views/include/footer.jsp"%>
