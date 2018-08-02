<%@page contentType="text/html;charset=GBK" %>
<%@page import="com.sinosoft.lis.pubfun.GlobalInput"%>
<html> 
<%
//程序名称：LXPRRISIns_BnfInput.jsp
//程序功能：
//创建日期：
//创建人 ：
//更新记录： 
%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
%>
<script>
	var operator  = "<%=tGI.Operator%>";    //记录操作员
	var manageCom = "<%=tGI.ManageCom%>";   //记录管理机构
	var comcode   = "<%=tGI.ComCode%>";     //记录登陆机构
</script>
<head >
		<SCRIPT src="../common/javascript/Common.js" >
		</SCRIPT><SCRIPT src="../common/javascript/MulLine.js">
		</SCRIPT><SCRIPT src="../common/Calendar/Calendar.js">
		</SCRIPT><SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
		<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
		<SCRIPT src="../common/javascript/VerifyInput.js" ></SCRIPT>
		<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
		<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
		<SCRIPT src="LXPRRISIns_Bnf.js"></SCRIPT>
		<%@include file="LXPRRISIns_BnfInit.jsp"%>
		<title>可疑被保人受益人清单</title>
</head>
<body onload="initForm();" >
<form action="./LXPRRISIns_BnfSave.jsp" method=post name=fm target=fraSubmit> 
	<table class= common align=center>
		<TR class= common>			
			<TD class=title>统计机构</TD>
			<TD class=input><Input class=codeno name=MngCom readonly ondblclick="return showCodeList('station',[this,MngComName],[0,1]);" onkeyup="return showCodeListKey('station',[this,MngComName],[0,1]);"><input class=codename name=MngComName readonly=true><font color=red>*</font></TD>
			<TD class= title>统计起期</TD>
			<TD class= input><input class="coolDatePicker" dateFormat="short" name="StartDate" ><font color=red>*</font></TD> 
			<TD class= title>统计止期	</TD>
			<TD class= input><input class="coolDatePicker" dateFormat="short" name="EndDate" ><font color=red>*</font></TD>    		
		</tr>
		<TR class= common>			
			<TD class=title>客户姓名</TD>
			<TD class=input><Input class=common name=CustomerName></TD>
			<TD class= title></TD>
			<TD class= input></TD> 
			<TD class= title></TD>
			<TD class= input></TD>    		
		</tr> 
	</table> 
	
	<br>
	
 <input type=button class=cssbutton name=saveb value='清单导出' onclick="submitSave();"> 
 <input type=button class=cssbutton value='重    置' onclick="resetForm();"> 
 </form>
 <span id="spanCode" style="display: none; position:absolute; slategray"></span>
</body>
</html>
