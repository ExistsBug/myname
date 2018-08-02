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
 * @date     : 2007-07-11
 * @direction: ���ɽ��ױ��İ����������
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>���ɽ��ױ��İ�����</title>
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
    <script language="JavaScript" src="DubitPkgMakeDeal.js"></script>
    <%@ include file="DubitPkgMakeDealInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���Ĳ�ѯ¼���� -->
        <table class="common">
            <tr class="common">
                <td class="title">���İ����</td>
                <td class="input"><input type="text" class="readonly" name="PackageNo" readonly></td>
                <td class="title">���İ�����</td>
                <td class="input"><input type="text" class="codeno" name="DataType" readonly><input type="text" class="codename" name="DataTypeName" readonly></td>
                <td class="title"><div id="divResendPackageTitle" style="display:'none'">�±��İ���</div></td>
                <td class="input"><div id="divResendPackageInput" style="display:'none'"><input type="text" class="readonly" name="ResendPackageNo" readonly></div></td>
            </tr>
        </table>
        <!-- ���ط����Ĳ���ʾ -->
        <div id="divNotResendLayer" style="display:'none'">
            <!-- ���Ĳ�ѯ�۵�չ�� -->
            <table>
                <tr>
                    <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBePackageSearch)"></td>
                    <td class="titleImg">��ѡ�ϱ����Ĳ�ѯ</td>
                </tr>
            </table>
            <!-- ���Ĳ�ѯ¼��Ĳ� -->
            <div id="divWaitForBePackageSearch" style="display:''">
                <!-- ���Ĳ�ѯ¼���� -->
                <table class="common">
                    <tr class="common">
                        <td class="title">���ı��</td>
                        <td class="input"><input type="text" class="common" name="FileNo1"></td>
                        <td class="title">��ʼ����</td>
                        <td class="input"><input type="text" class="common" name="StartDate1"></td>
                        <td class="title">��������</td>
                        <td class="input"><input type="text" class="readonly" name="EndDate1" readonly></td>
                    </tr>
                </table>
                <!-- �ύ���ݲ�����ť -->
                <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBePackageGrid()">
            </div>
            <!-- ������Ϣ�۵�չ�� -->
            <table>
                <tr>
                    <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBePackageGrid)"></td>
                    <td class="titleImg">��ѡ�ϱ�������Ϣ</td>
                </tr>
            </table>
            <!-- ������Ϣչ�ֱ�� -->
            <div id="divWaitForBePackageGrid" style="display:''">
                <table class="common">
                    <tr class="common">
                        <td><span id="spanWaitForBePackageGrid"></span></td>
                    </tr>
                </table>
                <!-- ������Ϣ�����ҳ -->
                <div id="divTurnPageWaitForBePackageGrid" align="center" style="display:'none'">
                    <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageWaitForBePackageGrid.firstPage()">
                    <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBePackageGrid.previousPage()">
                    <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBePackageGrid.nextPage()">
                    <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageWaitForBePackageGrid.lastPage()">
                </div>
                <!-- �ύ���ݲ�����ť -->
                <input type="button" class="cssButton" value=" �� �� " onclick="addToInPackageFile()" name="btnAddToInPackageFile">
                <br>
            </div>
        </div>
        <!-- ���Ĳ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divAlreadyInPackageSearch)"></td>
                <td class="titleImg">��ѡ�ϱ����Ĳ�ѯ</td>
            </tr>
        </table>
        <!-- ���Ĳ�ѯ¼��Ĳ� -->
        <div id="divAlreadyInPackageSearch" style="display:''">
            <!-- ���Ĳ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">���ı��</td>
                    <td class="input"><input type="text" class="common" name="FileNo2"></td>
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate2"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate2"></td>
                </tr>
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryAlreadyInPackageGrid()">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style= "cursor:hand" onclick="showPage(this,divAlreadyInPackageGrid)"></td>
                <td class="titleImg">��ѡ�ϱ�������Ϣ</td>
           </tr>
        </table>
        <!-- ������Ϣչ�ֱ�� -->
        <div id="divAlreadyInPackageGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanAlreadyInPackageGrid"></span></td>
                </tr>
            </table>
            <!-- ������Ϣ�����ҳ -->
            <div id="divTurnPageAlreadyInPackageGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageAlreadyInPackageGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageAlreadyInPackageGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageAlreadyInPackageGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageAlreadyInPackageGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� �� " onclick="deleteInPackageFile()" name="btnDeleteInPackageFile">
        </div>
        <br><br>
        <!-- �ύ���ݲ�����ť -->
        <input type="button" class="cssButton" value=" ���ɰ� " name="btnMakePackageFile" onclick="makeAllInPackageFile()">
        <input type="button" class="cssButton" value=" ���ذ� " name="btnDownloadFilePkg" onclick="downAllInPackageFile()" disabled>
        <input type="button" class="cssButton" value=" �� �� " onclick="returnParent()">
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
    </form>
    <br><br>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
