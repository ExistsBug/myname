<%@page contentType="text/html;charset=GBK" %>
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divDetail);">
			</td>
			<td class= titleImg>
				大额交易明细信息
			</td>
		</tr>
	</table>

	<Div id= "divDetail" style= "display: '' ">
		<table class=common border=0>
			<TR class=common>
				<TD class="title" /> 大额交易特征代码</TD>
				<TD class="input"/>
				    <Input name="CRCD" id="CRCD" class="code" verify="大额交易特征代码|notnull&Code:amlbigstamp"
	      				ondblclick="showCodeList('amlbigstamp',[this]);" 	
	      				onkeyup="showCodeListKey('amlbigstamp',[this]);" elementtype=nacessary />
		        </TD>
				<TD class="title" /> 大额交易明细编码</TD>
				<TD class="input"/>
			        <Input name="TSDT" id="TSDT" class="common" verify="大额交易明细编码|notnull&len<=4" elementtype=nacessary />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 金融机构网点名称</TD>
				<TD class="input"/>
			        <Input name="FINN" id="FINN" class="common" verify="金融机构网点名称|len<=64" elementtype=nacessary />
		        </TD>
				<TD class="title" /> 金融机构行政区代码</TD>
				<TD class="input"/>
				    <Input name="FIRC" id="FIRC" class="readOnly"  readOnly/>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 金融机构与大额交易关系</TD>
				<TD class="input"/>
				    <Input name="RLTP" id="RLTP" class="code" verify="金融机构与大额交易关系|notnull&Code:amlbigrelation"
	      				ondblclick="showCodeList('amlbigrelation',[this]);" 	
	      				onkeyup="showCodeListKey('amlbigrelation',[this]);" elementtype=nacessary>
		        </TD>
				<TD class="title" /> 交易时间</TD>
				<TD class="input"/>
			        <Input class='common' name="TSTM" id="TSTM" verify="交易时间|notnull" elementtype=nacessary /><font color=red style="font:9pt"> YYYYMMDDHH24MISS</font>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 金融机构网点代码类型</TD>
				<TD class="input"/>
			        <Input class='readOnly' name="FICT" id="FICT" value="00" elementtype=nacessary />
		        </TD>
				<TD class="title" /> 金融机构网点代码</TD>
				<TD class="input"/>
					<Input name="FINC" id="FINC" class="common"  verify="金融机构网点代码|len<=12" elementtype=nacessary />
				</TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 账户类型</TD>
				<TD class="input"/>
				    <Input name="CATP" id="CATP" class="code" verify="账户类型|notnull&Code:amlaccount"
	      				ondblclick="showCodeList('amlaccount',[this]);" 	
	      				onkeyup="showCodeListKey('amlaccount',[this]);" elementtype=nacessary >
		        </TD>
				<TD class="title" /> 账号</TD>
				<TD class="input"/>
			        <Input name="CTAC" id="CTAC" class="common" verify="账号|notnull&len<=64" elementtype=nacessary />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 交易代办人姓名</TD>
				<TD class="input"/>
			        <Input name="TBNM" id="TBNM" class="common" verify="交易代办人姓名|notnull&len<=32" elementtype=nacessary />
		        </TD>
				<TD class="title" /> </TD>
				<TD class="input"/>  </TD>
			</TR>
			<TR>
				<TD class="title" /> 代办人身份证件类型</TD>
				<TD class="input"/>
			        <Input name="TBIT" id="TBIT" class="code" verify="代办人身份证件类型|notnull&Code:amlidtype"  
	      					ondblclick="showCodeList('amlidtype',[this],[0,1], null,' #1# and code not like #2%# ', '1');"
	      					onkeyup=""showCodeListKey('amlidtype',[this],[0,1], null,' #1# and code not like #2%# ', '1');" elementtype=nacessary >
		        </TD>
		
				<TD class="title" /> 代办人身份证件号码</TD>
				<TD class="input"/>
			        <Input name="TBID" id="TBID" class="common" verify="代办人身份证件号码|notnull&len<=20" elementtype=nacessary />
		        </TD>
			</TR>				
			<TR class=common>
				<TD class="title" /> 代办人国籍</TD>
				<TD class="input"/>
			        <Input name="TBNT" id="TBNT" class="code"  verify="代办人国籍|notnull"  
	      					ondblclick="showCodeList('ccountry',[this]);" 	
	      					onkeyup="showCodeListKey('ccountry',[this]);" elementtype=nacessary  value="CHN"/>
		        </TD>
				<TD class="title" /> 业务标示号</TD>
				<TD class="input"/>
			        <Input name="TICD" id="TICD" class="readOnly" readOnly elementtype=nacessary  />
		        </TD>
			</TR>				
			<TR class=common>
				<TD class="title" /> 交易方式</TD>
				<TD class="input"/>
			        <Input name="TSTP" id="TSTP" class="code" verify="交易方式|notnull&Code:amlpaymode"  
	      					onchange="return clearTRCD();"			        
	      					ondblclick="showCodeList('amlpaymode',[this]);" 	
	      					onkeyup="showCodeListKey('amlpaymode',[this]);"  
	      					 elementtype=nacessary />
		        </TD>
				<TD class="title" /> 涉外收支交易分类与代码</TD>
				<TD class="input"/>
			        <Input name="TSCT" id="TSCT" class="code" 
	      					ondblclick="showCodeList('amloutpaycode',[this]);" 	
	      					onkeyup="showCodeListKey('amloutpaycode',[this]);" verify="涉外收支交易分类与代码|notnull&Code:amloutpaycode" elementtype=nacessary >
		        </TD>
			</TR>				
			<TR class=common>
				<TD class="title" /> 资金收付标识</TD>
				<TD class="input"/>
			        <Input name="TSDR" id="TSDR" class="code" 
	      					ondblclick="showCodeList('amloutpaytype',[this]);" 	
	      					onkeyup="showCodeListKey('amloutpaytype',[this]);" verify="资金收付标识|notnull&Code:amloutpaytype" elementtype=nacessary >
		        </TD>
				<TD class="title" /> 交易去向</TD>
				<TD class="input"/>
			        <Input name="TDRC" id="TDRC" class="code" 
	      					ondblclick="return showArea(this.name);" 	
	      					onkeyup="return showArea(this.name);" elementtype=nacessary verify="交易去向|notnull&len<=9"	
	      					/>			        			        
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 交易发生地</TD>
				<TD class="input"/>
			        <Input name="TRCD" id="TRCD" class="code"
	      					ondblclick="return showAreaEx(this.name);" 	
	      					onkeyup="return showAreaEx(this.name);"
	      					/>			        
		    </TD>
				<TD class="title" /> 数据来源</TD>
				<TD class="input"/>
			        <Input name="DataSource" id="DataSource" class="code"
	      					ondblclick="showCodeList('DataSource',[this]);" 	
	      					onkeyup="showCodeListKey('DataSource',[this]);" 
	      					/>
		    </TD>		    
			</TR>
			<TR class=common>
				<TD class="title" /> 资金用途</TD>
				<TD class="input" colspan=3/>
			        <textarea name="CRPP" id="CRPP" style="width:98% "class="common" elementtype=nacessary verify="资金用途|notnull&len<=128"></textarea>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 币种</TD>
				<TD class="input"/>
			        <Input name="CRTP" id="CRTP" class="code" 
	      					ondblclick="showCodeList('amlcurrencytype',[this]);" 	
	      					onkeyup="showCodeListKey('amlcurrencytype',[this]);" elementtype=nacessary verify="币种|notnull&Code:amlcurrencytype" value="CNY"/>
		        </TD>
				<TD class="title" /> 交易金额</TD>
				<TD class="input"/>
			        <Input name="CRAT" id="CRAT" class="common" elementtype=nacessary verify="交易金额|notnull&num&len<=20"/>
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 对方金融机构网点名称</TD>
				<TD class="input"/>
			        <Input name="CFIN" id="CFIN" class="common" elementtype=nacessary verify="对方金融机构网点名称|notnull&len<=64"/>
		        </TD>
				<TD class="title" /> 对方金融机构代码类型</TD>
				<TD class="input"/>
			        <Input name="CFCT" id="CFCT" class="code" 
	      					ondblclick="showCodeList('amlnettype',[this]);" 	
	      					onkeyup="showCodeListKey('amlnettype',[this]);" elementtype=nacessary verify="对方金融机构代码类型|notnull&Code:amlnettype" / >
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 对方金融交易网点代码</TD>
				<TD class="input"/>
			        <Input name="CFIC" id="CFIC" class="common" elementtype=nacessary verify="对方金融交易网点代码|notnull&len<=12" />
		        </TD>
				<TD class="title" /> 交易对手名称</TD>
				<TD class="input"/>
			        <Input name="TCNM" id="TCNM" class="common"  elementtype=nacessary verify="交易对手名称|notnull&len<=64"  />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 交易对手证件类型</TD>
				<TD class="input"/>
			        <Input name="TCIT" id="TCIT" class="code" 
	      					ondblclick="showCodeList('amlidtype',[this]);" 	
	      					onkeyup="showCodeListKey('amlidtype',[this]);" elementtype=nacessary  verify="交易对手证件类型|notnull&Code:amlidtype"  >
		        </TD>
				<TD class="title" /> 交易对手证件号码</TD>
				<TD class="input"/>
			        <Input name="TCID" id="TCID" class="common" elementtype=nacessary  verify="交易对手证件号码|notnull&len<=20" />
		        </TD>
			</TR>
			<TR class=common>
				<TD class="title" /> 交易对手账号类型</TD>
				<TD class="input"/>
				    <Input name="TCAT" id="TCAT" class="code" verify="交易对手账号类型|notnull"
	      				ondblclick="showCodeList('amlaccount',[this]);" 	
	      				onkeyup="showCodeListKey('amlaccount',[this]);" elementtype=nacessary  verify="交易对手账号类型|notnull&Code:amlaccount"  >
		        </TD>
				<TD class="title" /> 交易对手账号</TD>
				<TD class="input"/>
			        <Input name="TCAC" id="TCAC" class="common" elementtype=nacessary  verify="交易对手账号|notnull&len<=64" />
		        </TD>
			</TR>
		</table>
		<br>
	</div>