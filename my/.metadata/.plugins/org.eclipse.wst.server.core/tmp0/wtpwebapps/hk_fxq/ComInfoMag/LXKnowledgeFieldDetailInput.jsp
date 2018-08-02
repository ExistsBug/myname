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
<%//添加地域控制，登陆机构

	GlobalInput tGI=new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
//	String tidx2 = request.getParameter("Idx1");
   String tidx2 = request.getParameter("idx");
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
  var tIDX = "<%=tidx2%>";
</script>


     <head>
    	<!-- 公共引用脚本 -->
         <SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
        <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
        <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
         <SCRIPT src="../common/javascript/Common.js"></SCRIPT>
         <SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
         <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
         <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
	      <!-- 公共引用样式 -->
         <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
         <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
         	<SCRIPT src="LXKnowledgeFieldDetail.js"></SCRIPT> 
         	<%@include file="LXKnowledgeFieldDetailInit.jsp"%>
       </head>
        <body onload="initForm();"> 
              <form action=""  method=post name=fm target="fraSubmit">
                 <table>
	                <tr class=common>
		              <td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divLABranchGroup1);"></IMG> </td>
		              <td class=titleImg>知识园地上报信息管理</td>
	               </tr>
               </table>
 <Div id="divLABranchGroup1" style="display: ''">
<table class=common border=0>	
    <TR>
	<TD class="title" />发布类型</TD>
	<TD  class= "input"><Input class=codeno name="PubType" 
						onDblClick="return showCodeList('publishtype',[this,PubTypeName],[0,1]);" 
						onKeyUp="return showCodeListKey('publishtype',[this,PubTypeName],[0,1]);"/><input class=codename name="PubTypeName" readonly=true elementtype=nacessary></TD> 	
   	
   	<TD class="title" />管理机构</TD>
    
   	<TD class= input><Input class=codeno name="ManageCom" 
					onDblClick="return showCodeList('station',[this,ManageComName],[0,1]);" 
					onKeyUp="return showCodeListKey('station',[this,ManageComName],[0,1]);"><input class=codename name="ManageComName" readonly=true elementtype=nacessary></TD> 
   
  
   </TR>	
   	<TR>
	<TD class="title" />标题关键字</TD>			
	<TD class="input"/><input name="KeyWord" id="KeyWord" class="common"  verify="标题关键字|notnull&len<=120"  elementtype=nacessary/></TD>
	<TD class="title" />数据状态</TD>
	<TD  class= "input"><Input class=codeno name="State" 
						onDblClick="return showCodeList('datastate',[this,StateName],[0,1]);" 
						onKeyUp="return showCodeListKey('datastate',[this,StateName],[0,1]);"><input class=codename name="StateName" readonly=true elementtype=nacessary></TD> 	
	</TR>

</table>            
<INPUT class=cssButton name="backbutton" VALUE="返 回"  TYPE=button onclick="return Return();">
 </Div>
         <input type=hidden    name="Idx" value="">
	      <input type=hidden  name=hideOperate value="">
		<span id="spanCode" style="display: none; position: absolute;"></span>
</form>
     </body>
</html>
