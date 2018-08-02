<%@page contentType="text/html;charset=GBK"%>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%
//程序名称：LXPostInput.jsp
//程序功能：对岗位信息的操作页面
//创建日期：2010-04-02 11:15:40
//创建人 ：Lips
//更新记录：  更新人    更新日期     更新原因/内容
%>
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
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>审核</title>
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
		<script language="JavaScript" src="LXPolicRulcheckInput.js"></script>
		<%@include file="LXPolicRulcheckInit.jsp"%>
	</head>
	<body onload="initForm(); initElementtype();">
		<form name="fm" method="post" target="fraSubmit">
			<table>
				<tr>
					<td class=common>
						<IMG src="../common/images/butExpand.gif" style="cursor: hand;"
							OnClick="showPage(this,divQuery2);">
					</td>
					<td class=titleImg>
						综合信息审核
					</td>
				</tr>
			</table>
			<Div id="divQuery2" style="display: ''">
				<table class=common border=0>
					<TR>
						<TD class="title" />
							信息类型
						</TD>
						<TD  class= "input">
						<Input class=codeno name="InfoStyleCode" readonly 
							onDblClick="return showCodeList('publishtype',[this,InfoStyle],[0,1]);" 
							onKeyUp="return showCodeListKey('publishtype',[this,InfoStyle],[0,1]);
						"><input class=codename name="InfoStyle" readonly=true elementtype=nacessary></TD> 	
						<TD class="title" />
							上报机构
						</TD>
						<TD  class= "input">
						<Input class=codeno name="ManageComCode" readonly 
							onDblClick="return showCodeList('station',[this,ManageCom],[0,1]);" 
							onKeyUp="return showCodeListKey('station',[this,ManageCom],[0,1]);
						"><input class=codename name="ManageCom" readonly=true ></TD> 	
						
					</TR>
					<TR>
						<TD class="title" />统计起期</TD>
                 		<TD class="input"/>
                    		<Input class='coolDatePicker' name="StartDate" id="StartDate"   verify="发布起期|DATE"   />
                		</TD>
                		<TD class="title" />统计止期</TD>
                 		<TD class="input"/>
                    		<Input class='coolDatePicker' name="EndDate" id="EndDate"   verify="发布止期|DATE"   />
                		</TD>
					</TR>
					<TR>
						<TD class="title" />
							标题关键字
						</TD>
						<TD class="input" />
							 <input name="HeadLine" id="HeadLine" class="common"  verify="标题关键字|len<=20"  />
						</TD>
						<TD class="title" /> 
							数据类别
						</TD>
                        <TD  class= "input">
							<Input class=codeno name="State" readonly 
								onDblClick="return showCodeb(this,StateName);" 
								onKeyUp="return showCodeKeyb(this,StateName);
							"><input class=codename name="StateName" readonly >
						</TD>
					</TR>
				</table>
			</div>
			<br/>
			<INPUT class=cssButton VALUE=" 查  询 " name="query" TYPE=button
				onclick="easyQuery();" />
			<INPUT class=cssButton VALUE=" 重 置 " name="delete" TYPE=button
				onclick="setEmpty(this.name)" />
			<br/>
			<br/>
			<Div id="divLXPolicRulcheckGrid style=" display: ''" />
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
							<span id="spanLXPolicRulcheckGrid"></span>
						</td>
					</tr>
				</table>
				<div id="divTurnPageLXPolicRulcheckGrid" style="display: 'none'"
					align="center">
					<INPUT CLASS=cssButton VALUE="首  页" TYPE=button
						onclick="turnPageInfo.firstPage();" />
					<INPUT CLASS=cssButton VALUE="上一页" TYPE=button
						onclick="turnPageInfo.previousPage();" />
					<INPUT CLASS=cssButton VALUE="下一页" TYPE=button
						onclick="turnPageInfo.nextPage();" />
					<INPUT CLASS=cssButton VALUE="尾  页" TYPE=button
						onclick="turnPageInfo.lastPage();" />
				</div>
				<br/>
					<INPUT class=cssButton VALUE=" 查看详细信息 " name="query" TYPE=button
				onclick="queryDetailInfo(this.name)" />
				<INPUT class=cssButton VALUE=" 下载附件 " name="DownLoad" TYPE=button
				onclick="GoToDownLoad(this.name)" />
			 <br/><br/>
		<table>
         	<tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divreasonofcancelreport)"></td>
                <td class="titleImg">审核意见</td>
         	</tr>
        </table>
       
		<div id="divreasonofreport" style="display:''">
		<table class="common">    	
	       <tr>
	          <td class="input" colspan=8 >
	          	<textarea style="width:97%"  name="CheckOption" id="CheckOption" class="common" elementtype=nacessary verify="审核意见|notnull&len<=200"/></textarea>
		      </td>
	        </tr>
        </table>
        </div>
        <br/>
				<INPUT class=cssButton VALUE="审核通过" name="Pass" TYPE=button
				onclick="GoToCheckPass(this.name)" />
				<INPUT class=cssButton VALUE="审核不通过" name="NoPass" TYPE=button
				onclick="GoToCheckNo(this.name)" />
				<INPUT class=cssButton VALUE="返回修改" name="ReturnModify" TYPE=button
				onclick="GoToReturnModify(this.name)" />
			</Div>
		</form>
		<span id="spanCode" style="display: none; position: absolute;"></span>
	</body>
</html>
