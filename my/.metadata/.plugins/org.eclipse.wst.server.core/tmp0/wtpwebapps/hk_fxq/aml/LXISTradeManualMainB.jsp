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
<SCRIPT src="LXISTradeManualMain.js"></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="LXISTradeManualMainInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form action="./LXISTradeManualMainSaveB.jsp" method=post name="fm" target="fraSubmit" >		

<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ���ɽ���������Ϣ�ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTradeMain);">
				</td>
				<td class= titleImg>
					���ɽ�����Ϣ
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
			<input type=hidden name="Date" id="Date">
			<input type=hidden name="hideDealNo" id="hideDealNo">
			<input type=hidden name="hideOperate" id="hideOperate">
			<input type=hidden name="CSNM" id="CSNM">			
			<INPUT class=cssButton VALUE=" ��   �� " name="insert" TYPE=button onclick="return GoToInputTrade(this.name);" />	
			<INPUT class=cssButton VALUE=" ��   �� " name="update" TYPE=button onclick="return GoToInputTrade(this.name);" />	
			<!--  INPUT class=cssButton VALUE=" ɾ�� " name="delete" TYPE=button onclick="return GoToInputTrade(this.name);" / -->	
      		<INPUT class=cssButton VALUE=" ɾ������ " name="delaccessories" TYPE=button onclick="DelAccessories(this.name)" />				
			<INPUT class=cssButton VALUE=" ��   ѯ " name="query" TYPE=button onclick="return GoToInputTrade(this.name);" />	
								
		</Div>
		<hr>
	</form>	
<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      �ϴ��ļ��ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<form method=post name="upfm" id="upfm" target="fraSubmit" ENCTYPE="multipart/form-data">
		<table>
			<tr>
				<td class=common>
				<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divUpload);">
				</td>
				<td class= titleImg>
					�ϴ�������Ϣ����
				</td>
			</tr>
		</table>
		<Div  id= "divUpload" style= "display: '' "/>
			<table class="common">
				<TR  class="common" >	      
					<TD class="title" style="width : 17%" >
						�ļ���ַ
					</TD>
					<TD class= common >
						<Input class= common3 style="width:39%" type="file" name="FileName" id="FileName" >
					</TD>
				</TR>
			</table>
		</div>
		<input type=hidden name=ImportFileType>
		<input type=hidden name=ImportConfigFile value="">	
		<INPUT VALUE=" �ϴ����� " class= "cssButton" TYPE= button onclick="return GoToUpload();">
	<HR><BR><INPUT class=cssButton VALUE=" ¼����� " name="finish" TYPE=button onclick="return GoToInputTrade(this.name);" />
	<INPUT class=cssButton VALUE=" ��   �� " name="return" TYPE=button onclick="return GoToReturn();" />		
	</form>  
		
	<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>