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
    <title>���ײ�ѯ</title>
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
    <script language="JavaScript" src="LXCustomerEvaluateParameterInput.js"></script>
    <%@ include file="LXCustomerEvaluateParameterInit.jsp" %>
</head>
<body topmargin="0" onload="initForm();initElementtype();" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
				<input type="button" class="cssButton" name='sync' value="ͬ����Ϣ" onclick="return syncdata();">
				<input type="button" class="cssButton" name='cal' value="���ռ���" onclick="return calData();">
				<br><hr>
        <input type="button" class="cssButton" name='busi' value="��ѯ�ͻ���ҵ" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='managecom' value="��ѯͶ������" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='risk' value="��ѯͶ��ҵ��" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='fee' value="��ѯ���ѽ��" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='paymode' value="��ѯ�ɷѷ�ʽ" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='isreport' value="��ѯ�Ƿ��ϱ�" onclick="queryCustmoerGrid(this.name)">
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divCustmoerGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>
				<input type="button" class="cssButton" name='update' value="����" onclick="return updatedata(this.name);">

				<br><hr>
				<td class="titleImg">�߷���Ҫ�ز�ѯ</td><br>
				 
        <input type="button" class="cssButton" name='busi' value="��ѯ�ͻ���ҵ"      onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='managecom' value="��ѯͶ������" onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='risk' value="��ѯͶ��ҵ��"      onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='fee' value="��ѯ���ѽ��"       onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='paymode' value="��ѯ�ɷѷ�ʽ"   onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='isreport' value="��ѯ�Ƿ��ϱ�"  onclick="queryHCustmoerGrid(this.name)">
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divCustmoerGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanHCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageHCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageHCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageHCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageHCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>
<input type="button" class="cssButton" name='cancelH' value="���ò���" onclick="return updatedata(this.name);">

				<br><hr>
				<td class="titleImg">�з���Ҫ�ز�ѯ</td><br>
        <input type="button" class="cssButton" name='busi' value="��ѯ�ͻ���ҵ"      onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='managecom' value="��ѯͶ������" onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='risk' value="��ѯͶ��ҵ��"      onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='fee' value="��ѯ���ѽ��"       onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='paymode' value="��ѯ�ɷѷ�ʽ"   onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='isreport' value="��ѯ�Ƿ��ϱ�"  onclick="queryLCustmoerGrid(this.name)">
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divCustmoerGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanLCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageLCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageLCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageLCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageLCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>
<input type="button" class="cssButton" name='cancelL' value="���ò���" onclick="return updatedata(this.name);">


    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
