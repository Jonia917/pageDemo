<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'editorMd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../js/editormd/css/editormd.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/editormd/editormd.js"></script>
    <script type="text/javascript">
	//    调用编辑器
	var testEditor;
	$(function() {
	    testEditor = editormd("test-editormd", {
	        width   : "90%",
	        height  : "90%",
	        syncScrolling : "single",
	        path    : "../js/editormd/lib/",
           /*  markdown : md,  */
            codeFold : true,
            saveHTMLToTextarea : true,
            searchReplace : true,
            placeholder : "请输入......",
            delay : 300,
            toolbarIcons : function() {
            	var icons = ["undo", "redo", "|", 
            "bold", "del", "italic", "quote", "ucwords", "uppercase", "lowercase", "|", 
            "h1", "h2", "h3", "h4", "h5", "h6", "|", 
            "list-ul", "list-ol", "hr", "|",
            "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "datetime", "emoji", "html-entities", "pagebreak", "|",
            "goto-line", "watch", "preview", "clear", "search", "|",
            "save","help", "info"];
            	return icons;
            },
            toolbarCustomIcons : {
	            save : "<i class=\"fa fa-save\" style='cursor:pointer;margin-right: 8px;margin-left: 10px;' onclick=\"alert('保存');\"></i>"
	        },
            emoji : true,
            taskList : true,
            tocm : true,         // Using [TOCM]
            tex : true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart : true,             // 开启流程图支持，默认关闭
            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "examples/php/upload.php",
            onload : function() {
                console.log('onload', this);
            }
	    });
	   
	    $("#mark_down_txt").click(function(){
	    	var mark_down = testEditor.getMarkdown(); 
	    	alert(mark_down);
	    });
	    $("#html_txt").click(function(){
	    	var mark_down = testEditor.getHTML(); 
	    	alert(mark_down);
	    });
	});
	</script>

  </head>
  
  <body>
    <!--编辑器-->
	<div id="test-editormd">
	    <textarea style="display:none;" id="ts"></textarea>
	</div>
	<div>
		<input type="button" value="MarkDwon" id="mark_down_txt">
		<input type="button" value="HTML" id="html_txt">
	</div>
  </body>
</html>
