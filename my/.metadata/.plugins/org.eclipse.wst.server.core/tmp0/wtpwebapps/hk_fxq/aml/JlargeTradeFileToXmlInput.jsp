<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 ******************************************************************************/
%>

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
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>���ױ����ļ�����</title>
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
    <script language="JavaScript" src="JlargeTradeFileToXml.js"></script>
    <%@ include file="JlargeTradeFileToXmlInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���Ĳ�ѯ¼���� -->
        <!-- ���Ĳ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">��ѡ�ϱ����ײ�ѯ</td>
            </tr>
        </table>
        <!-- ���Ĳ�ѯ¼��Ĳ� -->
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- ���Ĳ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">���ױ��</td>
                    <td class="input"><input type="text" class="common" name="DealNo1"></td>
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT1" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT2" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CSNM1"></td>
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CTNM1"></td>
                    <td class="title">֤������</td>
                    <td class="input"><input type="text" class="common" name="CTID1"></td>
                </tr>
                  <tr class="common">
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
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBeFileGrid()">
            <!--<INPUT class=cssButton VALUE="�鿴������Ϣ" name="ViewAndUpdate" TYPE=button onclick="GoToViewAndUpdate(this.name);" />-->
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">��ѡ�ϱ�������Ϣ</td>
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
            <div id="divTurnPageWaitForBeFileGrid" align="left" style="display:''">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPage1.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPage1.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPage1.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPage1.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" ���ɱ��� " onclick="addToInFileMsg()" name="makefile">
            <br>
        </div>
        <!-- ���Ĳ�ѯ�۵�չ�� -->
            <div id="jinsh" align="left" style="display:'none'">
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divAlreadyInFileSearch)"></td>
                <td class="titleImg">��ѡ�ϱ����ײ�ѯ</td>
            </tr>
        </table>
        <!-- ���Ĳ�ѯ¼��Ĳ� -->
        <div id="divAlreadyInFileSearch" style="display:''">
            <!-- ���Ĳ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">���ױ��</td>
                    <td class="input"><input type="text" class="common" name="DealNo2"></td>
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT3" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT4" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CSNM2"></td>
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CTNM2"></td>
                    <td class="title">֤������</td>
                    <td class="input"><input type="text" class="common" name="CTID2"></td>
                 </tr>

                
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryAlreadyInFileGrid()">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style= "cursor:hand" onclick="showPage(this,divAlreadyInFileGrid)"></td>
                <td class="titleImg">��ѡ�ϱ�������Ϣ</td>
           </tr>
        </table>
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divAlreadyInFileGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanAlreadyInFileGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageAlreadyInFileGrid" align="left" style="display:''">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageAlreadyInFileGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageAlreadyInFileGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageAlreadyInFileGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageAlreadyInFileGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� �� " onclick="deleteInFileMsg()">
        </div>
        <br><br>
        <!-- �ύ���ݲ�����ť -->
        <input type="button" class="cssButton" value="�����ļ�" onclick="makeAllInFileMsg()" name="makeAction">
        <input type="button" class="cssButton" value="�����ļ�" onclick="downAllInFileMsg()" name="btnDownloadFileMsg" disabled>
        <input type="button" class="cssButton" value=" �� �� " onclick="returnParent()">
        <!-- ��ȡ���ݵ������� -->
      </div>
        <input type="hidden" name="type">
        <input type="hidden" name="reportType" value="<%=tReportType%>">
        <input type="hidden" name="dataType" value="<%=tDataType%>">
        <input type="hidden" name="tradeDataState" value="<%=tradeDataState%>">
        <input type="hidden" name="addedDate" value="<%=addedDate%>">
        <input type="hidden" name="FDRC" value="">
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">        
    </form>
    <br><br>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
