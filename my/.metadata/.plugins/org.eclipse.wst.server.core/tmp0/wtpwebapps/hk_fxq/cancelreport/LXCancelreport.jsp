<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>

<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
</script>
<%@ include file="../common/jsp/UsrCheck.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>放弃上报查询</title>
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
    <script language="JavaScript" src="LXCancelreport.js"></script>
    <%@ include file="LXCancelreportInit.jsp" %>
</head>
  
  <body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">放弃上报查询</td>
            </tr>
        </table>
        <div id="divLXCancelreport" style="display:''">
            <!-- 交易查询录入表格 -->
            <table class="common">
            	  <tr class="common">
                    <td class="title">起始日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" verify="起始日期|Date"></td>
                    <td class="title">结束日期</td>
                    <td class="input"><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" verify="结束日期|Date"></td>
                </tr>
                <tr class="common">
                    <td class="title">交易编号</td>
                    <td class="input"><input type="text" class="common" name="DealNo"></td>
                    <td class="title">客户名称/姓名</td>
                    <td class="input"><input type="text" class="common" name="CTNM"></td>
                </tr>

                <tr class="common">
                     <td class="title">客户号</td>
                    <td class="input"><input type="text" class="common" name="CSNM"></td>
                    <td class="title">交易类型</td>
                    <td class="input">
                    	<!--input type="text" class="common" name="TradeType">(请填入"IH"或"IS","IH"为大额交易,"IS"为可疑交易)-->
                    <Input name="TradeType" id="TradeType" class="codeno"  ondblclick="showCodeList('dealtype',[this,DealTypeName],[0,1]);" 	 onkeyup="showCodeListKey('dealtype',[this,DealTypeName],[0,1]);"/><Input class=codename name=DealTypeName readOnly  />
                    </td>
                </tr>

                <tr class="common">
                    <td class="title">操作人员</td>
                    <td class="input"><input type="text" class="common" name="OPERATOR"></td>
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
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryLXCancelreportGrid()">
            <!--
            <input type="button" class="cssButton" value=" 导 出 " onclick="turnPageLXCancelreportGrid.makeExcel();">
             -->
             <input type="button" class="cssButton" value=" 导 出 " onclick="GoToExcel();">
        </div>
        <!-- 交易信息折叠展开 -->

        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divLXCancelreportGrid)"></td>
                <td class="titleImg">放弃上报查询结果</td>
            </tr>
        </table>
        <!-- 交易信息展现表格 -->
        <div id="divLXCancelreportGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanLXCancelreportGrid"></span></td>
                </tr>
            </table>
            <!-- 交易信息结果翻页 -->
            <div id="divTurnPageLXCancelreportGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageLXCancelreportGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageLXCancelreportGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageLXCancelreportGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageLXCancelreportGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <br>
        </div>
        <br>

   </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>

  </body>
</html>
