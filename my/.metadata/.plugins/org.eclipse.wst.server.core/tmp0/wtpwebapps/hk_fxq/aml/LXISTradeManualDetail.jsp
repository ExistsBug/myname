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
<SCRIPT src="LXISTradeManualDetailInput.js"></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<%-- @include file="..\common\jsp\CodeQueryApplet.jsp" --%>
<%@include file="LXISTradeManualDetailInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
	<form action="./LXISTradeManualDetailSave.jsp" method=post name="fm" target="fraSubmit" >		
<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ����ͻ�������Ϣ¼��ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
<jsp:include page="ISTradeCustomerPage.jsp"/>

<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      �ͻ��ɶ���Ϣ�ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divStock);">
			</td>
			<td class= titleImg>
				�ͻ��ɶ���Ϣ
			</td>
		</tr>
	</table>
	<Div  id= "divStock" style= "display: '' "/>
		<table  class= common>
			<tr  class= common>
				<td text-align: left colSpan=1>
				<span id="spanStockGrid" >
				</span> 
				</td>
			</tr>
		</table>
	</Div>

<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ���ɽ�����Ϣ�ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTrans);">
			</td>
			<td class= titleImg>
				���ɽ�����Ϣ
			</td>
		</tr>
	</table>

	<Div id= "divTrans" style= "display: '' ">
		<table class=common border=0>
			<TR class=common>
				<TD class="title" /> ���ɽ�������</TD>
				<TD class="input" />
			        <Input name="STCR" id="STCR" class="code" verify = "���ɽ�������|notnull&Code:amlshadinessstamp" 
	      					ondblclick="showCodeList('amlshadinessstamp',[this]);" 	
	      					onkeyup="showCodeListKey('amlshadinessstamp',[this]);"
	    					 elementtype=nacessary/>
		        </TD>
				<TD class="title" /> ���ɳ̶�</TD>
				<TD class="input"/>
			        <Input name="SDGR" id="SDGR" class="codeno"	verify = "���ɳ̶�|notnull&Code:amlshadiness"
	      					ondblclick="showCodeList('amlshadiness',[this,SDGRName],[0,1]);" 	
	      					onkeyup="showCodeListKey('amlshadiness',[this,SDGRName],[0,1]);"
	    					/><Input class=codename name=SDGRName readOnly elementtype=nacessary />
		        </TD>
				<TD class="title" /> ���</TD>
				<TD class="input"/>
			        <Input name="RPNM" id="RPNM" class="common" value="<%=tGI.Operator%>" 
						verify = "���|notnull&len<=20" elementtype=nacessary />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���ɽ�����������</TD>
				<TD class="input"/>
			        <Input name="DealDate" id="DealDate" class='coolDatePicker' 
						verify = "���ɽ�����������|date&notnull" elementtype=nacessary />
		        </TD>
				<TD class="title" /> ���ɽ�������ʱ��</TD>
				<TD class="input"/>
			        <Input name="DealTime" id="DealTime" class="common" 
						verify = "���ɽ�������ʱ��|notnull"  elementtype=nacessary/>
		        </TD>
				<TD class="title" /> </TD>
				<TD class="input"/> </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ��ȡ��ʩ</TD>
				<TD class="input" colspan=5  />
			        <textarea style="width:97%"  name="TKMS" id="TKMS" class="common" 
						verify = "��ȡ��ʩ|notnull&len<=128" elementtype=nacessary/></textarea>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ������Ϊ����</TD>
				<TD class="input" colspan=5  />
			        <textarea style="width:97%"  name="SSDS" id="SSDS" class="common" 
						verify = "������Ϊ����|notnull&len<=500" elementtype=nacessary/></textarea>
		        </TD>
			</TR>
		</table>
	</div>
	<input type="hidden" name="hideOperate" id="hideOperate" value="" />
	<input type="hidden" name="DealNo" id="DealNo" value="" />
	<input type="hidden" name="DataState" id="DataState" value="" />
	<INPUT class=cssButton VALUE=" ���� " name="insert" TYPE=button onclick="return GoToInputMain();" />	
	<hr>

<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ���ɽ�����ϸ��Ϣ�ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divDetail);">
			</td>
			<td class= titleImg>
				���ɽ�����ϸ��Ϣ
			</td>
		</tr>
	</table>
	<Div  id= "divDetail" style= "display: '' "/>
		<table  class= common>
			<tr  class= common>
				<td text-align: left colSpan=1>
				<span id="spanDetailGrid" >
				</span> 
				</td>
			</tr>
		</table>
		<table align="center">
			<INPUT CLASS=cssButton VALUE="��ҳ" TYPE=button onclick="turnPage2.firstPage();" /> 
			<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage2.previousPage();" />
			<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage2.nextPage();" /> 
			<INPUT CLASS=cssButton VALUE="βҳ" TYPE=button onclick="turnPage2.lastPage();" />
		</table>
		<INPUT class=cssButton VALUE=" ���� " name="insert" TYPE=button onclick="return GoToDetailInput(this.name);" />
		<INPUT class=cssButton VALUE=" �޸� " name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />
		<INPUT class=cssButton VALUE=" ɾ�� " name="delete" TYPE=button onclick="return GoToDetailInput(this.name);" />		
		<INPUT class=cssButton VALUE=" �鿴 " name="newquery" TYPE=button onclick="return GoToDetailInput(this.name);" />		
	</Div>
	<hr>

<!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      ���ɽ��׺�ͬ��Ϣ�ؼ�         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCont);">
			</td>
			<td class= titleImg>
				���ɽ��׺�ͬ��ϸ��Ϣ
			</td>
		</tr>
	</table>
		<Div  id= "divCont" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanContGrid" >
					</span> 
					</td>
				</tr>
			</table>
			<table align="center">
			<INPUT CLASS=cssButton VALUE="��ҳ" TYPE=button onclick="turnPage3.firstPage();" /> 
			<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage3.previousPage();" />
			<INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage3.nextPage();" /> 
			<INPUT CLASS=cssButton VALUE="βҳ" TYPE=button onclick="turnPage3.lastPage();" />
		  </table>
			<br />
		</Div>
		<INPUT class=cssButton VALUE=" ���� " name="insert" TYPE=button onclick="return GoToContInput(this.name);" />
		<INPUT class=cssButton VALUE=" �޸� " name="update" TYPE=button onclick="return GoToContInput(this.name);" />
		<INPUT class=cssButton VALUE=" ɾ�� " name="delete" TYPE=button onclick="return GoToContInput(this.name);" />		
		<INPUT class=cssButton VALUE=" �鿴 " name="newquery" TYPE=button onclick="return GoToContInput(this.name);" />				
		<INPUT class=cssButton VALUE=" ���� " name="return" TYPE=button onclick="return GoToReturn();" />						
	</form>	
<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
<script>
if (toper == "query"){
	for (var elementsNum=0; elementsNum< document.forms[0].elements.length; elementsNum++)
	{
		var element = document.forms[0].elements[elementsNum];
		element.readOnly = true;
		if (element.name == "insert" || element.name == "update" || element.name == "delete" )
			//element.style.visibility = "hidden";
			element.disabled = true;
	}		
}
		
</script>
</html>