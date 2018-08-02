<%@page contentType="text/html;charset=GBK" %>
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			基础信息设置
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<TR class=common>
			<TD class="title" /> 金融机构名称</TD>
			<TD class="input"/>
		        <input name="RINM" id="RINM" class="common" verify = "金融机构名称|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />金融机构所在地区行政区划代码</TD>
			<TD class="input"/>
		        <input name="FIRC" id="FIRC" class="common" verify = "金融机构所在地区行政区划代码|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />金融机构代码类型</TD>
			<TD class="input"/>
		        <Input name="FICT" id="FICT" class="common" verify = "金融机构代码类型|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />金融机构代码</TD>
			<TD class="input"/>
		        <input name="FICD" id="FICD" class="common" verify = "金融机构代码|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />金融机构联系人</TD>
			<TD class="input"/>
		       <input name="CPNM" id="CPNM" class="common" verify = "金融机构联系人|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />金融机构联系电话</TD>
			<TD class="input"/>
		        <Input name="CTTL" id="CTTL" class="common" verify = "金融机构联系电话|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />金融机构地址</TD>
			<TD class="input"/>
		        <Input name="FIAR" id="FIAR" class="common" verify = "金融机构地址|notnull" elementtype=nacessary/>
	        </TD>
			<TD class="title" />金融机构其他联系方式信息</TD>
			<TD class="input"/>
		        <Input name="FCEI" id="FCEI" class="common" verify = "金融机构其他联系方式信息|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
		<TR class=common>
			<TD class="title" />报告机构编码</TD>
			<TD class="input"/>
		        <input name="RICD" id="RICD" class="common" verify = "报告机构编码|notnull" elementtype=nacessary/>
	        </TD>
		</TR>
	</table>  
</Div>