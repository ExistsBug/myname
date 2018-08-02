<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-10
 * @direction: 可疑交易报文文件申请主框架
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>风险规则定义</title>
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
    <script language="JavaScript" src="RiskIdentifyInput.js"></script>
    <%@ include file="RiskIdentifyInit.jsp" %>
</head>
<body topmargin="0" onload="initForm();  initElementtype();" ondragstart="return false">
    <form name="fm" method="post" target="fraSubmit">
              	<table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divRiskIdfySearch)"></td>
                <td class="titleImg">风险级别规则定义</td>
            </tr>
        </table>
         <div id="divRiskIdfySearch" style="display:''">
            <!-- 报文查询录入表格 -->
            <table class="common">
                <tr class="common">    					                   
                    <td class="title">级别编码</td>
                    <td class="input"><input class="common" name="code" id="code" elementtype=nacessary verify="级别编码|notnull"/></td>
                    <td class="title">级别名称</td>
                    <td class="input"><input class="common" name="codename" id="codename" elementtype=nacessary verify="级别名称|notnull"/></td>
                  </tr><tr>
                    <td class="title">级别描述</td>
                    <td class="input" colspan=5 ><textarea style="width:97%"  name="codealias" id="codealias" class="common" elementtype=nacessary verify="级别描述|notnull"/></textarea>
	        </td>
                    
                </tr>
                <tr>
                    <td class="title">采取措施</td>
                    <td class="input" colspan=5 ><textarea style="width:97%"  name="codealiasD" id="codealiasD" class="common" elementtype=nacessary verify="级别描述|notnull"/></textarea>
	        </td>
                    
                </tr>
                 
            </table>
            
           <input type="button" class="cssButton" value=" 查询级别 " onclick="return GoToQuery();">
           <input type="button" class="cssButton" name="INSERT" value=" 新增级别" onclick="return gotomodify(this.name);">
           <input type="button" class="cssButton" name="UPDATE" value=" 修改级别" onclick="return gotomodify(this.name);">
           <input type="button" class="cssButton" name="DELETE" value=" 删除级别 " onclick="return gotomodify(this.name);">             
           <input type="button" class="cssButton" value=" 重置 " onclick="return cleartext();">         
           <input type="button" class="cssButton" value=" 修改级别算法" onclick="return GoToDetail();">
            <input type="hidden" name="hideCode" id="hideCode"/>
            <br>
        </div>
  	<hr>



        <!-- 报文查询折叠展开 -->

        <table>
            <tr>
                <td class="common"><img src="../common/images/butExpand.gif" style="cursor:hand" onclick="showPage(this,divFileMsgGrid)"></td>
                <td class="titleImg">风险级别算法信息</td>
            </tr>
        </table>
        <!-- 报文信息展现表格 -->
        <div id="divFileMsgGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanFileMsgGrid"></span></td>
                </tr>
            </table>
            <!-- 报文信息结果翻页 -->
            <div id="divTurnPageFileMsgGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageFileMsgGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageFileMsgGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageFileMsgGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageFileMsgGrid.lastPage()">
            </div>
        </div>
      
        <!-- 获取数据的隐藏域 -->

    </form>
    <!-- 通用下拉信息列表 -->
    <span id="spanCode" style="display:none; position:absolute; slategray"></span>
</body>
</html>
