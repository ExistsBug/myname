
<table>
	<tr>
		<td class=common>
		<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
		</td>
		<td class= titleImg>
			提数接口主算法
		</td>
	</tr>
</table>
<Div id= "divCustom" style= "display: '' ">
	<table class=common border=0>
		<tr class="common">
                    <td class="title">标示号</td>
                    <td class="input"><input type="input" class="common" name="AppId" elementtype=nacessary></td>
                    <td class="title">指标编码</td>
                    <td class="input"><input type="input" class="common" name="CalCode" maxlength="10" elementtype=nacessary></td>
                    <td class="title">交易特征</td>
                    <td class="input"><input class=code name="CRCD" 
                    	ondblclick="return showCodeList('amlihistype', [this])" 
                    	onkeyup="return showCodeListKey('amlihistype', [this])" ></TD> 
               </tr>              
                <tr class="common">
                    <td class="title">有效性</td>                
                    <td class="input"><Input class=codeno name="Validity" CodeData="0|2^1|有效^0|无效" ondblclick="return showCodeListEx('Validity', [this,ValidityName],[0,1])"onkeyup="return showCodeListKeyEx('Validity', [this,ValidityName],[0,1])" ><Input class=codename name="ValidityName" readonly=true elementtype=nacessary></TD> 
                    <td class="title">URI</td>
                    <td class="input"><input class=common type=input name="URI" elementtype=nacessary></TD> 
                    <td class="title">表名</td>
                    <td class="input"><input type="input" class="common" name="TableName" maxlength="10" elementtype=nacessary></td>
                </tr>
                <tr class="common">
                    <td class="title">类型</td>                
                    <td class="input"><Input class=codeno name="Type" CodeData="0|2^S|SQL^C|Class" ondblclick="return showCodeListEx('Type', [this,TypeName],[0,1])"onkeyup="return showCodeListKeyEx('Type', [this,TypeName],[0,1])" ><Input class=codename name="TypeName" readonly=true elementtype=nacessary></TD> 
                </tr> 
                <tr class="common">
                    <td class="title">算法</td>                
                    <td class="input" colspan=5><textarea style="width:97%" rows="5" class="common" name="CalFactor" elementtype=nacessary></textarea></TD> 
                </tr>  
                <tr class="common">
                    <td class="title">参数名</td>                
                    <td class="input" colspan=5><textarea style="width:97%" class="common" name="Parameter" elementtype=nacessary></textarea></TD> 
                </tr> 
                <tr class="common">
                    <td class="title">描述</td>                
                    <td class="input" colspan=5><textarea style="width:97%" class="common" name="ReMark" elementtype=nacessary></textarea></TD> 
                </tr> 	
	<input type="hidden" name="hideCalCode" id="hideCalCode"/>
	<input type="hidden" name="hideAppId" id="hideAppId"/>
	</table>  
</Div>