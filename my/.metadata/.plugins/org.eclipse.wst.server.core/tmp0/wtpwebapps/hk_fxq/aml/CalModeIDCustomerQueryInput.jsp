<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
	<%
		//�������ƣ�
		//�����ܣ�
		//�������ڣ�2002-08-21 09:25:18
		//������ ��HX
		//���¼�¼�� ������  ��������   ����ԭ��/����
	%>
	<%
		GlobalInput tGI = new GlobalInput();
		tGI = (GlobalInput) session.getValue("GI");
	%>
	<script>
var operator = "<%=tGI.Operator%>"; //��¼����Ա
var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
var comcode = "<%=tGI.ComCode%>"; //��¼��½����
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
						�ͻ���ѯ
					</td>
				</tr>
			</table>
			<Div id="divQuery" style="display: ''">
				<table class=common border=0>
					<TR class=common>
						<TD class="title" />
							��������
						</TD>
						<TD class=input>
							<Input class=codeno name="salechnl"
								onDblClick="return showCodeList('salechnl',[this,tSalechnl],[0,1]);"
								onKeyUp="return showCodeListKey('salechnl',[this,tSalechnl],[0,1]);"><input class=codename name="tSalechnl" readonly=true>
						</TD>
						</TD>
						<TD class="title" />
							���׷�ʽ
						</TD>
						<TD class=input>
							<Input class=codeno name="paymode"
								onDblClick="return showCodeList('paymodetype',[this,tPaymode],[0,1]);"
								onKeyUp="return showCodeListKey('paymodetype',[this,tPaymode],[0,1]);"><input class=codename name="tPaymode" readonly=true>
						</TD>
						</TD>
						<TD class=title>
							�������
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
							ʶ��ʽ
						</TD>
						<TD class=input>
							<Input class=codeno name="transtype1"
								onDblClick="return showCodeList('transtype1',[this,tTranstype1],[0,1]);"
								onKeyUp="return showCodeListKey('transtype1',[this,tTranstype1],[0,1]);"><input class=codename name="tTranstype1" readonly=true>
						</TD>
						<TD class=title>
							��ʼ����
						</TD>
						<TD class=input>
							<Input class="coolDatePicker" dateFormat="short" name=StartDate
								verify="���׷�������|DATE">
						</TD>

						<TD class=title>
							��������
						</TD>
						<TD class=input>
							<Input class="coolDatePicker" dateFormat="short" name=EndDate
								verify="���׷���ֹ��|DATE">
						</TD>
					</TR>
					<TR class=common>
						<TD class="title" />
							ʶ������
						</TD>
						<TD class=input>
							<Input class=codeno name="transtype"
								onDblClick="return showCode(this,tTranstype);"
								onKeyUp="return showCodeKey(this,tTranstype);"><input class=codename name="tTranstype" readonly=true>
						</TD>
					</TR>
				</table>
				<INPUT class=cssButton VALUE=" �� ѯ " name="query" TYPE=button
					onclick="QueryGrid();" />
				<INPUT VALUE="��  ��" TYPE=button onclick="resetForm();"
					class="cssButton">
				<INPUT VALUE="����EXCEL" name=ExcelButton TYPE=button class=cssbutton
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
						�ͻ���Ϣ
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
					<input type="button" class="cssButton" value="��  ҳ"
						onclick="turnPageTasksGrid.firstPage()">
					<input type="button" class="cssButton" value="��һҳ"
						onclick="turnPageTasksGrid.previousPage()">
					<input type="button" class="cssButton" value="��һҳ"
						onclick="turnPageTasksGrid.nextPage()">
					<input type="button" class="cssButton" value="β  ҳ"
						onclick="turnPageTasksGrid.lastPage()">
				</div>
				<br>
			</Div>
		</form>
		<span id="spanCode" style="display: none; position: absolute;"></span>
	</body>
</html>