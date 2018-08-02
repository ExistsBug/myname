<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
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
    <title>可疑交易申请</title>
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
    <script language="JavaScript" src="LXISApp.js"></script>
    <%@ include file="LXISAppInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">回执正确交易查询</td>
            </tr>
        </table>
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- 交易查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">交易编号</td>
                    <td class="input"><input type="text" class="common" name="DealNo"></td>
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="结束日期|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">客户号</td>
                    <td class="input"><input type="text" class="common" name="CustomerNo"></td>
                    <td class="title">客户名</td>
                    <td class="input"><input type="text" class="common" name="CustomerName"></td>
                    <td class="title">证件号码</td>
                    <td class="input"><input type="text" class="common" name="IDNo"></td>
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
        <!-- 交易信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">可选交易信息</td>
            </tr>
        </table>
        <!-- 交易信息展现表格 -->
        <div id="divWaitForBeFileGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanWaitForBeFileGrid"></span></td>
                </tr>
            </table>
            <!-- 交易信息结果翻页 -->
            <div id="divTurnPageWaitForBeFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageWaitForBeFileGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageWaitForBeFileGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageWaitForBeFileGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageWaitForBeFileGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <br>
        </div>
        <br>
        <!-- 提交数据操作按钮 -->
        <input type="button" class="cssButton" value="申请纠错" onclick="correctApplication()">
  <!--      <input type="button" class="cssButton" value="删除申请" onclick="deleteApplication()">-->
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">
    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
