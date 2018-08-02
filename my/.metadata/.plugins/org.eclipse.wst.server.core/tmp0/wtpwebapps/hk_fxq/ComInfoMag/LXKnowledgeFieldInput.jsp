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
         <!-- 私有引用脚本 -->
          <SCRIPT src="LXKnowledgeFieldInput.js"></SCRIPT>
         <%@include file="LXKnowledgeFieldInit.jsp"%>
       </head>
        <body onload="initForm();initElementtype();"> <!-- encType="multipart/form-data" -->
              <form action="./LXKnowledgeFieldSave.jsp"  method=post name=fm target="fraSubmit" ENCTYPE="multipart/form-data">
                 <table>
	                <tr class=common>
		              <td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divLABranchGroup1);"></IMG> </td>
		              <td class=titleImg>知识园地录入管理</td>
	               </tr>
               </table>
 <Div id="divLABranchGroup1" style="display: ''">
<table class=common border=0>	
    <TR>
    <!--  
	<TD class="title" />发布类型</TD>
	<TD  class= "input"><Input class=codeno name="PubType" 
						onDblClick="return showCodeList('publishtype',[this,PubTypeName],[0,1]);" 
						onKeyUp="return showCodeListKey('publishtype',[this,PubTypeName],[0,1]);"/><input class=codename name="PubTypeName" readonly=true elementtype=nacessary></TD> 	
   	-->
   	<!--  
   	<TD class="title" />管理机构</TD>
   	<TD class= input><Input class=codeno name="ManageCom" 
					onDblClick="return showCodeList('station',[this,ManageComName],[0,1]);" 
					onKeyUp="return showCodeListKey('station',[this,ManageComName],[0,1]);"><input class=codename name="ManageComName" readonly=true elementtype=nacessary></TD> 
      -->
 
      	<TD class="title" />发布机构</TD>
   	<TD class= input><Input class=codeno name="ManageCom" verify="发布机构|notnull"><input class=codename name="ManageComName" readonly=true elementtype=nacessary></TD> 
 
    <TD class="title" />标题</TD>			
	<TD class="input"/><input name="KeyWord" id="KeyWord" class="common"  verify="标题关键字|notnull&len<=120"  elementtype=nacessary/></TD>
   </TR>	
   	<TR>
		<!--  
     <TD class="title" />数据状态</TD>
	<TD  class= "input"><Input class=codeno name="State" 
						onDblClick="return showCodeList('datastate',[this,StateName],[0,1]);" 
						onKeyUp="return showCodeListKey('datastate',[this,StateName],[0,1]);"><input class=codename name="StateName" readonly=true elementtype=nacessary></TD> 	
	-->
	</TR>
	<tr>
	 <Div id="divUpload" style="display: ''">
	   <table class="common">
		 <TR class="common">
		 <TD class="title" style="width: 17%">附件上传</TD>
		 <TD class=common><Input class=common3 style="width: 39%" type="file"name="FileName" id="FileName" elementtype=nacessary></TD>
		 </TR>

	  </table>
	 </div>
	
     <tr><br/></tr>
		<tr >
			<td class=button >
			</td>
			<td class=button align=right>	  
				<INPUT class=cssButton name="addbutton" VALUE="增  加"  TYPE=button onclick="return addClick();">
			</td>
			<td class=button width="10%" align=right>
				<INPUT class=cssButton name="updatebutton" VALUE="修  改"  TYPE=button onclick="return updateClick();">
			</td>			
			<td class=button width="10%" align=right>
			
			</td>		
			<td class=button width="10%" align=right>
				<INPUT class=cssButton name="resetbutton" VALUE="重  置"  TYPE=button onclick="return resetForm();">
			</td>
		</tr>
</table>            
 </Div>
         <input type=hidden  name="Idx" value="">
	      <input type=hidden name=hideOperate value="">
<!--  <input type=hidden  name=hideOperate value=""> -->
           <br/>
           <table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,divQuery3);">
					</td>
					<td class=titleImg>
						查询条件
					</td>
				</tr>
			</table>
		<Div id="divQuery3" style="display: ''">
           <table class=common border=0>
					<TR>
	                 <TD class="title" />标题关键字</TD>			
	                 <TD class="input"/><input name="KeyWord2" id="KeyWord2" class="common"  verify="标题关键字|len<=120"  ></TD>
	                 
	                  <TD class="title" />数据状态</TD>
	                  <TD  class= "input"><Input class=codeno name="State" 
						onDblClick="return showCode(this,StateName);" 
						onKeyUp="return showCodeKey(this,StateName);"><input class=codename name="StateName" readonly=true ></TD> 	
	                 </TR>

				   <TR>
	              <TD  class= title> 统计起期    </TD>
                      <TD  class= input>
                     <Input class= 'coolDatePicker' verify="统计起期|DATE" name=KDate format='short' > </TD>
                     <TD class="title" /> 统计止期</TD>
                      <TD  class= input><Input class= 'coolDatePicker' verify="统计止期|DATE" name=EDate format='short' ></TD>
	                </TR>
	                <!--  
	                
	                 -->

			</table>
			</Div>
			 <INPUT class=cssButton name="querybutton" VALUE="查  询"  TYPE=button onclick="return easyQuery();">
     <br/>
     <br/>
      <table>
	     <tr class=common><td class=common><IMG src="../common/images/butExpand.gif" style="cursor: hand;" OnClick="showPage(this,div2);"> <input
		  type=hidden name=Operate value=''></td>
		  <td class=titleImg>查询结果</td>
	    </tr>
      </table>
    <Div id="divLXKnowledgeGrid style=" display:''" />
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
		<INPUT class=cssButton VALUE=" 删  除 " name="deletebutton" TYPE=button onclick="deleteClick()" />
		
		<INPUT class=cssButton VALUE=" 上 报" name="uploadbutton" TYPE=button onclick="uploadClick()" />
		<!--  
		<INPUT class=cssButton VALUE="下载附件 " name="informbutton" TYPE=button onclick="downloadFile()" /> 
		--> 
		<!-- 
		<INPUT class=cssButton VALUE="删除附件 " name="deleteloadbutton" TYPE=button onclick="deleteloadFile()" /> 
		 -->
		<INPUT class=cssButton VALUE=" 发  布" name="publebutton" TYPE=button onclick="publeClick()" />
	    <br/>

	     <div id="divReason" style="display:'none'"> 
		<table>
         	<tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divWaitForReasonGrid)"></td>
                <td class="titleImg">可疑审核意见</td>
         	</tr>
        </table>
        
         <div id="divWaitForReasonGrid" style="display:''">    
		 <table class="common">
                <tr class="common">
                    <td><span id="spanWaitForReasonGrid"></span></td>
                </tr>
            </table>
        
         <div id="divTurnPageWaitForReasonGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageWaitForReasonGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageWaitForReasonGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageWaitForReasonGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageWaitForReasonGrid.lastPage()">
          </div>
        </div>
      </div>
		<span id="spanCode" style="display: none; position: absolute;"></span>
</form>
     </body>
</html>
