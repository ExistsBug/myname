<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			��ͬ���ֱ���������Ϣ
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> ���ױ��</TD>
			<TD class="input"/>
		        <input name="DealNo" id="DealNo" class="common" readOnly  verify = "���ױ��|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> ���պ�ͬ��</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" readOnly verify = "���պ�ͬ��|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
				<TD class="title" /> ��������</TD>
			<TD class="input"/>
		       <input name="ISNM" id="ISNM" class="common" readOnly verify = "��������|notnull&len<=32" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> ���ձ���</TD>
			<TD class="input"/>
		       <input name="RiskCode" id="RiskCode" class="common" readOnly verify = "���ձ���|notnull&len<=10" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �������˱���</TD>
			<TD class="input"/>
		        <Input name="InsuredNo" id="InsuredNo" class="common" verify = "�������˱���|notnull&len<=4" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> ������������</TD>
			<TD class="input"/>
		        <Input name="ISTN" id="ISTN" class="common" verify = "������������|notnull&len<=64" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �����������֤������</TD>
			<TD class="input"/>
		         <Input name="IITP" id="IITP" class="codeno" verify = "�����������֤������|notnull&len=2&Code:amlidtype"
      					ondblclick="showCodeList('amlidtype',[this,IITPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,IITPName],[0,1]);"
      					/><Input class=codename name=IITPName readOnly  elementtype=nacessary>
	        </TD>
			<TD class="title" /> �����������֤������</TD>
			<TD class="input"/>
		        <Input name="ISID" id="ISID" class="common" verify = "�����������֤������|notnull&len<=20" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>		
					<TD class="title" /> Ͷ�����뱻�����˵Ĺ�ϵ</TD>
			<TD class="input"/>
		        <Input name="RLTP" readonly id="RLTP" class="codeno" verify = "�������뱻�����˵Ĺ�ϵ|notnull&len<=64&Code:relation" 
		             ondblclick="showCodeList('relation',[this,RLTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('relation',[this,RLTPName],[0,1]);"
      					/><Input class=codename name=RLTPName readOnly  elementtype=nacessary>
	        </TD>
		</TR>
	</table>  
</Div>