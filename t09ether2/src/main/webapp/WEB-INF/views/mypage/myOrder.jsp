<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#wrapper {
		display: grid;
		place-items: center;
		min-height: 10vh;
	}
	#searchForm{
		text-align:center;
	}
	#searchForm2{
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
	#searchKey2, #searchWord2, #search2{
		display:inline-block;
	}
	#searchKey2 { /*제목임*/
		width:15%;
		margin: auto;
	}
	#searchWord2 { /*검색칸*/
		width:40%;
		margin: auto;
	}
	.searchDiv{
		padding:10px;
		text-align: center;	
		width:100%;	
	}
	.searchDiv2{
		padding:10px;
		text-align: center;	
		width:100%;	
	}
	.paging_div li{
		float:left;
		padding:10px 20px;
		list-style:none;
	}
	.paging_div a:link, .paging_div a:hover, .paging_div a:visited{
		color:#000;
	}
	.paging_div2 li{
		float:left;
		padding:10px 20px;
		list-style:none;
	}
	.paging_div2 a:link, .paging_div2 a:hover, .paging_div2 a:visited{
		color:#000;
	}
	thead tr th, tbody{
      text-align:center;
   }

    #usermain{
      margin:100px;
   }

</style>

<script>
	$(function(){
		$("#searchForm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색어를 입력하세요.");
				return false;
			}
			return true;
		});
		
		$("#searchForm2").submit(function(){
			if($("#searchWord2").val()==""){
				alert("검색어를 입력하세요.");
				return false;
			}
			return true;
		});
		
		
		//--- 전체 선택 클릭하면 체크박스 상태에 따라 선택 또는 해제 하는 기능 구현
		//$("#allCheck").click(function(){
		//	$(".board_list input[name=noList]").prop("checked", $("#allCheck").prop("checked"));
			
		//});
		
		//선택 삭제 버튼 클릭하면
		$("#chooseDel").click(function(){
			// 최소 1개 이상 삭제를 선택했을 때
			
			var checkCount = 0;
			$(".board_list input[name=noList]").each(function(idx, obj){
				if(obj.checked){ //$(obj.prop('checked'))>jquery 근데 안됨..
					checkCount++;
				}
			});
			
			if(checkCount>0){
				if(confirm(checkCount+'개의 글을 삭제 하시겠습니까?')){
					$("#delList").submit();
				}
			}else{
				alert("한 개 이상의 글을 선택 후 삭제 하세요.");
			}
		});
		
	});
</script>
<div id="usermain" class="row">
	<!-- Main -->
	<section id="main" class="container">
		<header>
			<h2>온라인 공구 내역</h2>
			<p>진행중인 내역</p>
		</header>
		<div class="row">
			<div class="col-12">
				<!-- 주문내역 리스트 -->
				
				<section class="box">
					<div class="table-wrapper">
					<form method="post">
					<input type="hidden" name="nowPage" value="${vo.nowPage }"/>
					<c:if test="${vo.searchWord!=null}">
						<input type="hidden" name="searchKey" value="${vo.searchKey }"/>
						<input type="hidden" name="searchWord" value="${vo.searchWord }"/>
					</c:if>
				
						<table class="board_list">
							<thead>
								<tr>
									<th>글번호</th>
									<th>주문번호</th>
									<th>상품명</th>
									<th>공구장</th>
									<th>공구장번호</th>
									<th>주문개수</th>
									<th>주문상태</th>
									<th>주문날짜</th>
									<th>취소</th>
								</tr>
							</thead>
							
							<tbody>
							<c:set var="recordNum" value="${vo.totalRecord-(vo.nowPage-1)*vo.onePageRecord}"/>
							<c:forEach var="bDTO" items="${list}">
								<tr>
									<td>${recordNum}</td>
									<td>${bDTO.ord_no }</td>
									<td>${bDTO.pro_name }</td>
									<td>${bDTO.pd_userid }</td>
									<td>${bDTO.tel }</td>
									<td>${bDTO.ord_count }</td>
									<c:choose>
										<c:when test="${bDTO.status==1 }">
											<td>결제완료</td>
										</c:when>
										<c:when test="${bDTO.status==2 }">
											<td>배송중</td>
										</c:when>
										<c:when test="${bDTO.status==3 }">
											<td>배송완료</td>
										</c:when>
										<c:when test="${bDTO.status==4 }">
											<td>만남완료</td>
										</c:when>
									</c:choose>
									<td>${bDTO.orderdate }</td>
									<c:choose>
										<c:when test="${bDTO.pd_status==1}">
											<td><input type="button" id="payCancel" onclick="location.href='<%=request.getContextPath() %>/pay/payCancel?ord_no=${bDTO.ord_no}'" value="결제 취소"/></td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${bDTO.status==3}">
													<c:choose>
														<c:when test="${bDTO.userid==bDTO.pd_userid }">
														<td><input type="button" id="joinUp" onclick="location.href='<%=request.getContextPath() %>/mypage/joinSuc?on_no=${bDTO.on_no}'" value="만남 완료"/></td>
														</c:when>
														<c:when test="${bDTO.userid!=bDTO.pd_userid }">
															<td>취소불가</td>
														</c:when>
													</c:choose>
												</c:when>
												<c:otherwise><td>취소불가</td></c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</tr>
								<c:set var="recordNum" value="${recordNum-1}"/>	
							</c:forEach>
							</tbody>
							<!--<tfoot>
								<tr>
									<td colspan="2"></td>
									<td>100.00</td>
								</tr>
							</tfoot>  -->
						</table>
					</form>
					</div>
					<!-- 페이징 -->
					<div  id="wrapper">
					<div class="paging_div"> 
						<ul>
							<!-- 이전 페이지 : nowPage를 기준으로 -->
							<c:if test="${vo.nowPage==1}"><!-- 현재 페이지가 첫번째 페이지 일때 -->
								<li></li>
							</c:if>
							<c:if test="${vo.nowPage>1}"><!--  현재 페이지가 첫번째 페이지가 아닐때 -->
								<li><a href="myOrder?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">이전</a></li>
							</c:if>
							<!-- 페이지 번호 -->
							
				         <c:forEach var="p" begin="${vo.startPageNum}" end="${vo.startPageNum+vo.onePageNumCount-1}">
				            <c:if test="${p<=vo.totalPage}"><!-- 표시할 페이지 번호가 총 페이지 수보다 작거나 같을 때 페이지 번호 출력.-->
				               <!-- 현재페이지 표시하기 -->
				               <c:if test="${p==vo.nowPage}">
				                  <li style="background:#ddd;">
				               </c:if>
				               <c:if test="${p!=vo.nowPage}">
				                 <li>
				               </c:if>
				                  <a href="myOrder?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
				                  </li>
				            </c:if>
				         </c:forEach>
							
							<!-- 다음 페이지 -->
							<c:if test="${vo.nowPage<vo.totalPage}"><!-- 다음 페이지가 있을 때 -->
								<li><a href="myOrder?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">다음</a></li>
							</c:if>
							<c:if test="${vo.nowPage==vo.totalPage}"><!-- 다음 페이지가 없을 때 -->
								<li></li>
							</c:if>
						</ul>
					</div>
					<!--검색 -->
					<div class ="searchDiv">
						<form method="get" id="searchForm" action="myOrder">
							<select name = "searchKey" id="searchKey">
								<option value="pro_name">상품명</option>
								<option value="orderdate">주문날짜</option>
							</select>
							<input type="text" name="searchWord" id="searchWord"/>
							<input type="submit" value="Search" id="search"/>
						</form>
					</div>
					</div>
				</section>
			</div>
		</div>
	</section>
	<!-- Main -->
	<section id="main" class="container">
		<header>
			<h2> </h2>
			<p>완료 내역</p>
		</header>
		<div class="row">
			<div class="col-12">
				<!-- 주문내역 리스트 -->
				
				<section class="box">
					<div class="table-wrapper">
					<form method="post">
					<input type="hidden" name="nowPage2" value="${vo2.nowPage2 }"/>
					<c:if test="${vo2.searchWord2!=null}">
						<input type="hidden" name="searchKey2" value="${vo2.searchKey2 }"/>
						<input type="hidden" name="searchWord2" value="${vo2.searchWord2 }"/>
					</c:if>
						<table class="board_list">
							<thead>
								<tr>
									<th>글번호</th>
									<th>주문번호</th>
									<th>상품명</th>
									<th>공구장</th>
									<th>주문개수</th>
									<th>주문상태</th>
									<th>주문날짜</th>
									<th>신고하기</th>

								</tr>
							</thead>
							
							<tbody>
							<c:set var="recordNum2" value="${vo2.totalRecord2-(vo2.nowPage2-1)*vo2.onePageRecord2}"/>
							<c:forEach var="bDTO2" items="${list2}">
								<tr>
									<td>${recordNum2}</td>
									<td>${bDTO2.ord_no }</td>
									<c:choose>
										<c:when test="${bDTO2.status==5 }">
											<td><span class="text-muted text-decoration-line-through">${bDTO2.pro_name }</span></td>
										</c:when>
										<c:otherwise>
										<td>${bDTO2.pro_name }</td>
										</c:otherwise>
									</c:choose>
									<td>${bDTO2.pd_userid }</td>
									<td>${bDTO2.ord_count }</td>
									<c:choose>
										<c:when test="${bDTO2.status==4 }">
											<td>만남완료</td>
										</c:when>
										<c:when test="${bDTO2.status==5 }">
											<td>환불</td>
										</c:when>
										<c:when test="${bDTO2.status==10 }">
											<td>만남완료</td>
										</c:when>
									</c:choose>
									<td>${bDTO2.orderdate }</td>
									<c:choose>
									<c:when test="${bDTO2.status==4}">
										<c:choose>
											<c:when test="${bDTO2.userid==bDTO2.pd_userid }">
												<td>신고불가</td>
											</c:when>
											<c:when test="${bDTO2.userid!=bDTO2.pd_userid }">
												<td><input type="button" id="reportWrite" onclick="location.href='<%=request.getContextPath() %>/mypage/reportWrite?pd_userid=${bDTO2.pd_userid}&ord_no=${bDTO2.ord_no }'" value="공구장신고"/></td>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${bDTO2.status==10}">
											<td>신고완료</td>
									</c:when>
									<c:otherwise>
										<td>신고불가</td>
									</c:otherwise>
									</c:choose>
								</tr>
								<c:set var="recordNum2" value="${recordNum2-1}"/>	
							</c:forEach>
							</tbody>
						</table>
					</form>
					</div>
					<!-- 페이징 -->
					<div id="wrapper"> 
					<div class="paging_div2"> 
						<ul>
							<!-- 이전 페이지 : nowPage를 기준으로 -->
							<c:if test="${vo2.nowPage2==1}"><!-- 현재 페이지가 첫번째 페이지 일때 -->
								<li></li>
							</c:if>
							<c:if test="${vo2.nowPage2>1}"><!--  현재 페이지가 첫번째 페이지가 아닐때 -->
								<li><a href="myOrder?nowPage2=${vo2.nowPage2-1}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">이전</a></li>
							</c:if>
							<!-- 페이지 번호 -->
							
				         <c:forEach var="p2" begin="${vo2.startPageNum2}" end="${vo2.startPageNum2+vo2.onePageNumCount2-1}">
				            <c:if test="${p2<=vo2.totalPage2}"><!-- 표시할 페이지 번호가 총 페이지 수보다 작거나 같을 때 페이지 번호 출력.-->
				               <!-- 현재페이지 표시하기 -->
				               <c:if test="${p2==vo2.nowPage2}">
				                  <li style="background:#ddd;">
				               </c:if>
				               <c:if test="${p2!=vo2.nowPage2}">
				                 <li>
				               </c:if>
				                  <a href="myOrder?nowPage2=${p2}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">${p2}</a>
				                  </li>
				            </c:if>
				         </c:forEach>
							
							<!-- 다음 페이지 -->
							<c:if test="${vo2.nowPage2<vo2.totalPage2}"><!-- 다음 페이지가 있을 때 -->
								<li><a href="myOrder?nowPage2=${vo2.nowPage2+1}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">다음</a></li>
							</c:if>
							<c:if test="${vo2.nowPage2==vo2.totalPage2}"><!-- 다음 페이지가 없을 때 -->
								<li></li>
							</c:if>
						</ul>
					</div>
					
					
					<!--검색 -->
					<div class ="searchDiv2">
						<form method="get" id="searchForm2" action="myOrder">
							<select name = "searchKey2" id="searchKey2">
								<option value="pro_name">상품명</option>
								<option value="orderdate">주문날짜</option>
							</select>
							<input type="text" name="searchWord2" id="searchWord2"/>
							<input type="submit" value="Search"/>
						</form>
					</div>
					</div>
				</section>
			</div>
		</div>
	</section>
	</div>