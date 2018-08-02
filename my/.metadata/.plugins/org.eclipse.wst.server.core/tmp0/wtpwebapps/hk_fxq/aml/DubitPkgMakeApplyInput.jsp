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
 * @direction: 可疑交易报文包申请主框架
 ******************************************************************************/
%>

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
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>可疑交易报文包申请</title>
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
    <script language="JavaScript" src="DubitPkgMakeApply.js"></script>
    <%@ include file="DubitPkgMakeApplyInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 报文查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFilePkgSearch)"></td>
                <td class="titleImg">报文包申请及查询</td>
            </tr>
        </table>
        <!-- 报文查询录入的层 -->
        <div id="divFilePkgSearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">报文包编号</td>
                    <td class="input"><input type="text" class="common" name="PackageNo"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="结束日期|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">报文包类型</td>
                    <td class="input"><input type="text" class="codeno" name="DataType" readonly><input type="text" class="codename" name="DataTypeName" readonly></td>
                    <td class="title">报文编号</td>
                    <td class="input"><input type="text" class="common" name="FileNo"></td>
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
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryFilePkgGrid()">
            <input type="button" class="cssButton" value=" 申 请 " name="btnApplyANewPkg" onclick="applyANewFilePkg()">
            <br>
        </div>
        <!-- 报文信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFilePkgGrid)"></td>
                <td class="titleImg">已申请报文包信息</td>
            </tr>
        </table>
        <!-- 报文信息展现表格 -->
        <div id="divFilePkgGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanFilePkgGrid"></span></td>
                </tr>
            </table>
            <!-- 报文信息结果翻页 -->
            <div id="divTurnPageFilePkgGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageFilePkgGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageFilePkgGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageFilePkgGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageFilePkgGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 处 理 " onclick="dealTheFilePkg()">
        </div>
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="ResendPackageNo">
        <input type="hidden" name="Operation">
    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
