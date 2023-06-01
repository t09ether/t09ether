<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.btn{
	width:30%;
	margin:10%;
	float:center;
}
</style>
<div class="container">
	<section id="main" class="container">
		<header>
			<h2>주문 완료</h2>
			<p>주문이 완료되었습니다!<br/><span style="font-size:1.2em;color:#000">[참여/0]</span>이 되면 공구가 성공! <br/>성공시 문자로 알림이 갑니다! <br/>자세한 상황은 마이페이지를 참조하세요!</p>
		</header>
		<div class="row">
		<input class="btn" type="button" value="온라인공구로 가기" onClick="location.href='<%=request.getContextPath()%>/product/onlineHome'"/>
		<input class="btn" type="button" value="마이페이지로 가기" onClick="location.href='<%=request.getContextPath()%>/mypage/myOrder'"/>
		</div>
	</section>
</div>