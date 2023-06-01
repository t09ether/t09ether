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
	.paging_div li{
		float:left;
		padding:10px 20px;
		list-style:none;
	}
	.paging_div a:link, .paging_div a:hover, .paging_div a:visited{
		color:#000;
	}
	#usermain{
		margin:10px;
		margin-left:250px;
		}
	table th{
		text-align: center;
		
		/* font-size: 1.2em;
    	font-weight: 100; */
   		padding: 0.75em 0.75em 0.75em 0.75em;
	}
</style>
<script>
$(function(){
	$("#searchForm").submit(function(){
		if($("#searchWord").val()==""){
			alert("검색어를 입력하세요....");
			return false;
		}
		return true;
	});
	
	//------------------ 전체선택 클릭 : 체크박스 상태의 따라 선택 또는 해제 ---------------------//
	$("#allCheck").click(function(){
		$(".board_list input[name=noList]").prop("checked",$("#allCheck").prop("checked"))
	});
		
	// 선택삭제 버튼 클릭하면
	$("#chooseDel").click(function(){
		// 최소 1개 이상 선택했을 때...
		var checkCount=0;
		$(".board_list input[name=noList]").each(function(idx, obj){
			if(obj.checked){
				checkCount++;
			}
		});
		
		
		if(checkCount>0){
			if(confirm(checkCount+'개의 글을 삭제하시겠습니까?')){
				$("#delList").submit();
			}
		}else{
			alert("1개 이상의 글을 선택후 삭제하세요....");
		}
	});
		
	});


   		
</script>
<div id="usermain" class="row">
	<!-- Main -->
	<section id="main" class="container">
		<header>
			<h2>오프라인 공동구매</h2>
			<p>전체 공구 내역</p>
		</header>
		<div class="row">
			<div class="col-12">
				<!-- 주문내역 리스트 -->
				
				<section class="box">
					<div class="table-wrapper">
					<form method="post" action="<%=request.getContextPath() %>/admin/adOfflineMultiDel" id="delList">
					<input type="hidden" name="nowPage" value="${vo.nowPage }"/>
					<c:if test="${vo.searchWord!=null}">
						<input type="hidden" name="searchKey" value="${vo.searchKey }"/>
						<input type="hidden" name="searchWord" value="${vo.searchWord }"/>
					</c:if>
				
						<table class="board_list">
							<thead>
								<tr>
									<th><input type="checkbox" id="allCheck"/></th>									
									<th>공구번호</th>
									<th>공구장</th>
									<th>제목</th>
									<th>모집인원</th>
									<th>현재인원</th>
									<th>상태</th>
									<th>생성일</th>
									<th>마감일</th>
									<th>공구날짜</th>									
								</tr>
							</thead>
							
							<tbody>
							<c:set var="recordNum" value="${vo.totalRecord-(vo.nowPage-1)*vo.onePageRecord}"/>
							<c:forEach var="bDTO" items="${list}">
								<tr>
									<th><input type="checkbox" name="noList" value="${bDTO.off_no}"/></th>	
									<th>${bDTO.off_no}</th>
									<th>${bDTO.userid}</th>
									<th><a href="<%=request.getContextPath()%>/offlineView?off_no=${bDTO.off_no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"">${bDTO.off_subject}</a></th>
									<th>${bDTO.group_num}</th>
									<th>${bDTO.current_num}</th>
									<th>
									<c:choose>
										<c:when test="${bDTO.status==1}"><div style="color:#A0D8B3;">진행중</div></c:when> 
										<c:when test="${bDTO.status==2}"><div style="color:#F99B7D;">마감</div></c:when> 
									</c:choose>
									</th>
									<th>${bDTO.writedate}</th>
									<th>${bDTO.deaddate}</th>	
									<th>${bDTO.app_time}</th>
								</tr>
								<c:set var="recordNum" value="${recordNum-1}"/>	
							</c:forEach>
							</tbody>
						</table>
					</form>
					<div>
						<input type="button" value="선택삭제" id="chooseDel"/>
					</div>
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
								<li><a href="adOfflineList?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">이전</a></li>
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
				                  <a href="adOfflineList?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
				                  </li>
				            </c:if>
				         </c:forEach>
							
							<!-- 다음 페이지 -->
							<c:if test="${vo.nowPage<vo.totalPage}"><!-- 다음 페이지가 있을 때 -->
								<li><a href="adOfflineList?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">다음</a></li>
							</c:if>
							<c:if test="${vo.nowPage==vo.totalPage}"><!-- 다음 페이지가 없을 때 -->
								<li></li>
							</c:if>
						</ul>
					</div>
					<!--검색 -->
					<div class ="searchDiv">
					<form method="get" id="searchForm" action="adOfflineList">
						<select name = "searchKey" id="searchKey">
							<option value="location" selected>지역</option>
							<option value="off_subject">제목</option>
							<option value="off_content">내용</option>				
						</select>
						<input type="text" name="searchWord" id="searchWord" placeholder="검색할 내용을 입력하세요"/>
						<input type="submit" value="Search"/>
					</form>	
				</div>
					
					</div>
				</section>
			</div>
		</div>
	</section>
	</div>