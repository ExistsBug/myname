<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			������Ϣ����
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> ���ڻ�������</TD>
			<TD class="input"/>
		        <input name="RINM" id="RINM" class="common" verify = "���ڻ�������|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />���ڻ������ڵ���������������</TD>
			<TD class="input"/>
		        <input name="FIRC" id="FIRC" class="common" verify = "���ڻ������ڵ���������������|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />���ڻ�����������</TD>
			<TD class="input"/>
		        <Input name="FICT" id="FICT" class="common" verify = "���ڻ�����������|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />���ڻ�������</TD>
			<TD class="input"/>
		        <input name="FICD" id="FICD" class="common" verify = "���ڻ�������|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />���ڻ�����ϵ��</TD>
			<TD class="input"/>
		       <input name="CPNM" id="CPNM" class="common" verify = "���ڻ�����ϵ��|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />���ڻ�����ϵ�绰</TD>
			<TD class="input"/>
		        <Input name="CTTL" id="CTTL" class="common" verify = "���ڻ�����ϵ�绰|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />���ڻ�����ַ</TD>
			<TD class="input"/>
		        <Input name="FIAR" id="FIAR" class="common" verify = "���ڻ�����ַ|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />���ڻ���������ϵ��ʽ��Ϣ</TD>
			<TD class="input"/>
		        <Input name="FCEI" id="FCEI" class="common" verify = "���ڻ���������ϵ��ʽ��Ϣ|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />�����������</TD>
			<TD class="input"/>
		        <input name="RICD" id="RICD" class="common" verify = "�����������|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
	</table>  
</Div>