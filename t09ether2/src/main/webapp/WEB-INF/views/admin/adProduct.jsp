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
	
</style>
<script>
	$(function(){
		$("#productInsert").on("click", function () {
			event.preventDefault();
			location.href="<%=request.getContextPath() %>/admin/productWrite"
		})
		
		$("#allCheck").click(function(){
			$(".board_list input[name=noList]").prop("checked", $("#allCheck").prop("checked")) //속성만 있고 속성값없어서 prop
		});
		
		//선택삭제버튼을 클릭하면
		$("#chooseDel").click(function(){
			//최소 1개이상 삭제를 선택했을때..
			
			var checkCount = 0;
			
			$(".productList input[name=noList]").each(function(idx, obj){
				if(obj.checked){
					checkCount++;
				}
			});
			
			if(checkCount>0){
				if(confirm(checkCount+'개의 글을 삭제하시겠습니까?')){
					$("#productDel").submit();	
				}
			}else{
				alert('1개 이상의 글을 선택 후 삭제하세요..');
			}
		});
	})
</script>
<div id="usermain" class="row">
	<!-- Main -->
	<section id="main" class="container">
		<header>
			<h2>온라인 상품 관리</h2>
			<p>온라인 상품 목록</p>
		</header>
		<div class="row">
			<div class="col-12">
				<!-- 주문내역 리스트 -->
				<section class="box">
					<div class="table-wrapper">
					<form method="post" action="<%=request.getContextPath() %>/admin/productDel" id="productDel">
					<input type="hidden" name="nowPage" value="${vo.nowPage }"/>
					<c:if test="${vo.searchWord!=null}">
						<input type="hidden" name="searchKey" value="${vo.searchKey }"/>
						<input type="hidden" name="searchWord" value="${vo.searchWord }"/>
					</c:if>
					
						<table class="productList">
							<thead>
								<tr>
									<th>선택</th>
									<th>글번호</th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>재고</th>
								</tr>
							</thead>
							<tbody>
								
								<!-- 시작번호 설정 					총레코드수			현재페이지		한페이지에표시할레코드수-->
								<c:set var="recordNum" value="${vo.totalRecord -(vo.nowPage-1)*vo.onePageRecord }"/>
								<!-- 반복문 돌령 list는 controller에서 mav에 넣을때 변수이름 정한 그것 **따옴표주의***-->
								<c:forEach var="pdto" items="${list }">
								<tr>
									<td><input type="checkbox" name="noList" value="${pdto.pro_code }"/></td>
									<td>${recordNum }</td>
									<td>${pdto.pro_code}</td>
									<td><a href="productEdit?pro_code=${pdto.pro_code}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${pdto.pro_name}</a></td>
									<td>${pdto.pro_price}</td>
									<td>${pdto.pro_total}</td>
									<td>${pdto.pro_stock}</td>
								</tr>
								<c:set var="recordNum" value="${recordNum-1 }"/>
								</c:forEach>
							</tbody>
							
						</table>
						</form>
					</div>
					<div>
						<input type="button" value="선택삭제" id="chooseDel"/>
						<input type="button" value="상품등록" id="productInsert" style="float:right"/>
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
								<li><a href="adProduct?nowPage=${vo.nowPage-1}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">이전</a></li>
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
				                  <a href="adProduct?nowPage=${p}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}</a>
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
						<form method="get" id="searchForm" action="adProduct">
							<select name = "searchKey" id="searchKey">
								<option value="pro_name">상품이름</option>
								<option value="pro_code">상품코드</option>
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
</div>