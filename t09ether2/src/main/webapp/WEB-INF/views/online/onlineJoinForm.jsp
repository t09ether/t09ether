<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
header,footer{
		display:none;
	}
 #restCount{
	font-size:1.5em;
	background:rgba(0,0,0,0.2);
	border-radius:5%;
	
} 

</style>

<script>
	$(function(){
			
		$(document).on('click','#insertbtn',function(){
			/* if(${logStatus=='Y'}){
				
			} */
			
			if($("#ord_count").val()==""){
				alert("수량을 입력하세요.")
				return false;
			}
			var reg = /[0-9]+$/
			if(!reg.test($("#ord_count").val())){
				alert("숫자만 입력 가능합니다.");
				return false;
			}
		
			alert("주문이 진행됩니다.");
			
			function sendPost() {
			    document.joinForm.action = "orderForm";
			    document.joinForm.target = opener.window.orderForm;
			    document.joinForm.submit();
			}
			 
			sendPost();	
			window.close();
		})
		
		
	})
	
	
</script>
		<section id="cta">

					<h2>공구 참여하기</h2>
					<p>수량을 입력시 결제하기가 진행됩니다!</p>
				<form name="joinForm" method="post">
					<div class="row gtr-50 gtr-uniform">
							<div class="col-8 col-12-mobilep">
							
								<p id="restCount">${dto.rest_count}</p>
							
							</div>
							<br/>
							<div class="col-4 col-12-mobilep">
							
								<p id="restCount">남은 수량</p>
						
							</div>
					</div>
		
					<div class="row gtr-50 gtr-uniform">
						<div class="col-8 col-12-mobilep">
							<input name="on_no" value="${dto.on_no }" type="hidden"/>
							<input name="rest_count" value="${dto.rest_count}" type="hidden"/>
							<input name="pro_code" value="${dto.pro_code}" type="hidden"/>
							<input id="ord_count" name="ord_count" class="form-control" type="text" placeholder="수량을 입력하세요" aria-label="수량을 입력하세요" />
						</div>
						<div class="col-4 col-12-mobilep">
							<input type="submit" id="insertbtn" value="입력하기" class="fit" />
						</div>
					</div>
				</form>

		</section>	