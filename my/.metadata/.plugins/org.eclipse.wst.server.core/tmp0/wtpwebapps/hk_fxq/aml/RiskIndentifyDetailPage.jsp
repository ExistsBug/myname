
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			风险管理主算法
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> 主算法编号</TD>
			<TD class="input"/>
		        <input name="CalCode" id="CalCode" class="common" verify = "主算法编号|notnull" elementtype=nacessary />
	        </TD>
			<TD class="title" /> 序号</TD>
			<TD class="input"/>
		        <input name="No" id="No" class="common" readOnly  elementtype=nacessary />
	        </TD>
		</TR>
		<TR class=common>
				<TD class="title" /> 特征代码</TD>
			<TD class="input"/>
		       <input name="CRCD" id="CRCD" class="common" readOnly  elementtype=nacessary />
	        </TD>
			<TD class="title" /> 有效性</TD>
			<TD class="input"/>
		       <input name="Validity" id="Validity" class="common" verify = "有效性|notnull&len=1" elementtype=nacessary />
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 参数名</TD>
			<TD class="input" colspan=5  /><textarea style="width:97%"  name="Parameter" id="Parameter" readOnly class="common" elementtype=nacessary ></textarea>
		</TR>
		<TR class=common>
			<TD class="title" /> 主算法</TD>
			<TD class="input" colspan=5  /><textarea style="width:97%" rows="5" name="CalFactor" id="CalFactor" class="common" elementtype=nacessary ></textarea>
		</TR>
		<TR class=common>
			<TD class="title" /> 描述</TD>
			<TD class="input" colspan=5  /><textarea style="width:97%"  name="ReMark" id="ReMark" class="common" elementtype=nacessary ></textarea>
		</TR>		
	<input type="hidden" name="hideCalCode" id="hideCalCode"/>
	</table>  
</Div>