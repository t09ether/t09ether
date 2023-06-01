<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<style>
	#header,footer {
		display:none;
	}
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
 	#topregi {
 		text-align:center;
 		padding: 50px;
 	}
</style>
<script>
	$(function() {
		//아이디 중복검사하기
		$("input[value=아이디중복검사]").click(function() {
			if($("#userid").val()!="") {
				//			주소,창이름,옵션
				window.open("idCheck?userid="+$("#userid").val(),"chk","width=400, height=300");
			}else {
				alert("아이디를 입력 후 중복검사를 해주세요.");
			
			}
		});
		
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
			    
		//아이디 입력란에 키보드를 입력하면 아이디 중복검사를 초기화해줌
		$("#userid").keyup(function() {
			$("#idStatus").val("N");
		});
		
		//유효성 검사
		$("#joinForm").submit(function() {
			
			if($("#userid").val()=="") {
				alert("아이디를 입력하세요..");
				return false;
			}
			// 아이디 검사
			// 첫번째 문자는 영대소문자, 숫자와 _ 가능
			//var reg = /^[A-Za-z]{1}[A-Za-z_]{7,14}$/
			var reg = /^[A-Za-z]{1}\w{7,14}$/
			
			if(!reg.test($("#userid").val()) ){ //유효한 값이면 true, 잘못된 데이터면 false
				alert("아이디 첫번째 문자는 영어대소문자로 시작해야 하며, \n 영어대소문자, 숫자 가능, 아이디 길이는 8~15글자까지 가능");
				return false;
			}
			if($("#idStatus").val()=="N") {
				alert("아이디 중복검사를 해주세요.");
				return false;
			}
			//비밀번호 검사
			if($("#userpwd").val()=="") {
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if($("#userpwd").val() != $("#userpwd2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			//이름검사
			reg = /^[가-힣]{2,10}$/
			if(!reg.test($("#username").val())) {
				alert("이름은 2글자에서 10글자까지 한글만 가능합니다.");
				return false;
			}
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

			//form태그의 action속성 설정
			$("#joinForm").attr("action","joinOk");
		});
	});
</script>
<div class="container">
<section id="main" class="container">
	<header>
		<h2>회원 가입</h2>
		<p>어서오세요.</p>
	</header>
</section>
	<form method="post" id="joinForm">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" minlength="8" maxlength="15" style="width:80%; float:left;"/>
				<input type="button" value="아이디중복검사" style="float:right;"/>
				<input type="hidden" id="idStatus" value="N"/>
			</li>
			
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15" placeholder="비밀번호는 8자이상 15자 이하로 설정해 주세요"/></li>
			
			<li>비밀번호확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2" placeholder="입력하신 비밀번호를 다시한번 입력해 주세요"/></li>
			
			<li>이름</li>
			<li><input type="text" name="username" id="username" minlength="2" maxlength="10" placeholder="이름은 2자이상 10자 이하로 입력해주세요"/></li>
			
			<li>연락처</li>
			<li>
				<select style="width:13%; float:left; margin:0;" name="tel1" id="tel1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="041">041</option>
					<option value="051">051</option>
				</select> 
				<input style="width:43.5%; float:left; margin:0;" type="text" name="tel2" id="tel2" maxlength="4" value="1234"/>
				<input style="width:43.5%; float:left; margin:0;" type="text" name="tel3" id="tel3" maxlength="4" value="5678"/>		
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" placeholder="이메일은 6자 이상 15자 이하로 입력해 주세요"/></li>
			<li>우편번호</li>
			<li>
				<input style="width:78%; float:left; margin:2px;" type="text" name="zipcode" id="txtPostCodeC"/>
				<input style="width:20%; float:right; margin:2px;" type="button" value="우편번호찾기" id="zipcodeSearch"/>
			</li>
			<li>주소</li>
			<li><input type="text" name="addr" id="txtAddressC" placeholder="우편번호찾기를 눌러 주소를 입력해 주세요"/></li>
			<li>상세주소</li>
			<li><input type="text" name="addrdetail"/></li>

			<!-- 등급 -->
			<li><input type="hidden" name="rank" id="rank" value="1"/><li>

			<!-- 신고당한횟수 -->
			<li><input type="hidden" name="report" id="report" value="0"/><li>
			<!-- 신고당한횟수 -->
			<li><input type="hidden" name="exp" id="exp" value="0"/><li>
			<br/><br/>

			<li><input type="submit" value="회원가입"/></li>
		</ul>
	</form>
</div>