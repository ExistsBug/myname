<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
<script>
	var format="";
</script>

<html>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
</script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>���ɽ���ͳ�Ʒ���</title>
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
    <script language="JavaScript" src="StatLXIS.js"></script>
    <%@ include file="StatLXISInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">ͳ�Ʒ���</td>
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
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CTNM"></td>
                </tr>
                <tr class="common">
                    <TD class="title" /> ���ɽ�������</TD>
				            <TD class="input" />
			              <Input name="STCR" id="STCR" class="code"  verify="���ɽ�������|Code:amlshadinessstamp"
	      					         ondblclick="showCodeList('amlshadinessstamp',[this]);" 	
	      					         onkeyup="showCodeListKey('amlshadinessstamp',[this]);"
	    					           elementtype=nacessary/>
		                </TD>
		                <td class="title">����״̬</td>
                    <td class="input"/>
				                  <Input name="DataState" id="DataState" class="code" verify="����״̬|Code:amldatastate"
	      				                  ondblclick="showCodeList('amldatastate',[this]);" 	
	      				                 onkeyup="showCodeListKey('amldatastate',[this]);" elementtype=nacessary />
		                </td>
                </tr>
                <tr class="common">
                    <td class="title">���ɳ̶�</td>
                    <TD class="input"/>
			                  <Input name="SDGR" id="SDGR" class="codeno"	verify="���ɳ̶�|Code:amlshadiness"
	      					             ondblclick="showCodeList('amlshadiness',[this,SDGRName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('amlshadiness',[this,SDGRName],[0,1]);"
	    					    /><Input class=codename name=SDGRName readOnly elementtype=nacessary />
		        </TD>
                  <td class="title">�������</td>
                    <TD class="input"/>
			                  <Input name="ManageCom" id="ManageCom" class="codeno"	verify="�������|Code:station"
	      					             ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"
	    					    /><Input class=codename name=ManageComName readOnly elementtype=nacessary />
		        </TD>
                </tr>
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" ͳ  �� " onclick="queryStatGrid()">
            <input type="button" class="cssButton" value=" ��  �� " onclick="resetForm()">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divStatGrid)"></td>
                <td class="titleImg">ͳ�Ʒ�����Ϣ</td>
            </tr>
        </table>
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divStatGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanStatGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageStatGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageStatGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageStatGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageStatGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageStatGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <br>
        </div>
        <br>
         <input type="button" class="cssButton" value=" ��  �� " onclick="turnPageStatGrid.makeExcel('1|@^4|0.00_ ');">
    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
