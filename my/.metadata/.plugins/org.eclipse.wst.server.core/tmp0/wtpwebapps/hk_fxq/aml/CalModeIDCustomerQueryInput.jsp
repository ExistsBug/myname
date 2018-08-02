<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
	<%
		//程序名称：
		//程序功能：
		//创建日期：2002-08-21 09:25:18
		//创建人 ：HX
		//更新记录： 更新人  更新日期   更新原因/内容
	%>
	<%
		GlobalInput tGI = new GlobalInput();
		tGI = (GlobalInput) session.getValue("GI");
	%>
	<script>
var operator = "<%=tGI.Operator%>"; //记录操作员
var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
var comcode = "<%=tGI.ComCode%>"; //记录登陆机构
</script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<SCRIPT src="../common/javascript/Common.js">
</SCRIPT>
		<SCRIPT src="../common/javascript/MulLine.js">
</SCRIPT>
		<SCRIPT src="../common/Calendar/Calendar.js">
</SCRIPT>
		<SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
		<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
		<SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
		<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
		<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
		<SCRIPT src="CalModeIDCustomerQueryInput.js"></SCRIPT>
		<%@include file="CalModeIDCustomerQueryInit.jsp"%>
	</head>
	<body onload="initForm(); initElementtype();">
		<form method=post name=fm target="fraSubmit">
			<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divQuery);">
					</td>
					<td class=titleImg>
						客户查询
					</td>
				</tr>
			</table>
			<Div id="divQuery" style="display: ''">
				<table class=common border=0>
					<TR class=common>
						<TD class="title" />
							销售渠道
						</TD>
						<TD class=input>
							<Input class=codeno name="salechnl"
								onDblClick="return showCodeList('salechnl',[this,tSalechnl],[0,1]);"
								onKeyUp="return showCodeListKey('salechnl',[this,tSalechnl],[0,1]);"><input class=codename name="tSalechnl" readonly=true>
						</TD>
						</TD>
						<TD class="title" />
							交易方式
						</TD>
						<TD class=input>
							<Input class=codeno name="paymode"
								onDblClick="return showCodeList('paymodetype',[this,tPaymode],[0,1]);"
								onKeyUp="return showCodeListKey('paymodetype',[this,tPaymode],[0,1]);"><input class=codename name="tPaymode" readonly=true>
						</TD>
						</TD>
						<TD class=title>
							管理机构
						</TD>
						<!-- station46 -->
						<TD class=input>
							<Input class=codeno name="StatiCode"
								onDblClick="return showCodeList('station',[this,StatiCodeName],[0,1]);"
								onKeyUp="return showCodeListKey('station',[this,StatiCodeName],[0,1]);"><input class=codename name="StatiCodeName" readonly=true>
						</TD>
						<!-- 				    	
                <td class="title"></td>
                <td class="input"></td>
                <td class="title"></td>
                <td class="input"></td>
                 -->
						</TD>
					</TR>
					<TR class=common>
						<TD class="title" />
							识别方式
						</TD>
						<TD class=input>
							<Input class=codeno name="transtype1"
								onDblClick="return showCodeList('transtype1',[this,tTranstype1],[0,1]);"
								onKeyUp="return showCodeListKey('transtype1',[this,tTranstype1],[0,1]);"><input class=codename name="tTranstype1" readonly=true>
						</TD>
						<TD class=title>
							起始日期
						</TD>
						<TD class=input>
							<Input class="coolDatePicker" dateFormat="short" name=StartDate
								verify="交易发生起期|DATE">
						</TD>

						<TD class=title>
							结束日期
						</TD>
						<TD class=input>
							<Input class="coolDatePicker" dateFormat="short" name=EndDate
								verify="交易发生止期|DATE">
						</TD>
					</TR>
					<TR class=common>
						<TD class="title" />
							识别类型
						</TD>
						<TD class=input>
							<Input class=codeno name="transtype"
								onDblClick="return showCode(this,tTranstype);"
								onKeyUp="return showCodeKey(this,tTranstype);"><input class=codename name="tTranstype" readonly=true>
						</TD>
					</TR>
				</table>
				<INPUT class=cssButton VALUE=" 查 询 " name="query" TYPE=button
					onclick="QueryGrid();" />
				<INPUT VALUE="重  置" TYPE=button onclick="resetForm();"
					class="cssButton">
				<INPUT VALUE="导出EXCEL" name=ExcelButton TYPE=button class=cssbutton
					onclick="GoToExcel();">
				<input type=hidden name=QuerySQL VALUE="">
			</div>
			<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divCustom);">
					</td>
					<td class=titleImg>
						客户信息
					</td>
				</tr>
			</table>
			<Div id="divCustom" style="display: ''" />
				<table class=common>
					<tr class=common>
						<td>
							&nbsp;
							<span id="spanTasksGrid"></span>
						</td>
					</tr>
				</table>
				<div id="divTurnPageTasksGrid" align="center"
					style="display: 'none'">
					<input type="button" class="cssButton" value="首  页"
						onclick="turnPageTasksGrid.firstPage()">
					<input type="button" class="cssButton" value="上一页"
						onclick="turnPageTasksGrid.previousPage()">
					<input type="button" class="cssButton" value="下一页"
						onclick="turnPageTasksGrid.nextPage()">
					<input type="button" class="cssButton" value="尾  页"
						onclick="turnPageTasksGrid.lastPage()">
				</div>
				<br>
			</Div>
		</form>
		<span id="spanCode" style="display: none; position: absolute;"></span>
	</body>
</html>