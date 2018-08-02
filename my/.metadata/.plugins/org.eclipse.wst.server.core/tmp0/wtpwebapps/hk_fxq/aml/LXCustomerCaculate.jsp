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
    <script language="JavaScript" src="LXCustomerCaculate.js"></script>
    <%@ include file="LXCustomerCaculateInit.jsp" %>
</head>
<body topmargin="0" onload="" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
    <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustmoerGrid);">
    		</td>
    		 <td class= titleImg>
        		风险计算
       		 </td>
    	</tr>
    </table> 
    <div id="divCustmoerGrid" style="display:''">
      <table  class= common>
        <TR  class = common>      
          <TD class="title" />起始日期</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="StartDate" maxlength="10" dateFormat="short" ></TD>
          <TD class="title" />结束日期</TD>
					<TD class="input" /><input type="text" class="coolDatePicker" name="EndDate" maxlength="10" dateFormat="short" ></TD>
        </TR>
      </table> 
      <br><br>
				<input type="button" class="cssButton" name='cal' value="风险计算" onclick="return calData();">
				<br>
	</div>
    </form>
</body>
</html>
