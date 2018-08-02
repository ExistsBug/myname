<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<head>
<%
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
%>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
    <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
    <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
    <SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
    <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
    <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
    <SCRIPT src="Detail.js"></SCRIPT>
    <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
    <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
    <%@include file="Detailinit.jsp"%>
    <title>立案登记 </title>
</head>
<body  onload="initForm();" >
    <form action="" method=post name=fm target="fraSubmit">
    <!-- 共享池部分 -->
    <table class= common border=0 width=100%>
        <tr>
            <td class= titleImg align= center>请输入查询条件：</td>
        </tr>
    </table>
    <Div  id= "divSearch" style= "display: ''">
        <table class= common>
            <TR class= common>
                <TD class= title> 交易类型 </TD>
                <TD class= input> <Input class=codeno name=DealType CodeData="0|3^01|大额交易^02|可疑交易" ondblclick="return showCodeListEx('DealType', [this,DealTypeName],[0,1])"onkeyup="return showCodeListKeyEx('DealType', [this,DealTypeName],[0,1])" ><Input class=codename name=DealTypeName readonly=true></TD>
           			<TD class= title> 回执类型 </TD>
           			<!--add by jinsh 反洗钱接口升级,下面的这条进行了更改-->
                <TD class= input> <Input class=codeno name=BackType  ondblclick="return showCodeList('backfiletype', [this,BackTypeName],[0,1])"onkeyup="return showCodeListKey('backfiletype', [this,BackTypeName],[0,1])" ><Input class=codename name=BackTypeName readonly=true></TD>
            </TR>                 
        </table>
    </DIV>
    <INPUT class=cssButton VALUE="查  询" TYPE=button onclick="queryGrid();">
    <Table>
        <TR>
            <TD class=common><IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divLLClaimRegister);"></TD>
            <TD class= titleImg> 回执包信息 </TD>
        </TR>
    </Table>
    <Div  id= "divLLClaimRegister" style= "display: ''" align = center>
        <Table  class= common>
            <TR  class= common>
                <TD text-align: left colSpan=1><span id="spanPackageGrid" ></span> </TD>
            </TR>
        </Table>

        <table>
            <tr>
                <td><INPUT class=cssButton VALUE="首  页" TYPE=button onclick="turnPage.firstPage();"></td>
                <td><INPUT class=cssButton VALUE="上一页" TYPE=button onclick="turnPage.previousPage();"></td>
                <td><INPUT class=cssButton VALUE="下一页" TYPE=button onclick="turnPage.nextPage();"></td>
                <td><INPUT class=cssButton VALUE="尾  页" TYPE=button onclick="turnPage.lastPage();"></td>
            </tr>
        </table>
    </Div>
    <br>
    <hr>
    <INPUT class=cssButton id="riskbutton" VALUE="申  请" TYPE=hidden onClick="ApplyClaim();">
    <DIV id=DivLCContInfo STYLE="display:''">
        <table>
            <tr>
                <td class= common> <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divSelfPackageGrid);"></td>
                <td class= titleImg> 回执文件信息 </td>
            </tr>
        </table>
    </Div>
    <Div id= "divSelfPackageGrid" style= "display: ''" align = center>
        <table  class= common >
            <tr  class=common>
                <td text-align: left colSpan=1 ><span id="spanSelfPackageGrid" ></span></td>
            </tr>
        </table>
        <table>
            <tr>
                <td><INPUT VALUE="首  页" class=cssButton TYPE=button onclick="turnPage2.firstPage();"></td>
                <td><INPUT VALUE="上一页" class=cssButton TYPE=button onclick="turnPage2.previousPage();"></td>
                <td><INPUT VALUE="下一页" class=cssButton TYPE=button onclick="turnPage2.nextPage();"></td>
                <td><INPUT VALUE="尾  页" class=cssButton TYPE=button onclick="turnPage2.lastPage();"></td>
            </tr>
        </table>
    </div>
    <br>
    <hr>
    <table  class= common >
        <tr  class=common>
            <td><INPUT class=cssButton VALUE="全部处理完毕" type=button onclick="AllDone();"></td>
        </tr>
    </table>
    <%
    //保存数据用隐藏表单区
    %>
    <Input type=hidden name="Operator" >
    <Input type=hidden name="ComCode" >
    <Input type=hidden name="ManageCom" >
    
	<input type=hidden id="MissionID" 	 name= "MissionID">
	<input type=hidden id="SubMissionID" name= "SubMissionID">
	<input type=hidden id="ActivityID" name= "ActivityID">
	
  </form>
  <span id="spanCode"  style="display: none; position:absolute; slategray"></span>
</body>
</html>
