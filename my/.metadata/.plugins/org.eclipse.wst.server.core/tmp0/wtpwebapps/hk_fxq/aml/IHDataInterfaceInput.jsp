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
<SCRIPT src="IHDataInterface.js"></SCRIPT>
<%@include file="IHDataInterfaceInit.jsp"%>
</head>
<body  onload="initForm();initElementtype();" >
  <form action="./IHDataInterfaceSave.jsp" method=post name=fm target="fraSubmit">
    <table>
    	<tr>
    		<td>
    		 <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divAgent1);">
    		</td>
    		 <td class= titleImg>
        		交易信息提取
       		 </td>
    	</tr>
    </table>
    <Div  id= "divAgent1" style= "display: ''">
      <table  class= common>
        <TR  class = common>           
           <TD  class = title>
            交易发生起期
          </TD>
          <TD  class= input>
            <Input class= "coolDatePicker" dateFormat="short" name=StartDate verify="交易发生起期|DATE&NOTNULL" elementtype=nacessary>
          </TD>

           <TD  class= title>
            交易发生止期
          </TD>
          <TD  class= input>
            <Input class= "coolDatePicker" dateFormat="short" name=EndDate verify="交易发生止期|DATE&NOTNULL" elementtype=nacessary>
          </TD>
        </TR>
      </table>
      <BR>
      <TD class=button>
          <input type =button class=cssbutton value="提  取" onclick="CalSave();">
          <!--<input type =button class=cssbutton value="删  除" onclick="DeleteCalSave();">-->
          <INPUT VALUE="重  置" TYPE=button onclick="initForm1();" class="cssButton">
          <input type="hidden" class=input name=CurrentDate value="<%=CurDate%>">
          <input type="hidden" class=input name=sFlag value="">
     </TD>
     <BR>
     <BR>
     <tr>
     	<TD class=button>
          <input type =button class=cssbutton value="重  提" onclick="ReCalSave();"><font color=red style="font:9pt">  重新提取指定时间段内的所有数据</font>
     </TD>
     	</tr>
     	<BR>
     	<BR>
     <tr>
     	<TD class=button>
          <input type =button class=cssbutton value="补  提" onclick="FillCalSave();"><font color=red style="font:9pt">  补提指定时间段内的所有未成功数据</font>
     </TD>
     	</tr>
     	<BR>
     	<BR>
     
    </Div>
    <hr>
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
        <TR  class = common>           
           <TD  class = title>
            成功/失败
          </TD>               
          <TD class="input"/>
		        <Input name="Flag" id="Flag" class="codeno" 
      					ondblclick="showCodeList('amllxcalflag',[this,FlagName],[0,1]);" 	
      					onkeyup="showCodeListKey('amllxcalflag',[this,FlagName],[0,1]);"
      					/><Input class=codename name=FlagName readOnly ></TD>
      					</TR>
      </table>
      <BR>
      <TD class=button>
          <input type =button class=cssbutton value="查    询" onclick="QueryGrid();">
          <INPUT VALUE="重  置" TYPE=button onclick="resetform1();" class="cssButton">
     </TD>
    </Div>
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