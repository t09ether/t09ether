<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 오프라인 공구 대화방(댓글) -->
<style>
	
	li{list-style-type: none;}
	.text-center text-white>h2{
		color:#fff;
		margin:0 auto;
		text-align: center;
	}
	.commentDiv{
		margin:0 auto;
		width:90%;
	}
	input[type='button']{
		height:35px;
		width:50px;
		background: #A4D0A4;
		padding:0 5px;
		margin:0 2px;
		border:1px solid #ddd;		
		text-align: center;
	}
	
	
	.task-tooltip {
  background-color: #eef3fd;
  border: #7689fd solid 1px;
  border-radius: 5px;
  color: #505bf0;
  font-size: 15px;
  font-weight: 500;
  height: auto;
  letter-spacing: -0.25px;
  margin-top: 6.8px;
  padding: 5px 11px;
  position: relative;
  width: fit-content;
  z-index: 100;
}

.task-tooltip::after {
  border-color: #eef3fd transparent;
  border-style: solid;
  border-width: 0 6px 8px 6.5px;
  content: '';
  display: block;
  left: 75px;
  position: absolute;
  top: -7px;
  width: 0;
  z-index: 1;
}

.task-tooltip::before {
  border-color: #7689fd transparent;
  border-style: solid;
  border-width: 0 6px 8px 6.5px;
  content: '';
  display: block;
  left: 75px;
  position: absolute;
  top: -8px;
  width: 0;
  z-index: 0;
}
	#view li{
		border-bottom:1px solid tomato;
		font-size: 1.2em;
	}
 	#participantList{
 		margin:5px;
 	}
 	.centerInfo{
 		margin:10px auto;
 		text-align: center;
 		font-size:2em;
 		color:#A4D0A4;
 	}
	#comment09{
		width:80%;
		margin: 10px 0 0 35px;
		border: 1px solid black;
	}
	#commentInsert{
		margin:0 0 0 35px;
	}
	.bottomMenu a{
		margin:10px; 
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function(){
		
		//--------댓글목록 ajax로 해당 게시물에 대한 모든 댓글 선택하여 뷰에 표시하는 함수------------------
		function commentList(){
			console.log("댓글리스트");
			$.ajax({
				url:"<%=request.getContextPath() %>/commentList",
				data:{
					off_no:${dto.off_no}
					},
				type:"GET",
				dataType:"json",
				success:function(result){
					//원래있는 댓글 목록 지운다
					//$("#commentList").html("");
					var tag="";
					$(result).each(function(i,cDTO){
						tag += "<li><div class='task-tooltip'><b>"+ cDTO.userid + "(" + cDTO.writedate + ")</b>";
						//본인이 쓴 댓글일 때 수정, 삭제 버튼 표시
						if(cDTO.userid == '${logId}'){ // 'goguma' == 'test1234'
							tag += "<input type='button' value='수정'/>";
							tag += "<input type='button' value='삭제' title='"+cDTO.comment_no+ "'/>";								
							
							tag += "<p>" + cDTO.comment09 + "</p></div>";//댓글내용
							//댓글 수정폼 만들기 - 기존댓글과, 댓글번호
							tag += "<div style='display:none'>";
							tag += "<form method='post'>";
							tag += "<input type='hidden' name='comment_no'  value='"+cDTO.comment_no+"'/>";//댓글일련번호
							tag += "<textarea name='comment09' style='border:1px solid black;'>"+cDTO.comment09+"</textarea>";
							tag += "<input type='submit' value='댓글수정하기'/>";
							tag += "</form>";
							tag += "</div>";	
						}else{
							tag += "<p>" + cDTO.comment09 + "</p></div>";
						}						
						tag += "</li>";						
					});			
					$("#commentList").html(tag);
				},error:function(e){
					console.log(e.responseText);
				}					
			});
		}
		
		//--------댓글쓰기-----------------
		$("#commentForm").submit(function(){
			//코멘트가 있을 때 ajax 실행
			if($("#comment09").val()==""){
				alert("댓글을 입력 후 등록하세요");
				return false;
			}
			//코멘트가 있을 때
			//폼의 값을 쿼리문으로 만들기
			//폼의 컴퍼넌트의 데이터를 name 속성의 값과 value속성의 값을 이용하여 쿼리
			var query = $(this).serialize();
			console.log(query);
			$.ajax({
				url:"<%=request.getContextPath() %>/commentSend",
				data:query,
				type:"POST",
				success:function(result){
					console.log(result);
					//기존에 입력한 댓글 지우기
					$("#comment09").val("");
					//댓글목록을 다시 뿌려준다
					commentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});
			return false; //form의 기본이벤트 떄문에 다음 실행이 있고 그것을 중단
		});
		//댓글 수정폼 보여주기 : 본인이 쓴 글일때 Edit 버튼 클릭하면 글 내용은 숨기고, 폼을 보이게 한다
		$(document).on('click', '#commentList input[value=수정]', function(){
			//기존의 열어놓은 폼이나 숨겨놓은 댓글 내용을 처리하고(하나만 열려있게)
			//$("#commentList>li>div:nth-frist").css("display","block");
			//$("#commentList>li>div:nth-last").css("display","none");
			//------------------------------
			$(this).parent().css("display","none");//댓글숨기기
			$(this).parent().next().css("display","block");//폼 보여주기
		});
		
		//댓글수정 -  DB
		$(document).on('click',"#commentList input[value=댓글수정하기]",function(){
			//데이터준비
			var params = $(this).parent().serialize();// c_no=34&coment=test
			var url = "<%=request.getContextPath() %>/commentEdit";
			
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(result){
					console.log(result);
					//댓글 목록 다시뿌리기
					commentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});
			
			return false;
	
		});
		
		
		//댓글 삭제
		
		$(document).on('click','#commentList input[value=삭제]',function(){
			if(confirm("댓글을 삭제할까요?")){
				var params = "comment_no="+$(this).attr("title");
				console.log(params);
				var url ="<%=request.getContextPath() %>/commentDelete";
				$.ajax({
					url:url,
					data:params,
					success:function(result){
						console.log(result);
						commentList();
					},error:function(error){
						console.log(error.responseText);
					}
				});
			}
		});
		
		//댓글목록 뿌려주기 -- 처음에 글내용 보기로 오면 댓글 보여주기
		commentList();
	});
</script>
	<!-- Header-->
	<header class="bg-tomato py-5" style="background-image:url('<%=request.getContextPath() %>/resources/images/test_banner.jpg'); background-size: 107% 100%">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
	        	<h1 class="display-4 fw-bolder" style="color:#FFF">일정조율하기</h1>	
	        	<h2 stlye="color:#A4D0A4">참가자들과 자유롭게 일정을 조율해보세요!</h2>	        	           
	        </div>
	    </div>
	</header>
<div class="container">			
	<div class="centerInfo">[참가자정보]</div>
	<div id="participantList">		
		<table>
			<tr class="theader">
			    <th>번호</th>
			    <th>아이디</th>
			    <th>이름</th>
			    <th>연락처</th>
			</tr>			  
		<c:forEach var="opDTO" items="${list}" varStatus="status">
			<tr class="infoDetail">
				<td style="width:6%; text-align:center;">${status.count}</td>
				<td>${opDTO.userid}<c:if test="${opDTO.userid==dto.userid}"> (방장)</c:if></td>
				<td>${opDTO.username}</td>
				<td>${opDTO.tel}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<div class="centerInfo">이곳에서 의견을 조율해보세요!</div>
	<div class="commentDiv" style="background-image:url('<%=request.getContextPath() %>/resources/images/home_test2.jpg'); background-size: cover">
		<ul id="commentList">		
		
		</ul>
		<form method="post" id="commentForm">
			<input type="hidden" name="off_no" value="${dto.off_no}"/> <!-- 원글 번호 -->
			<textarea name="comment09" id="comment09"></textarea>
			<button id="commentInsert">댓글등록</button>
		</form>		
	</div>
	<br/>
	<div class="bottomMenu">
	 <a class="btn btn-outline-dark mt-auto" href="javascript:history.go(-1)">뒤로가기</a>
	 <a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/offline">목록으로</a>
	</div>
</div>