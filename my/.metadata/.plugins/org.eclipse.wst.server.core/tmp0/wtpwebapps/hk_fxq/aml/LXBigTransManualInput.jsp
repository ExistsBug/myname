<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//程序名称：
//程序功能：
//创建日期：2002-08-21 09:25:18
//创建人 ：HX
//更新记录： 更新人  更新日期   更新原因/内容
%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<SCRIPT src="../common/javascript/Common.js" >
</SCRIPT><SCRIPT src="../common/javascript/MulLine.js">
</SCRIPT><SCRIPT src="../common/Calendar/Calendar.js">
</SCRIPT><SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
<SCRIPT src="../common/javascript/VerifyInput.js" ></SCRIPT>
<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
<SCRIPT src="LXBigTransManualInput.js"></SCRIPT>
<%@include file="LXBigTransManualInit.jsp"%>
</head>
<body onload="initForm(); initElementtype();">
<form name="fm" method="post" target="fraSubmit" >
    <table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divQuery);">
            </td>
            <td class= titleImg>
                客户查询
            </td>
        </tr>
    </table>
    <Div id= "divQuery" style= "display: '' ">
        <table class=common border=0>
            <TR class=common>
                <TD class="title" /> 客户号码</TD>
                <TD class="input"/>
                    <input name="CSNM" id="CSNM" class="common" />
                </TD>
                <TD class="title" /> 客户名</TD>
                <TD class="input"/>
                    <input name="CTNM" id="CTNM" class="common"/>
                </TD>
                <TD class="title" /> 统计日期</TD>
                <TD class="input"/>
                    <Input class='coolDatePicker' name="Date" id="Date" />
                </TD>
            </TR>
            <tr class="common">
								<TD  class=title>管理机构</TD>
								<TD  class= input><Input class=codeno name="StatiCode" readonly onDblClick="return showCodeList('station46',[this,StatiCodeName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,StatiCodeName],[0,1]);"><input class=codename name="StatiCodeName" readonly=true></TD> 	
                <td class="title"></td>
                <td class="input"></td>
                <td class="title"></td>
                <td class="input"></td>
            </tr>
        </table>
        <INPUT class=cssButton VALUE=" 查 询 " name="query" TYPE=button onclick="easyQuery()" />
    </div>
    <table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
            </td>
            <td class= titleImg>
                客户信息
            </td>
        </tr>
    </table>
        <Div  id= "divCustom" style= "display: '' "/>
            <table  class= common>
                <tr  class= common>
                    <td><span id="spanCustomGrid"></span></td>
                </tr>
            </table>
            <div id="divTurnPageCustom" style="display:'none'" align="center" >
                <INPUT CLASS=cssButton VALUE="首  页" TYPE=button onclick="turnPage.firstPage();" />
                <INPUT CLASS=cssButton VALUE="上一页" TYPE=button onclick="turnPage.previousPage();" />
                <INPUT CLASS=cssButton VALUE="下一页" TYPE=button onclick="turnPage.nextPage();" />
                <INPUT CLASS=cssButton VALUE="尾  页" TYPE=button onclick="turnPage.lastPage();" />
            </div>
            <br>
            <INPUT class=cssButton VALUE=" 申 请 " name="query" TYPE=button onclick="GoToInput()" />
			<INPUT class=cssButton VALUE=" 删 除 " name="delete" TYPE=button onclick="GoToDelInput()" />
        </Div>
        <input type="hidden" id="cDealNo" name="cDealNo" value="" />
</form>
<span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>