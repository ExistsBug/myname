<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 李晨 <lichen@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易申请
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>可疑交易查看</title>
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
    <script language="JavaScript" src="LXIHQueryMain.js"></script>
    <%@ include file="LXIHQueryMainInit.jsp" %>
</head>
<body topmargin="0" onload="initForm()" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">

	<table>
		<tr>
			<td class=common>
			<IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divTasks);">
			</td>
			<td class= titleImg>
				大额交易明细信息
			</td>
		</tr>
	</table>
		<Div  id= "divTasks" style= "display: '' "/>
			<table  class= common>
				<tr  class= common>
					<td text-align: left colSpan=1>
					<span id="spanTasksGrid" >
					</span> 
					</td>
				</tr>
			</table>
			<br />
		</Div>
		            <div id="divTurnPageTasksGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageTasksGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageTasksGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageTasksGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageTasksGrid.lastPage()">
            </div>
				<INPUT class=cssButton VALUE=" 查看交易明细信息 " name="update" TYPE=button onclick="return GoToDetailInput(this.name);" />
				<INPUT class=cssButton VALUE=" 返回 " name="return" TYPE=button onclick="return GoToReturn();" />	
	    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
