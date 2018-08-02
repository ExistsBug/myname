<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			可疑交易合同信息
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> 交易编号</TD>
			<TD class="input"/>
		        <input name="DealNo" id="DealNo" class="common" readOnly verify = "交易编号|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 保险合同号</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" verify = "保险合同号|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 保险种类</TD>
			<TD class="input"/>
		        <Input name="ISTP" id="ISTP" class="codeno" verify = "保险种类|notnull&len=2&Code:amlrisktype"
      					ondblclick="showCodeList('amlrisktype',[this,ISTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlrisktype',[this,ISTPName],[0,1]);"
      					/><Input class=codename name=ISTPName readOnly elementtype=nacessary>
	        </TD>
			<TD class="title" /> 保险名称</TD>
			<TD class="input"/>
		        <input name="ISNM" id="ISNM" class="common" verify = "保险名称|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 保险编码</TD>
			<TD class="input"/>
		       <input name="RiskCode" id="RiskCode" class="common" verify = "保险编码|notnull&len<=10" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 保险期间</TD>
			<TD class="input"/>
		        <Input name="ISPS" id="ISPS" class="common" verify = "保险期间|notnull&len=16|len=2" elementtype=nacessary/><font color=red style="font:9pt"> YYYYMMDDYYYYMMDD</font>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 保险合同其他信息</TD>
			<TD class="input"/>
		        <Input name="CTES" id="CTES" class="common" verify = "保险合同其他信息|notnull&len<=64" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 保险标的</TD>
			<TD class="input"/>
		        <Input name="ISOG" id="ISOG" class="common" verify = "保险标的|notnull&len<=128" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 保险金额</TD>
			<TD class="input"/>
		        <Input name="ISAT" id="ISAT" class="common" verify = "保险金额|notnull&num&len<=20" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 保险费</TD>
			<TD class="input"/>
		        <input name="ISFE" id="ISFE" class="common" verify = "保险费|notnull&num&len<=20" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 缴费方式</TD>
			<TD class="input"/>
			    <Input name="ISPT" id="ISPT" class="codeno" verify = "缴费方式|notnull&len=2&Code:amlpayintv" 
      				ondblclick="showCodeList('amlpayintv',[this,ISPTName],[0,1]);" 	
      				onkeyup="showCodeListKey('amlpayintv',[this,ISPTName],[0,1]);"
      				/><Input class=codename name=ISPTName readOnly elementtype=nacessary>
	        </TD>
<!--			<TD class="title" /> 保险合同其他信息</TD>
			<TD class="input"/>
		        <Input name="CTES" id="CTES" class="common" verify = "保险合同其他信息|notnull" elementtype=nacessary/>
	        </TD>-->
		</TR>
	</table>  
</Div>