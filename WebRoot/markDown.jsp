<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'markDown.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"></link> -->
	<style>
		body{
			padding:0px;
			margin:0px;
		}
	</style>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/markdown/showdown.min.js"></script>
	 <script>  
        $(function() {  
         	var converter = new showdown.Converter();  
	        $.get("js/markdown/markdownpad安装说明.md", function(response, status, xhr){ 
	        	var html_txt = converter.makeHtml(response);
				$("body").html(html_txt); 
			});
        });  
    </script>  

  </head>
  
  <body>
    
  </body>
</html>
