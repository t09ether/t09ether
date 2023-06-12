<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/super-build/ckeditor.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
   .container{
      padding:0;
   }
   body,ul,li{
      padding:0;
      margin:0;
      list-style-type:none;   
      color:black;
   }
   * input[name="group_num"]{
      width:30%;
   }
   
   #boardForm{
      padding: 10px 0px;
   }
   #boardForm li{
      text-decoration: none;
   }
   #subject{
      width:100%;      
   }
   .zipcode{
      float:left;
   }   
   /*CKEDITOR*/
   .ck-editor__editable[role="textbox"] {
      /* editing area */
      min-height: 200px;
      max-width: 100%;
    }
    .ck-content .image {
      /* block images */
      max-width: 100%;
      margin: 20px auto;
     }
     .conhead{margin:0;}
     #sample6_address{
        margin-top:16px;
        margin-bottom:10px;
     }
  
</style>
<script>
   var logId = sessionStorage.getItem("logId");
   console.log(logId);
   
   //=======================에디터 시작=====================//
   $(function(){
      CKEDITOR.ClassicEditor.create(document.getElementById("off_content"), {
            // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
            toolbar: {
                items: [
                    'exportPDF','exportWord', '|',
                    'findAndReplace', 'selectAll', '|',
                    'heading', '|',
                    'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                    'bulletedList', 'numberedList', 'todoList', '|',
                    'outdent', 'indent', '|',
                    'undo', 'redo',
                    '-',
                    'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                    'alignment', '|',
                    'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                    'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                    'textPartLanguage', '|',
                    'sourceEditing'
                ],
                shouldNotGroupWhenFull: true
            },
            // Changing the language of the interface requires loading the language file using the <script> tag.
            // language: 'es',
            list: {
                properties: {
                    styles: true,
                    startIndex: true,
                    reversed: true
                }
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
            heading: {
                options: [
                    { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                    { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                    { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                    { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                    { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                ]
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
            
            // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
            fontFamily: {
                options: [
                    'default',
                    'Arial, Helvetica, sans-serif',
                    'Courier New, Courier, monospace',
                    'Georgia, serif',
                    'Lucida Sans Unicode, Lucida Grande, sans-serif',
                    'Tahoma, Geneva, sans-serif',
                    'Times New Roman, Times, serif',
                    'Trebuchet MS, Helvetica, sans-serif',
                    'Verdana, Geneva, sans-serif'
                ],
                supportAllValues: true
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
            fontSize: {
                options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                supportAllValues: true
            },
            // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
            // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
            htmlSupport: {
                allow: [
                    {
                        name: /.*/,
                        attributes: true,
                        classes: true,
                        styles: true
                    }
                ]
            },
            // Be careful with enabling previews
            // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
            htmlEmbed: {
                showPreviews: true
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
            link: {
                decorators: {
                    addTargetToExternalLinks: true,
                    defaultProtocol: 'https://',
                    toggleDownloadable: {
                        mode: 'manual',
                        label: 'Downloadable',
                        attributes: {
                            download: 'file'
                        }
                    }
                }
            },
            // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
            mention: {
                feeds: [
                    {
                        marker: '@',
                        feed: [
                            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                            '@sugar', '@sweet', '@topping', '@wafer'
                        ],
                        minimumCharacters: 1
                    }
                ]
            },
            // The "super-build" contains more premium features that require additional configuration, disable them below.
            // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
            removePlugins: [
                // These two are commercial, but you can try them out without registering to a trial.
                // 'ExportPdf',
                // 'ExportWord',
                'CKBox',
                'CKFinder',
                'EasyImage',
                // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                // Storing images as Base64 is usually a very bad idea.
                // Replace it on production website with other solutions:
                // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                // 'Base64UploadAdapter',
                'RealTimeCollaborativeComments',
                'RealTimeCollaborativeTrackChanges',
                'RealTimeCollaborativeRevisionHistory',
                'PresenceList',
                'Comments',
                'TrackChanges',
                'TrackChangesData',
                'RevisionHistory',
                'Pagination',
                'WProofreader',
                // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                // from a local file system (file://) - load this site via HTTP server if you enable MathType
                'MathType'
            ]
        });//CKEDITOR
        //=======================에디터 끝=====================//
      //폼 유효성검사
      $("#offlineWriteForm").submit(function(){
         if($("#off_subject").val()==""){
            alert("제목을 입력하세요...");
            return false;
         }
      });
      
   });
   
   // ------------------ 다음 주소 API 시작---------------//
   function sample6_execDaumPostcode() {
      
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }                    
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
            
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
   // ------------------ 다음 주소 API 끝 ---------------//
</script>

<div class="container">
   <section id="main" class="container">
      <header class="conhead">
      <h1>오프라인 공동구매 시작하기</h1>      
      <p>상세 정보를 입력하세요</p>            
      </header>
   </section>
   
   <form method="post" action="offlineInsert" id="offlineWriteForm">
      <input type="hidden" name="current_num" value="1"/>
      <input type="hidden" name="off_hit" value="1"/>
      <ul>
         <li>제목</li>
         <li><input type="text" name="off_subject" id="off_subject"/></li><hr/>
         <li>[공구장소 설정]<li><br/>
         <li>우편번호</li>
         <li>
            <input type="text" id="sample6_postcode" placeholder="우편번호" readonly style="width:78%; float:left; margin:2px;">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:20%; float:right; margin:2px; margin-bottom:10px;">
         </li>   
            <li><input type="text" name="location" id="sample6_address" placeholder="주소"></li>
            <li><input type="text" id="sample6_detailAddress" placeholder="상세주소"></li>   <hr/>
            <!-- location 어떻게? -->               
      </ul>
      <ul class="numInfo">   
            <li style="width:12%; float:left; margin:2px; text-align:center; margin-top:15px;">모집인원</li>
            <li><input type="text" name="group_num" id="group_num" placeholder ="0" style="width:20%; float:left; margin:2px;"/></li>               
            <li style="width:14%; float:left; margin:2px; text-align:center; margin-top:15px;">모집마감일</li>
            <li><input type="text" name="deaddate" id="deaddate" placeholder="YY-MM-DD" style="width:20%; float:left; margin:2px;"/></li>
            <li style="width:14%; float:left; margin:2px; text-align:center; margin-top:15px;">공구날짜</li>
            <li><input type="text" name="app_time" id="app_time" placeholder="YY-MM-DD" style="width:18%; float:left; margin:2px;"/></li>         
         <li style="margin-bottom:40px;">&nbsp;</li>
         <li>상세 안내</li>            
         <li>
            <!-- 에디터 -->
            <textarea name="off_content" id="off_content" placeholder="공동구매해 대한 정보를 알려주세요!"></textarea>
         </li>
         <li>
            <input type="submit" value="공구등록하기"/>
         </li>
         
      </ul>
   
   </form>
</div>
</body>