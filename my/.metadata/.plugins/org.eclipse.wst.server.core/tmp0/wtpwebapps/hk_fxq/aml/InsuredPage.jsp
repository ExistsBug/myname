<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			合同险种被保险人信息
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> 交易编号</TD>
			<TD class="input"/>
		        <input name="DealNo" id="DealNo" class="common" readOnly  verify = "交易编号|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 保险合同号</TD>
			<TD class="input"/>
		        <input name="CSNM" id="CSNM" class="common" readOnly verify = "保险合同号|notnull&len<=32" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
				<TD class="title" /> 保险名称</TD>
			<TD class="input"/>
		       <input name="ISNM" id="ISNM" class="common" readOnly verify = "保险名称|notnull&len<=32" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 保险编码</TD>
			<TD class="input"/>
		       <input name="RiskCode" id="RiskCode" class="common" readOnly verify = "保险编码|notnull&len<=10" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 被保险人编码</TD>
			<TD class="input"/>
		        <Input name="InsuredNo" id="InsuredNo" class="common" verify = "被保险人编码|notnull&len<=4" elementtype=nacessary/>
	        </TD>
			<TD class="title" /> 被保险人姓名</TD>
			<TD class="input"/>
		        <Input name="ISTN" id="ISTN" class="common" verify = "被保险人姓名|notnull&len<=64" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 被保险人身份证件类型</TD>
			<TD class="input"/>
		         <Input name="IITP" id="IITP" class="codeno" verify = "被保险人身份证件类型|notnull&len=2&Code:amlidtype"
      					ondblclick="showCodeList('amlidtype',[this,IITPName],[0,1]);" 	
      					onkeyup="showCodeListKey('amlidtype',[this,IITPName],[0,1]);"
      					/><Input class=codename name=IITPName readOnly  elementtype=nacessary>
	        </TD>
			<TD class="title" /> 被保险人身份证件号码</TD>
			<TD class="input"/>
		        <Input name="ISID" id="ISID" class="common" verify = "被保险人身份证件号码|notnull&len<=20" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>		
					<TD class="title" /> 投保人与被保险人的关系</TD>
			<TD class="input"/>
		        <Input name="RLTP" readonly id="RLTP" class="codeno" verify = "报保人与被保险人的关系|notnull&len<=64&Code:relation" 
		             ondblclick="showCodeList('relation',[this,RLTPName],[0,1]);" 	
      					onkeyup="showCodeListKey('relation',[this,RLTPName],[0,1]);"
      					/><Input class=codename name=RLTPName readOnly  elementtype=nacessary>
	        </TD>
		</TR>
	</table>  
</Div>