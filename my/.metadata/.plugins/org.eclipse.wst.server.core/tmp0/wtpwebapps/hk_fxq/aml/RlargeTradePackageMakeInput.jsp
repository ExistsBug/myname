<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: ���ɽ��ױ����ļ����������
 ******************************************************************************/
%>
<%@ page import="com.sinosoft.lis.pubfun.*" %>

<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%
String sEndDate = PubFun.getCurrentDate();
String tReportType=request.getParameter("reportType");

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
    <!-- ˽�����ýű� -->
    <script language="JavaScript" src="RlargeTradePackageMake.js"></script>
    <%@ include file="RlargeTradePackageMakeInit.jsp" %>
</head>
<body topmargin="0" onload="initForm();initElementtype();" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit"  action="largeTradeToPackageSave.jsp?type=applyPackageNo">
        <!-- ���Ĳ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgSearch)"></td>
                <td class="titleImg">���ݰ����뼰��ѯ</td>
            </tr>
        </table>
        <!-- ���Ĳ�ѯ¼��Ĳ� -->
        <div id="divFileMsgSearch" style="display:''">
            <!-- ���Ĳ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">���ݰ����</td>
                    <td class="input"><input type="text" class="common" name="packageNo"></td>
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
                <tr>
     <TD class=title>��������</TD>
					<TD class= input>
						<Input class="codeno" name=dataType readonly><input class=codename name=dataTypeName readonly>
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
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryFileMsgGrid()">
            <input type="button" class="cssButton" value=" �� �� " onclick="applyANewFileMsg()" disabled>
            <br>
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgGrid)"></td>
                <td class="titleImg">���������ݰ���Ϣ</td>
            </tr>
        </table>
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divFileMsgGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanFileMsgGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageFileMsgGrid" align="left" style="display:''">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPage.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPage.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPage.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPage.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� �� " onclick="dealTheFileMsg()">
        </div>
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="ApplyType">
        <input type="hidden" name="reportType" value="<%=tReportType%>">
    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
