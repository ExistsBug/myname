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
    <title>明细数据</title>
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
    <script language="JavaScript" src="LXExportExcel.js"></script>
    <%@ include file="LXExportExcelInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">生成条件</td>
            </tr>
        </table>
        <div id="divWaitForBeFileSearch" style="display:''">
            <!-- 交易查询录入表格 -->
            <table class="common">
                <tr class="common">
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="结束日期|Date"></td>
                </tr>
                <tr><td class="title">管理机构</td>
                    <TD class="input"/>
			                  <Input name="ManageCom" id="ManageCom" class="codeno"	verify="管理机构|Code:station"
	      					             ondblclick="showCodeList('station',[this,ManageComName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('station',[this,ManageComName],[0,1]);"
	    					    /><Input class=codename name=ManageComName readOnly elementtype=nacessary />
		           </TD>
              </tr>
            </table>
            <!-- 提交数据操作按钮 -->
			<%-- <input type="button" class="cssButton" value=" 查 询 " onclick="queryWaitForBeFileGrid()">
                <br><br>--%>
            <!--
            <input type="button" class="cssButton" value=" 导 出 " onclick="turnPageWaitForBeFileGrid.makeExcel();">
            -->
            <input type="button" class="cssButton" value=" 个人现金2W提数" onclick="GoToExcel(1)">
            <input type="button" class="cssButton" value="个人转账20W提数" onclick="GoToExcel(2)">
            <input type="button" class="cssButton" value=" 团体现金2W提数" onclick="GoToExcel(4)">
            <input type="button" class="cssButton" value="团体转账20W提数" onclick="GoToExcel(3)">
            <br><br>
            <input type="button" class="cssButton" value=" 个人退保1W提数" onclick="GoToExcel(5)">
            <input type="button" class="cssButton" value=" 团体退保1W提数" onclick="GoToExcel(6)">
            <input type="button" class="cssButton" value=" 个人理赔1W提数" onclick="GoToExcel(7)">
            <input type="button" class="cssButton" value=" 团体理赔1W提数" onclick="GoToExcel(8)">
        </div>

        <!-- 获取数据的隐藏域 -->
<%--        <input type="hidden" name="Operation">--%>
        <!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      大额交易明细信息控件
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
<!--
    <table>
        <tr>
            <td class=common>
            <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divWaitForBeFileGrid);">
            </td>
            <td class= titleImg>
                查询结果
            </td>
        </tr>
    </table>
        <Div  id= "divWaitForBeFileGrid" style= "display: none "/>
            <table  class= common>
                <tr  class= common>
                    <td text-align: left colSpan=1>
                    <span id="spanWaitForBeFileGrid" >
                    </span>
                    </td>
                </tr>
            </table>
            <br />
        </Div>
                    <div id="divTurnPageWaitForBeFileGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageWaitForBeFileGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageWaitForBeFileGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageWaitForBeFileGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageWaitForBeFileGrid.lastPage()">
            </div>
            <INPUT class=cssButton VALUE="查看交易信息" name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />-->
    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
