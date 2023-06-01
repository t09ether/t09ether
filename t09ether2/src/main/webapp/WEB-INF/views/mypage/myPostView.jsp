<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		width:15%;
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
	
</style>
<section style="height:30px"></section>
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
						<li>${bDTO.userid}</li>
					</c:forEach>
			</ul>
		
	</section>
	<section class="box special" style="padding:0; margin-top:50px;">
		<ul id="view3">
			<li>${dto.off_content}</li>	
		</ul>
	</section>
		<div class="boardSubMenu">
			<a href="myPost?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord }</c:if> ">목록</a>
		</div>
</section>