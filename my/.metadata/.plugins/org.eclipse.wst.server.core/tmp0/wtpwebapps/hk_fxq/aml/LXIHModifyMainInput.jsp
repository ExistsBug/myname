<%@ page contentType="text/html; charset=gb2312" language="java" errorPage=""%>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 李晨 <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 大额交易修改
 ******************************************************************************/
%>
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


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>大额交易修改</title>
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
    <script language="JavaScript" src="LXIHModifyMain.js"></script>
    <%@ include file="LXIHModifyMainInit.jsp"  %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">待修改交易查询</td>
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
                    <td class= input><Input class=codeno name="MngCom" readonly onDblClick="return showCodeList('station46',[this,MngComName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,MngComName],[0,1]);"><input class=codename name="MngComName" readonly=true><font size=1 color='#ff0000'><b>*</b></font></td> 	
                    <td class="title"></td>
                    <td class="input"></td>
                    <td class="title"></td>
                    <td class="input"></td>
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
         <%@ include file="LXIHTradeMainDetailPage.jsp" %>
          <!--<INPUT class=cssButton VALUE="转交分公司处理" name="SendOut" TYPE=button onclick="SendOutFNC()" />-->
          <input type="button" class="cssButton" name="UPDATE" value=" 修  改 " onclick="submitMain(this.name)">
   <table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
			</td>
			<td class= titleImg>
				错误信息
			</td>
		</tr>
	</table>
		<Div  id= "divTasks" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanErrorGrid" >
					</span> 
					</td>
				</tr>
			</table>
			<br />
		</Div>
		            <div id="divTurnPageErrorGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageErrorGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageErrorGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageErrorGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageErrorGrid.lastPage()">
            </div>
       
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">
        <!--
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
                      大额交易明细信息控件         
    VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-->
	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
			</td>
			<td class= titleImg>
				大额交易明细信息
			</td>
		</tr>
	</table>
		<Div  id= "divTasks" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanTasksGrid" >
					</span> 
					</td>
				</tr>
			</table>
			<br />
		</Div>
		            <div id="divTurnPageTasksGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageTasksGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageTasksGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageTasksGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageTasksGrid.lastPage()">
            </div>
				<INPUT class=cssButton VALUE=" 添加交易明细信息 " name="insert" TYPE=button onclick="return GoToDetailInput(this.name);" />
		<INPUT class=cssButton VALUE=" 修改交易明细信息 " name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />
					<INPUT class=cssButton VALUE=" 删除交易明细信息 " name="delete" TYPE=button onclick="return GoToDetailInput(this.name);" />		
	<br/>
		<br/>
			<br/>
				<INPUT class=cssButton VALUE=" 确  认" name="update" TYPE=button onclick="SubmitWaitForBeFileGrid();" />
    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
<script> 
	//
	try{
		document.getElementById("HTDT").readOnly = true;
	} catch(ex){}
	
</script>
