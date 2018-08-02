<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
</script>

<html>
<head>
    <title>大额交易查询</title>
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
    <script language="JavaScript" src="LXCustomerEvaluateParameterInput.js"></script>
    <%@ include file="LXCustomerEvaluateParameterInit.jsp" %>
</head>
<body topmargin="0" onload="initForm();initElementtype();" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
				<input type="button" class="cssButton" name='sync' value="同步信息" onclick="return syncdata();">
				<input type="button" class="cssButton" name='cal' value="风险计算" onclick="return calData();">
				<br><hr>
        <input type="button" class="cssButton" name='busi' value="查询客户行业" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='managecom' value="查询投保地域" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='risk' value="查询投保业务" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='fee' value="查询保费金额" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='paymode' value="查询缴费方式" onclick="queryCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='isreport' value="查询是否上报" onclick="queryCustmoerGrid(this.name)">
        <!-- 交易信息展现表格 -->
        <div id="divCustmoerGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="首  页" onclick="turnPageCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>
				<input type="button" class="cssButton" name='update' value="更新" onclick="return updatedata(this.name);">

				<br><hr>
				<td class="titleImg">高风险要素查询</td><br>
				 
        <input type="button" class="cssButton" name='busi' value="查询客户行业"      onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='managecom' value="查询投保地域" onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='risk' value="查询投保业务"      onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='fee' value="查询保费金额"       onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='paymode' value="查询缴费方式"   onclick="queryHCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='isreport' value="查询是否上报"  onclick="queryHCustmoerGrid(this.name)">
        <!-- 交易信息展现表格 -->
        <div id="divCustmoerGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanHCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="首  页" onclick="turnPageHCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageHCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageHCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageHCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>
<input type="button" class="cssButton" name='cancelH' value="重置参数" onclick="return updatedata(this.name);">

				<br><hr>
				<td class="titleImg">中风险要素查询</td><br>
        <input type="button" class="cssButton" name='busi' value="查询客户行业"      onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='managecom' value="查询投保地域" onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='risk' value="查询投保业务"      onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='fee' value="查询保费金额"       onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='paymode' value="查询缴费方式"   onclick="queryLCustmoerGrid(this.name)">
        <input type="button" class="cssButton" name='isreport' value="查询是否上报"  onclick="queryLCustmoerGrid(this.name)">
        <!-- 交易信息展现表格 -->
        <div id="divCustmoerGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanLCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="首  页" onclick="turnPageLCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageLCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageLCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageLCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>
<input type="button" class="cssButton" name='cancelL' value="重置参数" onclick="return updatedata(this.name);">


    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
