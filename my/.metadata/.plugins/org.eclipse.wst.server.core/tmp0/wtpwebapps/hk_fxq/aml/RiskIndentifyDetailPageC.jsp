
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divC);">
		</td>
		<td class= titleImg>
			风险管理子算法
		</td>
	</tr>
</table>
<Div id= "divC" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> 子算法编号</TD>
			<TD class="input"/>
		        <input name="CalCodeC" id="CalCodeC" class="common" verify = "子算法编号|notnull" elementtype=nacessary />
	        </TD>
			<TD class="title" /> 序号</TD>
			<TD class="input"/>
		        <input name="NoC" id="NoC" class="common" verify = "序号|notnull" elementtype=nacessary />
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" /> 算法</TD>
			<TD class="input" colspan=5  /><textarea style="width:97%" verify = "主算法|notnull" rows="5" name="CalFactorC" id="CalFactorC" class="common" elementtype=nacessary ></textarea>
		</TR>
		<TR class=common>
			<TD class="title" /> 描述</TD>
			<TD class="input" colspan=5  /><textarea style="width:97%" verify = "描述|notnull"  name="ReMarkC" id="ReMarkC" class="common" elementtype=nacessary ></textarea>
		</TR>
	</table>  
		<input type="hidden" name="hideCalCodeC" id="hideCalCodeC"/>
		<input type="hidden" name="hideNoC" id="hideNoC"/>
</Div>