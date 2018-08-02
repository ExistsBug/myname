<%@page contentType="text/html;charset=GBK" %>
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
			<TD class="title" /> 保险合同号</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" verify="保险合同号|notnull&len<=32"  elementtype=nacessary />
	        </TD>
			<TD class="title" /> 业务标示号</TD>
			<TD class="input"/>
		        <input name="TICD" id="TICD" class="readOnly" readOnly />
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 交易日期</TD>
			<TD class="input"/>
		        <Input name="TSTM" id="TSTM" class="common" verify="交易日期|notnull&len=10"   elementtype=nacessary ><font color=red style="font:9pt"> YYYYMMDDHH24</font>
	        </TD>
			<TD class="title" /> 交易类型</TD>
			<TD class="input"/>
		        <Input name="TSTP" id="TSTP" class="codeno" verify="交易类型|notnull&Code:amltranstype"
      					ondblclick="showCodeList('amltranstype',[this,TSTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amltranstype',[this,TSTPName],[0,1]);"
      					/><Input class=codename name=TSTPName readOnly elementtype=nacessary >
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 币种 </TD>
			<TD class="input"/>
		        <Input name="CRTP" id="CRTP" class="codeno" verify="币种|notnull&len=3|Code:amlcurrencytype" value="CNY"
      					ondblclick="showCodeList('amlcurrencytype',[this,CRTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlcurrencytype',[this,CRTPName],[0,1]);"
      					/><Input class=codename name=CRTPName readOnly elementtype=nacessary >
	        </TD>
			<TD class="title" /> 交易金额 </TD>
			<TD class="input"/>
		        <Input name="CRAT" id="CRAT" class="common"  verify="交易金额|notnull&num&len<=20" elementtype=nacessary 　/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 资金进出方向 </TD>
			<TD class="input"/>
		        <Input name="CRDR" id="CRDR" class="codeno" verify="资金进出方向|notnull&Code:amloutpaytype"
      					ondblclick="showCodeList('amloutpaytype',[this,CRDRName],[0,1]);" 	
      					onkeyup="showCodeListKey('amloutpaytype',[this,CRDRName],[0,1]);"
      					/><Input class=codename name=CRDRName readOnly elementtype=nacessary >
	        </TD>
			<TD class="title" /> 资金进出方式 </TD>
			<TD class="input"/>
		        <Input name="CSTP" id="CSTP" class="codeno" verify="资金进出方式|notnull&Code:amlcstp"
      					ondblclick="showCodeList('amlcstp',[this,CSTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlcstp',[this,CSTPName],[0,1]);"
      					/><Input class=codename name=CSTPName readOnly elementtype=nacessary >
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 资金账户开户行</TD>
			<TD class="input"/>
		        <Input name="CAOI" id="CAOI" class="common" verify="资金账户开户行|notnull&len<=64" elementtype=nacessary  >
	        </TD>
			<TD class="title" /> 银行转帐资金账号</TD>
			<TD class="input"/>
			    <Input name="TCAN" id="TCAN" class="common" verify="银行转帐资金账号|notnull&len<=64" elementtype=nacessary >
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 经办人姓名</TD>
			<TD class="input"/>
		        <Input name="TBNM" id="TBNM" class="common" verify="经办人姓名|notnull&len<=32" elementtype=nacessary />
	        </TD>
			<TD class="title" /> </TD>
			<TD class="input"/> </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 经办人身份证件类型</TD>
			<TD class="input"/>
		        <Input name="TBIT" id="TBIT" class="codeno" verify="经办人身份证件类型|notnull&Code:amlidtype" 
      					ondblclick="showCodeList('amlidtype',[this,TBITName],[0,1], null,' #1# and code not like #2%# ', '1');" 	
      					onkeyup="showCodeListKey('amlidtype',[this,TBITName],[0,1], null,' #1# and code not like #2%# ', '1');" 
      					/><Input class=codename name=TBITName readOnly elementtype=nacessary >
	        </TD>
			<TD class="title" /> 经办人身份证件号码</TD>
			<TD class="input"/>
		        <Input  name="TBID" id="TBID" class="common" verify="经办人身份证件号码|notnull&len<=20"  elementtype=nacessary />
	        </TD>
		</TR>
	</table>  
</Div>