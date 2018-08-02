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
<SCRIPT src="LXISTradeContMain.js"></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="LXISTradeContMainInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form action="./LXISTradeContMainSave.jsp" method=post name="fm" target="fraSubmit" >		
<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      引入合同基本信息录入控件         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
<jsp:include page="ContPage.jsp"/>
	<input type="hidden" name="hideOperate" id="hideOperate" value="" />
	<input type="hidden" name="CSNM1" id="CSNM1" value="<%=tCSNM%>" />
	<input type="hidden" name="RiskCode1" id="RiskCode1" value="<%=tRiskCode%>" />
<INPUT class=cssButton VALUE=" 保存合同信息 " name="subbutton" TYPE=button onclick="return submitForm();" />
<SCRIPT>
var tOper = '<%=Oper%>' ;
	var element = document.getElementsByName("subbutton")[0];
	if (tOper == "insert"){
		element.value = " 保存合同信息 ";
		fm.all("hideOperate").value = "INSERT||CUSTOM";
	} else{ 
		if (tOper == "update"){
			element.value = " 修改合同信息 ";
			fm.all("hideOperate").value = "UPDATE||CUSTOM";
			} else if (tOper == "delete"){
			element.value = " 删除合同信息 ";
			fm.all("hideOperate").value = "DELETE||CUSTOM";
				}

	}
	</SCRIPT>
<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      大额交易明细信息控件         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
			</td>
			<td class= titleImg>
				被保人信息
			</td>
		</tr>
	</table>
		<Div  id= "divTasks" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanTasksGrid" >
					</span> 
					</td>
				</tr>
			</table>
			<br />
		</Div>
			
		<INPUT class=cssButton VALUE=" 添加被保人信息 " name="insert" TYPE=button onclick="return GoToDetailInput(this.name);" />	
		<INPUT class=cssButton VALUE=" 维护被保人信息 " name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />	
		<INPUT class=cssButton VALUE=" 删除被保人信息 " name="delete" TYPE=button onclick="return GoToDetailInput(this.name);" />	
		<INPUT class=cssButton VALUE=" 查看被保人信息 " name="query" TYPE=button onclick="return GoToDetailInput(this.name);" />	
		<INPUT class=cssButton VALUE=" 返回 " name="return" TYPE=button onclick="return GoToReturn();" />				
	</form>	

<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
<script>
if (oper == "newquery"){
	for (var elementsNum=0; elementsNum< document.forms[0].elements.length; elementsNum++)
	{
		var element = document.forms[0].elements[elementsNum];
		element.readOnly = true;
		if (element.name == "insert" || element.name == "update" || element.name == "delete" ||element.name == "subbutton")
			//element.style.visibility = "hidden";
			element.disabled = true;
	}		
}
if (oper == "delete"){
	for (var elementsNum=0; elementsNum< document.forms[0].elements.length; elementsNum++)
	{
		var element = document.forms[0].elements[elementsNum];
		element.readOnly = true;
		if (element.name == "insert" || element.name == "update" || element.name == "delete")
			//element.style.visibility = "hidden";
			element.disabled = true;
	}		
}	
</script>
</html>