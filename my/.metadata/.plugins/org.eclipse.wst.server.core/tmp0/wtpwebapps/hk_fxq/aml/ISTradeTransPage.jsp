<%@page contentType="text/html;charset=GBK" %>
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
<Div id= "divDetail" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> ���պ�ͬ��</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" verify="���պ�ͬ��|notnull&len<=32"  elementtype=nacessary />
	        </TD>
			<TD class="title" /> ҵ���ʾ��</TD>
			<TD class="input"/>
		        <input name="TICD" id="TICD" class="readOnly" readOnly />
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ��������</TD>
			<TD class="input"/>
		        <Input name="TSTM" id="TSTM" class="common" verify="��������|notnull&len=10"   elementtype=nacessary ><font color=red style="font:9pt"> YYYYMMDDHH24</font>
	        </TD>
			<TD class="title" /> ��������</TD>
			<TD class="input"/>
		        <Input name="TSTP" id="TSTP" class="codeno" verify="��������|notnull&Code:amltranstype"
      					ondblclick="showCodeList('amltranstype',[this,TSTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amltranstype',[this,TSTPName],[0,1]);"
      					/><Input class=codename name=TSTPName readOnly elementtype=nacessary >
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ���� </TD>
			<TD class="input"/>
		        <Input name="CRTP" id="CRTP" class="codeno" verify="����|notnull&len=3|Code:amlcurrencytype" value="CNY"
      					ondblclick="showCodeList('amlcurrencytype',[this,CRTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlcurrencytype',[this,CRTPName],[0,1]);"
      					/><Input class=codename name=CRTPName readOnly elementtype=nacessary >
	        </TD>
			<TD class="title" /> ���׽�� </TD>
			<TD class="input"/>
		        <Input name="CRAT" id="CRAT" class="common"  verify="���׽��|notnull&num&len<=20" elementtype=nacessary ��/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �ʽ�������� </TD>
			<TD class="input"/>
		        <Input name="CRDR" id="CRDR" class="codeno" verify="�ʽ��������|notnull&Code:amloutpaytype"
      					ondblclick="showCodeList('amloutpaytype',[this,CRDRName],[0,1]);" 	
      					onkeyup="showCodeListKey('amloutpaytype',[this,CRDRName],[0,1]);"
      					/><Input class=codename name=CRDRName readOnly elementtype=nacessary >
	        </TD>
			<TD class="title" /> �ʽ������ʽ </TD>
			<TD class="input"/>
		        <Input name="CSTP" id="CSTP" class="codeno" verify="�ʽ������ʽ|notnull&Code:amlcstp"
      					ondblclick="showCodeList('amlcstp',[this,CSTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlcstp',[this,CSTPName],[0,1]);"
      					/><Input class=codename name=CSTPName readOnly elementtype=nacessary >
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �ʽ��˻�������</TD>
			<TD class="input"/>
		        <Input name="CAOI" id="CAOI" class="common" verify="�ʽ��˻�������|notnull&len<=64" elementtype=nacessary  >
	        </TD>
			<TD class="title" /> ����ת���ʽ��˺�</TD>
			<TD class="input"/>
			    <Input name="TCAN" id="TCAN" class="common" verify="����ת���ʽ��˺�|notnull&len<=64" elementtype=nacessary >
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ����������</TD>
			<TD class="input"/>
		        <Input name="TBNM" id="TBNM" class="common" verify="����������|notnull&len<=32" elementtype=nacessary />
	        </TD>
			<TD class="title" /> </TD>
			<TD class="input"/> </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ���������֤������</TD>
			<TD class="input"/>
		        <Input name="TBIT" id="TBIT" class="codeno" verify="���������֤������|notnull&Code:amlidtype" 
      					ondblclick="showCodeList('amlidtype',[this,TBITName],[0,1], null,' #1# and code not like #2%# ', '1');" 	
      					onkeyup="showCodeListKey('amlidtype',[this,TBITName],[0,1], null,' #1# and code not like #2%# ', '1');" 
      					/><Input class=codename name=TBITName readOnly elementtype=nacessary >
	        </TD>
			<TD class="title" /> ���������֤������</TD>
			<TD class="input"/>
		        <Input  name="TBID" id="TBID" class="common" verify="���������֤������|notnull&len<=20"  elementtype=nacessary />
	        </TD>
		</TR>
	</table>  
</Div>