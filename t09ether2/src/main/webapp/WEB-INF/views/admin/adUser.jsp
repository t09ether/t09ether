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
	#usermain{
		margin:10px;
		margin-left:250px;
		}

	thead tr th, tbody{
		text-align:center;
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
		
		//임시정지
		$("#temp_stop").click(function(){
			var checkCount = 0;
			$(".board_list input[name=noList]").each(function(idx, obj){
				if(obj.checked){ 
					checkCount++;
				}
			});
			
			if(checkCount>0){
				if(confirm(checkCount+'명의 회원을 정지시키시겠습니까?')){
					$("#tempStopForm").submit();
				}
			}else{
				alert("한 명이상의 회원을 선택하세요.");
			}
		});
		
		//정지해제
		$("#unstop").click(function(){
			var checkCount = 0;
			$(".board_list2 input[name=noList]").each(function(idx, obj){
				if(obj.checked){ 
					checkCount++;
				}
			});
			
			if(checkCount>0){
				if(confirm(checkCount+'명의 회원을 정지 해제 시키시겠습니까?')){
					$("#unStopForm").submit();
				}
			}else{
				alert("한 명이상의 회원을 선택하세요.");
			}
		});
	});
</script>
<!-- Main -->
<div id="usermain" class="row">
	<!-- Main -->
	<section id="main" class="container">
		<header>
			<h2>회원 조회 및 관리</h2>
			<p>회원 목록</p>
		</header>
		<div class="row">
			<div class="col-12">
				<!-- 주문내역 리스트 -->
				
				<section class="box">
					<div class="table-wrapper">
					<form method="post" action="<%=request.getContextPath() %>/admin/tempStop" id="tempStopForm">
					<input type="hidden" name="nowPage" value="${vo.nowPage }"/>
					<c:if test="${vo.searchWord!=null}">
						<input type="hidden" name="searchKey" value="${vo.searchKey }"/>
						<input type="hidden" name="searchWord" value="${vo.searchWord }"/>
					</c:if>
				
						<table class="board_list">
							<thead>
								<tr>
									<th> </th>
									<th>번호</th>
									<th>이름</th>
									<th>아이디</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>등급</th>
									<th>가입일</th>
									<th>신고횟수</th>
								</tr>
							</thead>
							
							<tbody>
							<c:set var="recordNum" value="${1+(vo.nowPage-1)*vo.onePageRecord}"/>
							<c:forEach var="bDTO" items="${list}">
								<tr>
									<td><input type="checkbox" name="noList" value="${bDTO.userid}"/></td>
									<td>${recordNum}</td>
									<td>${bDTO.username }</td>
									<td>${bDTO.userid }</td>
									<td>${bDTO.tel }</td>
									<td>${bDTO.email }</td>
									<td>${bDTO.ranking }</td>
									<td>${bDTO.writedate }</td>
									<td>${bDTO.report }</td>
								</tr>
								<c:set var="recordNum" value="${recordNum+1}"/>	
							</c:forEach>
							</tbody>
						
						</table>
					</form>
					</div>
					<div>
						<input type="button" value="임시정지" id="temp_stop"/>
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
								<li><a href="adUser?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">이전</a></li>
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
				                  <a href="adUser?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
				                  </li>
				            </c:if>
				         </c:forEach>
							
							<!-- 다음 페이지 -->
							<c:if test="${vo.nowPage<vo.totalPage}"><!-- 다음 페이지가 있을 때 -->
								<li><a href="adUser?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">다음</a></li>
							</c:if>
							<c:if test="${vo.nowPage==vo.totalPage}"><!-- 다음 페이지가 없을 때 -->
								<li></li>
							</c:if>
						</ul>
					</div>
					
					
					<!--검색 -->
					<div class ="searchDiv">
						<form method="get" id="searchForm" action="adUser">
							<select name = "searchKey" id="searchKey">
								<option value="username">이름</option>
								<option value="userid">아이디</option>
								<option value="rank">등급</option>
							</select>
							<input type="text" name="searchWord" id="searchWord"/>
							<input type="submit" value="Search"/>
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
			<h2>임시 정지</h2>
			<p>임시정지된 회원 목록</p>
		</header>
		<div class="row">
			<div class="col-12">
				<!-- 주문내역 리스트 -->
				
				<section class="box">
					<div class="table-wrapper">
					<form method="post" action="<%=request.getContextPath() %>/admin/unStop" id="unStopForm">
					<input type="hidden" name="nowPage2" value="${vo2.nowPage2 }"/>
					<c:if test="${vo2.searchWord2!=null}">
						<input type="hidden" name="searchKey2" value="${vo2.searchKey2 }"/>
						<input type="hidden" name="searchWord2" value="${vo2.searchWord2 }"/>
					</c:if>
				
						<table class="board_list2">
							<thead>
								<tr>
									<th> </th>
									<th>번호</th>
									<th>이름</th>
									<th>아이디</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>등급</th>
									<th>임시정지일</th>
									<th>신고횟수</th>
								</tr>
							</thead>
							
							<tbody>
							<c:set var="recordNum2" value="${1+(vo2.nowPage2-1)*vo2.onePageRecord2}"/>
							<c:forEach var="bDTO2" items="${list2}">
								<tr>
									<td><input type="checkbox" name="noList" value="${bDTO2.userid}"/></td>
									<td>${recordNum2}</td>
									<td>${bDTO2.username }</td>
									<td>${bDTO2.userid }</td>
									<td>${bDTO2.tel }</td>
									<td>${bDTO2.email }</td>
									<td>${bDTO2.ranking }</td>
									<td>${bDTO2.writedate }</td>
									<td>${bDTO2.report }</td>
								</tr>
								<c:set var="recordNum2" value="${recordNum2+1}"/>	
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
					<div>
						<input type="button" value="정지해제" id="unstop"/>
					</div>
					<!-- 페이징 -->
					<div  id="wrapper">
					<div class="paging_div2"> 
						<ul>
							<!-- 이전 페이지 : nowPage를 기준으로 -->
							<c:if test="${vo2.nowPage2==1}"><!-- 현재 페이지가 첫번째 페이지 일때 -->
								<li></li>
							</c:if>
							<c:if test="${vo2.nowPage2>1}"><!--  현재 페이지가 첫번째 페이지가 아닐때 -->
								<li><a href="adUser?nowPage2=${vo2.nowPage2-1}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">이전</a></li>
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
				                  <a href="adUser?nowPage2=${p2}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">${p2}</a>
				                  </li>
				            </c:if>
				         </c:forEach>
							
							<!-- 다음 페이지 -->
							<c:if test="${vo2.nowPage2<vo2.totalPage2}"><!-- 다음 페이지가 있을 때 -->
								<li><a href="adUser?nowPage2=${vo2.nowPage2+1}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">다음</a></li>
							</c:if>
							<c:if test="${vo2.nowPage2==vo2.totalPage2}"><!-- 다음 페이지가 없을 때 -->
								<li></li>
							</c:if>
						</ul>
					</div>
					
					
					<!--검색 -->
					<div class ="searchDiv2">
						<form method="get" id="searchForm2" action="adUser">
							<select name = "searchKey2" id="searchKey2">
								<option value="username">이름</option>
								<option value="userid">아이디</option>
								<option value="report">신고수</option>
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