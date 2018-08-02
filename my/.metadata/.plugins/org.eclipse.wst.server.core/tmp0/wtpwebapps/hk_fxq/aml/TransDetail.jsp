
<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<head>
<%
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    String ErrFileName=request.getParameter("ErrFileName");
    String BackFileNo=request.getParameter("BackFileNo");
    String BackInfoNo=request.getParameter("BackInfoNo");
    
    System.out.println("ErrFileName=========="+ErrFileName);
    System.out.println("BackFileNo=========="+BackFileNo);
    System.out.println("BackInfoNo=========="+BackInfoNo);
%>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
    <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
    <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
    <SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
    <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
    <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
    <SCRIPT src="./TransDetail.js"></SCRIPT>
    <SCRIPT src="LLClaimPubFun.js"></SCRIPT>
    <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
    <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
    <%@include file="TransDetailinit.jsp"%>
    <title>交易详细信息 </title>
</head>
<body  onload="initForm();" >
    <form  method=post name=fm target="fraSubmit">
    <!-- 共享池部分 -->
    
    <Table>
        <TR>
            <TD class=common><IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divLLClaimRegister);"></TD>
            <TD class= titleImg> 选中记录 </TD>
        </TR>
    </Table>
    <Div  id= "divLLClaimRegister" style= "display: ''" align = center>
        <Table  class= common>
            <TR  class= common>
                <TD text-align: left colSpan=1><span id="spanPackageGrid" ></span> </TD>
            </TR>
        </Table>
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
    
    <DIV id=DivLCContInfo STYLE="display:''">
        <table>
            <tr>
                <td class= common> <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divSelfPackageGrid);"></td>
                <td class= titleImg> 交易信息 </td>
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
            <td><INPUT class=cssButton VALUE="处理"  type=button onclick="Deal();">
            <!--INPUT class=cssButton VALUE="返回"  type=button onclick="CloseWindow();"--></td>
        </tr>
    </table>
    <%
    //保存数据用隐藏表单区
    %>
    <Input type=hidden name="Operator" >
    <Input type=hidden name="ComCode" >
    <Input type=hidden name="ManageCom" >
    <Input type=hidden name="ErrFileName" value=<%=ErrFileName%>>
    <Input type=hidden name="BackFileNo" value=<%=BackFileNo%>>
    <Input type=hidden name="BackInfoNo" value=<%=BackInfoNo%>>
    
	<input type=hidden id="MissionID" 	 name= "MissionID">
	<input type=hidden id="SubMissionID" name= "SubMissionID">
	<input type=hidden id="ActivityID" name= "ActivityID">
	
  </form>
  <span id="spanCode"  style="display: none; position:absolute; slategray"></span>
</body>
</html>
