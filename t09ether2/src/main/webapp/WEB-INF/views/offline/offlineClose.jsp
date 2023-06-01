<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 오프라인 공구 종료 -->
<style>
	 #view, #view2, #viewParty ,#view3 {
      list-style:none;
   }
   #view li:first-child{
      font-size:30px;
      float:left;
      width:75%;
      padding:15px;
   }
   #view li:nth-child(2){
      float:right;
      width:13%;
      padding-top:30px;
   }
   #view{
      height:75px;
      margin-bottom:40px;
      border-top:1px solid #ddd;
      border-bottom:1px solid #ddd;
   }
   #view2{
      margin:10px 0;
      padding:0;
      height:90px;
      border-top:1px solid #ddd;
      border-bottom:1px solid #ddd;
   }
   #view2 li{
      float:left;
      width:15%;
      border-right:1px solid #ddd;
      border-left:1px solid #ddd;
      line-height:40px;
      height:90px;
      padding: 8px;
      text-align:center;
   }
   #view2 li:nth-child(3){
      width: 40%;
   }
   #viewParty{
      text-align:center;
      margin:auto;
      padding:0;
      height:90px;
      border-bottom:1px solid #ddd;
   }
   #viewParty li{
      display:inline-block;
      width:20%;
      line-height:40px;
      height:20px;
      padding: 8px;
      text-align:center;
   }
   #view3 {
      border: 1px solid #ddd;
      height:500px;
      margin: 0;
      padding: 0 32px;
   }
   
   #view3 li {
       text-align:left;
       margin:32px 0 16px 0;
   }
.scrollspy-example bg-light p-3 rounded-2 {
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.scrollspy-example bg-light p-3 rounded-2::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

thead tr th, tbody{
      text-align:center;
   }
   .theader{
   text-align:center !important;
   }

</style>
<script>
	
</script>
	<!-- Header-->
	<header class="bg-tomato py-5" style="background-image:url('<%=request.getContextPath() %>/resources/images/test_banner.jpg'); background-size: 107% 100%">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">	        	
	        	<h1 class="display-4 fw-bolder" style="color:#FFF">공동구매가 종료되었습니다</h1>	          
	        	<h3 style="color:#FEE8B0">만족스러우셨나요? 같이 참여한 사람들에 대한 리뷰를 남겨보세요!</h3>
	        </div>
	    </div>
	</header>
	
<section id="main" class="container">
   <ul id="view" class="major">
      <!-- <li>원글번호</li>
      <li>${dto.off_no }</li>
      <hr/> -->
      <li>${dto.off_subject }</li>
      <li>${dto.writedate }</li>
   </ul>
   <section>
      <ul id="view2">
         <li>공구장 <br/>${dto.userid}</li>
         <li>현재인원/모집 인원 <br/>${dto.current_num}/${dto.group_num}</li>
         <li>만남장소 <br/>${dto.location}</li>
         <li>약속시간 <br/>${dto.app_time}</li>
         <li>모집마감일 <br/>${dto.deaddate}</li>
      </ul>
   </section>
   <section>
         <ul id="viewParty">
            <li>공구원</li><br/>
               <c:forEach var="bDTO" items="${list}">
                  <li>${bDTO.userid}<c:if test="${bDTO.userid==dto.userid}">(방장)</c:if></li>
               </c:forEach>
         </ul>
      
   </section>
</section>

<div style="margin:50px 200px;">
 <div class="row">
	<div class="card mb-4">
       <div class="card-header"><div>리뷰를 작성해보세요!</div></div>
       <div class="card-body" style="height:300px">
		<div style="overflow-y: scroll; width: 100%; height: 250px; padding: 10px;">	
		<table>
			<tr class="theader">
			    <th>번호</th>
			    <th>아이디</th>
			    <th>이름</th>
			    <th>연락처</th>
			    <th>리뷰보기</th>
			    <th>리뷰쓰러가기</th>
			    <th>신고하기</th>
			</tr>	
					  
				<c:forEach var="opDTO" items="${list}" varStatus="status">
					<tr class="infoDetail">
					<c:if test="${opDTO.userid != logId}">
						<td style="text-align:center;">${status.count}</td>
						<td>${opDTO.userid}<c:if test="${opDTO.userid==dto.userid}">(방장)</c:if></td>
						<td>${opDTO.username}</td>
						<td>${opDTO.tel}</td>
						<td>
							<a class="btn btn-outline-dark mt-auto" href ="offlineInfo?userid=${opDTO.userid}" class="info" style="color:white;"><b>리뷰보기</b></a>
						</td>
						<td class="tdReview">	
							<form method="post" action="offlineReview" id="offlineReview">
								<input type="hidden" name="off_no" value="${dto.off_no}"/>	
								<input type="hidden" name="target_id" value="${opDTO.userid}"/>			
								<input type="submit" name ="review "value="리뷰작성" class="reviewButton"/>
							</form>	
						</td>
						<td>
							<form method="post" action="offlineReport" id="offlineReport">
								<input type="hidden" name="off_no" value="${dto.off_no}"/>	
								<input type="hidden" name="target_id" value="${opDTO.userid}"/>			
								<input type="submit" name ="review "value="신고" class="reportButton"/>
							</form>	
						</td>

					</c:if>
					</tr>					

				</c:forEach>
				
		</table>
		</div>
		</div>
	</div>
</div>
</div>
