<%@page contentType="text/html;charset=GBK" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : � <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ����ͳ�Ʒ���
 ******************************************************************************/
%>

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
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>����ͳ�Ʒ���</title>
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
    <script language="JavaScript" src="RiskCustomer.js"></script>
    <%@ include file="RiskCustomerInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
    	 <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divTradeMain)"></td>
                <td class="titleImg">���ռ������</td>
            </tr>
        </table>
         <Div  id= "divTradeMain" style= "display: '' "/>
         	<br>
         <input type="button" class="cssButton" value=" ���ռ������ " onclick="submitForm()">
         <br>
         </Div>
		<hr>
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">���տͻ���ѯ</td>
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
                    <td class="title" /> ���ռ���</td>
				            <td class="input"/>
				                  <Input name="Grade" id="Grade" class="codeno" verify="���ռ���|Code:amlriskgrade"
	      				                  ondblclick="showCodeList('amlriskgrade',[this,Gradename],[0,1]);" 	
	      				                 onkeyup="showCodeListKey('amlriskgrade',[this,Gradename],[0,1]);" elementtype=nacessary /><Input class=codename name=Gradename readOnly elementtype=nacessary>
		                </td>		    
		                
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
            <input type="button" class="cssButton" value=" ��  ѯ " onclick="queryStatGrid()">
            <input type="button" class="cssButton" value=" ��  �� " onclick="resetForm()">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divStatGrid)"></td>
                <td class="titleImg">���տͻ���Ϣ</td>
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
         <input type="button" class="cssButton" value=" ��  �� " onclick="turnPageStatGrid.makeExcel('1|@^4|@_ ');">
         <br>
         <br>
    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
