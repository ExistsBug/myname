<%@page contentType="text/html;charset=GBK" %>
<%@page import="com.sinosoft.lis.pubfun.GlobalInput"%>
<html> 
<%
//�������ƣ�LXPRRISIns_BnfInput.jsp
//�����ܣ�
//�������ڣ�
//������ ��
//���¼�¼�� 
%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
	var operator  = "<%=tGI.Operator%>";    //��¼����Ա
	var manageCom = "<%=tGI.ManageCom%>";   //��¼�������
	var comcode   = "<%=tGI.ComCode%>";     //��¼��½����
</script>
<head >
		<SCRIPT src="../common/javascript/Common.js" >
		</SCRIPT><SCRIPT src="../common/javascript/MulLine.js">
		</SCRIPT><SCRIPT src="../common/Calendar/Calendar.js">
		</SCRIPT><SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
		<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
		<SCRIPT src="../common/javascript/VerifyInput.js" ></SCRIPT>
		<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
		<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
		<SCRIPT src="LXPRRISIns_Bnf.js"></SCRIPT>
		<%@include file="LXPRRISIns_BnfInit.jsp"%>
		<title>���ɱ������������嵥</title>
</head>
<body onload="initForm();" >
<form action="./LXPRRISIns_BnfSave.jsp" method=post name=fm target=fraSubmit> 
	<table class= common align=center>
		<TR class= common>			
			<TD class=title>ͳ�ƻ���</TD>
			<TD class=input><Input class=codeno name=MngCom readonly ondblclick="return showCodeList('station',[this,MngComName],[0,1]);" onkeyup="return showCodeListKey('station',[this,MngComName],[0,1]);"><input class=codename name=MngComName readonly=true><font color=red>*</font></TD>
			<TD class= title>ͳ������</TD>
			<TD class= input><input class="coolDatePicker" dateFormat="short" name="StartDate" ><font color=red>*</font></TD> 
			<TD class= title>ͳ��ֹ��	</TD>
			<TD class= input><input class="coolDatePicker" dateFormat="short" name="EndDate" ><font color=red>*</font></TD>    		
		</tr>
		<TR class= common>			
			<TD class=title>�ͻ�����</TD>
			<TD class=input><Input class=common name=CustomerName></TD>
			<TD class= title></TD>
			<TD class= input></TD> 
			<TD class= title></TD>
			<TD class= input></TD>    		
		</tr> 
	</table> 
	
	<br>
	
 <input type=button class=cssbutton name=saveb value='�嵥����' onclick="submitSave();"> 
 <input type=button class=cssbutton value='��    ��' onclick="resetForm();"> 
 </form>
 <span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>
