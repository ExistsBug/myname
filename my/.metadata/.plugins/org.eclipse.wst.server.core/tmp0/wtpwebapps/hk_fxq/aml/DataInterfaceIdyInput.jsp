<%@ page contentType="text/html; charset=gbk" language="java" errorPage="" %>

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
 * @direction: 提数规则定义
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>提数接口规则定义</title>
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
    <script language="JavaScript" src="DataInterfaceIdy.js"></script>
    <%@ include file="DataInterfaceIdyInit.jsp" %>  
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgSearch)"></td>
                <td class="titleImg">提数接口规则定义及查询</td>
            </tr>
        </table>
        <!-- 报文查询录入的层 -->
        <div id="divFileMsgSearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">交易类型</td>                
                    <td class="input"><Input class=codeno name=DealType CodeData="0|2^01|大额交易^02|可疑交易" ondblclick="return showCodeListEx('DealType', [this,DealTypeName],[0,1])"onkeyup="return showCodeListKeyEx('DealType', [this,DealTypeName],[0,1])" ><Input class=codename name=DealTypeName readonly=true></TD> 
                    <td class="title">交易特征</td>
                    <td class="input"><input class=code name=CRCD ondblclick="dealCRCDType(this)" onkeyup="dealCRCDTypeKey(this)" ></TD> 
                    <td class="title">指标编码</td>
                    <td class="input"><input type="input" class="common" name="CalCode" maxlength="10" ></td>
                </tr>
                <tr class="common">
                    <td class="title">标示号</td>
                    <td class="input"><input type="input" class="common" name="AppId" ></td>
                    <td class="title">&nbsp;</td>
                    <td class="input">&nbsp;</td>
                    <td class="title">&nbsp;</td>
                    <td class="input">&nbsp;</td>
                </tr>                
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryFileMsgGrid()">
            <input type="button" class="cssButton" value=" 定 义 " onclick="dealTheFileMsg()">
            <br>
        </div>
        <!-- 报文信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgGrid)"></td>
                <td class="titleImg">已定义提数规则信息</td>
            </tr>
        </table>
        <!-- 报文信息展现表格 -->
        <div id="divFileMsgGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanFileMsgGrid"></span></td>
                </tr>
            </table>
            <!-- 报文信息结果翻页 -->
            <div id="divTurnPageFileMsgGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageFileMsgGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageFileMsgGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageFileMsgGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageFileMsgGrid.lastPage()">
            </div>
        </div>
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">
    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
