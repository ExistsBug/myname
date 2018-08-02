<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-11
 * @direction: 可疑交易报文包生成主框架
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>可疑交易报文包生成</title>
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
    <script language="JavaScript" src="DubitPkgMakeDeal.js"></script>
    <%@ include file="DubitPkgMakeDealInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 报文查询录入表格 -->
        <table class="common">
            <tr class="common">
                <td class="title">报文包编号</td>
                <td class="input"><input type="text" class="readonly" name="PackageNo" readonly></td>
                <td class="title">报文包类型</td>
                <td class="input"><input type="text" class="codeno" name="DataType" readonly><input type="text" class="codename" name="DataTypeName" readonly></td>
                <td class="title"><div id="divResendPackageTitle" style="display:'none'">新报文包号</div></td>
                <td class="input"><div id="divResendPackageInput" style="display:'none'"><input type="text" class="readonly" name="ResendPackageNo" readonly></div></td>
            </tr>
        </table>
        <!-- 非重发报文才显示 -->
        <div id="divNotResendLayer" style="display:'none'">
            <!-- 报文查询折叠展开 -->
            <table>
                <tr>
                    <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBePackageSearch)"></td>
                    <td class="titleImg">可选上报报文查询</td>
                </tr>
            </table>
            <!-- 报文查询录入的层 -->
            <div id="divWaitForBePackageSearch" style="display:''">
                <!-- 报文查询录入表格 -->
                <table class="common">
                    <tr class="common">
                        <td class="title">报文编号</td>
                        <td class="input"><input type="text" class="common" name="FileNo1"></td>
                        <td class="title">起始日期</td>
                        <td class="input"><input type="text" class="common" name="StartDate1"></td>
                        <td class="title">结束日期</td>
                        <td class="input"><input type="text" class="readonly" name="EndDate1" readonly></td>
                    </tr>
                </table>
                <!-- 提交数据操作按钮 -->
                <input type="button" class="cssButton" value=" 查 询 " onclick="queryWaitForBePackageGrid()">
            </div>
            <!-- 报文信息折叠展开 -->
            <table>
                <tr>
                    <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBePackageGrid)"></td>
                    <td class="titleImg">可选上报报文信息</td>
                </tr>
            </table>
            <!-- 报文信息展现表格 -->
            <div id="divWaitForBePackageGrid" style="display:''">
                <table class="common">
                    <tr class="common">
                        <td><span id="spanWaitForBePackageGrid"></span></td>
                    </tr>
                </table>
                <!-- 报文信息结果翻页 -->
                <div id="divTurnPageWaitForBePackageGrid" align="center" style="display:'none'">
                    <input type="button" class="cssButton" value="首  页" onclick="turnPageWaitForBePackageGrid.firstPage()">
                    <input type="button" class="cssButton" value="上一页" onclick="turnPageWaitForBePackageGrid.previousPage()">
                    <input type="button" class="cssButton" value="下一页" onclick="turnPageWaitForBePackageGrid.nextPage()">
                    <input type="button" class="cssButton" value="尾  页" onclick="turnPageWaitForBePackageGrid.lastPage()">
                </div>
                <!-- 提交数据操作按钮 -->
                <input type="button" class="cssButton" value=" 添 加 " onclick="addToInPackageFile()" name="btnAddToInPackageFile">
                <br>
            </div>
        </div>
        <!-- 报文查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divAlreadyInPackageSearch)"></td>
                <td class="titleImg">已选上报报文查询</td>
            </tr>
        </table>
        <!-- 报文查询录入的层 -->
        <div id="divAlreadyInPackageSearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">报文编号</td>
                    <td class="input"><input type="text" class="common" name="FileNo2"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate2"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate2"></td>
                </tr>
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryAlreadyInPackageGrid()">
        </div>
        <!-- 报文信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style= "cursor:hand" onclick="showPage(this,divAlreadyInPackageGrid)"></td>
                <td class="titleImg">已选上报报文信息</td>
           </tr>
        </table>
        <!-- 报文信息展现表格 -->
        <div id="divAlreadyInPackageGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanAlreadyInPackageGrid"></span></td>
                </tr>
            </table>
            <!-- 报文信息结果翻页 -->
            <div id="divTurnPageAlreadyInPackageGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageAlreadyInPackageGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageAlreadyInPackageGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageAlreadyInPackageGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageAlreadyInPackageGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 撤 销 " onclick="deleteInPackageFile()" name="btnDeleteInPackageFile">
        </div>
        <br><br>
        <!-- 提交数据操作按钮 -->
        <input type="button" class="cssButton" value=" 生成包 " name="btnMakePackageFile" onclick="makeAllInPackageFile()">
        <input type="button" class="cssButton" value=" 下载包 " name="btnDownloadFilePkg" onclick="downAllInPackageFile()" disabled>
        <input type="button" class="cssButton" value=" 返 回 " onclick="returnParent()">
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">
    </form>
    <br><br>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
