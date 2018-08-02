<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//程序名称：
//程序功能：
//创建日期：2002-08-21 09:25:18
//创建人 ：HX
//更新记录： 更新人  更新日期   更新原因/内容
%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
<SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
<SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
<SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
<SCRIPT src="LXISTradeManualMain.js"></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="LXISTradeManualMainInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form action="./LXISTradeManualMainSaveB.jsp" method=post name="fm" target="fraSubmit" >		

<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      可疑交易主表信息控件         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTradeMain);">
				</td>
				<td class= titleImg>
					可疑交易信息
				</td>
			</tr>
		</table>
		<Div  id= "divTradeMain" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanTradeMainGrid" >
					</span> 
					</td>
				</tr>
				<table align="center">
					<INPUT CLASS=cssButton VALUE="首页" TYPE=button onclick="turnPage.firstPage();" /> 
					<INPUT CLASS=cssButton VALUE="上一页" TYPE=button onclick="turnPage.previousPage();" />
					<INPUT CLASS=cssButton VALUE="下一页" TYPE=button onclick="turnPage.nextPage();" /> 
					<INPUT CLASS=cssButton VALUE="尾页" TYPE=button onclick="turnPage.lastPage();" />
				</table>		
			</table><br>
			<input type=hidden name="Date" id="Date">
			<input type=hidden name="hideDealNo" id="hideDealNo">
			<input type=hidden name="hideOperate" id="hideOperate">
			<input type=hidden name="CSNM" id="CSNM">			
			<INPUT class=cssButton VALUE=" 新   增 " name="insert" TYPE=button onclick="return GoToInputTrade(this.name);" />	
			<INPUT class=cssButton VALUE=" 修   改 " name="update" TYPE=button onclick="return GoToInputTrade(this.name);" />	
			<!--  INPUT class=cssButton VALUE=" 删除 " name="delete" TYPE=button onclick="return GoToInputTrade(this.name);" / -->	
      		<INPUT class=cssButton VALUE=" 删除附件 " name="delaccessories" TYPE=button onclick="DelAccessories(this.name)" />				
			<INPUT class=cssButton VALUE=" 查   询 " name="query" TYPE=button onclick="return GoToInputTrade(this.name);" />	
								
		</Div>
		<hr>
	</form>	
<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      上传文件控件         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<form method=post name="upfm" id="upfm" target="fraSubmit" ENCTYPE="multipart/form-data">
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divUpload);">
				</td>
				<td class= titleImg>
					上传交易信息附件
				</td>
			</tr>
		</table>
		<Div  id= "divUpload" style= "display: '' "/>
			<table class="common">
				<TR  class="common" >	      
					<TD class="title" style="width : 17%" >
						文件地址
					</TD>
					<TD class= common >
						<Input class= common3 style="width:39%" type="file" name="FileName" id="FileName" >
					</TD>
				</TR>
			</table>
		</div>
		<input type=hidden name=ImportFileType>
		<input type=hidden name=ImportConfigFile value="">	
		<INPUT VALUE=" 上传附件 " class= "cssButton" TYPE= button onclick="return GoToUpload();">
	<HR><BR><INPUT class=cssButton VALUE=" 录入完毕 " name="finish" TYPE=button onclick="return GoToInputTrade(this.name);" />
	<INPUT class=cssButton VALUE=" 返   回 " name="return" TYPE=button onclick="return GoToReturn();" />		
	</form>  
		
	<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>