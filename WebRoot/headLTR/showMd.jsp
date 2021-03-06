<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>显示MD文件</title>
    
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
		 var md_file = $("#mdDoc").val();
		 $.get(md_file, function(md){
                    testEditor = editormd("test-editormd", {
                    	width: "86%",
                        height: "98.5%",
                        path : '../js/editormd/lib/',
                        markdown : md,
                        toolbar  : false,             //关闭工具栏,
                        readOnly : true,
                        onload:function(){
                        	this.previewing();
                        }
                    });
                    
                });
    });
	</script>

  </head>
  
  <body>
    <!--编辑器-->
	<div id="test-editormd" style="border:none;">
	</div>
	<input type="hidden" id="mdDoc" value="<%=request.getParameter("mdPath")%>">
  </body>
</html>
