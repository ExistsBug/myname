<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%@page import="com.sinosoft.lis.pubfun.GlobalInput"%>

<html>
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
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>大额交易统计表</title>
    <!-- 公共引用样式 -->
    <link href="../common/css/Project.css" type="text/css" rel="stylesheet">
    <link href="../common/css/mulLine.css" type="text/css" rel="stylesheet">
    <!-- 公共引用脚本 -->
    <script language="JavaScript" src="../common/Calendar/Calendar.js"></script>
    <script language="JavaScript" src="../common/javascript/Common.js"></script>
    <script language="JavaScript" src="../common/cvar/CCodeOperate.js"></script>
    <script language="JavaScript" src="../common/javascript/MulLine.js"></script>
    <script language="JavaScript" src="../common/javascript/EasyQuery.js"></script>
    <script language="JavaScript" src="../common/easyQueryVer3/EasyQueryVer3.js"></script>
    <script language="JavaScript" src="../common/easyQueryVer3/EasyQueryCache.js"></script>
    <script language="JavaScript" src="../common/javascript/VerifyInput.js"></script>
    <!-- 私有引用脚本 -->
    <script language="JavaScript" src="LXPRRIHTrade.js"></script>
    <%@ include file="LXPRRIHTradeInit.jsp" %>
    
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form action="./LXPRRIHTradeSave.jsp" name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">统计分析</td>
            </tr>
        </table>
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- 交易查询录入表格 -->
            <table class="common">
               <tr class="common">
               	    <td class="title">统计机构<font color=red>*</font></td>
                    <td class="input"><Input name="ManageCom" id="ManageCom" class="codeno"	 ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"/><Input class=codename name=ManageComName readOnly elementtype=nacessary />
                    <td class="title">客户名称</td>
                    <td class="input"><input type="text" class="common" name="CTNM"></td>
                </tr>
                <tr class="common">
                    <td class="title">统计起期<font color=red>*</font></td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">统计止期<font color=red>*</font></td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="结束日期|Date"></td>
                </tr>
            </table>
 <input type=button class=cssbutton name=saveb value='清单导出' onclick="submitSave();"> 
 <input type="button" class="cssButton" value=" 重  置 " onclick="resetForm()">
 </form>
 <span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>