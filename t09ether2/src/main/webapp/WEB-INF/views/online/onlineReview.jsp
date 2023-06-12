<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
.card-text{
	font-size:.1.2em;
}
.rate{background: url(https://aldo814.github.io/jobcloud/html/images/user/star_bg02.png) no-repeat;width: 121px;height: 20px;position: relative;}
.rate span{position: absolute;background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);width: auto;height: 20px;}
#price{
	float:right;
	font-size:1.5em;
	margin: 20px 20px;
	padding:5px;
	text-align:right;
	
}
</style>
<script>
$(function(){
	$("#submitRev").on("click", function () {
		event.preventDefault();
		
		let rate = $('#rate').val();

        if(!rate){
            alert("별점을 선택해주세요.");
            $('#rate').focus();
            return false;
        }
        
        if($("#content").val==""){
        	alert("후기를 입력해주세요.");
        	$('#content').focus();
            return false;
        }
       
      //form태그의 action속성 설정
		<%-- $("#reviewForm").attr("action","<%=request.getContextPath() %>/online/reviewOk"); --%>
		let params = $("#reviewForm").serialize();
		console.log(params);
		$.ajax({
			type:"POST",
			url:"<%=request.getContextPath() %>/online/reviewOk",
			data:params,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(result){
				console.log(result); 
				alert('리뷰가 등록되었습니다.');
				location.href="<%=request.getContextPath() %>/online/onlineReview?pro_code="+${dto.pro_code};
			},error:function(error){
				console.log(error.responseText); 
			}
		});//ajax
        
	});
	
	$("#deleteRev").on("click", function () {
		event.preventDefault();
		if(confirm("리뷰를 삭제할까요?")){
			var params = "on_r_no="+ $(this).attr("title");
			console.log(params);
			$.ajax({
				url:"<%=request.getContextPath() %>/online/reviewDel",
				data:params,
				success:function(result){
					console.log(result); 
					if(result>0){
						 alert('리뷰가 삭제되었습니다.');
						 location.href="<%=request.getContextPath() %>/online/onlineReview?pro_code="+${dto.pro_code};
					}
				},error:function(error){
					console.log(error.responseText); 
				}
			});//ajax
		}//if문
		});		
	

		var totalprice=document.getElementById('totalprice').innerHTML; 
		totalprice = Math.floor(totalprice/10)*10; 
		totalprice= totalprice.toLocaleString() 
		document.getElementById('totalprice').innerHTML = totalprice; 
		
		var oneprice=document.getElementById('oneprice').innerHTML; 
		oneprice = Math.floor(oneprice/10)*10; 
		oneprice = oneprice.toLocaleString() 
		document.getElementById('oneprice').innerHTML = oneprice;


});
</script>
<section id="main" class="container">
	<header>
		<h2>상품 리뷰</h2>
		<p>리뷰를 확인해주세요</p>
	</header>
       <div class="row">
       
           <!-- Blog entries-->
           <div class="col-lg-5">
               <!-- Featured blog post-->
               <div class="card mb-6" style="height:850px">
                   <img src="${dto.image }" />
                   <hr/>
	               <p style="margin-left:10px"><h2 class="card-title" style="margin-left:20px">${dto.pro_name }</h2></p>
	               	<div style="margin-left:310px;padding:0 50px">
		               	<div class="rate">
					        <span id="avgRate"style="width:${Math.ceil(rateAvg/5*100)}%"></span>
					    </div>
					    <div style="margin-left:50px">(${rateAvg }/5)</div>
				    </div>
	               <div id="price">
	               
                        <div>총&nbsp;&nbsp;<span id="totalprice">${dto.pro_price }</span>&nbsp;원</div>
	                    <div>개당&nbsp;&nbsp;<span id="oneprice">${dto.pro_price/dto.pro_total }</span>&nbsp;원</div>
	                </div>
	               <p ></p>
	               <br/>
               </div>
               

           </div>
           <!-- Side widgets-->
           <div class="col-lg-7">
               <div class="card mb-6">
              		<div class="card-header">리뷰</div>
              		<div class="card-body"> 
              		                   
                      	<form method="get" id="reviewForm">
                      		<input type="hidden" name="pro_code" value="${dto.pro_code }">
                      		<div>
	                      		<div class="rate">
							        <span style="width:${Math.ceil(rateAvg/5*100)}%"></span>
							    </div>
							    <div style="margin-left:50px">(${rateAvg }/5)</div>
						    </div>
                      		<br/>
                      		<select name="rate" id="rate">
            						<option value="">평점을 선택해주세요★</option>
						     <c:forEach var="i" items="${rating}">
						     	<option value="${i.key}">${i.value}</option>
						    </c:forEach>
            					</select>
            				<c:choose>
	            				<c:when test="${fn:contains(userList, logId) and logStatus == 'Y'}">
	                      		<textarea rows="2" name="content" id="content" placeholder="코멘트를 입력하세요!" ></textarea>
	            					<button type="submit" id="submitRev" style="float:right">리뷰 등록</button>
	            				</c:when>
	            				<c:otherwise>
	            				<textarea rows="2" name="content" id="content" placeholder="상품 구매한 이후, 1회 리뷰 작성 가능합니다!" readonly ></textarea>
	            					<button type="submit" id="submitRev" style="float:right" disabled>리뷰 등록</button>
	            				</c:otherwise>
            				</c:choose>
                      	</form>
                      	<br/>
                      	<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-light p-3 rounded-2" tabindex="0" style="overflow: scroll; width: 100%; height: 520px; padding: 10px;">
                    <table class="table table-stripped" id="reviews">
				    <thead>
				        <tr>
				            <th>Rating</th> <!-- 평점 -->
				            <th>User</th>
				            <th>Text</th>
				            <th>writedate</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach var="i" items="${list}" varStatus="status">
				            <!-- 평점 기준 별표시 출력 -->
				            <tr>
				                <td><c:forEach var="rating" items="${rating}" varStatus="status" begin="1" end="${ i.rate }">★</c:forEach></td>
				                <%-- <td><input type="hidden" name="on_r_no" value="${i.on_r_no }"><td> --%>
				                <td>${i.userid }</td>
				                <td>${i.content }</td>
				                <td>${i.writedate }<c:if test="${logId == i.userid }"><button id="deleteRev" title='${i.on_r_no  }'>X</button></c:if></td>
				               
				            </tr>
				        </c:forEach>
				    </tbody>
				    </table>
					    </div>
                   </div>  
               </div>		    							                     
             </div>
             
            </div>
        </section>