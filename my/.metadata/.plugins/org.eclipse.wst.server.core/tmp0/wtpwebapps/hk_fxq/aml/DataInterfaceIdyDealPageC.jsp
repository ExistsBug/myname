
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divC);">
		</td>
		<td class= titleImg>
			提数接口子算法
		</td>
	</tr>
</table>
<Div id= "divC" style= "display: '' ">
	<table class=common border=0>
		<tr class="common">
                    <td class="title">类型</td>                
                    <td class="input"><Input class=codeno name="TypeC" CodeData="0|2^S|SQL^C|Class" ondblclick="return showCodeListEx('TypeC', [this,TypeCName],[0,1])"onkeyup="return showCodeListKeyEx('TypeC', [this,TypeCName],[0,1])" ><Input class=codename name="TypeCName" readonly=true elementtype=nacessary></TD>              
                    <td class="title">有效性</td>                
                    <td class="input"><Input class=codeno name="ValidityC" CodeData="0|2^1|有效^0|无效" ondblclick="return showCodeListEx('ValidityC', [this,ValidityCName],[0,1])"onkeyup="return showCodeListKeyEx('ValidityC', [this,ValidityCName],[0,1])" ><Input class=codename name="ValidityCName" readonly=true elementtype=nacessary></TD> 
                    </tr>              
                <tr class="common">
                    <td class="title">URI</td>
                    <td class="input"><input class=common type=input name="URIC" elementtype=nacessary></TD> 
                    <td class="title">表名</td>
                    <td class="input"><input type="input" class="common" name="TableNameC" elementtype=nacessary></td>
                    <td class="title">序号</td>
                    <td class="input"><input class=common type=input name="NoC" elementtype=nacessary></TD> 
                </tr>
                <tr class="common">
                    <td class="title">算法</td>                
                    <td class="input" colspan=5><textarea style="width:97%" rows="5" class="common" name="CalFactorC" elementtype=nacessary></textarea></TD> 
                </tr>  
                <tr class="common">
                    <td class="title">参数名</td>                
                    <td class="input" colspan=5><textarea style="width:97%" class="common" name="ParameterC" elementtype=nacessary></textarea></TD> 
                </tr> 
                <tr class="common">
                    <td class="title">描述</td>                
                    <td class="input" colspan=5><textarea style="width:97%" class="common" name="ReMarkC" elementtype=nacessary></textarea></TD> 
                </tr> 
	</table>  
		<input type="hidden" name="hideCalCodeC" id="hideCalCodeC"/>
		<input type="hidden" name="hideNoC" id="hideNoC"/>
</Div>