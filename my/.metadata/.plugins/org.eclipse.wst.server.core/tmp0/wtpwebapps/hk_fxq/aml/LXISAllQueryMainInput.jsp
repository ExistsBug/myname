<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<%
	GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>"; //��¼��½����
</script>
<%@ include file="../common/jsp/UsrCheck.jsp"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����ۺϲ�ѯ</title>
<!-- ����������ʽ -->
<link href="../common/css/Project.css" type="text/css" rel="stylesheet">
<link href="../common/css/mulLine.css" type="text/css" rel="stylesheet">
<!-- �������ýű� -->
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
<!-- ˽�����ýű� -->
<script language="JavaScript" src="LXISAllQueryMain.js"></script>
<%@ include file="LXISAllQueryMainInit.jsp"%>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
	<form name="fm" method="post" target="fraSubmit">
		<!-- ���ײ�ѯ�۵�չ�� -->
		<table>
			<tr>
				<td class="common"><img src="../common/images/butExpand.gif"
					style="cursor: hand"
					onclick="showPage(this,divWaitForBeFileSearch)"></td>
				<td class="titleImg">�����ۺϲ�ѯ</td>
			</tr>
		</table>
		<div id="divWaitForBeFileSearch" style="display: ''">
			<!-- ���ײ�ѯ¼���� -->
			<table class="common">
				<tr class="common">
					<td class="title">��ʼ����</td>
					<td class="input"><input type="text" class="coolDatePicker"
						name="StartDate" maxlength="10" dateFormat="short"
						verify="��ʼ����|Date"></td>
					<td class="title">��������</td>
					<td class="input"><input type="text" class="coolDatePicker"
						name="EndDate" maxlength="10" dateFormat="short"
						verify="��������|Date"></td>
				</tr>
				<tr class="common">
					<td class="title">�ͻ���</td>
					<td class="input"><input type="text" class="common"
						name="CSNM"></td>
					<td class="title">�ͻ�����/����</td>
					<td class="input"><input type="text" class="common"
						name="CTNM"></td>
				</tr>
				<tr class="common">
					<TD class="title">���ɽ�������</TD>
					<TD class="input"><Input name="STCR" id="STCR" class="code"
						verify="���ɽ�������|Code:amlshadinessstamp"
						ondblclick="showCodeList('amlshadinessstamp',[this]);"
						onkeyup="showCodeListKey('amlshadinessstamp',[this]);"
						elementtype=nacessary /></TD>
					<td class="title">����״̬</td>
					<td class="input"><Input name="DataState" id="DataState"
						class="code" verify="����״̬|Code:amldatastate"
						ondblclick="showCodeList('amldatastate',[this]);"
						onkeyup="showCodeListKey('amldatastate',[this]);"
						elementtype=nacessary /></td>
				</tr>
				<tr class="common">
					<td class="title">���ɳ̶�</td>
					<TD class="input"><Input name="SDGR" id="SDGR" class="codeno"
						verify="���ɳ̶�|Code:amlshadiness"
						ondblclick="showCodeList('amlshadiness',[this,SDGRName],[0,1]);"
						onkeyup="showCodeListKey('amlshadiness',[this,SDGRName],[0,1]);" />
						<Input class=codename name=SDGRName readOnly elementtype=nacessary />
					</TD>
					<td class="title">�������</td>
					<TD class="input"><Input name="ManageCom" id="ManageCom"
						class="codeno" verify="�������|Code:station"
						ondblclick="showCodeList('station',[this,ManageComName],[0,1]);"
						onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);" />
						<Input class=codename name=ManageComName readOnly
						elementtype=nacessary /></TD>
				</tr>
			</table>
			<!-- �ύ���ݲ�����ť -->
			<input type="button" class="cssButton" value=" �� ѯ "
				onclick="queryWaitForBeFileGrid()">
			<!--
            <input type="button" class="cssButton" value=" �� �� " onclick="turnPageWaitForBeFileGrid.makeExcel();">
            -->
			<input type="button" class="cssButton" value=" �� �� "
				onclick="GoToExcel()">
		</div>
		<!-- ������Ϣ�۵�չ�� -->
		<table>
			<tr>
				<td class="common"><img src="../common/images/butExpand.gif"
					style="cursor: hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
				<td class="titleImg">�����ۺϲ�ѯ���</td>
			</tr>
		</table>
		<!-- ������Ϣչ�ֱ�� -->
		<div id="divWaitForBeFileGrid" style="display: ''">
			<table class="common">
				<tr class="common">
					<td><span id="spanWaitForBeFileGrid"></span></td>
				</tr>
			</table>
			<!-- ������Ϣ�����ҳ -->
			<div id="divTurnPageWaitForBeFileGrid" align="center"
				style="display: 'none'">
				<input type="button" class="cssButton" value="��  ҳ"
					onclick="turnPageWaitForBeFileGrid.firstPage()"> <input
					type="button" class="cssButton" value="��һҳ"
					onclick="turnPageWaitForBeFileGrid.previousPage()"> <input
					type="button" class="cssButton" value="��һҳ"
					onclick="turnPageWaitForBeFileGrid.nextPage()"> <input
					type="button" class="cssButton" value="β  ҳ"
					onclick="turnPageWaitForBeFileGrid.lastPage()">
			</div>
			<!-- �ύ���ݲ�����ť -->
			<br>
		</div>
		<br>
		<!-- �鿴�ǿ���ԭ�� -->
		<div id="divreasonofcancelreport" style="display: 'none'">
			<table>
				<tr>
					<td class="common"><img src="../common/images/butExpand.gif"
						style="cursor: hand" onclick="showPage(this,divreasonofcancel)"></td>
					<td class="titleImg">�ǿ���ԭ��</td>
				</tr>
			</table>
			<div id="divreasonofcancel" style="display: ''">
				<div id="divfileofcancel" style="display: 'none'">
					<INPUT class=cssButton VALUE="ԭ�򸽼�����" id="download" name="download"
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
		<!-- ��ȡ���ݵ������� -->
		<input type="hidden" name="Operation"> <input type="hidden"
			id="FileName" name="FileName"> <input type="hidden"
			id="DisplayFileName" name="DisplayFileName">
		<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ������ϸ��Ϣ�ؼ�
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
		<INPUT class=cssButton VALUE="�鿴������Ϣ" name="query" TYPE=button
			onclick="return GoToDetailInput(this.name);" />
	</form>
	<!-- ͨ��������Ϣ�б� -->
	<span id="spanCode" style="display: none; position: absolute;"></span>
</body>
</html>
