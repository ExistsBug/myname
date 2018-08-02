<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//程序名称：LABranchGroupInput.jsp
//程序功能：

//创建日期：

//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<%
  GlobalInput tGI = new GlobalInput();
  tGI = (GlobalInput) session.getValue("GI");
  String IDX1= request.getParameter("IDX");
  String tInfoStyle2 = request.getParameter("infoStyle");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
  var tIDX="<%=IDX1%>"; 
  var tInfoStyle="<%=tInfoStyle2%>";
</script>

     <head>
     		<title>知识园地详细信息</title>
    	<!-- 公共引用脚本 -->
         <SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
        <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
        <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
         <SCRIPT src="../common/javascript/Common.js"></SCRIPT>
         <SCRIPT src="LAComTellerInput.js"></SCRIPT>
         <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
         <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
         <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
	      <!-- 公共引用样式 -->
         <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
         <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
         <%@ include file="LXPolicRulmageDetialInit.jsp" %>
         	<SCRIPT src="LXPolicRulmageDetial.js"></SCRIPT>
       </head>
        <body onload="initForm();initElementtype();"> 
              <form action="./LXKnowledgeFieldSave.jsp"  method=post name=fm target="fraSubmit">
                 <table>
	                <tr class=common>
		              <td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divLABranchGroup1);"></IMG> </td>
		              <td class=titleImg>知识园地详细信息</td>
	               </tr>
               </table>
 <Div id="divLABranchGroup1" style="display: ''">
<table class=common border=0>	
    <TR>
	<TD class="title" />发布类型</TD>
	<TD  class= "input"><Input class=codeno name="PubType" 
						onDblClick="return showCodeList('publishtype',[this,PubTypeName],[0,1]);" 
						onKeyUp="return showCodeListKey('publishtype',[this,PubTypeName],[0,1]);"/><input class=codename name="PubTypeName" readonly=true ></TD> 	
   	
   	<TD class="title" />管理机构</TD>
   	<TD class= input><Input class=codeno name="ManageCom" 
					onDblClick="return showCodeList('station',[this,ManageComName],[0,1]);" 
					onKeyUp="return showCodeListKey('station',[this,ManageComName],[0,1]);"><input class=codename name="ManageComName" readonly=true ></TD> 
   </TR>	
   	<TR>
	<TD class="title" />标题关键字</TD>			
	<TD class="input"/><input name="KeyWord" id="KeyWord" class="common"  verify="标题关键字|notnull&len<=120"  /></TD>
	</TR>
	</table> 
	<INPUT class=cssButton VALUE=" 下载附件 " name="DownLoad" TYPE=button
				onclick="GoToDownLoad(this.name)" />
	<INPUT class=cssButton VALUE="返  回 " name="return" TYPE=button
				onclick="GoToReturn()" />
 </Div>
         <input type=hidden    name="Idx" value="">
	      <input type=hidden  name=hideOperate value="">
		<span id="spanCode" style="display: none; position: absolute;"></span>
</form>
     </body>
</html>
