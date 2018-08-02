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
  String otype = new String(request.getParameter("otype"));
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
<script src="./LXShowAreaInputInput.js"></script>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="LXShowAreaInputInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form action="#" method=post name="fm" target="fraSubmit" >		
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
				</td>
				<td class= titleImg>
					查询条件
				</td>
			</tr>
		</table>
		<Div id= "divCustom" style= "display: '' ">
			<table class=common border=0>
				<TR class=common>
					<TD class="title" /> 交易发生地国籍编码</TD>
					<TD class="input"/>
				        <input name="Country" id="Country" class="common" />
			        </TD>
					<TD class="title" /> 交易发生地国籍名称</TD>
					<TD class="input"/>
				        <input name="CountryName" id="CountryName" class="common" />
			        </TD>
				</tr>
				<TR class=common>
					<TD class="title" /> 交易发生地行政地区编码</TD>
					<TD class="input"/>
				        <Input name="Province" id="Province" class="common" / >
			        </TD>
					<TD class="title" /> 交易发生地行政地区</TD>
					<TD class="input"/>
				        <Input name="ProvinceName" id="ProvinceName" class="common" / >
			        </TD>
				</TR>
					<!--增加地区类型选择 add by huangchong-->
				<TR class=common>
					<TD class="title" /> 交易发生地地区类型</TD>
					<TD class="input"/>
				          <input class=codeno name="TRCDType" CodeData="0|^CHN|中国大陆地区一般贸易区|^Z01|中国大陆地区保税区^Z02|中国大陆地区加工区^Z03|中国大陆地区钻石交易所"  ondblclick="return showCodeListEx('TRCDType', [this,TRCDTypeName],[0,1]);" onkeyup="return showCodeListKeyEx('TRCDType', [this,TRCDTypeName],[0,1]);""><input class=codename name=TRCDTypeName readonly=true>
			                </TD>
				</TR>
				<!--end-->
		</table>
		<input type="hidden" name="otype" id="otype" value="<%=otype%>">
		<INPUT class=cssButton VALUE=" 查询 " name="query" TYPE=button onclick="return initInpBox();" />		
		<INPUT class=cssButton VALUE=" 返回 " name="query" TYPE=button onclick="return returnParent();" />			
	
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTradeMain);">
				</td>
				<td class= titleImg>
					交易发生地明细信息
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
		</Div>
	</form>	

		
	<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>