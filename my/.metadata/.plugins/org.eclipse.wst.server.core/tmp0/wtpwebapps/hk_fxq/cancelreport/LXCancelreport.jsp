<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>

<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
</script>
<%@ include file="../common/jsp/UsrCheck.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>�����ϱ���ѯ</title>
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
    <script language="JavaScript" src="LXCancelreport.js"></script>
    <%@ include file="LXCancelreportInit.jsp" %>
</head>
  
  <body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">�����ϱ���ѯ</td>
            </tr>
        </table>
        <div id="divLXCancelreport" style="display:''">
            <!-- ���ײ�ѯ¼���� -->
            <table class="common">
            	  <tr class="common">
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">���ױ��</td>
                    <td class="input"><input type="text" class="common" name="DealNo"></td>
                    <td class="title">�ͻ�����/����</td>
                    <td class="input"><input type="text" class="common" name="CTNM"></td>
                </tr>

                <tr class="common">
                     <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CSNM"></td>
                    <td class="title">��������</td>
                    <td class="input">
                    	<!--input type="text" class="common" name="TradeType">(������"IH"��"IS","IH"Ϊ����,"IS"Ϊ���ɽ���)-->
                    <Input name="TradeType" id="TradeType" class="codeno"  ondblclick="showCodeList('dealtype',[this,DealTypeName],[0,1]);" 	 onkeyup="showCodeListKey('dealtype',[this,DealTypeName],[0,1]);"/><Input class=codename name=DealTypeName readOnly  />
                    </td>
                </tr>

                <tr class="common">
                    <td class="title">������Ա</td>
                    <td class="input"><input type="text" class="common" name="OPERATOR"></td>
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
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryLXCancelreportGrid()">
            <!--
            <input type="button" class="cssButton" value=" �� �� " onclick="turnPageLXCancelreportGrid.makeExcel();">
             -->
             <input type="button" class="cssButton" value=" �� �� " onclick="GoToExcel();">
        </div>
        <!-- ������Ϣ�۵�չ�� -->

        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divLXCancelreportGrid)"></td>
                <td class="titleImg">�����ϱ���ѯ���</td>
            </tr>
        </table>
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divLXCancelreportGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanLXCancelreportGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageLXCancelreportGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageLXCancelreportGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageLXCancelreportGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageLXCancelreportGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageLXCancelreportGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <br>
        </div>
        <br>

   </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>

  </body>
</html>
