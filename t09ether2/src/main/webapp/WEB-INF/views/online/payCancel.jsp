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
	#payCancelForm ul{
		overflow:auto; 
		padding:50px;
		
	}
	#payCancelForm li{
		
		margin:5px ; 
		padding:5px 0;	
		list-style:none;
		
	}
	
	#firstul li>:nth-child(2n){
		float:left;
	}
	#test{
		float:left;
	}
	#ord_count, #discount_amount, #final_amount{
		text-align:center;
	}
	
	
	#image{
		width: 500px;
  		height: 500px;
  		margin: 0 auto;
	}
	#buttoncancel{
		text-align: center; 
	}
	
</style>
<script>
	
$(function(){
	
	var imp_uid = document.getElementById("imp_uid").value;
	var merchant_uid = document.getElementById("r_merchant_uid").value;
	var amount = document.getElementById("final_amount").value;
	var ord_no = parseInt(document.getElementById("ord_no").value);
	var total_amount = parseInt(document.getElementById("ord_count").value);
	var on_no = parseInt(document.getElementById("on_no").value);
	/////////////추가
	var ord_count = document.getElementById("ord_count").value;
	
    function payCancel(){
    	$.ajax({
    		  type: 'POST',
    		  url: '<%=request.getContextPath() %>/pay/payCancelOk', // 환불 처리를 위한 URL을 입력합니다.
    		  dataType: 'json',
    		  data: {
    		    imp_uid: imp_uid, // 환불 대상 결제 건의 imp_uid를 입력합니다.
    		    merchant_uid: merchant_uid, // 환불 대상 결제 건의 merchant_uid를 입력합니다.
    		    amount: amount, // 환불할 금액을 입력합니다.
    		    reason: "환불요청", // 환불 사유를 입력합니다.
    		    ord_no: ord_no, // 취소할 주문
    		    total_amount: total_amount, //취소수량
    		    on_no:on_no,  //취소할 공구
    		    ///////추가
    		    ord_count:ord_count //주문수량
    		  },
    		  success: function(response) {
    		    if (response.code === '1') {
    		      alert('환불이 완료되었습니다.');
    		      location.href="<%=request.getContextPath() %>/mypage/myOrder";
    		      // 환불 완료 후 처리할 코드를 입력합니다.
    		    } else {
    		      alert('환불 처리 중 오류가 발생했습니다.');
    		      // 환불 처리 중 오류가 발생한 경우 처리할 코드를 입력합니다.
    		    }
    		  },
    		  error: function(xhr, status, error) {
    		    alert('환불 처리 중 오류가 발생했습니다.');
    		    console.error(xhr.responseText);
    		    console.error(status);
    		    console.error(error);
    		    // 환불 처리 중 오류가 발생한 경우 처리할 코드를 입력합니다.
    		  }
    		});
    }
    
    $("#cancelbutton").click(function(){
    	var answer = confirm("결제를 취소하시겠습니까?");
    	if(answer){
    		payCancel();
    	}else{
    		return false;
    	}
    });
});
	
		
</script>
<div class="container">
	<section id="main" class="container">
		<header>
			<h2>주문 및 결제 취소</h2>
			<p>환불/결제 취소 </p>
		</header>
	</section>

		<div class="container" style="margin-bottom:50px;">
        <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-6">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <img id="image" src="${dto.image }" alt="${dto.pro_name }" />
                    </div>
                </div>
                <!-- Side widgets-->
                
                <div class="col-lg-6">
                    <!-- Search widget-->
                    <div class="card mb-4">
                    	<form method="post" id="payCancelForm">
						
						<ul id="firstul">
							<!-- 상품이미지가져와야함 -->
							<li>상품명</li>
							<li><input type="text" name="pro_name" id="pro_name" value="${dto.pro_name }" readonly></li> <!-- 상품명가져와야함 -->
							<li>수량</li>
							<li><input type="number" name="ord_count" id="ord_count" value="${dto.ord_count }" readonly/></li>
							<li>할인 금액</li>
							<li><input type="number" name="discount_amount" id="discount_amount" value="${dto.discount_amount }" readonly/> 원</li>
							<li>환불 가격 </li>
							<li><input type="number" name="final_amount" id="final_amount" value="${dto.final_amount}" readonly/> 원</li>				
							<li><input type="hidden" name="total_amount" id="total_amount" value="${dto.total_amount} }"/></li>
							<li><input type="hidden" name="ord_no" id="ord_no" value="${dto.ord_no }"/></li>
							<li><input type="hidden" name="on_no" id="on_no" value="${dto.on_no }"/></li>
							<li><input type="hidden" name="imp_uid" id="imp_uid" value="${dto.pay_no }"/></li>
							<li><input type="hidden" name="r_merchant_uid" id="r_merchant_uid" value="${dto.r_merchant_uid}"/></li>		
						</ul>
						<div id="buttoncancel"><input type="button" id="cancelbutton" value="결제취소"/></div>
                    </form>
                    </div>		    							                     
                  </div>  
              </div>
            </div>
</div>
