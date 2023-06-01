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
	#onlineGBForm ul{
		overflow:auto; 
		padding:20px;
		
	}
	#onlineGBForm li{
		
		margin:3px ; 
		padding:3px 0;	
		list-style:none;
		
	}
	
	#firstul li>:nth-child(2n){
		float:left;
	}
	
	#addr, #shareaddr{
 		width:76%;
 		float:left;
 	}
 	
	#shareaddrDetail{
		width:87%;
	}
	
	#lastsubmit{
		width:150px;
        margin:0 auto;
		display:block;
	}
	
	#test{
		float:left;
	}
	#on_count, #pro_price, #ord_amount, #o_price{
		text-align:center;
	}
	
	
	.card-img-top{
		width: 400px;
  		height: 400px;
  		
	}
	#plus, #minus{
		text-align:center;
		
		height:30px;
	}
</style>
<script>
	$(function(){
		$("#ord_amount").ready(function(){
		    var num = document.getElementById("ord_amount").value
		    num = Math.floor(num/10)*10;
		    document.getElementById("ord_amount").value = num;
	    });
		
		$("#o_price").ready(function(){
		    var num = document.getElementById("o_price").value
		    num = Math.floor(num/10)*10;
		    document.getElementById("o_price").value = num;
	    });
		
		$("#plus").click(function(){
			var pro_total = parseInt(document.getElementById("pro_total").value);
			var cnt =  parseInt(document.getElementById("ord_count").value);
			if(cnt<pro_total){
				var c_cnt = document.getElementById("ord_count").value = cnt + 1;
				var num =  parseInt(document.getElementById("o_price").value);
				var total = (num*c_cnt);
				document.getElementById("ord_amount").value = total;
				document.getElementById("rest_count").value = parseInt(document.getElementById("rest_count").value) - 1;
			}
		});
		
		$("#minus").click(function(){
			var pro_total = parseInt(document.getElementById("pro_total").value);
			var cnt =  parseInt(document.getElementById("ord_count").value);
			if(cnt>1){
				var c_cnt = document.getElementById("ord_count").value = cnt - 1;
				var num =  parseInt(document.getElementById("o_price").value);
				var total = (num*c_cnt);
				document.getElementById("ord_amount").value = total;
				document.getElementById("rest_count").value = parseInt(document.getElementById("rest_count").value) + 1;
			}
		});
		
		$("#shareaddrSearch").click(function kakaopost() {
		      new daum.Postcode({
		        oncomplete: function (data) {
		          var addressCompany = data.address;
		          document.getElementById("shareaddr").value = addressCompany; // 주소 넣기
		          document.querySelector("input[name=sharedetail]").focus(); //상세입력 포커싱
		        }
		      }).open();
		});
		
		
		
		//유효성 검사
		$("#onlineGBForm").submit(function() {
			//event.preventDefault();
			if($("#shareaddr").val()=="") {
				alert("나눔주소를 입력하세요.");
				return false;
			}
			
			if($("#sharedetail").val()=="") {
				alert("나눔상세주소를 입력하세요.");
				return false;
			}
			
			
			//form태그의 action속성 설정
			$("#onlineGBForm").attr("action","<%=request.getContextPath() %>/order/paytestInfo");
			
			
			
		});
	});
		
</script>
<div class="container">
	<section id="main" class="container">
		<header>
			<h2>온라인 공동구매 생성</h2>
			<p>주문 상품</p>
		</header>
	</section>

		<div class="container" style="margin-bottom:50px;">
        <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-6">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                        <img src="${dto.image }" alt="${dto.pro_name }" />
                    </div>
                </div>
                <!-- Side widgets-->
                
                <div class="col-lg-6">
                    <!-- Search widget-->
                    <div class="card mb-4">
                    	<form method="post" id="onlineGBForm">
						
						<ul id="firstul">
							<!-- 상품이미지가져와야함 -->
							<li><input type="hidden" name="pro_code" id="pro_code" value="${dto.pro_code }"/></li>
							<li>상품명</li>
							<li><input type="text" name="pro_name" id="pro_name" value="${dto.pro_name }" readonly></li> <!-- 상품명가져와야함 -->
							<li>가격</li>
							<li><input type="number" name="pro_price" id="pro_price" value="${dto.pro_price }" readonly/> 원</li> <!-- 가격가져와야함 -->
							<li>개당가격</li>
							<li><input type="number" name="o_price" id="o_price" value="${dto.pro_price/dto.pro_total}" readonly/> 원</li> <!-- 가격가져와야함 -->
							<li>구매수량</li>
							<li><input type="hidden" name="pro_total" id="pro_total" value="${dto.pro_total }"/></li> 
							<li><input type="hidden" name="on_count" id="on_count" value="${dto.pro_total }"/></li> 
							<li>
								<input type="button" name="plus" id="plus" value="+"/>
								<input type="number" name="ord_count" id="ord_count" min="1" max="${dto.pro_total }" value="1" readonly/>
								<input type="button" name="minus" id="minus" value="-"/>
							</li>
							<li>전체 가격 </li>
							<li><input type="number" name="ord_amount" id="ord_amount" value="${ (dto.pro_price/dto.pro_total)}" readonly/> 원</li>
							
							<li>만남 주소</li>
							<li>
								<input type="text" id="shareaddr" name="shareaddr" value="" placeholder="나눔주소입력" onfocus="this.placeholder=''" readonly/>
								<input type="button" value="주소찾기" id="shareaddrSearch"/>
							</li>
							<li><input type="text" name="sharedetail" id="sharedetail" value="" placeholder="나눔상세주소입력" onfocus="this.placeholder=''"/></li>
							<li><input type="hidden" name="rest_count" id="rest_count" value="${dto.pro_total-1 }"/></li>
								
					</ul>
					<input type="submit" value="등록하기" id="lastsubmit"/>
                    </form>
                    </div>		    							                     
                  </div>  
              </div>
            </div>
</div>