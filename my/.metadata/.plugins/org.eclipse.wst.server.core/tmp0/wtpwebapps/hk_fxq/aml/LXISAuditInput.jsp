<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 
 * @version  : 
 * @date     : 2007-11-10
 * @direction: ���ɽ������
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        GlobalInput tGe = new GlobalInput();
        tGe=(GlobalInput)session.getValue("GI");
        String OperatorCodee=tGe.Operator;
        System.out.println("OperatorCode======"+OperatorCodee);
    %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>�������</title>
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
    <script language="JavaScript" src="LXPubFun.js"></script>
    <!-- ˽�����ýű� -->
    <script language="JavaScript" src="LXISAudit.js"></script>
    <%@ include file="LXISAuditInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">����˽��ײ�ѯ</td>
            </tr>
        </table>
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- ���ײ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">���ױ��</td>
                    <td class="input"><input type="text" class="common" name="DealNo"></td>
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CustomerNo"></td>
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CustomerName"></td>
                    <td class="title">֤������</td>
                    <td class="input"><input type="text" class="common" name="IDNo"></td>
                </tr>
                <tr class="common">
										<TD  class=title>�������</TD>
										<TD  class= input><Input class=codeno name="StatiCode" readonly onDblClick="return showCodeList('station46',[this,StatiCodeName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,StatiCodeName],[0,1]);"><input class=codename name="StatiCodeName" readonly=true></TD> 	
                    <td class="title">����ԭ��</td>
                    <TD  class= input><Input class=codeno name="amlshadinessstamp" readonly onDblClick="return showCodeList('amlshadinessstamp',[this,amlshadinessstampName],[0,1]);" onKeyUp="return showCodeListKey('amlshadinessstamp',[this,amlshadinessstampName],[0,1]);"><input class=codename name="amlshadinessstampName" readonly=true></TD> 	
                    <td class="title">��������</td>
                    <!--<TD class="input"><Input name="TSTP" readonly id="TSTP" class="codeno" verify="��������|notnull&Code:amltranstype"	ondblclick="showCodeList('amltranstype',[this,TSTPName],[0,1]);" 	onkeyup="showCodeListKey('amltranstype',[this,TSTPName],[0,1]);"><Input class=codename name=TSTPName readOnly elementtype=nacessary >-->
                    <TD class= input><input class=codeno readonly name="TSTP" CodeData="0|5^01|����Լ����^02|�˱�����^04|��ȫ����^05|�������^08|�������" onDblClick="return showCodeListEx('TSTP', [this,TSTPName],[0,1],'','','','',200)"onkeyup="return showCodeListKeyEx('TSTP', [this,],TSTPName[0,1],'','','','',200);"><input class=codename name=TSTPName readonly ></TD> 	
                </tr>
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBeFileGrid(fm.UserCode.value)">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">����˽�����Ϣ</td>
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
            <br>
            <!-- �ύ���ݲ�����ť 
            <INPUT class=cssButton VALUE="�鿴������Ϣ" name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />-->
            <!--INPUT class=cssButton VALUE="�ύ�ϼ����" name="upgrade" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" /-->
            <INPUT class=cssButton VALUE="ȷ���ϱ�" name="affirm" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" />
            <INPUT class=cssButton VALUE="�����ϱ�" name="keep" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" />
        </div>
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
        <input type="hidden" name="UserCode" value="<%=OperatorCodee%>">

        <table>
         <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divreasonofcancelreport)"></td>
                <td class="titleImg">�����ϱ�ԭ��</td>
         </tr>
        </table>

      <div id="divreasonofcancelreport" align="center" style="display:''">
        <table class="common">    	
        <tr>
         <td class="input" colspan=8 ><textarea style="width:97%"  name="reason" id="reason" class="common" /></textarea>
	      </td>
      </tr>
        </table>
     </div >
   </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
