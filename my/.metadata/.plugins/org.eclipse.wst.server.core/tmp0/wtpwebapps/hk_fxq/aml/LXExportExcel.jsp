<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
</script>

<html>
<head>
    <title>��ϸ����</title>
    <!-- ����������ʽ -->
    <link href="../common/css/Project.css" type="text/css" rel="stylesheet">
    <link href="../common/css/mulLine.css" type="text/css" rel="stylesheet">
    <!-- �������ýű� -->
    <script language="JavaScript" src="../common/Calendar/Calendar.js"></script>
    <script language="JavaScript" src="../common/javascript/Common.js"></script>
    <script language="JavaScript" src="../common/cvar/CCodeOperate.js"></script>
    <script language="JavaScript" src="../common/javascript/MulLine.js"></script>
    <script language="JavaScript" src="../common/javascript/EasyQuery.js"></script>
    <script language="JavaScript" src="../common/easyQueryVer3/EasyQueryVer3.js"></script>
    <script language="JavaScript" src="../common/easyQueryVer3/EasyQueryCache.js"></script>
    <script language="JavaScript" src="../common/javascript/VerifyInput.js"></script>
    <!-- ˽�����ýű� -->
    <script language="JavaScript" src="LXExportExcel.js"></script>
    <%@ include file="LXExportExcelInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">��������</td>
            </tr>
        </table>
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- ���ײ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
                <tr><td class="title">�������</td>
                    <TD class="input"/>
			                  <Input name="ManageCom" id="ManageCom" class="codeno"	verify="�������|Code:station"
	      					             ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"
	    					    /><Input class=codename name=ManageComName readOnly elementtype=nacessary />
		           </TD>
              </tr>
            </table>
            <!-- �ύ���ݲ�����ť -->
			<%-- <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBeFileGrid()">
                <br><br>--%>
            <!--
            <input type="button" class="cssButton" value=" �� �� " onclick="turnPageWaitForBeFileGrid.makeExcel();">
            -->
            <input type="button" class="cssButton" value=" �����ֽ�2W����" onclick="GoToExcel(1)">
            <input type="button" class="cssButton" value="����ת��20W����" onclick="GoToExcel(2)">
            <input type="button" class="cssButton" value=" �����ֽ�2W����" onclick="GoToExcel(4)">
            <input type="button" class="cssButton" value="����ת��20W����" onclick="GoToExcel(3)">
            <br><br>
            <input type="button" class="cssButton" value=" �����˱�1W����" onclick="GoToExcel(5)">
            <input type="button" class="cssButton" value=" �����˱�1W����" onclick="GoToExcel(6)">
            <input type="button" class="cssButton" value=" ��������1W����" onclick="GoToExcel(7)">
            <input type="button" class="cssButton" value=" ��������1W����" onclick="GoToExcel(8)">
        </div>

        <!-- ��ȡ���ݵ������� -->
<%--        <input type="hidden" name="Operation">--%>
        <!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ������ϸ��Ϣ�ؼ�
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
<!--
    <table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divWaitForBeFileGrid);">
            </td>
            <td class= titleImg>
                ��ѯ���
            </td>
        </tr>
    </table>
        <Div  id= "divWaitForBeFileGrid" style= "display: none "/>
            <table  class= common>
                <tr  class= common>
                    <td text-align: left colSpan=1>
                    <span id="spanWaitForBeFileGrid" >
                    </span>
                    </td>
                </tr>
            </table>
            <br />
        </Div>
                    <div id="divTurnPageWaitForBeFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageWaitForBeFileGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBeFileGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBeFileGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageWaitForBeFileGrid.lastPage()">
            </div>
            <INPUT class=cssButton VALUE="�鿴������Ϣ" name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />-->
    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
