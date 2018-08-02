<%@include file="../common/jsp/UsrCheck.jsp"%>
<html>
<%
//程序名称：IHDataInterface.jsp
//程序功能：
//创建日期：2007-11-15
//创建人  ：CrtHtml程序创建
//更新记录：  更新人    更新日期     更新原因/内容
%>
<%@page contentType="text/html;charset=GBK" %>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%
    String CurDate = PubFun.getCurrentDate();
    System.out.println(CurDate);
%>
<head>
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
<SCRIPT src="IRDataInterface.js"></SCRIPT>
<%@include file="IRDataInterfaceQueryInit.jsp"%>
</head>
<body  onload="initForm();initElementtype();" >
  <form action="" method=post name=fm target="fraSubmit">
    <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divAgent11);">
    		</td>
    		 <td class= titleImg>
        		提取信息查询
       		 </td>
    	</tr>
    </table>
    <Div  id= "divAgent11" style= "display: ''">
      <table  class= common>
        <TR  class = common>           
           <TD  class = title>
             交易发生起期
          </TD>
          <TD  class= input>
            <Input class= "coolDatePicker" dateFormat="short" name="StartDate1" verify="交易发生起期|DATE" >
          </TD>

           <TD  class= title>
             交易发生止期
          </TD>
          <TD  class= input>
            <Input class= "coolDatePicker" dateFormat="short" name="EndDate1" verify="交易发生止期|DATE" >
          </TD>
        </TR>
      </table>
      <BR>
      <TD class=button>
          <input type =button class=cssbutton value="查    询" onclick="QueryGrid();">
          <INPUT VALUE="重  置" TYPE=button onclick="resetform1();" class="cssButton">
     </TD>
    </Div>
    </br>
     <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divAgent11);">
    		</td>
    		 <td class= titleImg>
        		查询结果
       		 </td>
    	</tr>
    </table>
        <!-- 交易信息展现表格 -->
        <div id="divTasksGrid" style="display:''">
            <table class="common">
                <tr class="common">
                    <td><span id="spanTasksGrid"></span></td>
                </tr>
            </table>
            <!-- 交易信息结果翻页 -->
            <div id="divTurnPageTasksGrid" align="center" style="display:'none'">
                <input type="button" class="cssButton" value="首  页" onclick="turnPageTasksGrid.firstPage()">
                <input type="button" class="cssButton" value="上一页" onclick="turnPageTasksGrid.previousPage()">
                <input type="button" class="cssButton" value="下一页" onclick="turnPageTasksGrid.nextPage()">
                <input type="button" class="cssButton" value="尾  页" onclick="turnPageTasksGrid.lastPage()">
            </div>
            <!-- 提交数据操作按钮 -->
            <br>
        </div>
        <br>
    </form>
    
  <span id="spanCode"  style="display: none; position:absolute; slategray"></span>
</body>
</html>