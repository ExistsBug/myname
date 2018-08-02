<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 张立盛 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成主框架
 ******************************************************************************/
%>



<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>大额交易报文文件生成</title>
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
    <script language="JavaScript" src="largeTradeFileToXml.js"></script>
    <%@ include file="largeTradeFileToXmlInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 报文查询录入表格 -->
        <!--zhangyf modify 增加隐藏 style="display:'none'"--> 
        <table class="common" style="display:'none'"> 
            <tr class="common">
                <td class="title">文件编号</td>
                <td class="input"><input type="text" class="readonly" name="FileNo" readonly></td>
                <td class="title">&nbsp;</td>
                <td class="input">&nbsp;</td>
                <td class="title">&nbsp;</td>
                <td class="input">&nbsp;</td>
            </tr>
        </table>
        <!-- 报文查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">可选上报交易查询</td>
            </tr>
        </table>
        <!-- 报文查询录入的层 -->
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">交易编号</td>
                    <td class="input"><input type="text" class="common" name="DealNo1"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT1" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT2" maxlength="10" dateFormat="short" verify="结束日期|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">客户号</td>
                    <td class="input"><input type="text" class="common" name="CSNM1"></td>
                    <td class="title">客户名</td>
                    <td class="input"><input type="text" class="common" name="CTNM1"></td>
                    <td class="title">证件号码</td>
                    <td class="input"><input type="text" class="common" name="CTID1"></td>
                </tr>
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryWaitForBeFileGrid()">
            <!--<INPUT class=cssButton VALUE="查看交易信息" name="ViewAndUpdate" TYPE=button onclick="GoToViewAndUpdate(this.name);" />-->
        </div>
        <!-- 报文信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">可选上报交易信息</td>
            </tr>
        </table>
        <!-- 报文信息展现表格 -->
        <div id="divWaitForBeFileGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanWaitForBeFileGrid"></span></td>
                </tr>
            </table>
            <!-- 报文信息结果翻页 -->
            <div id="divTurnPageWaitForBeFileGrid" align="left" style="display:''">
                <input type="button" class="cssButton" value="首  页" onclick="turnPage1.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPage1.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPage1.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPage1.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 添 加 " onclick="addToInFileMsg()">
            <br>
        </div>
        <!-- 报文查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divAlreadyInFileSearch)"></td>
                <td class="titleImg">已选上报交易查询</td>
            </tr>
        </table>
        <!-- 报文查询录入的层 -->
        <div id="divAlreadyInFileSearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">交易编号</td>
                    <td class="input"><input type="text" class="common" name="DealNo2"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT3" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="HTDT4" maxlength="10" dateFormat="short" verify="结束日期|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">客户号</td>
                    <td class="input"><input type="text" class="common" name="CSNM2"></td>
                    <td class="title">客户名</td>
                    <td class="input"><input type="text" class="common" name="CTNM2"></td>
                    <td class="title">证件号码</td>
                    <td class="input"><input type="text" class="common" name="CTID2"></td>
                </tr>
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryAlreadyInFileGrid()">
        </div>
        <!-- 报文信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style= "cursor:hand" onclick="showPage(this,divAlreadyInFileGrid)"></td>
                <td class="titleImg">已选上报交易信息</td>
           </tr>
        </table>
        <!-- 报文信息展现表格 -->
        <div id="divAlreadyInFileGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanAlreadyInFileGrid"></span></td>
                </tr>
            </table>
            <!-- 报文信息结果翻页 -->
            <div id="divTurnPageAlreadyInFileGrid" align="left" style="display:''">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageAlreadyInFileGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageAlreadyInFileGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageAlreadyInFileGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageAlreadyInFileGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 撤 销 " onclick="deleteInFileMsg()">
        </div>
        <br><br>
        <!-- 提交数据操作按钮 -->
        <input type="button" class="cssButton" value="生成文件" onclick="makeAllInFileMsg()" name="makeAction">
        <input type="button" class="cssButton" value="下载文件" onclick="downAllInFileMsg()" name="btnDownloadFileMsg" disabled>
        <input type="button" class="cssButton" value=" 返 回 " onclick="returnParent()">
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="type">
        <input type="hidden" name="reportType" value="<%=tReportType%>">
        <input type="hidden" name="dataType" value="<%=tDataType%>">
        <input type="hidden" name="tradeDataState" value="<%=tradeDataState%>">
        <input type="hidden" name="addedDate" value="<%=addedDate%>">
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">        
    </form>
    <br><br>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
