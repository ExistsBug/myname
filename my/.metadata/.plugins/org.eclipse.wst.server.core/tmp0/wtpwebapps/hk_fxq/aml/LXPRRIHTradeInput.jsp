<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%@page import="com.sinosoft.lis.pubfun.GlobalInput"%>

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
    <title>����ͳ�Ʊ�</title>
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
    <script language="JavaScript" src="LXPRRIHTrade.js"></script>
    <%@ include file="LXPRRIHTradeInit.jsp" %>
    
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form action="./LXPRRIHTradeSave.jsp" name="fm" method="post" target="fraSubmit">
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
               	    <td class="title">ͳ�ƻ���<font color=red>*</font></td>
                    <td class="input"><Input name="ManageCom" id="ManageCom" class="codeno"	 ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"/><Input class=codename name=ManageComName readOnly elementtype=nacessary />
                    <td class="title">�ͻ�����</td>
                    <td class="input"><input type="text" class="common" name="CTNM"></td>
                </tr>
                <tr class="common">
                    <td class="title">ͳ������<font color=red>*</font></td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">ͳ��ֹ��<font color=red>*</font></td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
            </table>
 <input type=button class=cssbutton name=saveb value='�嵥����' onclick="submitSave();"> 
 <input type="button" class="cssButton" value=" ��  �� " onclick="resetForm()">
 </form>
 <span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>