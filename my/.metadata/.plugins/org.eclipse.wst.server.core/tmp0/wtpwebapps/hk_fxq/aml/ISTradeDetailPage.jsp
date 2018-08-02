<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divDetail);">
		</td>
		<td class= titleImg>
			可疑交易明细信息
		</td>
	</tr>
</table>
<Div id= "divDetail" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> 客户号码</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" verify = "客户号码|notnull" elementtype=nacessary  />
	        </TD>
			<TD class="title" /> 客户名称</TD>
			<TD class="input"/>
		        <input name="CTNM" id="CTNM" class="common" verify = "客户名称|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 客户身份证件类型</TD>
			<TD class="input"/>
		        <Input name="CITP" id="CITP" class="codeno" 
      					ondblclick="showCodeList('amlidtype',[this,CITPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,CITPName],[0,1]);"
      					/><Input class=codename name=CITPName readOnly >
	        </TD>
			<TD class="title" /> 客户证件号码</TD>
			<TD class="input"/>
		        <Input name="CTID" id="CTID" class="common" />
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 投保人类型</TD>
			<TD class="input"/>
		        <Input name="CTTP" id="CTTP" class="codeno" 
      					ondblclick="showCodeList('amlpolicyholdertype',[this,CTTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlpolicyholdertype',[this,CTTPName],[0,1]);"
      					/><Input class=codename name=CTTPName readOnly >
	        </TD>
			<TD class="title" /> 客户联系电话</TD>
			<TD class="input"/>
		        <Input name="CCTL" id="CCTL" class="common"  />
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 客户详细地址</TD>
			<TD class="input"/>
		        <textarea name="CTAR" id="CTAR" class="common" /></textarea>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 客户其他信息</TD>
			<TD class="input"/>
		        <textarea name="CCEI" id="CCEI" class="common" /></textarea>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 客户职业或行业</TD>
			<TD class="input"/>
			    <Input name="CTVC" id="CTVC" class="codeno" 
      				ondblclick="showCodeList('amloccupationtype',[this,CTVCName],[0,1]);" 	
      				onkeyup="showCodeListKey('amloccupationtype',[this,CTVCName],[0,1]);"
      				/><Input class=codename name=CTVCName readOnly >
	        </TD>
			<TD class="title" /> 代表人姓名</TD>
			<TD class="input"/>
		        <Input name="CRNM" id="CRNM" class="common" />
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 代表人身份证类型</TD>
			<TD class="input"/>
		        <Input name="CRIT" id="CRIT" class="codeno" 
      					ondblclick="showCodeList('amlidtype',[this,CRITName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,CRITName],[0,1]);"
      					/><Input class=codename name=CRITName readOnly >
	        </TD>
			<TD class="title" /> 代表人身份证件号码</TD>
			<TD class="input"/>
		        <Input  name="CRID" id="CRID" class="common" />
	        </TD>
		</TR>
	</table>  
</Div>