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
   #idSearch li {
      list-style:none;      
   }
   
</style>
<script>
</script>
<div class="container">
   <div>
      <h1>아이디 찾기</h1>
      <form method="post" id="idSearchForm"  action="/home/register/idSearchOk">
         <ul>
            <li>이름</li>
            <li><input type="text" name="username" id="username" placeholder="회원가입시 입력했던 이름을 입력하세요."/></li>
            <li>이메일</li>
            <li><input type="text" name="email" id="email" placeholder="회원가입시 입력했던 이메일을 입력하세요."/></li>
            <li><input type="submit" value="아이디찾기"/></li>
            <li></li>
            <li></li>
         </ul>
      </form>
   </div>
</div>