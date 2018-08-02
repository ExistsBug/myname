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
   String IDX1= request.getParameter("IDX");
  String tInfoStyle2 = request.getParameter("infoStyle");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
   var tIDX="<%=IDX1%>"; 
  var tInfoStyle="<%=tInfoStyle2%>";
</script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>通知详细信息</title>
		<!-- 公共引用脚本 -->
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
		<!-- 私有引用脚本 -->
		<%@ include file="LXPolicRulmageDetialInit.jsp" %>
			<SCRIPT src="LXPolicRulmageDetial.js"></SCRIPT>
	</head>
	<body onload="initForm(); initElementtype();">
		<form action="./NotificationSave.jsp" name="fm" method="post" target="fraSubmit">
			<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divQuery2);">
					</td>
					<td class=titleImg>
						通知详细信息
					</td>
				</tr>
			</table>
		<Div id="divQuery2" style="display: ''">
				<table class=common border=0>
					<TR>
						<TD class=title>
							发布单位
						</TD>
						<TD  class= "input">
						<Input class=codeno name="MangeCom" readonly 
							" 
							
						"><input class=codename name="MangeComName" readonly=true>
						</TD>
						<TD class="title" />
							文号
						</TD>
						<TD class="input"/>
                    		<input name="RefNum" id="RefNum" class="common"  />
                		</TD>
					</TR>
					<TR>
						<TD class="title" />
							发布对象
						</TD>
						<TD class="input"/>
                    		<input name="PubObj" id="PubObj" class="common"  />
                		</TD>
                		<TD class="title" />
							标题名称
						</TD>
						<TD class="input" />
							 <input name="TitleName" id="TitleName" class="common"  />
						</TD>
					</TR>
					<TR>
                		<TD class="title" />
							发布内容
						</TD>
						<TD class="input" colspan=8 >
							<textarea style="width: 83%;height:50" name="PubCont" id="PubCont"
								class="common" verify="发布内容|len<=200"
								 /></textarea>
						</TD>
					</TR>
				</table>
				 </div>   
			</div>
			<INPUT class=cssButton VALUE="返  回 " name="return" TYPE=button
				onclick="GoToReturn()" />
				<INPUT class=cssButton VALUE=" 下载附件 " name="DownLoad" TYPE=button
				onclick="GoToDownLoad(this.name)" />
			<br/>
		</form>
		<span id="spanCode" style="display: none; position: absolute;"></span>
	</body>
</html>
