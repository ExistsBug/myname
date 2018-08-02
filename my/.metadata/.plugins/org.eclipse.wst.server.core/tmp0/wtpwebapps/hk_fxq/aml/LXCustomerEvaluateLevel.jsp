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
    <title>大额交易查询</title>
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
    <script language="JavaScript" src="LXCustomerEvaluateLevel.js"></script>
    <%@ include file="LXCustomerEvaluateLevelInit.jsp" %>
</head>
<body topmargin="0" onload="initForm();initElementtype();" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
    	
    <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustmoerGrid);">
    		</td>
    		 <td class= titleImg>
        		客户风险信息查询
       		 </td>
    	</tr>
    </table> 
    <div id="divCustmoerGrid" style="display:''">
      <table  class= common>
      	<TR  class = common>  
	      	<TD  class=title>管理机构</TD>
					<TD  class= input><Input class=codeno value=<%=tGI.ManageCom%> name="StatiCode" readonly onDblClick="return showCodeList('station46',[this,StatiCodeName],[0,1]);" onKeyUp="return showCodeListKey('station46',[this,StatiCodeName],[0,1]);"><input class=codename name="StatiCodeName" readonly=true></TD> 
	        <td  class = "title">风险等级</td>
	        <td  class = "input"/><Input name="Level" id="Level" class="codeno" ondblclick="showCodeList('hazardlevel',[this,LevelName],[0,1]);" onkeyup="showCodeListKey('hazardlevel',[this,LevelName],[0,1]);"/><Input class=codename name=LevelName readOnly ></TD>
			  </TR>
        <TR  class = common>      
          <TD class="title" />承保起始日期</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" ></TD>
          <TD class="title" />承保结束日期</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" ></TD>
     
        </TR>
        <TR  class = common>           
          <td  class = "title">客户号</td>
          <td  class = "input"><input type="text" class="common" name="AppntNo"></td>
          <td  class = "title"></td>
          <td  class = "input"></td>
        </TR>
      </table> 
      
      
				<input type="button" class="cssButton" name='sync' value="查询" onclick="return easyQueryData();">
				<input type="button" class="cssButton" name='cal' value="导出"  onclick="return MakeExcel();">

        
            <table class="common">
                <tr class="common">
                    <td><span id="spanCustmoerGrid"></span></td>
                </tr>
            </table>
            <center>
                <input type="button" class="cssButton" value="首  页" onclick="turnPageCustmoerGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageCustmoerGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageCustmoerGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageCustmoerGrid.lastPage()">
            </center>
            <br>
        </div>
        <br>


    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
