<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//�������ƣ�LABranchGroupInput.jsp
//�����ܣ�

//�������ڣ�

//������  ��CrtHtml���򴴽�
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
  String IDX1= request.getParameter("IDX");
  String tInfoStyle2 = request.getParameter("infoStyle");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
  var tIDX="<%=IDX1%>"; 
  var tInfoStyle="<%=tInfoStyle2%>";
</script>

     <head>
     		<title>֪ʶ԰����ϸ��Ϣ</title>
    	<!-- �������ýű� -->
         <SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
        <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
        <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
         <SCRIPT src="../common/javascript/Common.js"></SCRIPT>
         <SCRIPT src="LAComTellerInput.js"></SCRIPT>
         <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
         <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
         <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
	      <!-- ����������ʽ -->
         <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
         <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
         <%@ include file="LXPolicRulmageDetialInit.jsp" %>
         	<SCRIPT src="LXPolicRulmageDetial.js"></SCRIPT>
       </head>
        <body onload="initForm();initElementtype();"> 
              <form action="./LXKnowledgeFieldSave.jsp"  method=post name=fm target="fraSubmit">
                 <table>
	                <tr class=common>
		              <td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divLABranchGroup1);"></IMG> </td>
		              <td class=titleImg>֪ʶ԰����ϸ��Ϣ</td>
	               </tr>
               </table>
 <Div id="divLABranchGroup1" style="display: ''">
<table class=common border=0>	
    <TR>
	<TD class="title" />��������</TD>
	<TD  class= "input"><Input class=codeno name="PubType" 
						onDblClick="return showCodeList('publishtype',[this,PubTypeName],[0,1]);" 
						onKeyUp="return showCodeListKey('publishtype',[this,PubTypeName],[0,1]);"/><input class=codename name="PubTypeName" readonly=true ></TD> 	
   	
   	<TD class="title" />�������</TD>
   	<TD class= input><Input class=codeno name="ManageCom" 
					onDblClick="return showCodeList('station',[this,ManageComName],[0,1]);" 
					onKeyUp="return showCodeListKey('station',[this,ManageComName],[0,1]);"><input class=codename name="ManageComName" readonly=true ></TD> 
   </TR>	
   	<TR>
	<TD class="title" />����ؼ���</TD>			
	<TD class="input"/><input name="KeyWord" id="KeyWord" class="common"  verify="����ؼ���|notnull&len<=120"  /></TD>
	</TR>
	</table> 
	<INPUT class=cssButton VALUE=" ���ظ��� " name="DownLoad" TYPE=button
				onclick="GoToDownLoad(this.name)" />
	<INPUT class=cssButton VALUE="��  �� " name="return" TYPE=button
				onclick="GoToReturn()" />
 </Div>
         <input type=hidden    name="Idx" value="">
	      <input type=hidden  name=hideOperate value="">
		<span id="spanCode" style="display: none; position: absolute;"></span>
</form>
     </body>
</html>
