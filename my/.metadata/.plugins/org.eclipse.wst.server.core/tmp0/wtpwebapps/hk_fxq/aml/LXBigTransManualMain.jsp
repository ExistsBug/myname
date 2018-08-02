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

%>


<head>
<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
<SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
<SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
<SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
<SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
<SCRIPT src="LXBigTransManualMain.js"></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="LXBigTransManualMainInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form method=post name="fm" target="fraSubmit" >		
<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      引入基本信息录入控件         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
         <%@ include file="LXIHTradeMainDetailPage.jsp" %>
		<INPUT class=cssButton VALUE=" 保存 " name="insert" TYPE=button onclick="GoToMainInput()" />
		<br>
		<hr /><br>
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
				大额交易明细信息
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
		<table align="center">
			<INPUT CLASS=cssButton VALUE="首页" TYPE=button onclick="turnPage.firstPage();" /> 
			<INPUT CLASS=cssButton VALUE="上一页" TYPE=button onclick="turnPage.previousPage();" />
			<INPUT CLASS=cssButton VALUE="下一页" TYPE=button onclick="turnPage.nextPage();" /> 
			<INPUT CLASS=cssButton VALUE="尾页" TYPE=button onclick="turnPage.lastPage();" />
		</table>
		<br />
		<input type="hidden" name="hideOperate" id="hideOperate" value="" />
		<INPUT class=cssButton VALUE=" 新 增 " name="insert" TYPE=button onclick="GoToDetailInput(this.name)" />
		<INPUT class=cssButton VALUE=" 修 改 " name="update" TYPE=button onclick="GoToDetailInput(this.name)" />
		<INPUT class=cssButton VALUE=" 删 除 " name="delete" TYPE=button onclick="GoToDelDetail()" />			
	</Div>
	<hr />	
	<br>	
	<INPUT class=cssButton VALUE=" 录入完毕 " name="finish" TYPE=button onclick="GoToWorkFlow()" />	
	<INPUT class=cssButton VALUE=" 返   回 " name="return" TYPE=button onclick="GoParent()" />			
	</form>	

<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
<script language="JavaScript">
	showCodeName(); 
</script>
</html>