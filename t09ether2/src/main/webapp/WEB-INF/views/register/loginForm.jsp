<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 카카오 스크립트 -->
<script>
Kakao.init('8eb7bc1501b18bca203ea80145d3d9ba'); // 반드시 본인꺼 쓰세요!!!!
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
             console.log(response);
             alert(response);
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
/*
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
           console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
*/


</script>
<style>
   header, footer { 
      display: none;
   }
   h2 {
       color:tomato; 
       font-size:45px; 
       text-align:center;
   }
   #wrapper {
     display: grid;
     place-items: center;
     min-height: 100vh;
   }
   #logFrm input{
      margin:0 auto;
      width:70%;   
   }
   #logFrm div{
      width: 580px;
      height: 330px;
      border: 1px solid #ddd;
      margin: 0 auto;
      padding: 0;
      position:relative;
   }
   #logFrm ul{
      width: 700px;
      height: 400px;
      margin-left:-370px;
      margin-top:-185px;
      left:50%;
      top:50%;
      position:absolute;
   }
   #logFrm li:first-child {
      margin:65px 0 0 0;
   }
   
   #logFrm li:nth-child(5n) {
      padding-bottom:20px;
   }
   
   #logFrm li {
      padding-bottom:18px;
      text-align:center;
      list-style:none;
      margin: 0 auto;   
   }
   #threestyle {
      font-size:13px;
      width:80%;
      margin:0 auto;
      padding:20px;
      text-align:center;
      word-spacing: 80px;
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

<div class="container" id="wrapper">
   <div>
   <section id="main" class="container" style="padding:0;">
      <div style="margin:0 auto;">
         <h2><a href="<%=request.getContextPath()%>">t09ether</a></h2><br/>
      </div>
   </section>
   <form method="post" action="loginOk" id="logFrm">
   <div>
      <ul>
         <li><input type="text" name="userid" id="userid" placeholder="t09ether 아이디"/></li>
         <li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호"/></li>
         <li><input type="submit" value="LOGIN"/></li>
         <!-- <li style="font-size:13px;">───────────────── 또는 ─────────────────</li> -->
         <!-- <li onclick="kakaoLogin();"> 
      <a href="javascript:void(0)">-->
          <!-- <li><img src="resources/images/kakao_login.png" onclick="kakaoLogin()" alt=""/></li> -->
      <li id="threestyle" >
         <a href="join">회원가입</a>
         <a href="<%=request.getContextPath() %>/idSearchForm">아이디찾기</a>
         <a href="pwdSearchForm">비밀번호찾기</a>
      </li>   
      </ul>
   </div>
   </form>
   </div>
</div>