<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : xr 
 * @version  : 1.00
 * @date     : 2016-12-20
 * @direction: �������ȷ��-�ܹ�˾
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
    <!-- ˽�����ýű� -->
    <script language="JavaScript" src="LXIHAffirmMainZ.js"></script>
    <%@ include file="LXIHAffirmMainInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">���������ײ�ѯ</td>
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
                    <td class="title"></td>
                    <td class="input"></td>
                    <td class="title"></td>
                    <td class="input"></td>
                </tr>
    
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBeFileGrid(fm.UserCode.value)">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">������������Ϣ</td>
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
        </div>
    <!--table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
            </td>
            <td class= titleImg>��ȷ�Ͻ�����ϸ</td>
        </tr>
    </table>
        <Div  id= "divTasks" style= "display: '' "/>
            <table  class= common>
                <tr  class= common>
                    <td><span id="spanTasksGrid"></span></td>
                </tr>
            </table>
            <br />
        </Div>
            <div id="divTurnPageTasksGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageTasksGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageTasksGrid.lastPage()">
            </div-->
            <br>
            <!-- �ύ���ݲ�����ť -->
            <!--INPUT class=cssButton VALUE="�鿴������Ϣ" name="ViewAndUpdate" TYPE=button onclick="GoToDetailInput(this.name);" /-->
            <INPUT class=cssButton VALUE="�鿴������Ϣ" name="ViewAndUpdate" TYPE=button onclick="GoToViewAndUpdate(this.name);" />
            <!--INPUT class=cssButton VALUE="�޸Ľ�����Ϣ" name="update" TYPE=button onclick="" /-->
            <!-- <INPUT class=cssButton VALUE="�ύ�ϼ����" name="upgrade" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" /> -->
            <INPUT class=cssButton VALUE="ȷ������" name="confirm" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" />
            <INPUT class=cssButton VALUE="����" name="reject" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" />
            <INPUT class=cssButton VALUE="�����ϱ�" name="keep" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" />
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
        <input type="hidden" name="UserCode" value="<%=OperatorCodee%>">

    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
