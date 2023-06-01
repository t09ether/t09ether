<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/super-build/ckeditor.js"></script>

<style>
	#productForm ul{
		overflow:auto; 
		/*border:1px solid #ddd;*/
	
		
	}
	#productForm li{
		
		margin:5px ; 
		padding:5px 0;	
		list-style:none;
		
	}
	#pro_name{
		width:50%;
	}

	#pro_stock, #pro_price, #pro_total{
		text-align:center;
	}
	
	
	.card-img-top{
		width: 400px;
  		height: 400px;
  		
	}
	.ck-editor__editable[role="textbox"] {
		/* editing area */
        min-height: 200px;
        max-width: 100%;
    }
</style>
<script>
	$(function(){
		//바디실행후 실행시키기위해 제이쿼리사용
		CKEDITOR.ClassicEditor.create(document.getElementById("detailed"), {
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
            placeholder: '',
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
        }); //CKEDITOR
       
		$("#productForm").submit(function(){
	        //상품명
	        if($("#pro_name").val()==""){
	        	alert("상품명을 입력하세요.");
	        	return false;
	        }
	        
	      //상품수량
	        if($("#pro_total").val()==""){
	        	alert("상품수량을 입력하세요.");
	        	return false;
	        }
	        
	        //상품가격
	        if($("#pro_price").val()==""){
	        	alert("상품가격을 입력하세요.");
	        	return false;
	        }
	        
	      	//재고개수
	        if($("#pro_stock").val()==""){
	        	alert("재고개수를 입력하세요.");
	        	return false;
	        }
	      	
	      	//상품이미지주소
	        if($("#image").val()==""){
	        	alert("이미지주소를 입력하세요.");
	        	return false;
	        }
	      	
	      //상품정보
	        if($("#detailed").val()==""){
	        	alert("상세정보를 입력하세요.");
	        	return false;
	        }
	     	return true;
		});
        
	});
</script>

<section id="main" class="container">
	<header>
			<h2>관리자 상품 수정</h2>
			<p>판매 상품 수정하기</p>
	</header>

<form method="post" action="productEditOk" id="productForm">
	<ul> 
		<li>상품명</li>
		<li><input type="hidden" name="pro_code" id="pro_code" value="${dto.pro_code }"/></li>
		<li><input type="text" name="pro_name" id="pro_name" value="${dto.pro_name }"/></li>
		<li>상품수량</li>
		<li><input type="number" name="pro_total" id="pro_total" min="10" value="${dto.pro_total }"/></li>
		<li>상품가격</li>
		<li><input type="number" name="pro_price" id="pro_price" min="1"  value="${dto.pro_price }"/></li>
		<li>재고개수</li>
		<li><input type="number" name="pro_stock" id="pro_stock" min="1" value="${dto.pro_stock }"/></li>
		<li>상품이미지 주소</li>
		<li>
			<input type="text" name="image" id="image" value="${dto.image }" readonly/>
			<img src=""/>
		</li>
		
		
		<!-- <li><input type="file" name=image id="image" accept=".gif, .jpg, .png"/></li> -->
		<li>상품정보</li>
		<li><textarea name="detailed" id="detailed">${dto.detailed }</textarea></li>
		<li><input type="submit" value="수정하기"/></li>
	</ul>
</form>
</section>
