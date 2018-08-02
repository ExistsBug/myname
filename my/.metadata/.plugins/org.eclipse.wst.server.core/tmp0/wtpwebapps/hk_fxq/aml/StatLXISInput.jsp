<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="../common/jsp/UsrCheck.jsp" %>
<script>
	var format="";
</script>

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
    <title>可疑交易统计分析</title>
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
    <script language="JavaScript" src="StatLXIS.js"></script>
    <%@ include file="StatLXISInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">统计分析</td>
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
                <tr class="common">
                    <td class="title">客户号</td>
                    <td class="input"><input type="text" class="common" name="CSNM"></td>
                    <td class="title">客户名</td>
                    <td class="input"><input type="text" class="common" name="CTNM"></td>
                </tr>
                <tr class="common">
                    <TD class="title" /> 可疑交易特征</TD>
				            <TD class="input" />
			              <Input name="STCR" id="STCR" class="code"  verify="可疑交易特征|Code:amlshadinessstamp"
	      					         ondblclick="showCodeList('amlshadinessstamp',[this]);" 	
	      					         onkeyup="showCodeListKey('amlshadinessstamp',[this]);"
	    					           elementtype=nacessary/>
		                </TD>
		                <td class="title">数据状态</td>
                    <td class="input"/>
				                  <Input name="DataState" id="DataState" class="code" verify="数据状态|Code:amldatastate"
	      				                  ondblclick="showCodeList('amldatastate',[this]);" 	
	      				                 onkeyup="showCodeListKey('amldatastate',[this]);" elementtype=nacessary />
		                </td>
                </tr>
                <tr class="common">
                    <td class="title">可疑程度</td>
                    <TD class="input"/>
			                  <Input name="SDGR" id="SDGR" class="codeno"	verify="可疑程度|Code:amlshadiness"
	      					             ondblclick="showCodeList('amlshadiness',[this,SDGRName],[0,1]);" 	
	      					             onkeyup="showCodeListKey('amlshadiness',[this,SDGRName],[0,1]);"
	    					    /><Input class=codename name=SDGRName readOnly elementtype=nacessary />
		        </TD>
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
            <input type="button" class="cssButton" value=" 统  计 " onclick="queryStatGrid()">
            <input type="button" class="cssButton" value=" 重  置 " onclick="resetForm()">
        </div>
        <!-- 交易信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divStatGrid)"></td>
                <td class="titleImg">统计分析信息</td>
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
         <input type="button" class="cssButton" value=" 导  出 " onclick="turnPageStatGrid.makeExcel('1|@^4|0.00_ ');">
    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
