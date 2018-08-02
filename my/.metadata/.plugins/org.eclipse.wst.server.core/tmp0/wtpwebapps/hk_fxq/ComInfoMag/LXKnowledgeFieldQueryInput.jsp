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
%>
<script>
  var operator = "<%=tGI.Operator%>";   //记录操作员
  var manageCom = "<%=tGI.ManageCom%>"; //记录管理机构
  var comcode = "<%=tGI.ComCode%>";     //记录登陆机构
</script>

     <head>
     <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>知识园地发布查询</title>
		<!-- 公共引用脚本 -->
     		<!-- 公共引用脚本 -->
		<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
		<SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
		<SCRIPT src="../common/Calendar/Calendar.js"></SCRIPT>
		<SCRIPT src="../common/javascript/EasyQuery.js"></SCRIPT>
		<SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
		<SCRIPT src="../common/easyQueryVer3/EasyQueryCache.js"></SCRIPT>
		<SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
		<!-- 公共引用样式 -->
		<LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
		<LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
         <!-- 私有引用脚本 -->
          <SCRIPT src="LXKnowledgeFieldQueryInput.js"></SCRIPT>
         <%@include file="LXKnowledgeFieldQueryInit.jsp"%>
       </head>
        <body onload="initForm();initElementtype();"> 
              <form action="./LXKnowledgeFieldSave.jsp"  method=post name=fm target="fraSubmit">
                 <table>
	                <tr class=common>
		              <td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divLABranchGroup1);"></IMG> </td>
		              <td class=titleImg>知识园地发布查询</td>
	               </tr>
               </table>
 <Div id="divLABranchGroup1" style="display: ''">
<table class=common border=0>	
    <TR>
    <!-- 
	<TD class="title" />发布类型</TD>
	<TD  class= "input"><Input class=codeno name="PubType" 
						onDblClick="return showCodeList('publishtype',[this,PubTypeName],[0,1]);" 
						onKeyUp="return showCodeListKey('publishtype',[this,PubTypeName],[0,1]);"/><input class=codename name="PubTypeName" readonly=true ></TD> 	
   	 -->
   	<TD class="title" />管理机构</TD>
    
   	<TD class= input><Input class=codeno name="ManageCom" 
					onDblClick="return showCodeList('station',[this,ManageComName],[0,1]);" 
					onKeyUp="return showCodeListKey('station',[this,ManageComName],[0,1]);"><input class=codename name="ManageComName" readonly=true ></TD> 
    <TD class="title" />标题关键字</TD>			
	<TD class="input"/><input name="KeyWord" id="KeyWord" class="common"  verify="标题关键字|notnull&len<=120"  /></TD> 
   </TR>	
   	<TR>
	   <TD  class= title> 统计起期    </TD>
          <TD  class= input>
            <Input class= 'coolDatePicker' verify="发布起期|DATE" name=FDate format='short' > </TD>
        <TD class="title" /> 统计止期</TD>
          <TD  class= input><Input class= 'coolDatePicker' verify="发布止期|DATE" name=EDate format='short' ></TD>
	</TR>
</table> 

         <INPUT class=cssButton name="querybutton" VALUE="查  询"  TYPE=button onclick="return easyQuery();">
         <INPUT class=cssButton name="querybutton" VALUE="重  置"  TYPE=button onclick="return resetForm();">
 </Div>
         <input type=hidden    name="Idx" value="">
	      <input type=hidden  name=hideOperate value="">

<!--      <table>-->
<!--	     <tr class=common><td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,div2);"> <input-->
<!--		  type=hidden name=Operate value=''></td>-->
<!--		  <td class=titleImg>查询结果</td>-->
<!--	    </tr>-->
<!--      </table>-->
    <Div id="divLXKnowledgeGrid style=" display: ''" />
    	<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divQuery2);">
					</td>
					<td class=titleImg>
						查询结果
					</td>
				</tr>
				</table>
        <table class=common>
					<tr class=common>
						<td>
							<span id="spanLXKnowledgeGrid"></span>
						</td>
					</tr>
      </table>
        <div id="divTurnPageLXKnowledgeGrid" style="display: 'none'"align="center">
		<INPUT CLASS=cssButton VALUE="首  页" TYPE=button onclick="turnPageInfo.firstPage();" />
		<INPUT CLASS=cssButton VALUE="上一页" TYPE=button onclick="turnPageInfo.previousPage();" />
		<INPUT CLASS=cssButton VALUE="下一页" TYPE=button onclick="turnPageInfo.nextPage();" />
		<INPUT CLASS=cssButton VALUE="尾  页" TYPE=button onclick="turnPageInfo.lastPage();" />
	    </Div>
  </Div>
		 <br/>
	    <br/>
		<INPUT class=cssButton name="querybutton" VALUE="查询下载报备信息 "  TYPE=button onclick="QueryDataReport();">
		<span id="spanCode" style="display: none; position: absolute;"></span>
</form>
     </body>
</html>
