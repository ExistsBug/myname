<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			客户基本信息
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> 客户号码</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" verify = "客户号码|notnull&len<=32" elementtype=nacessary  />
	        </TD>
			<TD class="title" /> 客户名称</TD>
			<TD class="input"/>
		        <input name="CTNM" id="CTNM" class="common" verify = "客户名称|notnull&len<=32" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 投保人类型</TD>
			<TD class="input"/>
		        <Input name="CTTP" id="CTTP" class="codeno" verify = "投保人类型|notnull&Code:amlpolicyholdertype"
      					ondblclick="showCodeList('amlpolicyholdertype',[this,CTTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlpolicyholdertype',[this,CTTPName],[0,1]);"
      					/><Input class=codename name=CTTPName readOnly elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 客户身份证件类型</TD>
			<TD class="input"/>
		        <Input name="CITP" id="CITP" class="codeno"  verify = "客户身份证件类型|notnull&Code:amlidtype"
      					ondblclick="showCodeList('amlidtype',[this,CITPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,CITPName],[0,1]);"
      					/><Input class=codename name=CITPName readOnly elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 客户证件号码</TD>
			<TD class="input"/>
		        <Input name="CTID" id="CTID" class="common" verify = "客户证件号码|notnull&len<=20" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 客户联系电话</TD>
			<TD class="input"/>
		        <Input name="CCTL" id="CCTL" class="common" verify = "客户联系电话|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 交易发生地编码</TD>
			<TD class="input"/>
		        <Input name="TRCD" id="TRCD" class="code" verify = "交易发生地编码|notnull"
      					ondblclick="return showArea();" 	
      					onkeyup="return showArea();"	elementtype=nacessary
      					/>
	        </TD>
			<TD class="title" /> 交易发生地</TD>
			<TD class="input"/>
		        <Input name="TRCDName" id="TRCDName" class="readOnly" verify = " 交易发生地|notnull" ReadOnly elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 客户职业或行业</TD>
			<TD class="input"/>
			    <Input name="CTVC" id="CTVC" class="codeno" verify = "客户职业或行业|notnull&Code:amloccupationtype"
      				ondblclick="showCodeListCTVC(this);" 	
      				onkeyup="showCodeListKeyCTVC(this);"
      				/><Input class=codename name=CTVCName readOnly elementtype=nacessary>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 代表人姓名</TD>
			<TD class="input"/>
		        <Input name="CRNM" id="CRNM" class="common" verify = " 代表人姓名|notnull&len<=32" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 代表人身份证件类型</TD>
			<TD class="input"/>
		        <Input name="CRIT" id="CRIT" class="codeno" verify = "代表人身份证件类型|notnull&Code:amlidtype"
      					ondblclick="showCodeList('amlidtype',[this,CRITName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,CRITName],[0,1]);"
      					/><Input class=codename name=CRITName readOnly elementtype=nacessary>
	        </TD>
			<TD class="title" /> 代表人身份证件号码</TD>
			<TD class="input"/>
		        <Input  name="CRID" id="CRID" class="common" verify = " 代表人身份证件号码|len<=20&notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 客户详细地址</TD>
			<TD class="input" colspan=5 />
		        <textarea style="width:97%" name="CTAR" id="CTAR" verify=" 客户详细地址|notnull&len<=128" class="common" elementtype=nacessary/></textarea>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 客户其他信息</TD>
			<TD class="input" colspan=5  />
		        <textarea style="width:97%"  name="CCEI" id="CCEI" class="common" verify=" 客户其他信息|notnull&len<=64"  elementtype=nacessary/></textarea>
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
	
