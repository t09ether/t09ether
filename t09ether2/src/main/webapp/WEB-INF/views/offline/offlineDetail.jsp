<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 오프라인 공구 방(?) -->
<style>
	#view, #view2, #viewParty ,#view3 {
      list-style:none;
   }
   #view li:first-child{
      font-size:30px;
      float:left;
      width:70%;
      padding:15px;
   }
   #view li:nth-child(2){
      float:right;
      width:20%;
      padding-top:30px;
   }
   #view{
      height:75px;
      margin-bottom:40px;
      border-top:1px solid black;
      border-bottom:1px solid black;
   }
   #view2{
      margin:10px 0;
      padding:0;
      height:90px;
      border-top:1px solid black;
      border-bottom:1px solid black;
   }
   #view2 li{
      float:left;
      width:15%;
      border-right:1px solid black;
      border-left:1px solid black;
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
      border-bottom:1px solid black;
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
      border: 1px solid black;
      height:500px;
      margin: 0;
      padding: 0 32px;
   }
   
   #view3 li {
       text-align:left;
       margin:32px 0 16px 0;
   }
	li{list-style-type: none;}
	
	.bg-tomato py-5{
		margin:0;
		padding:0;
	}
	.participantInfo{
		border: none;;
		font-size: 1.5em;
		color:orange;
		text-align: center;
	}	
	.goComment{
		text-align:center;		
	}
	table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	  text-align: center;
	}
	.theader th{
		text-align: center;
	}
	td, th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}

	tr:nth-child(even) {
	  background-color: #ddd;
	}
	tr:nth-child(odd) {
	  background-color: yellow;
	}
	.offlineClose{
		margin:0 auto;
	}
	#closeButton{
		margin:10px auto;
		padding:0;
		width:220px;
		font-size: 1.6em;
		border:1px solid black;
		border-radius: 10px;
		background-color:white;
		color:black;		
	}
	.buttonDiv{
		margin:0 auto;
	}
	.participantInfo{
		margin:0 auto;
		text-align: center;
		
	}
	.participantInfo h2{
		font-size: 2em;
		color: orange;
	}
	.info{
		border-radius : 5px;
		padding:3px 5px;
		background: orange;
		color:white;
	}
	#closeButton{
		margin: 10px auto;
	}
	.buttonDiv{
		margin: 0 auto;
		text-align: center;
	}
</style>
<script>
	refreshList();
	function refreshList(){
		$("#participantList").load(location.href+' #participantList');
	}
</script>
	<!-- Header-->
	<header class="bg-tomato py-5" style="background-image:url('<%=request.getContextPath() %>/resources/images/test_banner.jpg'); background-size: 107% 100%">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">	        	
	        	<h1 class="display-4 fw-bolder" style="color:#FFF">${dto.userid}님의 공동구매</h1>	           
	        	<h3 style="color:orange;">모집이 완료되면 문자로 안내드립니다 즐거운시간되세요!</h3>
	        </div>
	    </div>
	</header>
	
<div class="container">	
<section id="main" class="container">
   <ul id="view" class="major">
      <!-- <li>원글번호</li>
      <li>${dto.off_no }</li>
      <hr/> -->
      <li>${dto.off_subject }</li>
      <li>작성일 : ${dto.writedate}</li>
   </ul>
   <section>
      <ul id="view2">
         <li>공구장 <br/>${dto.userid}</li>
         <li>현재인원/모집 인원 <br/>${dto.current_num}/${dto.group_num}</li>
         <li>만남장소 <br/>${dto.location}</li>
         <li>만남날짜 <br/>${dto.app_time}</li>
         <li>모집마감일 <br/>${dto.deaddate}</li>
      </ul>
   </section>
   <section>
         <ul id="viewParty">
            <li style="color:orange; font-size: 1.3em;">[현재 참여자 정보]</li><br/>
               <c:forEach var="bDTO" items="${list}">
                  <li>${bDTO.userid}<c:if test="${bDTO.userid==dto.userid}">(공구장)</c:if></li>
               </c:forEach>
         </ul>
      
   </section>
   <section class="box special" style="padding:0; margin-top:50px;">
      <ul id="view3">
         <li>${dto.off_content}</li>   
      </ul>
   </section>
   <div class="goComment"><a class="btn btn-outline-dark mt-auto" href="offlineComment?off_no=${dto.off_no}" style="margin:auto auto; padding:30px 10px 10px 10px ;width:300px;height:100px; text-align: center; font-size: 2em;" >일정조율하러가기</a></div>	    
</section>
	
	<div class="participantInfo"><h2>[참가자 상세정보]</h2></div>

	<div id="participantList" >		
		<table>
			<tr class="theader">
			    <th>번호</th>
			    <th>아이디</th>
			    <th>이름</th>
			    <th>연락처</th>
			    <th></th>
			</tr>			  
		<c:forEach var="opDTO" items="${list}" varStatus="status">
			<tr class="infoDetail">			
				<td style="width:6%; text-align:center;">${status.count}</td>
				<td><b>${opDTO.userid}<c:if test="${opDTO.userid==dto.userid}"> (방장)</c:if></b></td>
				<td>${opDTO.username}</td>				
				<td>${opDTO.tel}</td>
				
				<%-- <c:if test="${opDTO.userid != logId}">   
            		<td><a href ="offlineInfo?userid=${opDTO.userid}" class="info" style="color:white;"><b>리뷰보기</b></a></td> --%>

				<c:if test="${opDTO.userid != logId}">	
					<td><a class="btn btn-outline-dark mt-auto" href ="offlineInfo?userid=${opDTO.userid}" class="info" style="color:white;"><b>리뷰보기</b></a></td>

			</c:if>
			</tr>
		</c:forEach>
		</table>
	</div>
	<form method="get" action="offlineClose" class="offlineClose">
		<input type="hidden" name="off_no" value="${dto.off_no}"/>
		<div class="buttonDiv">
				<c:if test="${logStatus=='Y' && logId==firstDTO.userid}">
					<input type="submit" value="모집마감하기" id="closeButton"/>	
				</c:if>			
		</div>
	</form>
</div>