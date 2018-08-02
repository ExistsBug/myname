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
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件生成主框架
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>可疑交易报文文件生成</title>
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
    <script language="JavaScript" src="LXPubFun.js"></script>
    <!-- 私有引用脚本 -->
    <script language="JavaScript" src="DubitMsgMakeDeal.js"></script>
    <%@ include file="DubitMsgMakeDealInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 报文查询录入表格 -->
        <table class="common" style="display:'none'">
            <tr class="common">
                <td class="title">报文编号</td>
                <td class="input"><input type="text" class="readonly" name="FileNo" readonly></td>
                <td class="title">报文类型</td>
                <td class="input"><input type="text" class="codeno" name="DataType" readonly><input type="text" class="codename" name="DataTypeName" readonly></td>
                <td class="title"><div id="divCorrectFileTitle" style="display:'none'">新报文号</div></td>
                <td class="input"><div id="divCorrectFileInput" style="display:'none'"><input type="text" class="readonly" name="CorrectFileNo" readonly></div></td>
            </tr>
        </table>
        <!-- 非重发纠错才显示 -->
        <div id="divNotCorrectLayer" style="display:'none'">
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
                        <td class="input"><input type="text" class="readonly" name="StartDate1" readonly></td>
                        <td class="title">结束日期</td>
                        <td class="input"><input type="text" class="readonly" name="EndDate1" readonly></td>
                    </tr>
                    <tr class="common">
                        <td class="title">客户号</td>
                        <td class="input"><input type="text" class="common" name="CustomerNo1"></td>
                        <td class="title">客户名</td>
                        <td class="input"><input type="text" class="common" name="CustomerName1"></td>
                        <td class="title">证件号码</td>
                        <td class="input"><input type="text" class="common" name="IDNo1"></td>
                    </tr>
                   <tr class="common">
                	 <td class="title">管理机构</td>
                        <TD class="input"/>
			                  <Input name="ManageCom" id="ManageCom" class="codeno"	verify="管理机构|Code:station"
	      					             ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"
	    					    /><Input class=codename name=ManageComName readOnly elementtype=nacessary />
		                </TD>
                </tr>
                </table>
                <!-- 提交数据操作按钮 -->
                <input type="button" class="cssButton" value=" 查 询 " onclick="queryWaitForBeFileGrid()">
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
                <div id="divTurnPageWaitForBeFileGrid" align="center" style="display:''" >
                    <input type="button" class="cssButton" value="首  页" onclick="turnPageWaitForBeFileGrid.firstPage()">
                    <input type="button" class="cssButton" value="上一页" onclick="turnPageWaitForBeFileGrid.previousPage()">
                    <input type="button" class="cssButton" value="下一页" onclick="turnPageWaitForBeFileGrid.nextPage()">
                    <input type="button" class="cssButton" value="尾  页" onclick="turnPageWaitForBeFileGrid.lastPage()">
                </div>
                <!-- 提交数据操作按钮 zhangyf modify>
                <input type="button" class="cssButton" value=" 添 加 " onclick="addToInFileMsg()" name="btnAddToInFileMsg">
                <input type="button" class="cssButton" value=" 放弃上报 " onclick="delToInFileMsg()" name="btnADelToInFileMsg">
                <br-->
            </div>

        </div>
        <!-- 报文查询折叠展开 -->
        <!--table class="common" style="display:'none'>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divAlreadyInFileSearch)"></td>
                <td class="titleImg">已选上报交易查询</td>
            </tr>
        </table-->
        <!-- 报文查询录入的层 -->
        <div id="divAlreadyInFileSearch" style="display:'none'" >
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">交易编号</td>
                    <td class="input"><input type="text" class="common" name="DealNo2"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate2"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate2"></td>
                </tr>
                <tr class="common">
                    <td class="title">客户号</td>
                    <td class="input"><input type="text" class="common" name="CustomerNo2"></td>
                    <td class="title">客户名</td>
                    <td class="input"><input type="text" class="common" name="CustomerName2"></td>
                    <td class="title">证件号码</td>
                    <td class="input"><input type="text" class="common" name="IDNo2"></td>
                </tr>

            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryAlreadyInFileGrid()">
        </div>
        <!-- 报文信息折叠展开 -->
        <table class="common" style="display:'none'">
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style= "cursor:hand" onclick="showPage(this,divAlreadyInFileGrid)"></td>
                <td class="titleImg">已选上报交易信息</td>
           </tr>
        </table>
        <!-- 报文信息展现表格 -->
        <div id="divAlreadyInFileGrid" style="display:'none'">
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
            <input type="button" class="cssButton" value=" 撤 销 " onclick="deleteInFileMsg()" name="btnDeleteInFileMsg">
        </div>
        <br><br>
        <!-- 提交数据操作按钮 -->
        <input type="button" class="cssButton" value="生成报文" onclick="makeAllInFileMsg()" name="btnMakeAllFileMsg">
        <input type="button" class="cssButton" value="下载报文" onclick="downAllInFileMsg()" name="btnDownloadFileMsg" disabled>
        <!--input type="button" class="cssButton" value="放弃上报" onclick="keepDeal()" name="keep"-->
        <input type="button" class="cssButton" value=" 返 回 " onclick="returnParent()">
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">
    </form>
    <br><br>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
