<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mdshow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="editormd/css/editormd.min.css">
  </head>
  
  <body>
    <div class="editormd-preview" style="display: block; width: 684px; top: 0px; height: 668.15px;"><div class="markdown-body editormd-preview-container" previewcontainer="true" style="padding: 20px;"><h3 id="h3-markdown-"><a name="MarkDown语法" class="reference-link"></a><span class="header-link octicon octicon-link"></span>MarkDown语法</h3><h4 id="h4-1-"><a name="1. 标题序号" class="reference-link"></a><span class="header-link octicon octicon-link"></span>1. 标题序号</h4><h1 id="h1-u4E00u7EA7u6807u9898"><a name="一级标题" class="reference-link"></a><span class="header-link octicon octicon-link"></span>一级标题</h1><h2 id="h2-u4E8Cu7EA7u6807u9898"><a name="二级标题" class="reference-link"></a><span class="header-link octicon octicon-link"></span>二级标题</h2><h3 id="h3-u4E09u7EA7u6807u9898"><a name="三级标题" class="reference-link"></a><span class="header-link octicon octicon-link"></span>三级标题</h3><h4 id="h4-u56DBu7EA7u6807u9898"><a name="四级标题" class="reference-link"></a><span class="header-link octicon octicon-link"></span>四级标题</h4><h6 id="h6-u4E94u7EA7u6807u9898"><a name="五级标题" class="reference-link"></a><span class="header-link octicon octicon-link"></span>五级标题</h6><h6 id="h6-u516Du7EA7u6807u9898"><a name="六级标题" class="reference-link"></a><span class="header-link octicon octicon-link"></span>六级标题</h6><h4 id="h4-2-"><a name="2.表格" class="reference-link"></a><span class="header-link octicon octicon-link"></span>2.表格</h4><table>
<thead>
<tr>
<th>语言</th>
<th>评分</th>
</tr>
</thead>
<tbody>
<tr>
<td>Java</td>
<td>96</td>
</tr>
<tr>
<td>C#</td>
<td>95</td>
</tr>
<tr>
<td>Python</td>
<td>96</td>
</tr>
</tbody>
</table>
<h4 id="h4-3-"><a name="3.代码高亮" class="reference-link"></a><span class="header-link octicon octicon-link"></span>3.代码高亮</h4><h5 id="h5-java"><a name="Java" class="reference-link"></a><span class="header-link octicon octicon-link"></span>Java</h5><pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="lang-java"><span class="kwd">public</span><span class="pln"> </span><span class="kwd">class</span><span class="pln"> </span><span class="typ">Test</span><span class="pun">{</span></code></li><li class="L1"><code class="lang-java"><span class="pln">    </span><span class="kwd">public</span><span class="pln"> </span><span class="kwd">static</span><span class="pln"> </span><span class="kwd">void</span><span class="pln"> main</span><span class="pun">(</span><span class="typ">String</span><span class="pun">[]</span><span class="pln"> args</span><span class="pun">){</span></code></li><li class="L2"><code class="lang-java"><span class="pln">        </span><span class="typ">System</span><span class="pun">.</span><span class="pln">out</span><span class="pun">.</span><span class="pln">println</span><span class="pun">(</span><span class="str">"HELLO JAVA!"</span><span class="pun">)；</span></code></li><li class="L3"><code class="lang-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L4"><code class="lang-java"><span class="pun">}</span></code></li></ol></pre>
<h4 id="h4-javascript"><a name="JavaScript" class="reference-link"></a><span class="header-link octicon octicon-link"></span>JavaScript</h4><pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="lang-javascript"><span class="pln">$</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(){</span></code></li><li class="L1"><code class="lang-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> count </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span></code></li><li class="L2"><code class="lang-javascript"><span class="pln">    </span><span class="kwd">for</span><span class="pun">(</span><span class="kwd">var</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">&lt;=</span><span class="lit">100</span><span class="pln"> </span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++){</span></code></li><li class="L3"><code class="lang-javascript"><span class="pln">        count </span><span class="pun">=</span><span class="pln"> count </span><span class="pun">+</span><span class="pln"> i</span><span class="pun">;</span></code></li><li class="L4"><code class="lang-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L5"><code class="lang-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="str">"sum(1-100)"</span><span class="pun">+</span><span class="pln">count</span><span class="pun">);</span></code></li><li class="L6"><code class="lang-javascript"><span class="pun">});</span></code></li></ol></pre>
<h4 id="h4-html"><a name="HTML" class="reference-link"></a><span class="header-link octicon octicon-link"></span>HTML</h4><pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="lang-html"><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">style</span><span class="pun">=</span><span class="atv">"</span><span class="pln">width</span><span class="pun">:</span><span class="lit">200px</span><span class="pun">;</span><span class="pln">height</span><span class="pun">:</span><span class="lit">200px</span><span class="pun">;</span><span class="pln">background</span><span class="pun">-</span><span class="pln">color</span><span class="pun">:#</span><span class="pln">ffeeff</span><span class="pun">;</span><span class="atv">"</span><span class="tag">&gt;</span></code></li><li class="L1"><code class="lang-html"><span class="pln">    HELLO KITTY</span></code></li><li class="L2"><code class="lang-html"><span class="tag">&lt;/div&gt;</span></code></li></ol></pre>
</div></div>
  </body>
</html>
