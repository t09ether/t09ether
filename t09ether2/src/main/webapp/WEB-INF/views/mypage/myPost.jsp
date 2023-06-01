<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#wrapper {
		display: grid;
		place-items: center;
		min-height: 10vh;
	}
	#searchForm, #searchForm2{
		text-align:center;
	}
	#searchKey, #searchWord, #search,
	#searchKey2, #searchWord2, #search2 {
		display:inline-block;
	}
	#searchKey, #searchKey2 { /*제목임*/
		width:15%;
		margin: auto;
	}
	#searchWord, #searchWord2 { /*검색칸*/
		width:40%;
		margin: auto;
	}
	.searchDiv, .searchDiv2{
		padding:10px;
		text-align: center;	
		width:100%;	
	}
	.paging_div li, .paging_div2 li{
		float:left;
		padding:10px 20px;
		list-style:none;
	}
	.paging_div a:link, .paging_div a:hover, .paging_div a:visited
	.paging_div2 a:link, .paging_div2 a:hover, .paging_div2 a:visited {
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
		$("#allCheck1").click(function(){
			$(".board_list input[name=noList1]").prop("checked", $("#allCheck1").prop("checked"));
			
		});
		
		//선택 삭제 버튼 클릭하면
		$("#chooseDel1").click(function(){
			// 최소 1개 이상 삭제를 선택했을 때
			
			var checkCount = 0;
			$(".board_list input[name=noList1]").each(function(idx, obj){
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
		
		$("#allCheck2").click(function(){
			$(".board_list input[name=noList2]").prop("checked", $("#allCheck2").prop("checked"));
			
		});
		
		//선택 삭제 버튼 클릭하면
		$("#chooseDel2").click(function(){
			// 최소 1개 이상 삭제를 선택했을 때
			
			var checkCount = 0;
			$(".board_list input[name=noList2]").each(function(idx, obj){
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
			<h2>오프라인 공구 게시물</h2>
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
									<th>번호</th>
									<th>공구제목</th>
									<th>공구장</th>
									<th>만남장소</th>
									<th>약속시간</th>
									<th>모집마감일</th>
									<th>현재인원/모집 인원</th>
								</tr>
							</thead>
							
							<tbody>
							<c:set var="recordNum" value="${vo.totalRecord-(vo.nowPage-1)*vo.onePageRecord}"/>
							<c:forEach var="bDTO" items="${list}">
									<tr>
										<td>${recordNum}</td>
										<td><a href="myPostView?no=${bDTO.off_no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${bDTO.off_subject }</a></td>
										<td>${bDTO.userid }</td>
										<td>${bDTO.location }</td>
										<td>${bDTO.app_time }</td>
										<td>${bDTO.deaddate }</td>
										<td>${bDTO.current_num}/${bDTO.group_num}</td>
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
								<li><a href="myPost?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">이전</a></li>
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
				                  <a href="myPost?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
				                  </li>
				            </c:if>
				         </c:forEach>
							
							<!-- 다음 페이지 -->
							<c:if test="${vo.nowPage<vo.totalPage}"><!-- 다음 페이지가 있을 때 -->
								<li><a href="myPost?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">다음</a></li>
							</c:if>
							<c:if test="${vo.nowPage==vo.totalPage}"><!-- 다음 페이지가 없을 때 -->
								<li></li>
							</c:if>
						</ul>
					</div>
					<!--검색 -->
					<div class ="searchDiv">
						<form method="get" id="searchForm" action="myPost">
							<select name = "searchKey" id="searchKey">
								<option value="off_subject">공구제목</option>
								<option value="location">만남장소</option>
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
									<th>번호</th>
									<th>공구제목</th>
									<th>공구장</th>
									<th>만남장소</th>
									<th>약속시간</th>
									<th>모집마감일</th>
									<th>현재인원/모집 인원</th>
								</tr>
							</thead>
							
							<tbody>
							<c:set var="recordNum2" value="${vo2.totalRecord2-(vo2.nowPage2-1)*vo2.onePageRecord2}"/>
							<c:forEach var="bDTO2" items="${list2}">
								<tr>
									<td>${recordNum2}</td>
									<td><a href="myPostView?no=${bDTO2.off_no }&nowPage2=${vo2.nowPage2}<c:if test="${vo2.searchWord2!=null }">&searchKey2=${vo2.searchKey2 }&searchWord2=${vo2.searchWord2 }</c:if>">${bDTO2.off_subject }</a></td>
									<td>${bDTO2.userid }</td>
									<td>${bDTO2.location }</td>
									<td>${bDTO2.app_time }</td>
									<td>${bDTO2.deaddate }</td>
									<td>${bDTO2.current_num}/${bDTO2.group_num}</td>
								</tr>
								<c:set var="recordNum2" value="${recordNum2-1}"/>	
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
					<div id="wrapper"> 
					<div class="paging_div2"> 
						<ul>
							<!-- 이전 페이지 : nowPage를 기준으로 -->
							<c:if test="${vo2.nowPage2==1}"><!-- 현재 페이지가 첫번째 페이지 일때 -->
								<li></li>
							</c:if>
							<c:if test="${vo2.nowPage2>1}"><!--  현재 페이지가 첫번째 페이지가 아닐때 -->
								<li><a href="myPost?nowPage2=${vo2.nowPage2-1}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">이전</a></li>
							</c:if>
							<!-- 페이지 번호 -->
							
				         <c:forEach var="p" begin="${vo2.startPageNum2}" end="${vo2.startPageNum2+vo2.onePageNumCount2-1}">
				            <c:if test="${p<=vo2.totalPage2}"><!-- 표시할 페이지 번호가 총 페이지 수보다 작거나 같을 때 페이지 번호 출력.-->
				               <!-- 현재페이지 표시하기 -->
				               <c:if test="${p==vo2.nowPage2}">
				                  <li style="background:#ddd;">
				               </c:if>
				               <c:if test="${p!=vo2.nowPage2}">
				                 <li>
				               </c:if>
				                  <a href="myPost?nowPage2=${p}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">${p}</a>
				                  </li>
				            </c:if>
				         </c:forEach>
							
							<!-- 다음 페이지 -->
							<c:if test="${vo2.nowPage2<vo2.totalPage2}"><!-- 다음 페이지가 있을 때 -->
								<li><a href="myPost?nowPage2=${vo2.nowPage2+1}<c:if test="${vo2.searchWord2!=null}">&searchKey2=${vo2.searchKey2}&searchWord2=${vo2.searchWord2}</c:if>">다음</a></li>
							</c:if>
							<c:if test="${vo2.nowPage2==vo2.totalPage2}"><!-- 다음 페이지가 없을 때 -->
								<li></li>
							</c:if>
						</ul>
					</div>
					
					
					<!--검색 -->
					<div class ="searchDiv2">
						<form method="get" id="searchForm2" action="myPost">
							<select name = "searchKey2" id="searchKey2">
								<option value="off_subject">공구제목</option>
								<option value="location">만남장소</option>
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