<%@ page contentType="text/html; charset=gbk" language="java" errorPage="" %>

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
 * @direction: ����������
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>�����ӿڹ�����</title>
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
    <script language="JavaScript" src="DataInterfaceIdy.js"></script>
    <%@ include file="DataInterfaceIdyInit.jsp" %>  
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ��ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgSearch)"></td>
                <td class="titleImg">�����ӿڹ����弰��ѯ</td>
            </tr>
        </table>
        <!-- ���Ĳ�ѯ¼��Ĳ� -->
        <div id="divFileMsgSearch" style="display:''">
            <!-- ���Ĳ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">��������</td>                
                    <td class="input"><Input class=codeno name=DealType CodeData="0|2^01|����^02|���ɽ���" ondblclick="return showCodeListEx('DealType', [this,DealTypeName],[0,1])"onkeyup="return showCodeListKeyEx('DealType', [this,DealTypeName],[0,1])" ><Input class=codename name=DealTypeName readonly=true></TD> 
                    <td class="title">��������</td>
                    <td class="input"><input class=code name=CRCD ondblclick="dealCRCDType(this)" onkeyup="dealCRCDTypeKey(this)" ></TD> 
                    <td class="title">ָ�����</td>
                    <td class="input"><input type="input" class="common" name="CalCode" maxlength="10" ></td>
                </tr>
                <tr class="common">
                    <td class="title">��ʾ��</td>
                    <td class="input"><input type="input" class="common" name="AppId" ></td>
                    <td class="title">&nbsp;</td>
                    <td class="input">&nbsp;</td>
                    <td class="title">&nbsp;</td>
                    <td class="input">&nbsp;</td>
                </tr>                
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryFileMsgGrid()">
            <input type="button" class="cssButton" value=" �� �� " onclick="dealTheFileMsg()">
            <br>
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgGrid)"></td>
                <td class="titleImg">�Ѷ�������������Ϣ</td>
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
            <div id="divTurnPageFileMsgGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageFileMsgGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageFileMsgGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageFileMsgGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageFileMsgGrid.lastPage()">
            </div>
        </div>
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
