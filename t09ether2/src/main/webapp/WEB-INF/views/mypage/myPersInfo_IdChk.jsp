<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#logFrm input{
		margin:0 auto;
		width:60%;
	}
	#logFrm div{
		width: 700px;
		height: 400px;
		border: 1px solid #ddd;
		margin: 0 auto;
		padding: 0;
		position:relative;
	}
	#logFrm ul{
		width: 700px;
		height: 400px;
		margin-left:-360px;
		margin-top:-200px;
		left:50%;
		top:50%;
		position:absolute;
	}
	#logFrm li:first-child {
		margin:100px 0 0 0;
	}	
	#logFrm li:nth-child(2n) {
		padding-bottom:30px;
	}
	#logFrm li {
		padding-bottom:15px;
		text-align:center;
		list-style:none;
		margin: 0 auto;
	}
	
	a { 
		text-decoration: none; 
		color: black; 
	}
    a:visited { 
    	text-decoration: none; 
    }
    a:hover { 
    	text-decoration: none;
    }
    a:focus { 
    	text-decoration: none; 
    }
    a:hover, a:active { 
    	text-decoration: none; 
    }
</style>
</head>
<body>
<section id="main" class="container">
	<header>
		<h2>회원정보 확인</h2>
		<p>${username }님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>
	</header>
		<form method="post" action="psInfoEdit" id="logFrm">
			<div>
			<ul>
				<li><input type="text" name="userid" id="userid" value="${userid }" readonly/></li>
				<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호를 입력하세요."/></li>
				<li><input type="submit" value="확인"/></li>
			</ul>
			</div>
		</form>
</section>
</body>
</html>