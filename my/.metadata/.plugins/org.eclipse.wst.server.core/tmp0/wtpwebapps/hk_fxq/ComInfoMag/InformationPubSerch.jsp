<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>

<%
//程序名称：LXPostInput.jsp
//程序功能：对岗位信息的操作页面
//创建日期：2010-04-02 11:15:40
//创建人 ：Lips
//更新记录：  更新人    更新日期     更新原因/内容
%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
</script>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>综合信息发布查询</title>
		<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
		<SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
		<SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
		<SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
		<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
		<SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
		<!-- 公共引用样式 -->
		<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
		<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
		<style>
			body{
				margin:0px;
				padding:0px;
				font-size:16px;
				font-family:verdana,sans-serif;
				background-color:#F7F7F7;
			}

			#tab{
				width:100%;
				height:100%;
				border:1px solid #7b9ebd;
			}
			#top{
				margin:5px 5px 0px 5px;
				width:420px;
				background-color:#F7F7F7;
				float:left;
			}

			ul{
				margin:0px;
				padding:0px;
				list-style:none;
			}

			#top ul li,#top ul li a{
				margin:0px;
				padding:0px;
				float:left;
			}
	
			#top .title{
				//margin-left:2px;
				width:85px;
				height:30px;
				line-height:30px;
				text-align:center;
				font-weight:bold;	
				background-color:#AABFEC;	
			}

			#nav{
				clear:both;
			}
			#bottom{
				width:100%;
				height:100%;
				margin:0px 5px 0px 5px;
				overflow:hidden;
				border:0px solid black;
				background-color:white;
				border-top:0px;
			}

			#top a:link,a:visited{
				width:100%;
				height:100%;
				color:black;
				text-decoration:none;
				border:1px solid black;
			}

			#top a:hover,a:active{
				width:100%;
				height:100%;
				background-color:#999999;
				border-color:#fff;
				border:1px solid black;
				border-bottom:0px;
			}
		</style>

		<script>
			function show(src,des){
				//alert(des);
				for(i=1;i<5;i++){
					//alert(i);
					if(des==i){
						document.getElementById("ondiv"+i).style.display = "block";
						document.getElementById("tab"+i).style.backgroundColor = "#fff";
						document.getElementById("tab"+i).firstChild.style.borderBottom = "0px";
					
					}else{
						document.getElementById("ondiv"+i).style.display = "none";
						document.getElementById("tab"+i).style.backgroundColor = "";
						document.getElementById("tab"+i).firstChild.style.borderBottom = "";					
					}
				}
			}
		</script>
	</head>
	<body>
		<div id="tab">
			<div id="top">
				<ul>
					<li id="tab1" class="title" onclick="show(this,'1')"><a   href="###">通知发布</a></li>
					<li id="tab2" class="title" onclick="show(this,'2')"><a href="###">政策法规</a></li>
					<li id="tab3" class="title" onclick="show(this,'3')"><a href="###">规章制度</a></li>
					<li id="tab4" class="title" onclick="show(this,'4')"><a href="###">知识园地</a></li>	
				</ul>
			</div>
			<div id="nav"></div>
			<br/>
			<div id="bottom">
				<div id="ondiv1" class="content" style="display:block">
				  
				</div>
				<div id="ondiv2" class="content" style="display:none">
				 <jsp:include page="LXPolicRulpubInput.jsp"/>
				</div>
				<div id="ondiv3" class="content" style="display:none">
				
				</div>
				<div id="ondiv4" class="content" style="display:none">
					
				</div>
			</div>
		</div>
	</body>
</html>