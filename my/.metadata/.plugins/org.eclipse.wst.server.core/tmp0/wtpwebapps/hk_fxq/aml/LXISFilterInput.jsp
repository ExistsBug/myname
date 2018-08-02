<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

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


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>�����ۺϲ�ѯ</title>
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
    <script language="JavaScript" src="LXISFilter.js"></script>
    <%@ include file="LXISFilterInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit"  ENCTYPE="multipart/form-data">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">�����ۺϲ�ѯ</td>
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
                    <TD class="title" /> ���ɽ�������</TD>
				            <TD class="input" />
			              <Input name="STCR" id="STCR" class="code"  verify="���ɽ�������|Code:amlshadinessstamp"
	      					         ondblclick="showCodeList('amlshadinessstamp',[this]);" 	
	      					         onkeyup="showCodeListKey('amlshadinessstamp',[this]);"
	    					           elementtype=nacessary/>
		                </TD>
                
                    <td class="title">���ɳ̶�</td>
                    <TD class="input"/>
			                  <Input name="SDGR" id="SDGR" class="codeno"	verify="���ɳ̶�|Code:amlshadiness"
	      					             ondblclick="showCodeList('amlshadiness',[this,SDGRName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('amlshadiness',[this,SDGRName],[0,1]);"
	    					    /><Input class=codename name=SDGRName readOnly elementtype=nacessary />
		        </TD>
                </tr>
                <tr class="common">
                  <td class="title">�������</td>
                    <TD class="input"/>
			                  <Input name="ManageCom" id="ManageCom" class="codeno"	verify="�������|Code:station"
	      					             ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"
	    					    /><Input class=codename name=ManageComName readOnly elementtype=nacessary />
		        </TD>
                    <td class="title"></td>
                    <TD class="input"/>

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
                <td class="titleImg">�����ۺϲ�ѯ���</td>
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
            <div id="divTurnPageWaitForBeFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageWaitForBeFileGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBeFileGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageWaitForBeFileGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageWaitForBeFileGrid.lastPage()">
            </div>
            <!-- �ύ���ݲ�����ť -->
            <br>
        </div>
        <br>

        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
        <!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ������ϸ��Ϣ�ؼ�
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
		<table>
         	<tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divreasonofcancelreport)"></td>
                <td class="titleImg">�ǿ���ԭ��</td>
         	</tr>
        </table>
		<div id="divreasonofcancelreport" style="display:''">
		<table class="common">    	
	        <tr>
	          <td class="input" colspan=8 ><textarea style="width:97%"  name="reason" id="reason" class="common" /></textarea>
		      </td>
	        </tr>
	        <tr>
	        	<td class="common">
	        		<Input type="file" class= common3 style="width:50%" name=FileName size=20 value="">
		        	<input name=ImportPath type= hidden>
	        	</td>
	        </tr>
        </table>
        </div>
        
		        		<br />

            <INPUT class=cssButton VALUE="��  ��" name="yes" TYPE=button onclick="return GoToFilter(this.name);" />
            <INPUT class=cssButton VALUE="�ǿ���" name="no" TYPE=button onclick="return GoToFilter(this.name);" />
   </form>
<%--   <form method=post name="fmload" target="fraSubmit" ENCTYPE="multipart/form-data">--%>
<%--   		<table>--%>
<%--         	<tr>--%>
<%--                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divreasonofcancelreport)"></td>--%>
<%--                <td class="titleImg">�ǿ���ԭ���ļ�����</td>--%>
<%--         	</tr>--%>
<%--        </table>--%>
<%--   		<table class="common">    	--%>
<%--	        <tr>--%>
<%--	        	<td class="common">--%>
<%--	        		<Input type="file" class= common3 style="width:50%" name=FileName size=20 value="">--%>
<%--		        	<input name=ImportPath type= hidden>--%>
<%--	        	</td>--%>
<%--	        </tr>--%>
<%--        </table>--%>
<%--   </form>--%>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
