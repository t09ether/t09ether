<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   #uldesign {
      list-style:none;
      border-bottom:2px solid #ddd;
      border-right:1px solid #ddd;
   }
   #uldesign li:nth-child(3), #uldesign li:nth-child(4) { /* 폰트 컬러 */
      font-color: #black;
   }
   #uldesign li:nth-child(1) { /* 제목 */
      font-size:23px;
      float:left;
      width:60%;
      text-align:left;
      padding-top:30px;
      /*padding-top:25px;*/
   }
  #uldesign li:nth-child(1) { /* 제목 */
      font-size:30px;
      float:left;
      width:60%;
      text-align:left;
      padding:15px;
   }
   #uldesign li:nth-child(2) { /* 작성자 */
      float:right;
      width:10%;
      text-align:center;
      padding-top:30px;
   }
   #uldesign li:nth-child(3) { /* 등록일 */
      float:right;
      width:15%;
      text-align:center;
      padding-top:30px;
   }
   #uldesign li:nth-child(4) { /* 분류 */
      float:right;
      width:10%;
      text-align:center;
      padding-top:30px;
   }
    
   #uldesign li:nth-child(5) { /* 글 내용 */
      height:500px;
      padding-top:30px;
      font-size:30px;
      border :1px solid #ddd;
      width: 100%;
   }
   
   #contentdesign>li {
      width:100%;
      list-style:none;
      border: 1px solid:#ddd;
   }
   /* 이거쓰면 수직정렬됨
   #wrappertwo {
      display: grid;
      place-items: center;
      min-height: 10vh;
   }
   */
   .boardSubMenu {
      text-align: center;
   }
   
   #replyList {
      list-style:none;
   }
   #replyList>li:first-child {
      border-top:1px solid #ddd;
   }
   #replyList>li {
      border-bottom:1px solid #ddd;   
   }
   
</style>
<script>
   function csBoardDel() {
      if(confirm("삭제 하시겠습니까?")) {
         location.href = "csBoardDel?cus_b_num=${CustomerCenterDTO.cus_b_num}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>";
      }
   }
   $(function() {
      //댓글목록 ajax로 해당 게시물에 대한 모든 댓글을 선택하여 뷰에 표시하는 함수--------------------------
      function replyList() {
         $.ajax({
            url : "<%=request.getContextPath() %>/replyList",
            data : {
               cus_b_num:${CustomerCenterDTO.cus_b_num}
            },
            type : "GET",
            dataType:"json",
            success : function(content) {
               
               //원래 있는 댓글은 목록에서 지운다
               //$("#commentList").html("");
               
               var tag = "";
               $(content).each(function(i, rDTO) {
                  //<b> </b>지움
                  tag += "<li><div><b>"+rDTO.userid+"("+rDTO.writedate+")</b>";
                  
                  
                  //본인이 쓴 댓글일 때 수정 삭제 버튼 나오게
                  if(rDTO.userid == '${logId}') {
                     //<button type="button"> <img src="" /></button>
                     tag += "<button type='button' value='Edit' style='1px solid tomato;'> <img src='../resources/images/erase.png'></button>";
                     tag += "<button type='button' value='Del' title='"+rDTO.reply_num+"'> <img src='../resources/images/trash.png'> </button>";
                     
                     tag += "<p>"+rDTO.content+"</p></div>"; //댓글 내용
                     
                     //댓글 수정폼을 만들기 - 기존댓글과, 댓글번호가 폼에 있어야 한다.
                     tag +="<div style='display:none;'>";
                     tag +="<form method='post'>";
                     tag += "<input type='hidden' name='reply_num' value='"+rDTO.reply_num+"'/>"; //댓글 일련번호
                     tag += "<textarea name='content' style='width:415px; height:60px;'>"+rDTO.content+"</textarea>";
                     tag += "<input type='submit' value='댓글수정하기'/>";
                     tag +="</form>";
                     tag +="</div>";
                     
                  }else {
                     tag += "<p>"+rDTO.content+"</p></div>"; //댓글 내용
                  }
                  
                  tag += "</li>";
                  
               });
               
               $("#replyList").html(tag);
            }, error: function(e) {
               console.log(e.responseText)
            }
         });
      }
      //댓글쓰기--------------------------
      $("#replyForm").submit(function() {
         //관리자만 댓글달기 가능하게
         //코멘트가 있을 때 ajax실행
         if($("#content").val()=="") {
            alert("댓글을 입력 후 등록하세요.");
            return false;
         }
         //코멘트가 있을 때
         //폼의 값을 쿼리문으로 만들기 no=44&coment=hihi
         //폼 컴포넌트의 데이터를 name의 속성 값과 value속성의 값을 이용하여 쿼리문을 만들어준다.
         var query = $(this).serialize(); // no=44&coment=hihi
         console.log(query);
         $.ajax({
            url : "<%=request.getContextPath() %>/replySend",
            data : query,
            type : "POST",
            success : function(result) {
               //console.log(result)
               //기존에 입력한 댓글 지우기
               $("#content").val("");
               // 댓글 입력됐다고 알려주기
               alert("댓글이 입력되었습니다.");
               //댓글 목록을 다시 뿌려준다.
               replyList();
            }, error : function(e) {
               console.log(e.responseText);
            }
         });
         
         return false; //form의 기본이벤트 때문에 다음 실행이 있고 그것을 중단한다.   
      });
      
      //댓글 수정폼 보여주기 : 본인이 쓴 글일 때 Edit버튼 클릭하면 글 내용은 숨기고, 폼을 보이게 한다.
      $(document).on('click','#replyList button[value=Edit]', function() {
         //기존에 열어 놓은 폼이나, 숨겨놓은 댓글 내용을 처리하고
         //dom.children("div")eq(0).css('display','block');
         //$("#replyList>li>div:nth-first").css('display','none');
         //$("#replyList>li>div:nth-last").css('display','none');

         //$(this).parent().css("display","none");//댓글숨기고
         $(this).parent().next().css("display","block");//폼 보여주고
         
      });
      //댓글 수정 -DB
      $(document).on('click','#replyList input[value=댓글수정하기]', function() {
         //데이터 준비
         var params = $(this).parent().serialize(); // c_no=34&coment=test
         var url ="<%=request.getContextPath() %>/replyEdit";
         
         if(confirm("댓글을 수정하시겠습니까?")) {
            $.ajax({
               url: url,
               data: params,
               type: "POST",
               success : function(result) {
                  //console.log(result);
                  //댓글목록 다시 뿌려주기
                  replyList();
               },error : function(e) {
                  console.log(e.responseText);
               }
            });
         }
         return false;
      });
      //댓글 삭제
      $(document).on('click', '#replyList button[value=Del]', function() {
         if(confirm("댓글을 삭제할까요?")) {
            var params = "reply_num="+$(this).attr("title");
            console.log(params);
            var url = "<%=request.getContextPath() %>/replyDelete";
            
            $.ajax({
               url:url,
               data:params,
               success: function(result) {
                  console.log(result);
                  //댓글목록 다시뿌려주기
                  replyList();
               }, error : function(e) {
                  console.log(e.responseText);
               }
            })
         }
      })
      //댓글 목록을 뿌려준다.
      replyList();
   });//jquery
      
</script>
<body>
<section id="main" class="container">
<header>
   <h2>Q&A 게시판</h2>
</header>
   <ul id="uldesign">
      <!--  
      <li>글 번호 : ${CustomerCenterDTO.cus_b_num }</li>
      -->
      <li> ${CustomerCenterDTO.subject }</li>
      <li> ${CustomerCenterDTO.writedate }</li>
      <li> ${CustomerCenterDTO.userid }</li>
      <li> ${CustomerCenterDTO.category }</li>
   </ul>
      <br><br>
   <hr/>
   <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-light p-3 rounded-2" tabindex="0" style="overflow: scroll; width: 100%; height: 500px; padding: 10px;">
      <ul id="contentdesign">
         <li>${CustomerCenterDTO.content }</li>
      </ul>
   </div>   
   
   <hr/>
   <div class="boardSubMenu">
      <a href="customerBoard?nowPage=${vo.nowPage }<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">글목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      <c:if test="${logId == CustomerCenterDTO.userid }">
      <a href="csBoardEdit?cus_b_num=${CustomerCenterDTO.cus_b_num }&nowPage=${vo.nowPage }<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="javascript:csBoardDel()">삭제</a>
      </c:if>
      <p>
      </p>
      <hr/>
   </div>

      <ul id="replyList">
      <hr/>
      </ul>
   

</section>
</body>
</html>