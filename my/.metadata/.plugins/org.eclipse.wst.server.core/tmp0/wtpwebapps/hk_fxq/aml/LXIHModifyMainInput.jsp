<%@ page contentType="text/html; charset=gb2312" language="java" errorPage=""%>
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
 * @direction: �����޸�
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
<%@ include file="../common/jsp/UsrCheck.jsp" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>�����޸�</title>
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
    <script language="JavaScript" src="LXIHModifyMain.js"></script>
    <%@ include file="LXIHModifyMainInit.jsp"  %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- ���ײ�ѯ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">���޸Ľ��ײ�ѯ</td>
            </tr>
        </table>
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- ���ײ�ѯ¼���� -->
            <table class="common">
                <tr class="common">
                    <td class="title">���ױ��</td>
                    <td class="input"><input type="text" class="common" name="DealNo"></td>
                    <td class="title">��ʼ����</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="��ʼ����|Date"></td>
                    <td class="title">��������</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="��������|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CustomerNo"></td>
                    <td class="title">�ͻ���</td>
                    <td class="input"><input type="text" class="common" name="CustomerName"></td>
                    <td class="title">֤������</td>
                    <td class="input"><input type="text" class="common" name="IDNo"></td>
                </tr>
                <tr class="common">
                    <td class="title">�������</td>
                    <td class= input><Input class=codeno name="MngCom" readonly onDblClick="return showCodeList('station46',[this,MngComName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,MngComName],[0,1]);"><input class=codename name="MngComName" readonly=true><font size=1 color='#ff0000'><b>*</b></font></td> 	
                    <td class="title"></td>
                    <td class="input"></td>
                    <td class="title"></td>
                    <td class="input"></td>
                </tr>
            </table>
            <!-- �ύ���ݲ�����ť -->
            <input type="button" class="cssButton" value=" �� ѯ " onclick="queryWaitForBeFileGrid()">
        </div>
        <!-- ������Ϣ�۵�չ�� -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">��ѡ������Ϣ</td>
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
         <%@ include file="LXIHTradeMainDetailPage.jsp" %>
          <!--<INPUT class=cssButton VALUE="ת���ֹ�˾����" name="SendOut" TYPE=button onclick="SendOutFNC()" />-->
          <input type="button" class="cssButton" name="UPDATE" value=" ��  �� " onclick="submitMain(this.name)">
   <table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
			</td>
			<td class= titleImg>
				������Ϣ
			</td>
		</tr>
	</table>
		<Div  id= "divTasks" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanErrorGrid" >
					</span> 
					</td>
				</tr>
			</table>
			<br />
		</Div>
		            <div id="divTurnPageErrorGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageErrorGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageErrorGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageErrorGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageErrorGrid.lastPage()">
            </div>
       
        <!-- ��ȡ���ݵ������� -->
        <input type="hidden" name="Operation">
        <!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ������ϸ��Ϣ�ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
			</td>
			<td class= titleImg>
				������ϸ��Ϣ
			</td>
		</tr>
	</table>
		<Div  id= "divTasks" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanTasksGrid" >
					</span> 
					</td>
				</tr>
			</table>
			<br />
		</Div>
		            <div id="divTurnPageTasksGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="��  ҳ" onclick="turnPageTasksGrid.firstPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.previousPage()">
                <input type="button" class="cssButton" value="��һҳ" onclick="turnPageTasksGrid.nextPage()">
                <input type="button" class="cssButton" value="β  ҳ" onclick="turnPageTasksGrid.lastPage()">
            </div>
				<INPUT class=cssButton VALUE=" ��ӽ�����ϸ��Ϣ " name="insert" TYPE=button onclick="return GoToDetailInput(this.name);" />
		<INPUT class=cssButton VALUE=" �޸Ľ�����ϸ��Ϣ " name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />
					<INPUT class=cssButton VALUE=" ɾ��������ϸ��Ϣ " name="delete" TYPE=button onclick="return GoToDetailInput(this.name);" />		
	<br/>
		<br/>
			<br/>
				<INPUT class=cssButton VALUE=" ȷ  ��" name="update" TYPE=button onclick="SubmitWaitForBeFileGrid();" />
    </form>
    <!-- ͨ��������Ϣ�б� -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
<script> 
	//
	try{
		document.getElementById("HTDT").readOnly = true;
	} catch(ex){}
	
</script>
