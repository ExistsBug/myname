<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п�����ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п����Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼��������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
</script>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>���ɽ��ױ����ļ�����</title>
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
    <script language="JavaScript" src="FDRCDubitMsgMakeDeal.js"></script>
    <%@ include file="FDRCDubitMsgMakeDealInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���Ĳ�ѯ¼����� -->
        <table class="common" style="display:'none'>
            <tr class="common">
                <td class="title" style="display:'none'">���ı��</td>
                <td class="input"><input type="text" class="readonly" name="FileNo" readonly style="display:'none'"></td>
                <td class="title" style="display:'none'">��������</td>
                <td class="input"><input type="text" class="codeno" name="DataType" readonly style="display:'none'"><input type="text" class="codename" name="DataTypeName" readonly style="display:'none'"></td>
                <!--<td class="title"><div id="divCorrectFileTitle" style="display:'none'">�±��ĺ�</div></td>-->
                <td class="input"><div id="divCorrectFileInput" style="display:'none'"><input type="text" class="readonly" name="CorrectFileNo" readonly></div></td>
            </tr>
        </table>
        <!-- ���ط���������ʾ -->
        <div id="divNotCorrectLayer" style="display:'none'">
            <!-- ���Ĳ�ѯ�۵�չ�� -->
            <table>
                <tr>
                    <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                    <td class="titleImg">��ѡ�ϱ����ײ�ѯ</td>
                </tr>
            </table>
            <!-- ���Ĳ�ѯ¼��Ĳ� -->
            <div id="divWaitForBeFileSearch" style="display:''">
                <!-- ���Ĳ�ѯ¼����� -->
                <table class="common">
                    <tr class="common">
                        <td class="title">���ױ��</td>
                        <td class="input"><input type="text" class="common" name="DealNo1"></td>
                        <td class="title">��ʼ����</td>
                        <td class="input"><input type="text" class="readonly" name="StartDate1" readonly></td>
                        <td class="title">��������</td>
                        <td class="input"><input type="text" class="readonly" name="EndDate1" readonly></td>
                    </tr>
                    <tr class="common">
                        <td class="title">�ͻ���</td>
                        <td class="input"><input type="text" class="common" name="CustomerNo1"></td>
                        <td class="title">�ͻ���</td>
                        <td class="input"><input type="text" class="common" name="CustomerName1"></td>
                        <td class="title">֤������</td>
                        <td class="input"><input type="text" class="common" name="IDNo1"></td>
                    </tr>
                    <tr class="common">
                    		<td class="title">��������</td>
                        <TD class="input"/>
			                  <Input name="ManageCom" id="ManageCom" class="codeno"	verify="��������|Code:station"
	      					             ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"
	    					    /><Input class=codename name=ManageComName readOnly elementtype=nacessary />
		                </TD>
		              </tr>
                </table>
                <!-- �ύ���ݲ�����ť -->
                <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBeFileGrid()">
            </div>
            <!-- ������Ϣ�۵�չ�� -->
            <table>
                <tr>
                    <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                    <td class="titleImg">��ѡ�ϱ�������Ϣ</td>
                </tr>
            </table>
            <!-- ������Ϣչ�ֱ��� -->
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
                <!--<input type="button" class="cssButton" value=" �� �� " onclick="addToInFileMsg()" name="btnAddToInFileMsg">-->
                <br>
            </div>

        </div>
        <!-- ���Ĳ�ѯ�۵�չ�� -->
        <!--<table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divAlreadyInFileSearch)"></td>
                <td class="titleImg">��ѡ�ϱ����ײ�ѯ</td>
            </tr>
        </table>-->
        <!-- ���Ĳ�ѯ¼��Ĳ� -->
        <div id="divAlreadyInFileSearch" style="display:'none'">
            <!-- ���Ĳ�ѯ¼����� -->
            <table class="common">
                <tr class="common">
                    <td class="title">���ױ��</td>
                    <td class="input"><input type="text" class="common" name="DealNo2"></td>
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate2"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate2"></td>
                </tr>
                <tr class="common">
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CustomerNo2"></td>
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CustomerName2"></td>
                    <td class="title">֤������</td>
                    <td class="input"><input type="text" class="common" name="IDNo2"></td>
                </tr>
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryAlreadyInFileGrid()">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <!--<table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style= "cursor:hand" onclick="showPage(this,divAlreadyInFileGrid)"></td>
                <td class="titleImg">��ѡ�ϱ�������Ϣ</td>
           </tr>
        </table>-->
        <!-- ������Ϣչ�ֱ��� -->
        <div id="divAlreadyInFileGrid" style="display:'none'">
            <table class="common">
                <tr class="common">
                    <td><span id="spanAlreadyInFileGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageAlreadyInFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageAlreadyInFileGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageAlreadyInFileGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageAlreadyInFileGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageAlreadyInFileGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� �� " onclick="deleteInFileMsg()" name="btnDeleteInFileMsg">
        </div>
        <br><br>
        <!-- �ύ���ݲ�����ť -->
        <input type="button" class="cssButton" value="���ɱ���" onclick="makeAllInFileMsg()" name="btnMakeAllFileMsg">
        <input type="button" class="cssButton" value="���ر���" onclick="downAllInFileMsg()" name="btnDownloadFileMsg" disabled>
        <input type="button" class="cssButton" value=" �� �� " onclick="returnParent()">
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
    </form>
    <br><br>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>