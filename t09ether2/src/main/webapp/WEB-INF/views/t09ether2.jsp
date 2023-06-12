<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
   thead tr th, tbody{
      text-align:center;
   }
</style>
<!-- Banner -->
            <section id="banner">
               <h2>t09ether</h2>
               <p>온/오프라인 공동구매 서비스</p>
               <ul class="actions special">
                  <c:if test="${logStatus != 'Y' }">
                  <li><a href="<%=request.getContextPath()%>/join" class="button primary">회원가입</a></li>
                  </c:if>
                  <!-- <li><a href="#" class="button">더 알아보기</a></li> -->
               </ul>
            </section>

         <!-- Main -->
            <section id="main" class="container">

               <section class="box special">
                  <header class="major">
                     <h3 style="line-height:50px">동네 이웃과 함께 하는 공구생활</h3>
                     <h1 style="color:tomato;">t09ether</h1>
                     <p>묶음으로는 너무 많고, 조금 사기에는 너무 비싼가요?<br/>
                        t09ether에서 함께 구매할 이웃을 찾아보세요
                     </p>
                  </header>
               </section>
               
               <div class="row">
                  <div class="col-6 col-12-narrower">

                     <section class="box special">
                        <span class="image featured"><img src="<%=request.getContextPath()%>/resources/images/home_test3.jpg" alt="image" /></span>
                        <h3 style="line-height:50px; margin-bottom:30px;">온라인 공동구매</h3>
                        <p style="color:gray; margin-bottom:30px; font-size:1.2em">t09ether가 준비한 상품은 어떠세요? <br/>
                        좋은 가격으로 다양한 상품을 준비했어요<br/>
                        공구장 or 공구원이 되어 이웃과 구매해보세요<br/>
                        </p>
                     </section>

                  </div>
                  <div class="col-6 col-12-narrower">

                     <section class="box special">
                        <span class="image featured"><img src="<%=request.getContextPath()%>/resources/images/home_test2.jpg" alt="" /></span>
                        <h3 style="line-height:50px; margin-bottom:30px;">오프라인 공동구매</h3>
                        <p style="color:gray; margin-bottom:30px; font-size:1.2em">
                        혼자 마트가기 힘드세요?<br/>
                        대형 마트에서도 공동구매를 하고 싶으세요?<br/>
                        함께 할 공구메이트를 찾아보세요<br/>
                        </p>
                     </section>
                  </div>
               </div>

               <div class="row">
                  <div class="col-6 col-12-narrower">

                     <section class="box special">
                     <h3 style="line-height:50px; margin-bottom:30px;">온라인 공구 <span style="color:tomato; font-size:28px">등급별 할인</span></h3>
                     <table class="board_list">
                        <thead>
                           <tr>
                              <th>등급</th>
                              <th>필요 점수(점)</th>
                              <th>할인율(%)</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td>1</td>
                              <td>가입즉시</td>
                              <td>-</td>
                           </tr>
                           <tr>
                              <td>2</td>
                              <td>10</td>
                              <td>1</td>
                           </tr>
                           <tr>
                              <td>3</td>
                              <td>30</td>
                              <td>2</td>
                           </tr>
                           <tr>
                              <td>4</td>
                              <td>60</td>
                              <td>3</td>
                           </tr>
                           <tr>
                              <td>5</td>
                              <td>100</td>
                              <td>4</td>
                           </tr>
                        </tbody>
                        <tfoot>
                           <tr>
                              <td colspan="1"></td>
                              <td>공구장 참여 / 리뷰 작성 : +1점 </td>
                           </tr>
                        </tfoot>
                     </table>
                        <p style="color:gray; margin-bottom:30px; font-size:1.2em">온라인 공동구매는 <span style="color:tomato; font-size:19.2px">등급별로 할인율이 달라집니다</span> <br/>
                        <span style="color:tomato; font-size:19.2px">공구장으로 참여하거나 리뷰를 남겨 포인트를 쌓고</span><br/>
                        등급을 올려 더욱 많은 혜택을 누리세요 <br/>
                        </p>
                        <ul class="actions special">
                           <li><a href="<%=request.getContextPath()%>/product/onlineHome" class="button alt">온라인 공구 시작</a></li>
                        </ul>
                     </section>

                  </div>
                  <div class="col-6 col-12-narrower">

                     <section class="box special">
                        <h3 style="line-height:50px; margin-bottom:0;">오프 공구 상세안내</h3>
                        <span class="image featured" style="margin-top:0; margin-bottom:0;"><img src="<%=request.getContextPath()%>/resources/images/home_test4.png" style="width:400px; height:330px; margin:0 auto;" alt="" /></span>
                        <p style="color:gray; margin-bottom:30px; font-size:1.2em">
                        <span style="color:tomato; font-size:19.2px">공구장</span>의 경우 만남 장소, 약속 시간 등을 설정하고<br/>
                        공구 예정인 상품에 대한 정보를 알려주세요<br/>
                        </p>
                        <p style="color:gray; margin-bottom:30px; font-size:1.2em">
                        <span style="color:tomato; font-size:19.2px">공구원</span>으로 참여할 경우 참여할 공구에 대한 정보를 확인하고<br/>
                        다른 공구원과 소통하면서 일정을 조율해보세요<br/>
                        </p>
                        <ul class="actions special">
                           <li><a href="<%=request.getContextPath()%>/offline" class="button alt">오프라인 공구 시작</a></li>
                        </ul>
                     </section>
                  </div>
               </div>
            </section>
