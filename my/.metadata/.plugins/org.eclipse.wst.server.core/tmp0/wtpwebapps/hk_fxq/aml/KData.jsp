<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.lis.pubfun.GlobalInput"%>
<% 
//程序名称：DData.jsp
//程序功能：大额数据确认 
//创建日期：2007-07-02 11:10:36
//创建人  ：zhu
//更新记录：  更新人    更新日期     更新原因/内容
%>
<html>
<%
  //个人下个人	
	String tContNo = "";
	
  GlobalInput tGI = new GlobalInput();
	tGI = (GlobalInput)session.getValue("GI");
%>
<script>	
	var contNo = "<%=tContNo%>";          //个人单的查询条件.
	var operator = "<%=tGI.Operator%>";   //记录操作员
	var manageCom = "<%=tGI.ManageCom%>"; //记录登陆机构
	var comcode = "<%=tGI.ComCode%>";//记录登陆机构
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
  <SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
  <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
  <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
   <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
  <SCRIPT src="KData.js"></SCRIPT>
  <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
  <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
  <%@include file="KDataInit.jsp"%>
  <title>大额数据确认</title>
</head>
<body  onload="initForm();" >
  <form action="./KDataChk.jsp" method=post name=fm target="fraSubmit">
    <!-- 大额交易数据信息 -->
    <table class= common border=0 width=100%>
    	<tr>
		<td class= titleImg align= center>请输入查询条件：</td>
	</tr>
    </table>
    <table  class= common align=center>
      	<TR  class= common>
          <TD  class= title>
            客户号  
          </TD>
          <TD  class= input>
            <Input class=common name=CSNM >
          </TD>
          <TD  class= title>  
            统计日期
          </TD>
          <TD  class= input>
          
            <Input class="coolDatePicker" name="StaDate" dateFormat="short">
          </TD>
         
        </TR>
        
        
    </table>
          <INPUT VALUE="查  询" class = cssButton TYPE=button onclick="easyQueryClickSelf();"> 
    
  	<Div  id= "divLCPol1" style= "display: ''" align=center>
      	<table  class= common>
       		<tr  class= common>  
      	  		<td text-align: left colSpan=1>
  					<span id="spanPolGrid" >
  					</span> 
  			  	</td> 
  			</tr>
    	</table>
      <INPUT VALUE="首  页"  class =  cssButton TYPE=button onclick="getFirstPage();"> 
      <INPUT VALUE="上一页" class = cssButton TYPE=button onclick="getPreviousPage();"> 					
      <INPUT VALUE="下一页" class = cssButton TYPE=button onclick="getNextPage();"> 
      <INPUT VALUE="尾  页"  class =  cssButton TYPE=button onclick="getLastPage();"> 					
  	</div>
  	<p>
      <INPUT VALUE="可疑数据确认" class = cssButton TYPE=button onclick="chk()"> 
     
  	</p>
  </form>
  <span id="spanCode"  style="display: none; position:absolute; slategray"></span>
</body>
</html>
