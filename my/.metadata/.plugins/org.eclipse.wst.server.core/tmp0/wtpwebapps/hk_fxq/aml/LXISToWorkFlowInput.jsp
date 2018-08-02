<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 李晨 <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑工作流补录
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>大额交易统计分析</title>
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
    <script language="JavaScript" src="LXISToWorkFlow.js"></script>
    <%@ include file="LXISToWorkFlowInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">待补录交易查询</td>
            </tr>
        </table>
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- 交易查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="结束日期|notnull&Date"></td>
                    <td class="title">&nbsp;</td>
                    <td class="input">&nbsp;</td>
                </tr>
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryStatGrid()">
        </div>
        <!-- 交易信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divStatGrid)"></td>
                <td class="titleImg">待补录交易信息</td>
            </tr>
        </table>
        <!-- 交易信息展现表格 -->
        <div id="divStatGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanStatGrid"></span></td>
                </tr>
            </table>
            <!-- 交易信息结果翻页 -->
            <div id="divTurnPageStatGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageStatGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageStatGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageStatGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageStatGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <br>
        </div>
        <br>
        <input type="button" class="cssButton" value=" 保 存 " onclick="return submitForm();">
    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
