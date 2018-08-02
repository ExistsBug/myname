<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<html>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput)session.getValue("GI");	
%>
<script>
var tdealno ="<%=request.getParameter("dealno")%>";
var tdatastate ="<%=request.getParameter("datastate")%>";
var toper ="<%=request.getParameter("oper")%>";
//alert(SerialNo);
</script>
<head>
<title>提交上级审核 </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
  <SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
  <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>  
  <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT> 
  <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>   
  <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
  <script src="./LXISAffirmReportInput.js"></script> 
  <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
  <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
  <%@include file="LXISAffirmReportInit.jsp"%>

</head>
<body  onload="initForm();">
<!--登录画面表格-->
<form name=fm action="./LXISAffirmMainSave.jsp" target="fraSubmit" method=post>
    <BR/><BR/>
    <Table>
    	<TR>
        	<TD class=common>
	           <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCancelReason);">
    		</TD>
    		<TD class= titleImg>
    			 可疑行为描述
    		</TD>
    	</TR>
    </Table>    	
 <Div  id= "divCancelReason" style= "display: ''">
  <table class=common border=0>
			<TR class=common>
				<TD class="input" colspan=5  />
			        <textarea style="width:100%"  rows="8" name="ReMark" id="SSDS" class="common"  verify = "可疑行为描述|notnull&len<=500" elementtype=nacessary/></textarea>
		        </TD>
			</TR>
		</table>
 </Div>		
	<BR/><BR/>
      <INPUT VALUE="提交上级审核" Class=cssButton TYPE=button Name=ReportSubmit onclick="RSubmit();"> 
      &nbsp;&nbsp;
      <INPUT VALUE="取    消" Class=cssButton TYPE=button Name=Cancel onclick="top.close();">  
      <INPUT VALUE="" TYPE=hidden name=dealno> 
      <INPUT VALUE="" TYPE=hidden name=datastate> 
      <INPUT VALUE="" TYPE=hidden name=oper> 
<span id="spanCode"  style="display: none; position:absolute; slategray"></span>					
</Form>
</body>
</html>
