<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//�������ƣ�
//�����ܣ�
//�������ڣ�2002-08-21 09:25:18
//������ ��HX
//���¼�¼�� ������  ��������   ����ԭ��/����
%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //��¼����Ա
  var manageCom = "<%=tGI.ManageCom%>"; //��¼�������
  var comcode = "<%=tGI.ComCode%>";     //��¼��½����
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
<SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
<SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
<SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
<SCRIPT src="DataInterfaceIdyDeal.js"></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="DataInterfaceIdyDealInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form action="./DataInterfaceIdyDealSave.jsp" method=post name="fm" target="fraSubmit" >		
<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      �����ͬ������Ϣ¼��ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
<jsp:include page="DataInterfaceIdyDealPage.jsp"/>
	<INPUT class=cssButton VALUE=" ��  �� " name="main" TYPE=button onclick="return submitForm(this.name);" />
	<INPUT class=cssButton VALUE=" ɾ  �� " name="deletemain" TYPE=button onclick="return submitForm(this.name);" />
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
			</td>
			<td class= titleImg>
				���㷨����
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
		<jsp:include page="DataInterfaceIdyDealPageC.jsp"/>
<INPUT class=cssButton VALUE=" ��  �� " name="addson" TYPE=button onclick="return submitForm(this.name);" />
<INPUT class=cssButton VALUE=" ��  �� " name="updateson" TYPE=button onclick="return submitForm(this.name);" />
<INPUT class=cssButton VALUE=" ɾ  �� " name="deleteson" TYPE=button onclick="return submitForm(this.name);" />
<INPUT class=cssButton VALUE=" ��  �� " name="return" TYPE=button onclick="return GoToReturn();" />	
	<table>
	</form>	
<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>