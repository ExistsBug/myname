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
    <title>����ۺϲ�ѯ</title>
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
    <script language="JavaScript" src="LXIHAllQueryMain.js"></script>
    <%@ include file="LXIHAllQueryMainInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">����ۺϲ�ѯ</td>
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
                <tr class="common">
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CSNM"></td>
                    <td class="title">�ͻ�����/����</td>
                    <td class="input"><input type="text" class="common" name="CTNM"></td>
                </tr>
                <tr class="common">
                    <td class="title" /> ��������</td>
				            <td class="input"/>
				                  <Input name="CRCD" id="CRCD" class="code" verify="��������|Code:amlbigstamp"
	      				                  ondblclick="showCodeList('amlbigstamp',[this]);" 	
	      				                 onkeyup="showCodeListKey('amlbigstamp',[this]);" elementtype=nacessary />
		                </td>
		                <td class="title">����״̬</td>
                    <td class="input"/>
				                  <Input name="DataState" id="DataState" class="code" verify="����״̬|Code:amldatastate"
	      				                  ondblclick="showCodeList('amldatastate',[this]);" 	
	      				                 onkeyup="showCodeListKey('amldatastate',[this]);" elementtype=nacessary />
		                </td>
                </tr>
                <tr><td class="title">�������</td>
                    <TD class="input"/>
			                  <Input name="ManageCom" id="ManageCom" class="codeno"	verify="�������|Code:station"
	      					             ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"
	    					    /><Input class=codename name=ManageComName readOnly elementtype=nacessary />
		           </TD>
				<TD class="title" /> ������Դ</TD>
				<TD class="input"/>
			        <Input name="DataSource" id="DataSource" class="code"
	      					ondblclick="showCodeList('DataSource',[this]);" 	
	      					onkeyup="showCodeListKey('DataSource',[this]);" verify="������Դ|notnull&Code:DataSource" elementtype=nacessary
	      					/>
		    </TD>	
              </tr>
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBeFileGrid()">
            <!--
            <input type="button" class="cssButton" value=" �� �� " onclick="turnPageWaitForBeFileGrid.makeExcel();">
            -->
            <input type="button" class="cssButton" value=" �� �� " onclick="GoToExcel()">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">����ۺϲ�ѯ���</td>
            </tr>
        </table>
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divWaitForBeFileGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanWaitForBeFileGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageWaitForBeFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageWaitForBeFileGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBeFileGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBeFileGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageWaitForBeFileGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <br>
        </div>
        <br>

        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
        <!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ������ϸ��Ϣ�ؼ�
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
    <table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
            </td>
            <td class= titleImg>
                ������ϸ��Ϣ
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
                    <div id="divTurnPageTasksGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageTasksGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageTasksGrid.lastPage()">
            </div>
            <INPUT class=cssButton VALUE="�鿴������Ϣ" name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />
    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
