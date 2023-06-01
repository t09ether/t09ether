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
</style>
<body>
	<!-- Main -->
	<section id="main" class="container">
		<header>
			<h2>온라인 공구 내역</h2>
			<p>진행 중인 내역</p>
		</header>
		<div class="row">
			<div class="col-12">
				<!-- 주문내역 리스트 -->
				<section class="box">
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>니베아 맨 센서티브 쉐이빙 폼, 200ml, 6개</td>
									<td>22,350원</td>
									<td>1개</td>
								</tr>
								<tr>
									<td>2</td>
									<td>니베아 맨 센서티브 쉐이빙 폼, 200ml, 6개</td>
									<td>22,350원</td>
									<td>1개</td>
								</tr>
								<tr>
									<td>3</td>
									<td>니베아 맨 센서티브 쉐이빙 폼, 200ml, 6개</td>
									<td>22,350원</td>
									<td>1개</td>
								</tr>
								<tr>
								<c:forEach var="data" items="${list}">
									<td>${data.no}2023.03.26</td>
									<td>${data.product}니베아 맨 센서티브 쉐이빙 폼, 200ml, 6개</td>
									<td>${data.price}22,350원</td>
									<td>${data.quantity}1개</td>
								</c:forEach>
								</tr>
							</tbody>
							<!--<tfoot>
								<tr>
									<td colspan="2"></td>
									<td>100.00</td>
								</tr>
							</tfoot>  -->
						</table>
					</div>
				</section>
			</div>
		</div>
	</section>
</body>
</html>