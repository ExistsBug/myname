<%@page contentType="text/html;charset=GBK" %>
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divDetail);">
			</td>
			<td class= titleImg>
				������ϸ��Ϣ
			</td>
		</tr>
	</table>

	<Div id= "divDetail" style= "display: '' ">
		<table class=common border=0>
			<TR class=common>
				<TD class="title" /> ������������</TD>
				<TD class="input"/>
				    <Input name="CRCD" id="CRCD" class="code" verify="������������|notnull&Code:amlbigstamp"
	      				ondblclick="showCodeList('amlbigstamp',[this]);" 	
	      				onkeyup="showCodeListKey('amlbigstamp',[this]);" elementtype=nacessary />
		        </TD>
				<TD class="title" /> ������ϸ����</TD>
				<TD class="input"/>
			        <Input name="TSDT" id="TSDT" class="common" verify="������ϸ����|notnull&len<=4" elementtype=nacessary />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���ڻ�����������</TD>
				<TD class="input"/>
			        <Input name="FINN" id="FINN" class="common" verify="���ڻ�����������|len<=64" elementtype=nacessary />
		        </TD>
				<TD class="title" /> ���ڻ�������������</TD>
				<TD class="input"/>
				    <Input name="FIRC" id="FIRC" class="readOnly"  readOnly/>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���ڻ�������׹�ϵ</TD>
				<TD class="input"/>
				    <Input name="RLTP" id="RLTP" class="code" verify="���ڻ�������׹�ϵ|notnull&Code:amlbigrelation"
	      				ondblclick="showCodeList('amlbigrelation',[this]);" 	
	      				onkeyup="showCodeListKey('amlbigrelation',[this]);" elementtype=nacessary>
		        </TD>
				<TD class="title" /> ����ʱ��</TD>
				<TD class="input"/>
			        <Input class='common' name="TSTM" id="TSTM" verify="����ʱ��|notnull" elementtype=nacessary /><font color=red style="font:9pt"> YYYYMMDDHH24MISS</font>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���ڻ��������������</TD>
				<TD class="input"/>
			        <Input class='readOnly' name="FICT" id="FICT" value="00" elementtype=nacessary />
		        </TD>
				<TD class="title" /> ���ڻ����������</TD>
				<TD class="input"/>
					<Input name="FINC" id="FINC" class="common"  verify="���ڻ����������|len<=12" elementtype=nacessary />
				</TD>
			</TR>
			<TR class=common>
				<TD class="title" /> �˻�����</TD>
				<TD class="input"/>
				    <Input name="CATP" id="CATP" class="code" verify="�˻�����|notnull&Code:amlaccount"
	      				ondblclick="showCodeList('amlaccount',[this]);" 	
	      				onkeyup="showCodeListKey('amlaccount',[this]);" elementtype=nacessary >
		        </TD>
				<TD class="title" /> �˺�</TD>
				<TD class="input"/>
			        <Input name="CTAC" id="CTAC" class="common" verify="�˺�|notnull&len<=64" elementtype=nacessary />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���״���������</TD>
				<TD class="input"/>
			        <Input name="TBNM" id="TBNM" class="common" verify="���״���������|notnull&len<=32" elementtype=nacessary />
		        </TD>
				<TD class="title" /> </TD>
				<TD class="input"/>  </TD>
			</TR>
			<TR>
				<TD class="title" /> ���������֤������</TD>
				<TD class="input"/>
			        <Input name="TBIT" id="TBIT" class="code" verify="���������֤������|notnull&Code:amlidtype"  
	      					ondblclick="showCodeList('amlidtype',[this],[0,1], null,' #1# and code not like #2%# ', '1');"
	      					onkeyup=""showCodeListKey('amlidtype',[this],[0,1], null,' #1# and code not like #2%# ', '1');" elementtype=nacessary >
		        </TD>
		
				<TD class="title" /> ���������֤������</TD>
				<TD class="input"/>
			        <Input name="TBID" id="TBID" class="common" verify="���������֤������|notnull&len<=20" elementtype=nacessary />
		        </TD>
			</TR>				
			<TR class=common>
				<TD class="title" /> �����˹���</TD>
				<TD class="input"/>
			        <Input name="TBNT" id="TBNT" class="code"  verify="�����˹���|notnull"  
	      					ondblclick="showCodeList('ccountry',[this]);" 	
	      					onkeyup="showCodeListKey('ccountry',[this]);" elementtype=nacessary  value="CHN"/>
		        </TD>
				<TD class="title" /> ҵ���ʾ��</TD>
				<TD class="input"/>
			        <Input name="TICD" id="TICD" class="readOnly" readOnly elementtype=nacessary  />
		        </TD>
			</TR>				
			<TR class=common>
				<TD class="title" /> ���׷�ʽ</TD>
				<TD class="input"/>
			        <Input name="TSTP" id="TSTP" class="code" verify="���׷�ʽ|notnull&Code:amlpaymode"  
	      					onchange="return clearTRCD();"			        
	      					ondblclick="showCodeList('amlpaymode',[this]);" 	
	      					onkeyup="showCodeListKey('amlpaymode',[this]);"  
	      					 elementtype=nacessary />
		        </TD>
				<TD class="title" /> ������֧���׷��������</TD>
				<TD class="input"/>
			        <Input name="TSCT" id="TSCT" class="code" 
	      					ondblclick="showCodeList('amloutpaycode',[this]);" 	
	      					onkeyup="showCodeListKey('amloutpaycode',[this]);" verify="������֧���׷��������|notnull&Code:amloutpaycode" elementtype=nacessary >
		        </TD>
			</TR>				
			<TR class=common>
				<TD class="title" /> �ʽ��ո���ʶ</TD>
				<TD class="input"/>
			        <Input name="TSDR" id="TSDR" class="code" 
	      					ondblclick="showCodeList('amloutpaytype',[this]);" 	
	      					onkeyup="showCodeListKey('amloutpaytype',[this]);" verify="�ʽ��ո���ʶ|notnull&Code:amloutpaytype" elementtype=nacessary >
		        </TD>
				<TD class="title" /> ����ȥ��</TD>
				<TD class="input"/>
			        <Input name="TDRC" id="TDRC" class="code" 
	      					ondblclick="return showArea(this.name);" 	
	      					onkeyup="return showArea(this.name);" elementtype=nacessary verify="����ȥ��|notnull&len<=9"	
	      					/>			        			        
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���׷�����</TD>
				<TD class="input"/>
			        <Input name="TRCD" id="TRCD" class="code"
	      					ondblclick="return showAreaEx(this.name);" 	
	      					onkeyup="return showAreaEx(this.name);"
	      					/>			        
		    </TD>
				<TD class="title" /> ������Դ</TD>
				<TD class="input"/>
			        <Input name="DataSource" id="DataSource" class="code"
	      					ondblclick="showCodeList('DataSource',[this]);" 	
	      					onkeyup="showCodeListKey('DataSource',[this]);" 
	      					/>
		    </TD>		    
			</TR>
			<TR class=common>
				<TD class="title" /> �ʽ���;</TD>
				<TD class="input" colspan=3/>
			        <textarea name="CRPP" id="CRPP" style="width:98% "class="common" elementtype=nacessary verify="�ʽ���;|notnull&len<=128"></textarea>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ����</TD>
				<TD class="input"/>
			        <Input name="CRTP" id="CRTP" class="code" 
	      					ondblclick="showCodeList('amlcurrencytype',[this]);" 	
	      					onkeyup="showCodeListKey('amlcurrencytype',[this]);" elementtype=nacessary verify="����|notnull&Code:amlcurrencytype" value="CNY"/>
		        </TD>
				<TD class="title" /> ���׽��</TD>
				<TD class="input"/>
			        <Input name="CRAT" id="CRAT" class="common" elementtype=nacessary verify="���׽��|notnull&num&len<=20"/>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> �Է����ڻ�����������</TD>
				<TD class="input"/>
			        <Input name="CFIN" id="CFIN" class="common" elementtype=nacessary verify="�Է����ڻ�����������|notnull&len<=64"/>
		        </TD>
				<TD class="title" /> �Է����ڻ�����������</TD>
				<TD class="input"/>
			        <Input name="CFCT" id="CFCT" class="code" 
	      					ondblclick="showCodeList('amlnettype',[this]);" 	
	      					onkeyup="showCodeListKey('amlnettype',[this]);" elementtype=nacessary verify="�Է����ڻ�����������|notnull&Code:amlnettype" / >
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> �Է����ڽ����������</TD>
				<TD class="input"/>
			        <Input name="CFIC" id="CFIC" class="common" elementtype=nacessary verify="�Է����ڽ����������|notnull&len<=12" />
		        </TD>
				<TD class="title" /> ���׶�������</TD>
				<TD class="input"/>
			        <Input name="TCNM" id="TCNM" class="common"  elementtype=nacessary verify="���׶�������|notnull&len<=64"  />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���׶���֤������</TD>
				<TD class="input"/>
			        <Input name="TCIT" id="TCIT" class="code" 
	      					ondblclick="showCodeList('amlidtype',[this]);" 	
	      					onkeyup="showCodeListKey('amlidtype',[this]);" elementtype=nacessary  verify="���׶���֤������|notnull&Code:amlidtype"  >
		        </TD>
				<TD class="title" /> ���׶���֤������</TD>
				<TD class="input"/>
			        <Input name="TCID" id="TCID" class="common" elementtype=nacessary  verify="���׶���֤������|notnull&len<=20" />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> ���׶����˺�����</TD>
				<TD class="input"/>
				    <Input name="TCAT" id="TCAT" class="code" verify="���׶����˺�����|notnull"
	      				ondblclick="showCodeList('amlaccount',[this]);" 	
	      				onkeyup="showCodeListKey('amlaccount',[this]);" elementtype=nacessary  verify="���׶����˺�����|notnull&Code:amlaccount"  >
		        </TD>
				<TD class="title" /> ���׶����˺�</TD>
				<TD class="input"/>
			        <Input name="TCAC" id="TCAC" class="common" elementtype=nacessary  verify="���׶����˺�|notnull&len<=64" />
		        </TD>
			</TR>
		</table>
		<br>
	</div>