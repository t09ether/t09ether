<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>

</script>
<style>
   #wrappertwo {
      display: grid;
      place-items: center;
      min-height: 10vh;
   }
   
   #searchForm{
      text-align:center;
   }
   #searchKey, #searchWord, #search{
      display:inline-block;
   }
   #searchKey { /*제목임*/
      width:15%;
      margin: auto;
   }
   #searchWord { /*검색칸*/
      width:40%;
      margin: auto;
   }
   .searchDiv{
      padding:10px;
      text-align: center;   
      width:100%;   
   }
   .pagingDiv li{
      float:left;
      padding: 10px 20px;
      list-style: none;
   }
   .pagingDiv a:link, .pagingDiv a:hover, .pagingDiv a:visited{
      color:#000;
   }
   .pagingDiv ul{
      margin:0 auto;
   }
   .rate{background: url(https://aldo814.github.io/jobcloud/html/images/user/star_bg02.png) no-repeat;width: 121px;height: 20px;position: relative;}
   .rate span{position: absolute;background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);width: auto;height: 20px;}
   .rankinfo{
      color:tomato;
      font-size:1.2em;
   }

</style>
<!-- Header-->
<header class="bg-tomato py-5" style="background-image:url('<%=request.getContextPath() %>/resources/images/test_banner.jpg'); background-size: 107% 100%">
   <div class="container px-4 px-lg-5 my-5">
      <div class="text-center text-white">
           <h1 class="display-4 fw-bolder" style="color:#7d7b7a">온라인 공동구매</h1>
            <p style="color:#7d7b7a" >공동구매를 시작하거나 참여해보세요.</p>

             <c:choose>
            <c:when test = "${logStatus!='Y'}">
               <span class="rankinfo">로그인을 하시면 등급별로 할인받으실 수 있습니다.</span>
            </c:when>
            <c:otherwise>
               <c:choose>
               <c:when test="${logRank > 1}"><span class="rankinfo">${logName }님, 현재 ${logRank }등급으로 ${logRank-1 }% 할인이 전품목 적용됩니다.</span></c:when>
               <c:otherwise><span class="rankinfo">${logName }님, 현재 ${logRank }등급으로 할인이 적용되지 않는 등급입니다!<br/>공구장이 되거나 리뷰를 써서 등급을 올려 할인받으세요!</span></c:otherwise>
               </c:choose>
               
            </c:otherwise>
         </c:choose>

        </div>
    </div>
</header>

<!-- Section-->
<section class="py-5">


   <c:if test="${vo.searchWord!=null}">
      <input type="hidden" name="searchKey" value="${vo.searchKey }"/>
      <input type="hidden" name="searchWord" value="${vo.searchWord }"/>
   </c:if>
   <div class ="searchDiv">
      <form method="get" id="searchForm" action="onlineHome">
         <select name = "searchKey" id="searchKey">
               <option value="pro_name">상품명</option>
         </select>
         <input type="text" name="searchWord" id="searchWord"/>
         <input type="submit" value="Search" id="search"/>
      </form>
   </div>
   <div class="container px-4 px-lg-5 mt-5">
      <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
           <input type="hidden" name="nowPage" value="${vo.nowPage }"/>
           <!-- 시작번호 설정 -->
         <c:set var="recordNum" value="${vo.totalRecord -(vo.nowPage -1)*vo.onePageRecord }"></c:set>
           <c:forEach var="proDTO" items="${list}">
              <div class="col mb-5">
                  <div class="card h-100">
                      <!-- Product image-->
                       <img class="card-img-top" src="${proDTO.image }" alt="${proDTO.pro_name }" />
                          
                          <!-- Product details-->
                           <div class="card-body p-4">
                              <div class="text-center">
                                  <!-- Product name-->
                                   <h5 class="fw-bolder">${proDTO.pro_name }</h5>
                                   <!-- Product price-->
                                   <!-- 원래 가격 줄그어서 세일 표시하는 스타일
                                   <span class="text-muted text-decoration-line-through">총${proDTO.pro_price }원</span> 
                                   --> 
                                   <div>총&nbsp;<fmt:formatNumber value="${proDTO.pro_price }" maxFractionDigits="0" />&nbsp;원</div>
                                  <div>개당&nbsp;<fmt:formatNumber value="${(proDTO.pro_price/proDTO.pro_total)-(proDTO.pro_price/proDTO.pro_total%10)}" maxFractionDigits="0" />&nbsp;원</div>
                                  <%-- <c:if test="${log }" --%>
                                  <%-- <div>개당&nbsp;<fmt:formatNumber value="${(proDTO.pro_price/proDTO.pro_total)-(proDTO.pro_price/proDTO.pro_total%10)}" maxFractionDigits="0" />&nbsp;원</div> --%>
                               </div>
                               <div style="margin-left:50px">
                                  <div class="rate">
                                <span id="avgRate"style="width:${Math.ceil(proDTO.rateAvg/5*100)}%"></span>
                            </div>
                            <div style="margin-left:25px" >(${proDTO.rateAvg }/5)</div>
                        </div>
                           </div>
                           <!-- Product actions-->
                           <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                              <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="productDetail?pro_code=${proDTO.pro_code }">구매하기</a></div>
                           </div>
                    </div>
               </div>
               <c:set var="recordNum" value="${recordNum-1 }"></c:set>


            </c:forEach>
     <!-- 여기에 있던 코드 잠시 테스트로 인해 뺌 -->
        </div>
    </div>
    <div class="pagingDiv" id="wrappertwo">
            <ul>
               <!-- nowPage -->
               <c:if test="${vo.nowPage==1 }"> <!-- 현재페이지가 첫번째 페이지 일때 -->
                  <li>이전</li>
               </c:if>
               
               <c:if test="${vo.nowPage>1 }"> <!-- 현재페이지가 첫번째 페이지가 아닐때 -->
                  <li><a href="onlineHome?nowPage=${vo.nowPage-1 }<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">이전</a></li>
               </c:if>
               <!-- 페이지번호 -->
               <c:forEach var="p" begin="${vo.startPageNum }" end="${vo.startPageNum+vo.onePageNumCount-1 }">
                  <c:if test="${p <= vo.totalPage }"><!-- 표시할 페이지번호 총페이지수보다 작거나 같을때 페이지번호를 출력한다. -->   
                     <!-- 현재페이지 표시하기 -->
                     <c:if test="${p==vo.nowPage }">
                        <li style="background:#ddd;"> 
                     </c:if>
                     <c:if test="${p!=vo.nowPage }">
                        <li id="sort">
                     </c:if>
                        <a href="onlineHome?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p }</a>
                     </li>
                  </c:if>
               </c:forEach>
               
               <!-- 다음페이지 -->
               <c:if test="${vo.nowPage<vo.totalPage }">
                  <li><a href="onlineHome?nowPage=${vo.nowPage+1 }<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">다음</a></li>
               </c:if>
               <c:if test="${vo.nowPage==vo.totalPage }">
                  <li>다음</li>
               </c:if>
            </ul>
   </div>
</section>