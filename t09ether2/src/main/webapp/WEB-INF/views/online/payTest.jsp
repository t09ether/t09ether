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
	
	#lastsubmit{
		width:150px;
        margin:auto;
		display:block;
	}
	
	#test{
		float:left;
	}
	#imagetest{
		
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
	var sum;
$(function(){
	var IMP = window.IMP; 

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
   
   #lastsubmit{
      width:150px;
        margin:auto;
      display:block;
   }
   
   #test{
      float:left;
   }
   #imagetest{
      
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
   var sum;
$(function(){
   
      var num = document.getElementById("final_amount").value;
      num = Math.ceil(num);
      var cnt = document.getElementById("ord_count").value;
      sum = (num*cnt)+500;
      
      document.getElementById("final_amount").value = sum;
      

   
   
   
   
   var IMP = window.IMP; 

    IMP.init("imp01658864"); 
    
    var pro_name = document.getElementById("pro_name").value;
    var all_amount = document.getElementById("final_amount").value;;
    var email = document.getElementById("email").value;
    var username = document.getElementById("username").value;
    var tel = document.getElementById("tel").value;
    var addr = document.getElementById("addr").value+" "+ document.getElementById("addrdetail").value;
    var zipcode = document.getElementById("zipcode").value;

    function requestPay() {
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid: "merchant-"+ new Date().getTime(), 
            name : pro_name,
            amount : all_amount,
            buyer_email : email,
            buyer_name : username,
            buyer_tel : tel,
            buyer_addr : addr,
            buyer_postcode : zipcode
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp);
            } else {
                console.log(rsp);
            }
        });
    }
    
    $("#lastsubmit").click(function(){

    	requestPay();
    	
    });
    
});
	
		
</script>



       requestPay();
       
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
      <div>
         <ul id="firstul">
            <li><h3>주문상품</h3></li>
            <!-- 상품이미지가져와야함 -->
            <li><img class="card-img-top" src="${sdto.image }" alt="${sdto.pro_name }" /></li>
            <li>상품명</li>
            <li><input type="text" name="pro_name" id="pro_name" value="${sdto.pro_name }" readonly></li> <!-- 상품명가져와야함 -->
            <li>수량</li>
            <li><input type="number" name="ord_count" id="ord_count" value="${sdto.ord_count }" readonly/></li>
            <li>할인 금액</li>
            <li><input type="number" name="discount_amount" id="discount_amount" value="0" readonly/> 원</li>
            <li>전체 가격 </li>
            <li><input type="number" name="final_amount" id="final_amount" value="${sdto.pro_price/sdto.pro_total}" readonly/> 원</li>
            
            <li><input type="hidden" name="ord_no" id="ord_no" value="${sdto.ord_no} }"/></li>
            <li><input type="hidden" name="delivery_fee" id="delivery_fee" value="500" readonly/></li>
            <li><input type="hidden" name="rank" id="rank" value="${sdto.rank }" readonly/></li>
               
         </ul>
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
         <input type="button" value="결제하기" id="lastsubmit"/>
      </div>
   </form>
</div>

