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
  String otype = new String(request.getParameter("otype"));
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
<script src="./LXShowAreaInputInput.js"></script>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="LXShowAreaInputInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form action="#" method=post name="fm" target="fraSubmit" >		
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
				</td>
				<td class= titleImg>
					��ѯ����
				</td>
			</tr>
		</table>
		<Div id= "divCustom" style= "display: '' ">
			<table class=common border=0>
				<TR class=common>
					<TD class="title" /> ���׷����ع�������</TD>
					<TD class="input"/>
				        <input name="Country" id="Country" class="common" />
			        </TD>
					<TD class="title" /> ���׷����ع�������</TD>
					<TD class="input"/>
				        <input name="CountryName" id="CountryName" class="common" />
			        </TD>
				</tr>
				<TR class=common>
					<TD class="title" /> ���׷�����������������</TD>
					<TD class="input"/>
				        <Input name="Province" id="Province" class="common" / >
			        </TD>
					<TD class="title" /> ���׷�������������</TD>
					<TD class="input"/>
				        <Input name="ProvinceName" id="ProvinceName" class="common" / >
			        </TD>
				</TR>
					<!--���ӵ�������ѡ�� add by huangchong-->
				<TR class=common>
					<TD class="title" /> ���׷����ص�������</TD>
					<TD class="input"/>
				          <input class=codeno name="TRCDType" CodeData="0|^CHN|�й���½����һ��ó����|^Z01|�й���½������˰��^Z02|�й���½�����ӹ���^Z03|�й���½������ʯ������"  ondblclick="return showCodeListEx('TRCDType', [this,TRCDTypeName],[0,1]);" onkeyup="return showCodeListKeyEx('TRCDType', [this,TRCDTypeName],[0,1]);""><input class=codename name=TRCDTypeName readonly=true>
			                </TD>
				</TR>
				<!--end-->
		</table>
		<input type="hidden" name="otype" id="otype" value="<%=otype%>">
		<INPUT class=cssButton VALUE=" ��ѯ " name="query" TYPE=button onclick="return initInpBox();" />		
		<INPUT class=cssButton VALUE=" ���� " name="query" TYPE=button onclick="return returnParent();" />			
	
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTradeMain);">
				</td>
				<td class= titleImg>
					���׷�������ϸ��Ϣ
				</td>
			</tr>
		</table>
		<Div  id= "divTradeMain" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanTradeMainGrid" >
					</span> 
					</td>
				</tr>
				<table align="center">
					<INPUT CLASS=cssButton VALUE="��ҳ" TYPE=button onclick="turnPage.firstPage();" /> 
					<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage.previousPage();" />
					<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage.nextPage();" /> 
					<INPUT CLASS=cssButton VALUE="βҳ" TYPE=button onclick="turnPage.lastPage();" />
				</table>		
			</table><br>
		</Div>
	</form>	

		
	<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>