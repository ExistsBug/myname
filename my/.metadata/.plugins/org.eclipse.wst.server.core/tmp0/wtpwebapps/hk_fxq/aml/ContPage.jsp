<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			���ɽ��׺�ͬ��Ϣ
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> ���ױ��</TD>
			<TD class="input"/>
		        <input name="DealNo" id="DealNo" class="common" readOnly verify = "���ױ��|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> ���պ�ͬ��</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" verify = "���պ�ͬ��|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ��������</TD>
			<TD class="input"/>
		        <Input name="ISTP" id="ISTP" class="codeno" verify = "��������|notnull&len=2&Code:amlrisktype"
      					ondblclick="showCodeList('amlrisktype',[this,ISTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlrisktype',[this,ISTPName],[0,1]);"
      					/><Input class=codename name=ISTPName readOnly elementtype=nacessary>
	        </TD>
			<TD class="title" /> ��������</TD>
			<TD class="input"/>
		        <input name="ISNM" id="ISNM" class="common" verify = "��������|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ���ձ���</TD>
			<TD class="input"/>
		       <input name="RiskCode" id="RiskCode" class="common" verify = "���ձ���|notnull&len<=10" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> �����ڼ�</TD>
			<TD class="input"/>
		        <Input name="ISPS" id="ISPS" class="common" verify = "�����ڼ�|notnull&len=16|len=2" elementtype=nacessary/><font color=red style="font:9pt"> YYYYMMDDYYYYMMDD</font>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ���պ�ͬ������Ϣ</TD>
			<TD class="input"/>
		        <Input name="CTES" id="CTES" class="common" verify = "���պ�ͬ������Ϣ|notnull&len<=64" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> ���ձ��</TD>
			<TD class="input"/>
		        <Input name="ISOG" id="ISOG" class="common" verify = "���ձ��|notnull&len<=128" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ���ս��</TD>
			<TD class="input"/>
		        <Input name="ISAT" id="ISAT" class="common" verify = "���ս��|notnull&num&len<=20" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> ���շ�</TD>
			<TD class="input"/>
		        <input name="ISFE" id="ISFE" class="common" verify = "���շ�|notnull&num&len<=20" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �ɷѷ�ʽ</TD>
			<TD class="input"/>
			    <Input name="ISPT" id="ISPT" class="codeno" verify = "�ɷѷ�ʽ|notnull&len=2&Code:amlpayintv" 
      				ondblclick="showCodeList('amlpayintv',[this,ISPTName],[0,1]);" 	
      				onkeyup="showCodeListKey('amlpayintv',[this,ISPTName],[0,1]);"
      				/><Input class=codename name=ISPTName readOnly elementtype=nacessary>
	        </TD>
<!--			<TD class="title" /> ���պ�ͬ������Ϣ</TD>
			<TD class="input"/>
		        <Input name="CTES" id="CTES" class="common" verify = "���պ�ͬ������Ϣ|notnull" elementtype=nacessary/>
	        </TD>-->
		</TR>
	</table>  
</Div>