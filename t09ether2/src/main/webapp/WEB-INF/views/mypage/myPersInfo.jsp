<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<style>
	#joinForm ul{
 		overflow:auto;
	}
	#joinForm li {
 		float:left;
 		text-align:center;
		width:20%; 
		padding:10px 0; 
 		/*border-bottom:1px solid #ddd;*/
		line-height:40px;
		list-style:none;
	}
 	#joinForm li:nth-child(2n) { 
 		width:80%;
 		z-index:10; 
 	} 
 	#joinForm li:last-child { 
 		width:100%;
 	}
 	#nothankyou ul{
 		list-style:none;
 		hidden;
 	} 
 	#addr{
 		width:80%;
 	}
</style>
<script>
	function check(){
		//전화번호 010-1234-5678
		var tel = $("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val();
		reg = /^(010|02|031|041|051)-[0-9]{3,4}-[0-9]{4}$/
		if(!reg.test(tel)) {
			alert("전화번호를 잘못 입력했습니다.");
			return false;
		}
		//이메일
		// 아이디 6~15글자 까지, @, aaa.co.kr, aaa.com, aaa.net, aaa.go.kr
		//									 ()? -> 있어도 되고 없어도 되고
		reg = /^\w{6,15}@[a-zA-Z]{2,8}[.][a-z]{2,5}(.[a-z]{2,5})?$/
		if(!reg.test($("#email").val())) {
			alert("이메일을 잘못 입력했습니다.");
			return false;
		}

	}

	$(function() {		
		$("#zipcodeSearch").click(function findDaumPostcode() {
			      new daum.Postcode({
			        oncomplete: function (data) {
			          var zoneCodeCompany = data.zonecode;
			          var addressCompany = data.address;
			          document.getElementById("txtPostCodeC").value = zoneCodeCompany; // zipcode
			          document.getElementById("txtAddressC").value = addressCompany; // 주소 넣기
			          }
			      }).open();
		});
		
		//유효성 검사
		$("#joinForm").submit(function() {
			
			//if 비밀번호 바꿀때랑 안바꿀때로 구분
			
			
			var reg = /^[A-Za-z]{1}\w{7,14}$/
			
			
			//비밀번호 검사	
			if($("#userpwd").val()==""){
				
				check();
				
				$("#joinForm").attr("action","psInfoEditOk1");
				
			}else{
				if($("#userpwd").val()!="${dto.userpwd}"){
					alert("현재 비밀번호가 일치하지 않습니다.");
					return false;
				}
				
				if($("#userpwd1").val() != $("#userpwd2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				
				check();
				

				//form태그의 action속성 설정
				$("#joinForm").attr("action","psInfoEditOk2");
			}
		});
	});
</script>
</head>
<body>
<section id="main" class="container">
					<header>
						<h2>회원정보 수정</h2>
						<p> </p>
					</header>
<div class="container">
	<form method="post" id="joinForm">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" minlength="8" maxlength="15" value="${dto.userid }"readonly/>
				<input type="hidden" id="idStatus" value="N"/>
			</li>
			
			<li>현재 비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15" placeholder="비밀번호 수정을 원할 경우에만 입력하세요."/></li>
			
			<li>새 비밀번호</li>
			<li><input type="password" name="userpwd1" id="userpwd1" minlength="8" maxlength="15" placeholder="새 비밀번호를 입력해주세요.(8~15자)"/></li>
			
			<li>새 비밀번호확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2" placeholder="확인을 위해 새 비밀번호를 다시 입력해주세요." /></li>
			
			<li>이름</li>
			<li><input type="text" name="username" id="username" minlength="2" maxlength="10" value="${dto.username }" readonly/></li>
			
			<li>연락처</li>
			<li>
				<select style="width:13%; float:left; margin:0;" name="tel1" id="tel1">
					<option value="010" <c:if test="${dto.tel1=='010'}">selected</c:if>>010</option>
					<option value="02" <c:if test="${dto.tel1=='02'}">selected</c:if>>02</option>
					<option value="031" <c:if test="${dto.tel1=='031'}">selected</c:if>>031</option>
					<option value="041" <c:if test="${dto.tel1=='041'}">selected</c:if>>041</option>
					<option value="051" <c:if test="${dto.tel1=='051'}">selected</c:if>>051</option>
				</select> 
				<input style="width:43.5%; float:left; margin:0;" type="text" name="tel2" id="tel2" maxlength="4" value="${dto.tel2 }" />
				<input style="width:43.5%; float:left; margin:0;" type="text" name="tel3" id="tel3" maxlength="4" value="${dto.tel3 }" />		
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" value="${dto.email }"/></li>
			<li>우편번호</li>
			<li>
				<input style="width:78%; float:left; margin:2px;" type="text" name="zipcode" id="txtPostCodeC" value="${dto.zipcode }"/>
				<input style="width:20%; float:right; margin:2px;" type="button" value="우편번호찾기" id="zipcodeSearch"/>
			</li>
			<li>주소</li>
			<li><input type="text" name="addr" id="txtAddressC" value="${dto.addr }"/></li>
			<li>상세주소</li>
			<li><input type="text" name="addrdetail" value="${dto.addrdetail }"/></li>

			<!-- 등급 -->
			<li>등급</li>
			<li><input type="text" name="rank" id="rank" value="${dto.rank }" readonly/><li>
			<br/><br/>

			<li><input type="submit" value="회원정보수정"/></li>
		</ul>
	</form>
</div>
</section>
</body>
</html>