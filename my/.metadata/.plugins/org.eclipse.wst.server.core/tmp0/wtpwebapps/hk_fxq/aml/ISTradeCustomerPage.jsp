<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			�ͻ�������Ϣ
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> �ͻ�����</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" verify = "�ͻ�����|notnull&len<=32" elementtype=nacessary  />
	        </TD>
			<TD class="title" /> �ͻ�����</TD>
			<TD class="input"/>
		        <input name="CTNM" id="CTNM" class="common" verify = "�ͻ�����|notnull&len<=32" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> Ͷ��������</TD>
			<TD class="input"/>
		        <Input name="CTTP" id="CTTP" class="codeno" verify = "Ͷ��������|notnull&Code:amlpolicyholdertype"
      					ondblclick="showCodeList('amlpolicyholdertype',[this,CTTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlpolicyholdertype',[this,CTTPName],[0,1]);"
      					/><Input class=codename name=CTTPName readOnly elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �ͻ����֤������</TD>
			<TD class="input"/>
		        <Input name="CITP" id="CITP" class="codeno"  verify = "�ͻ����֤������|notnull&Code:amlidtype"
      					ondblclick="showCodeList('amlidtype',[this,CITPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,CITPName],[0,1]);"
      					/><Input class=codename name=CITPName readOnly elementtype=nacessary/>
	        </TD>
			<TD class="title" /> �ͻ�֤������</TD>
			<TD class="input"/>
		        <Input name="CTID" id="CTID" class="common" verify = "�ͻ�֤������|notnull&len<=20" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> �ͻ���ϵ�绰</TD>
			<TD class="input"/>
		        <Input name="CCTL" id="CCTL" class="common" verify = "�ͻ���ϵ�绰|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ���׷����ر���</TD>
			<TD class="input"/>
		        <Input name="TRCD" id="TRCD" class="code" verify = "���׷����ر���|notnull"
      					ondblclick="return showArea();" 	
      					onkeyup="return showArea();"	elementtype=nacessary
      					/>
	        </TD>
			<TD class="title" /> ���׷�����</TD>
			<TD class="input"/>
		        <Input name="TRCDName" id="TRCDName" class="readOnly" verify = " ���׷�����|notnull" ReadOnly elementtype=nacessary/>
	        </TD>
			<TD class="title" /> �ͻ�ְҵ����ҵ</TD>
			<TD class="input"/>
			    <Input name="CTVC" id="CTVC" class="codeno" verify = "�ͻ�ְҵ����ҵ|notnull&Code:amloccupationtype"
      				ondblclick="showCodeListCTVC(this);" 	
      				onkeyup="showCodeListKeyCTVC(this);"
      				/><Input class=codename name=CTVCName readOnly elementtype=nacessary>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> ����������</TD>
			<TD class="input"/>
		        <Input name="CRNM" id="CRNM" class="common" verify = " ����������|notnull&len<=32" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> ���������֤������</TD>
			<TD class="input"/>
		        <Input name="CRIT" id="CRIT" class="codeno" verify = "���������֤������|notnull&Code:amlidtype"
      					ondblclick="showCodeList('amlidtype',[this,CRITName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,CRITName],[0,1]);"
      					/><Input class=codename name=CRITName readOnly elementtype=nacessary>
	        </TD>
			<TD class="title" /> ���������֤������</TD>
			<TD class="input"/>
		        <Input  name="CRID" id="CRID" class="common" verify = " ���������֤������|len<=20&notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �ͻ���ϸ��ַ</TD>
			<TD class="input" colspan=5 />
		        <textarea style="width:97%" name="CTAR" id="CTAR" verify=" �ͻ���ϸ��ַ|notnull&len<=128" class="common" elementtype=nacessary/></textarea>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> �ͻ�������Ϣ</TD>
			<TD class="input" colspan=5  />
		        <textarea style="width:97%"  name="CCEI" id="CCEI" class="common" verify=" �ͻ�������Ϣ|notnull&len<=64"  elementtype=nacessary/></textarea>
	        </TD>
		</TR>
	</table>  
</Div>
<script>
function showCodeListCTVC(cObj){
	var strSQL = "";
	var CTTP = document.getElementById("CTTP").value;
	if (CTTP == "07"){
	 	strSQL = " #1# and code like #1%# ";
	 	try{
			showCodeList('amloccupationtype',[cObj], null, null, strSQL, "1");	 	
		}catch(ex){
			alert(ex);
		}
	}
	else{
		showCodeList('amloccupationtype',[cObj],[0,1]);	
	}
}

function showCodeListKeyCTVC(){
	var strSQL = "";
	var CTTP = document.getElementById("CTTP").value;
	if (CTTP == "07"){
	 	strSQL = " #1# and code like #1%# ";
	 	try{
			showCodeListKey('amloccupationtype',[cObj], null, null, strSQL, "1");	 	
		}catch(ex){
			alert(ex);
		}
	}
	else{
		showCodeListKey('amloccupationtype',[cObj],[0,1]);	
	}
}
</script>
	
