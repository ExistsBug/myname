<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%
	GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>"; //记录登陆机构
</script>
<%@ include file="../common/jsp/UsrCheck.jsp"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>可疑综合查询</title>
<!-- 公共引用样式 -->
<link href="../common/css/Project.css" type="text/css" rel="stylesheet">
<link href="../common/css/mulLine.css" type="text/css" rel="stylesheet">
<!-- 公共引用脚本 -->
<script language="JavaScript" src="../common/Calendar/Calendar.js"></script>
<script language="JavaScript" src="../common/javascript/Common.js"></script>
<script language="JavaScript" src="../common/cvar/CCodeOperate.js"></script>
<script language="JavaScript" src="../common/javascript/MulLine.js"></script>
<script language="JavaScript" src="../common/javascript/EasyQuery.js"></script>
<script language="JavaScript"
	src="../common/easyQueryVer3/EasyQueryVer3.js"></script>
<script language="JavaScript"
	src="../common/easyQueryVer3/EasyQueryCache.js"></script>
<script language="JavaScript" src="../common/javascript/VerifyInput.js"></script>
<!-- 私有引用脚本 -->
<script language="JavaScript" src="LXISAllQueryMain.js"></script>
<%@ include file="LXISAllQueryMainInit.jsp"%>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
	<form name="fm" method="post" target="fraSubmit">
		<!-- 交易查询折叠展开 -->
		<table>
			<tr>
				<td class="common"><img src="../common/images/butExpand.gif"
					style="cursor: hand"
					onclick="showPage(this,divWaitForBeFileSearch)"></td>
				<td class="titleImg">可疑综合查询</td>
			</tr>
		</table>
		<div id="divWaitForBeFileSearch" style="display: ''">
			<!-- 交易查询录入表格 -->
			<table class="common">
				<tr class="common">
					<td class="title">起始日期</td>
					<td class="input"><input type="text" class="coolDatePicker"
						name="StartDate" maxlength="10" dateFormat="short"
						verify="起始日期|Date"></td>
					<td class="title">结束日期</td>
					<td class="input"><input type="text" class="coolDatePicker"
						name="EndDate" maxlength="10" dateFormat="short"
						verify="结束日期|Date"></td>
				</tr>
				<tr class="common">
					<td class="title">客户号</td>
					<td class="input"><input type="text" class="common"
						name="CSNM"></td>
					<td class="title">客户名称/姓名</td>
					<td class="input"><input type="text" class="common"
						name="CTNM"></td>
				</tr>
				<tr class="common">
					<TD class="title">可疑交易特征</TD>
					<TD class="input"><Input name="STCR" id="STCR" class="code"
						verify="可疑交易特征|Code:amlshadinessstamp"
						ondblclick="showCodeList('amlshadinessstamp',[this]);"
						onkeyup="showCodeListKey('amlshadinessstamp',[this]);"
						elementtype=nacessary /></TD>
					<td class="title">数据状态</td>
					<td class="input"><Input name="DataState" id="DataState"
						class="code" verify="数据状态|Code:amldatastate"
						ondblclick="showCodeList('amldatastate',[this]);"
						onkeyup="showCodeListKey('amldatastate',[this]);"
						elementtype=nacessary /></td>
				</tr>
				<tr class="common">
					<td class="title">可疑程度</td>
					<TD class="input"><Input name="SDGR" id="SDGR" class="codeno"
						verify="可疑程度|Code:amlshadiness"
						ondblclick="showCodeList('amlshadiness',[this,SDGRName],[0,1]);"
						onkeyup="showCodeListKey('amlshadiness',[this,SDGRName],[0,1]);" />
						<Input class=codename name=SDGRName readOnly elementtype=nacessary />
					</TD>
					<td class="title">管理机构</td>
					<TD class="input"><Input name="ManageCom" id="ManageCom"
						class="codeno" verify="管理机构|Code:station"
						ondblclick="showCodeList('station',[this,ManageComName],[0,1]);"
						onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);" />
						<Input class=codename name=ManageComName readOnly
						elementtype=nacessary /></TD>
				</tr>
			</table>
			<!-- 提交数据操作按钮 -->
			<input type="button" class="cssButton" value=" 查 询 "
				onclick="queryWaitForBeFileGrid()">
			<!--
            <input type="button" class="cssButton" value=" 导 出 " onclick="turnPageWaitForBeFileGrid.makeExcel();">
            -->
			<input type="button" class="cssButton" value=" 导 出 "
				onclick="GoToExcel()">
		</div>
		<!-- 交易信息折叠展开 -->
		<table>
			<tr>
				<td class="common"><img src="../common/images/butExpand.gif"
					style="cursor: hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
				<td class="titleImg">可疑综合查询结果</td>
			</tr>
		</table>
		<!-- 交易信息展现表格 -->
		<div id="divWaitForBeFileGrid" style="display: ''">
			<table class="common">
				<tr class="common">
					<td><span id="spanWaitForBeFileGrid"></span></td>
				</tr>
			</table>
			<!-- 交易信息结果翻页 -->
			<div id="divTurnPageWaitForBeFileGrid" align="center"
				style="display: 'none'">
				<input type="button" class="cssButton" value="首  页"
					onclick="turnPageWaitForBeFileGrid.firstPage()"> <input
					type="button" class="cssButton" value="上一页"
					onclick="turnPageWaitForBeFileGrid.previousPage()"> <input
					type="button" class="cssButton" value="下一页"
					onclick="turnPageWaitForBeFileGrid.nextPage()"> <input
					type="button" class="cssButton" value="尾  页"
					onclick="turnPageWaitForBeFileGrid.lastPage()">
			</div>
			<!-- 提交数据操作按钮 -->
			<br>
		</div>
		<br>
		<!-- 查看非可疑原因 -->
		<div id="divreasonofcancelreport" style="display: 'none'">
			<table>
				<tr>
					<td class="common"><img src="../common/images/butExpand.gif"
						style="cursor: hand" onclick="showPage(this,divreasonofcancel)"></td>
					<td class="titleImg">非可疑原因</td>
				</tr>
			</table>
			<div id="divreasonofcancel" style="display: ''">
				<div id="divfileofcancel" style="display: 'none'">
					<INPUT class=cssButton VALUE="原因附件下载" id="download" name="download"
						TYPE=button onclick="getFile();" /> <br />
				</div>
				<table class="common">
					<tr>
						<td class="input" colspan=8><textarea style="width: 97%"
								name="reason" id="reason" class="common" /></textarea></td>
					</tr>
				</table>
			</div>
			<br />
		</div>
		<!-- 获取数据的隐藏域 -->
		<input type="hidden" name="Operation"> <input type="hidden"
			id="FileName" name="FileName"> <input type="hidden"
			id="DisplayFileName" name="DisplayFileName">
		<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      大额交易明细信息控件
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
		<INPUT class=cssButton VALUE="查看交易信息" name="query" TYPE=button
			onclick="return GoToDetailInput(this.name);" />
	</form>
	<!-- 通用下拉信息列表 -->
	<span id="spanCode" style="display: none; position: absolute;"></span>
</body>
</html>
