<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 
 * @version  : 
 * @date     : 2007-11-10
 * @direction: 可疑交易审核
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

    <%@ page import="com.sinosoft.lis.pubfun.*" %>
    <%
        GlobalInput tGe = new GlobalInput();
        tGe=(GlobalInput)session.getValue("GI");
        String OperatorCodee=tGe.Operator;
        System.out.println("OperatorCode======"+OperatorCodee);
    %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>可疑审核</title>
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
    <script language="JavaScript" src="LXISAudit.js"></script>
    <%@ include file="LXISAuditInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
        <!-- 交易查询折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileSearch)"></td>
                <td class="titleImg">待审核交易查询</td>
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
										<TD  class=title>管理机构</TD>
										<TD  class= input><Input class=codeno name="StatiCode" readonly onDblClick="return showCodeList('station46',[this,StatiCodeName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,StatiCodeName],[0,1]);"><input class=codename name="StatiCodeName" readonly=true></TD> 	
                    <td class="title">规则原因</td>
                    <TD  class= input><Input class=codeno name="amlshadinessstamp" readonly onDblClick="return showCodeList('amlshadinessstamp',[this,amlshadinessstampName],[0,1]);" onKeyUp="return showCodeListKey('amlshadinessstamp',[this,amlshadinessstampName],[0,1]);"><input class=codename name="amlshadinessstampName" readonly=true></TD> 	
                    <td class="title">交易类型</td>
                    <!--<TD class="input"><Input name="TSTP" readonly id="TSTP" class="codeno" verify="交易类型|notnull&Code:amltranstype"	ondblclick="showCodeList('amltranstype',[this,TSTPName],[0,1]);" 	onkeyup="showCodeListKey('amltranstype',[this,TSTPName],[0,1]);"><Input class=codename name=TSTPName readOnly elementtype=nacessary >-->
                    <TD class= input><input class=codeno readonly name="TSTP" CodeData="0|5^01|新契约规则^02|核保规则^04|保全规则^05|理赔规则^08|财务规则" onDblClick="return showCodeListEx('TSTP', [this,TSTPName],[0,1],'','','','',200)"onkeyup="return showCodeListKeyEx('TSTP', [this,],TSTPName[0,1],'','','','',200);"><input class=codename name=TSTPName readonly ></TD> 	
                </tr>
            </table>
            <!-- 提交数据操作按钮 -->
            <input type="button" class="cssButton" value=" 查 询 " onclick="queryWaitForBeFileGrid(fm.UserCode.value)">
        </div>
        <!-- 交易信息折叠展开 -->
        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForBeFileGrid)"></td>
                <td class="titleImg">待审核交易信息</td>
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
            <br>
            <!-- 提交数据操作按钮 
            <INPUT class=cssButton VALUE="查看交易信息" name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />-->
            <!--INPUT class=cssButton VALUE="提交上级审核" name="upgrade" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" /-->
            <INPUT class=cssButton VALUE="确定上报" name="affirm" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" />
            <INPUT class=cssButton VALUE="放弃上报" name="keep" TYPE=button onclick="SubmitWaitForBeFileGrid(this.name);" />
        </div>
        <!-- 获取数据的隐藏域 -->
        <input type="hidden" name="Operation">
        <input type="hidden" name="UserCode" value="<%=OperatorCodee%>">

        <table>
         <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divreasonofcancelreport)"></td>
                <td class="titleImg">放弃上报原因</td>
         </tr>
        </table>

      <div id="divreasonofcancelreport" align="center" style="display:''">
        <table class="common">    	
        <tr>
         <td class="input" colspan=8 ><textarea style="width:97%"  name="reason" id="reason" class="common" /></textarea>
	      </td>
      </tr>
        </table>
     </div >
   </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
