<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   #view3 li>p>span {
       font-size:16px;
   }
   .joinDiv input{
      float: left;
      margin :10px 10px;;
   }
   
   
   .bottomMenu{
      float:left;
      width:100%;


   }
   
   .boardSubMenu {
      float: left;
      margin: 0 0 0 5px;
   }
   .joinDiv{
      margin: 0 0 20px 0;
      width:60%;
      float:right;      
   }
   .joinDiv input{
      float:right;
   }
   .detailButton{
      position: relative;
      top: -40px;   
   }
   .joinButton{
      position: relative;
      top: -8px;   
   }
   .reviewButton{
      position:relative;
      top: -10px;
   }
   .writedate{
      width:30px;
   }

</style>
<script>

   function offlineDel(){
      if(confirm("정말 삭제하시겠습니까?")){
         location.href="offlineDel?off_no=${dto.off_no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>";
      }   
   }
   
   $(function(){
      var userid = '<%=session.getAttribute("logId")%>';   
      console.log("userid="+userid);
      $(".joinButton").click(function(){   
            if(!confirm(userid+"님 공동구매에 참여하시겠습니까?")){
               //아니오 -> 참여안함
               alert("공동구매 참여가 취소되었습니다.");
               return false;
            }else{//예 -> 참여함
               if(${dto.current_num}>=${dto.group_num}){//자리없으면 돌려보내기
                  alert("정원이 가득 찼습니다");
                  return false;
               }   
            }
         });
      });
</script>
<header class="bg-tomato py-5" style="background-image:url('<%=request.getContextPath() %>/resources/images/test_banner.jpg'); background-size: 107% 100%">
   <div class="container px-4 px-lg-5 my-5">
      <div class="text-center text-white">
           <h1 class="display-4 fw-bolder" style="color:#7d7b7a">오프라인 공동구매</h1>
        </div>
    </div>
</header>
<section style="height:30px"></section>
<section id="main" class="container">
   <ul id="view" class="major">
      <!-- <li>원글번호</li>
      <li>${dto.off_no }</li>
      <hr/> -->
      <li>${dto.off_subject }</li>
      <li>작성일: ${dto.writedate}</li>
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
            <li style="color:tomato; font-size: 1.3em;">[현재 참여자 정보]</li><br/>
               <c:forEach var="bDTO" items="${list}">
                  <li>${bDTO.userid}<c:if test="${bDTO.userid==dto.userid}">(공구장)</c:if></li>
               </c:forEach>
         </ul>
      
   </section>
   <section class="box special" style="padding:0; margin-top:50px;">
      <ul id="view3">
         <li style="font-size: m;">${dto.off_content}</li>   
      </ul>
   </section>
   <div class="bottomMenu">

        <!-- 목록,수정,삭제 버튼 / 지금참여하기/리뷰쓰러가기버튼-->
      <div class="boardSubMenu">
            <a class="btn btn-outline-dark mt-auto" href="offline?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord }</c:if> ">목록</a>
            <!-- 작성자와 로그인 아이디 같은경우 수정 삭제 버튼 -->      
         <c:if test="${logId==dto.userid}">
            <a class="btn btn-outline-dark mt-auto" href="offlineEdit?off_no=${dto.off_no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">수정</a>
            <a class="btn btn-outline-dark mt-auto" href="javascript:offlineDel()">삭제</a>
         </c:if>
         <!-- 지금참여하기/리뷰쓰러가기 버튼 -->
      </div>
      
      <div class="joinDiv">   
            <c:if test="${logStatus=='Y'&& dto.status==1}">
               <form method="post" action="offlineJoin" id="offlineJoin">
                     <input type="hidden" name="off_no" value="${dto.off_no}"/>
                     <input type="submit" value="지금참여하기" class="joinButton"/>               
               </form>
            </c:if>
            <!-- 이미 참여되어있는 사람은 상세정보 페이지로 이동할 수 있는 버튼 -->
            <c:forEach var="ids" items="${idList}">
               <c:if test="${nowId==ids && dto.status==1}">
                  <form method="post" action="offlineJoin" id="offlineJoin">
                     <input type="hidden" name="off_no" value="${dto.off_no}"/>
                     <input type="submit" value="공구페이지로 이동" class="detailButton"/>               
               </form>
               </c:if>
               
            </c:forEach>      
            <c:if test="${logStatus=='Y'&& dto.status==2}">
               <form method="get" action="offlineFinished" id="offlineFinished">
                  <input type="hidden" name="off_no" value="${dto.off_no}"/>
                  <input type="submit" value="리뷰쓰러가기" class="reviewButton">
               </form>
               <form method="get" action="offlineComment" id="offlineFinished">
                  <input type="hidden" name="off_no" value="${dto.off_no}"/>
                  <input type="submit" value="일정조율하러가기" class="detailButton"/>
               </form>
               
               
            </c:if>
      </div>
   </div>
</section>

