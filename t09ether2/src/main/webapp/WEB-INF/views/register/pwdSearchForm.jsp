<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
   header, footer { 
      display: none;
   }
   .container>div{
      width:50%;
      margin:100px auto;
      
   }
   .container li {
      padding:10px;
      list-style:none;
   }
   .container input {
      width:100%;
   }
   
</style>
<script>
$(function() {
   $("#pwdSearch").submit(function() {
      event.preventDefault();
      
      if($("#userid").val()=="") {
         alert("아이디를 입력하세요...");
         return false;
      }
      if($("#email").val()=="") {
         alert("이메일을 입력하세요...");
         return false;
      }
      var url = 'pwdSearchEmailSend';
      var params = $("#pwdSearch").serialize();
      
      $.ajax({
         url : url,
         data : params,
         type : 'POST',
         success:function(result) {
            if(result=='Y') {
               alert("입력하신 이메일로 비밀번호를 전송했습니다.");
               location.href="/home/loginForm";
            }else {
               alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
            }
         },error:function(e) {
            console.log(e.responseText);
         }
      });
   });
});
</script>
<div class="container">
   <div>
      <h1>비밀번호 찾기</h1>
      <form method="post" id="pwdSearch">
         <ul>
            <li>아이디</li>
            <li><input type="text" name="userid" id="userid" placeholder="회원가입시 입력했던 아이디를 입력하세요."/></li>
            <li>이메일</li>
            <li><input type="text" name="email" id="email" placeholder="회원가입시 입력했던 이메일을 입력하세요."/></li>
            <li><input type="submit" value="비밀번호 찾기"/></li>
            <li></li>
            <li></li>
         </ul>
      </form>
   </div>
</div>