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

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>���չ�����</title>
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
    <script language="JavaScript" src="RiskIdentifyInput.js"></script>
    <%@ include file="RiskIdentifyInit.jsp" %>
</head>
<body topmargin="0" onload="initForm();  initElementtype();" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
              	<table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divRiskIdfySearch)"></td>
                <td class="titleImg">���ռ��������</td>
            </tr>
        </table>
         <div id="divRiskIdfySearch" style="display:''">
            <!-- ���Ĳ�ѯ¼���� -->
            <table class="common">
                <tr class="common">    					                   
                    <td class="title">�������</td>
                    <td class="input"><input class="common" name="code" id="code" elementtype=nacessary verify="�������|notnull"/></td>
                    <td class="title">��������</td>
                    <td class="input"><input class="common" name="codename" id="codename" elementtype=nacessary verify="��������|notnull"/></td>
                  </tr><tr>
                    <td class="title">��������</td>
                    <td class="input" colspan=5 ><textarea style="width:97%"  name="codealias" id="codealias" class="common" elementtype=nacessary verify="��������|notnull"/></textarea>
	        </td>
                    
                </tr>
                <tr>
                    <td class="title">��ȡ��ʩ</td>
                    <td class="input" colspan=5 ><textarea style="width:97%"  name="codealiasD" id="codealiasD" class="common" elementtype=nacessary verify="��������|notnull"/></textarea>
	        </td>
                    
                </tr>
                 
            </table>
            
           <input type="button" class="cssButton" value=" ��ѯ���� " onclick="return GoToQuery();">
           <input type="button" class="cssButton" name="INSERT" value=" ��������" onclick="return gotomodify(this.name);">
           <input type="button" class="cssButton" name="UPDATE" value=" �޸ļ���" onclick="return gotomodify(this.name);">
           <input type="button" class="cssButton" name="DELETE" value=" ɾ������ " onclick="return gotomodify(this.name);">             
           <input type="button" class="cssButton" value=" ���� " onclick="return cleartext();">         
           <input type="button" class="cssButton" value=" �޸ļ����㷨" onclick="return GoToDetail();">
            <input type="hidden" name="hideCode" id="hideCode"/>
            <br>
        </div>
  	<hr>



        <!-- ���Ĳ�ѯ�۵�չ�� -->

        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgGrid)"></td>
                <td class="titleImg">���ռ����㷨��Ϣ</td>
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

    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
