<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 张立盛 <Zhangls@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成主框架
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>
    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
            String tradeDataState="";
            String tReportType=request.getParameter("reportType");
                String tDataType=request.getParameter("dataType");
                String sEndDate =request.getParameter("makeDate");
                System.out.println(request.getParameter("dataType"));
                System.out.println(request.getParameter("reportType"));
                System.out.println(request.getParameter("PackageNo"));
                String sStartDate="";
                sEndDate =sEndDate;
//                  if(tDataType.equals("03"))
//              {
//                  sEndDate = PubFun.calDate(sEndDate, -6, "D", null);
//              }
//          else
//              {
//                  sEndDate =sEndDate;
//              }

    %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>大额交易数据包生成</title>
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
    <script language="JavaScript" src="largeTradeFileToPackage.js"></script>
    <%@ include file="largeTradeFileToPackageInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 报文查询录入表格 -->
        <table class="common">
            <tr class="common">
                <td class="title">数据包编号</td>
                <td class="input"><input type="text" class="readonly" name="PackageNo" readonly></td>
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
                <td class="titleImg">可选文件查询</td>
            </tr>
        </table>
        <!-- 报文查询录入的层 -->
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">文件编号</td>
                    <td class="input"><input type="text" class="common" name="fileNo1"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="makeDate1" maxlength="10" dateFormat="short" verify="起始日期|Date" readonly=true></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="makeDate2" maxlength="10" dateFormat="short" verify="结束日期|Date" readonly=true></td>
                </tr>
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryWaitForBeFileGrid()">
        </div>
        <!-- 报文信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">可选文件信息</td>
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
            <div id="divTurnPageWaitForBeFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageWaitForBeFileGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageWaitForBeFileGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageWaitForBeFileGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageWaitForBeFileGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 添 加 " onclick="addToInFileMsg()" name="AddFile">
            <br>
        </div>
        <!-- 报文查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divAlreadyInFileSearch)"></td>
                <td class="titleImg">已选文件查询</td>
            </tr>
        </table>
        <!-- 报文查询录入的层 -->
        <div id="divAlreadyInFileSearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">文件编号</td>
                    <td class="input"><input type="text" class="common" name="fileNo2"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="makeDate3" maxlength="10" dateFormat="short" verify="起始日期|Date" readonly=true></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="makeDate4" maxlength="10" dateFormat="short" verify="结束日期|Date" readonly=true></td>
                </tr>
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryAlreadyInFileGrid()">
        </div>
        <!-- 报文信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style= "cursor:hand" onclick="showPage(this,divAlreadyInFileGrid)"></td>
                <td class="titleImg">已选文件信息</td>
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
            <div id="divTurnPageAlreadyInFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageAlreadyInFileGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageAlreadyInFileGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageAlreadyInFileGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageAlreadyInFileGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 撤 销 " onclick="deleteInFileMsg()"name="DeleteFile">
        </div>
        <br><br>
        <!-- 提交数据操作按钮 -->
        <input type="button" class="cssButton" value="生成数据包" onclick="makeAllInFileMsg()" name="makeAction">
        <input type="button" class="cssButton" value="下载数据包" onclick="downAllInFileMsg()" name="btnDownloadFileMsg" disabled>
        <input type="button" class="cssButton" value=" 返 回 " onclick="returnParent()">
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="type">
        <input type="hidden" name="reportType" value="<%=tReportType%>">
        <input type="hidden" name="dataType" value="<%=tDataType%>">
        <input type="hidden" name="packagePath" >
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">        
    </form>
    <br><br>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
