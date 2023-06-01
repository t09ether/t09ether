<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
   input::-webkit-outer-spin-button,
   input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
   
   }
   #onlineGBPayForm ul{
      overflow:auto; 
      border:1px solid #ddd;
      padding:50px;
      
   }
   #onlineGBPayForm li{
      
      margin:5px ; 
      padding:5px 0;   
      list-style:none;
      
   }
   
   #firstul li>:nth-child(2n){
      float:left;
   }
   
   #addr, #shareaddr{
       width:80%;
       float:left;
    }
    
   #addrdetail, #shareaddrDetail{
      width:90%;
   }
   #button1{
      float:left;
      color:#red;
   }
   #allbutton{
      margin: auto;
   }
   
   #button1, #button2{
      margin-left:10px;   
      margin-right:10px;
   }
   
   #test{
      float:left;
   }
   #ord_count, #discount_amount, #final_amount{
      text-align:center;
   }
   
   
   .card-img-top{
      width: 400px;
        height: 400px;
        
   }
   #plus, #minus{
      text-align:center;
      width:42px;
      height:35px;
   }
</style>
<script>
$(function(){
   var IMP = window.IMP; 

    IMP.init("imp01658864"); 
    
    var pro_name = document.getElementById("pro_name").value;
    var email = document.getElementById("email").value;
    var username = document.getElementById("username").value;
    var tel = document.getElementById("tel").value;   
    var addr = document.getElementById("addr").value+" "+ document.getElementById("addrdetail").value;
    var zipcode = parseInt(document.getElementById("zipcode").value);
    var discount_amount = parseInt(document.getElementById("discount_amount").value);
   var total_amount = parseInt(document.getElementById("total_amount").value);
   var ord_no = parseInt(document.getElementById("ord_no").value);
   var on_no = parseInt(document.getElementById("on_no").value);
   var image = document.getElementById("image").value;
   var ord_count = document.getElementById("ord_count").value;
   var final_amount = document.getElementById("final_amount").value;
   var rank = parseInt(document.getElementById("rank").value);
   var addrdetail = document.getElementById("addrdetail").value;
   
   switch (rank) {
     case 2:
        discount_amount = Math.floor(final_amount * 0.01);
        var discount = parseInt(discount_amount/10)*10;
        var sum = final_amount - discount;
        final_amount = sum;
        document.getElementById("discount_amount").value = discount;
        document.getElementById("final_amount").value = sum;
       break;
     case 3:
        discount_amount = Math.floor(final_amount * 0.02);
        var discount = parseInt(discount_amount/10)*10;
        var sum = final_amount - discount;
        final_amount = sum;
        document.getElementById("discount_amount").value = discount;
        document.getElementById("final_amount").value = sum;
       break;
     case 4:
        discount_amount = Math.floor(final_amount * 0.03);
        var discount = parseInt(discount_amount/10)*10;
        var sum = final_amount - discount;
        final_amount = sum;
        document.getElementById("discount_amount").value = discount;
        document.getElementById("final_amount").value = sum;
       break;
     case 5:
        discount_amount = Math.floor(final_amount * 0.04);
        var discount = parseInt(discount_amount/10)*10;
        var sum = final_amount - discount;
        final_amount = sum;
        document.getElementById("discount_amount").value = discount;
        document.getElementById("final_amount").value = sum;
       break;
     default:
       // 실행할 코드
       break;
   }
   
   var all_amount = document.getElementById("final_amount").value;
   
    function requestPay() {
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: "t09ether-"+new Date().getTime(), 
            name : pro_name,
            amount : all_amount,
            buyer_email : email,
            buyer_name : username,
            buyer_tel : tel,
            buyer_addr : addr,
            buyer_postcode : zipcode
        }, function (rsp) { // callback

           if (rsp.success) {
              let data = {
                    imp_uid:rsp.imp_uid,
                    final_amount:rsp.paid_amount,
                    r_merchant_uid:rsp.merchant_uid,
                    discount_amount:discount_amount,
                    ord_no:ord_no,
                    total_amount:total_amount,
                    ord_count:ord_count
                    
                 };
                    //결제 검증
                    $.ajax({
                    type:"POST",
                    url:"<%=request.getContextPath() %>/pay/verifyIamport",
                    data: JSON.stringify(data),                   
                    contentType:"application/json; charset=utf-8",
                    dataType:"json",
                    success: function(result) {
                       console.log(result);
                       alert("결제 성공");
                       location.href="/home/online/paymentSucOk";
                            //form에 정보담아 submit
                       
                       //self.close();
                    },
                    error: function(result){
                       alert("결제 실패");
                       console.log(result);
                       orderDelete();
                    }
                 });
                 
                } else {// 결제 실패 시 로직
                 alert("결제 실패");
                 //alert(rsp.error_msg);
                 console.log(rsp);         
                 orderDelete();
                }
           });
    }
    
    
    function orderDelete(){
       let data = {
             pro_name:pro_name,
             image:image,
             ord_count:ord_count,
             final_amount:final_amount,
             discount_amount:discount_amount,
             total_amount:total_amount,
             ord_no:ord_no,
             rank:rank,
             on_no:on_no,
             username:username,
             tel:tel,
             email:email,
             zipcode:zipcode,
             addr:addr,
             addrdetail:addrdetail
            
         };
            //주문 취소
            $.ajax({
            type:"POST",
            url:"<%=request.getContextPath() %>/order/orderDelete",
            data: JSON.stringify(data),                   
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            success: function(result) {
               console.log(result);
               alert("취소 성공");
               location.href="/home/product/onlineHome";
               //self.close();
            },
            error: function(result){
               alert("취소 실패");
               console.log(result);
            }
         });
    }
    function payCancel(){
       
    }
    
    
    $("#lastsubmit").click(function(){
       requestPay();
       
    });
    
    $("#cancelsubmit").click(function(){
       var answer = confirm("취소하시겠습니까?");
       if(answer){
          orderDelete();   
       }else{
          return false;
       }
    });
    
});
   
      
</script>
<div class="container">
   <section id="main" class="container">
      <header>
         <h2>온라인 공동구매 결제하기</h2>
         <p>공동 구매 주문 확인 및 결제 </p>
      </header>
   </section>
   <form method="post" id="onlineGBPayForm" >
      <div class="container" style="margin-bottom:50px;">
         <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-6">

                        <ul id="firstul">

                     <li><h3>주문상품</h3></li>
                     <!-- 상품이미지가져와야함 -->
                     <li><img class="card-img-top" src="${sdto.image }" alt="${sdto.pro_name }" /></li>
                     <li>상품명</li>
                     <li><input type="text" name="pro_name" id="pro_name" value="${sdto.pro_name }" readonly></li> <!-- 상품명가져와야함 -->
                     <li>수량</li>
                     <li><input type="number" name="ord_count" id="ord_count" value="${sdto.ord_count }" readonly/></li>
                     <li>
                              <c:choose>
                                 <c:when test="${sdto.rank==1}">
                                    <b style="color:#ff6347;">${logName }님은 1등급으로 할인이 적용되지 않습니다.</b>
                                 </c:when>
                                 <c:when test="${sdto.rank==2}">
                                    <b style="color:#ff6347;">${logName }님은 2등급으로 1% 할인이 적용됩니다.</b>
                                 </c:when>
                                 <c:when test="${sdto.rank==3}">
                                    <b style="color:#ff6347;">${logName }님은 3등급으로 2% 할인이 적용됩니다.</b>
                                 </c:when>
                                 <c:when test="${sdto.rank==4}">
                                    <b style="color:#ff6347;">${logName }님은 4등급으로 3% 할인이 적용됩니다.</b>
                                 </c:when>
                                 <c:when test="${sdto.rank==5}">
                                    <b style="color:#ff6347;">${logName }님은 5등급으로 4% 할인이 적용됩니다.</b>
                                 </c:when>
                              </c:choose>
                           </li>
                     <li>할인 금액</li>
                     <li><input type="number" name="discount_amount" id="discount_amount" value="0" readonly/> 원</li>
                     <li>전체 가격 </li>
                     <li><input type="number" name="final_amount" id="final_amount" value="${sdto.ord_amount}" readonly/> 원</li>
                     
                     <li><input type="hidden" name="total_amount" id="total_amount" value="${sdto.pro_total} }"/></li>
                     <li><input type="hidden" name="ord_no" id="ord_no" value="${sdto.ord_no }"/></li>
                     <li><input type="hidden" name="rank" id="rank" value="${sdto.rank }" readonly/></li>
                     <li><input type="hidden" name="shareaddr" id="shareaddr" value="${sdto.shareaddr }"/></li>
                     <li><input type="hidden" name="sharedetail" id="sharedetail" value="${sdto.sharedetail }"/></li>
                     <li><input type="hidden" name="on_no" id="on_no" value="${sdto.on_no }"/></li>
                     <li><input type="hidden" name="image" id="image" value="${sdto.image }"/></li>
                        
                  </ul>

                </div>
            <!-- Side widgets-->
                
            <div class="col-lg-6">  
            <ul>         
               <li><h3>주문자</h3></li> 
               <li>주문자명</li> <!-- 주문자명가져와야함 -->
               <li><input type="text" id="username" name="username" value="${sdto.username }" readonly/></li>
               <li>전화번호</li>
               <li><input type="text" id="tel" name="tel" value="${sdto.tel }" readonly/></li>
               <li>이메일</li>
               <li><input type="email" id="email" name="email" value="${sdto.email }" readonly/></li>
            </ul>   
            <ul>   
               <li><h3>배송지</h3></li>
               <li>배송 주소</li>
               <li>
                  <input type="hidden" name="zipcode" id="zipcode" value="${sdto.zipcode }" readonly/>
                  <input type="text" name="addr" id="addr" value="${sdto.addr }" readonly/>
               </li>
               <!-- 상세주소가져와야함 -->
               <li><input type="text" name="addrdetail" id="addrdetail" value="${sdto.addrdetail }" readonly/></li>
            </ul>
            <div id="allbutton">
               <div id="button1">
                  <input type="button" value="취소하기" id="cancelsubmit"/>
               </div>
               <div id="button2">
                  <input type="button" value="결제하기" id="lastsubmit"/>
               </div>
            </div>   
         </div>
      </div>
      </div>
   </form>
</div>
