<!-- 调用 JSP Init 初始化页面 : 开始 -->

<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%
    String sEndDate = PubFun.getCurrentDate();
    GlobalInput tGI = new GlobalInput();
    tGI=(GlobalInput)session.getValue("GI");
    String OperatorCode=tGI.Operator;
    System.out.println("OperatorCode======"+OperatorCode);
%>

  <script language="JavaScript">

	var WaitForBeFileGrid;
	var operator = "<%=tGI.Operator%>";   
	var manageCom = "<%=tGI.ManageCom%>"; 
	var comcode = "<%=tGI.ComCode%>";  
  /**
   * 总函数，初始化页面
   */
  function initForm()
  {
      try
      {
          initInputBox();
          initWaitForBeFileGrid();
          initUserPower();
          initUserCheck();
			    fm.all('StatiCode').value = <%= tGI.ManageCom %>;
			    showOneCodeName("station","StatiCode","StatiCodeName");
      }
      catch (ex)
      {
          alert("在 LXISAuditInit.jsp --> initForm 函数中发生异常: 初始化界面错误！");
      }
  }

  /**
   * 输入框的初始化
   */
  function initInputBox()
  {
      try
      {
          document.getElementsByName("EndDate")[0].value = "<%=sEndDate%>";
      }
      catch (ex)
      {
          alert("在 LXISAuditInit.jsp --> initInputBox 函数中发生异常: 初始化界面错误！");
      }
  }

  /**
    *查看用户是否有大额确认的权限
    */
  function initUserPower()
  {
      var Oper="<%=OperatorCode%>";
      var StrSql1="SELECT PopEdom FROM LXUser where UserCode='"+Oper+"' and usertype in('02','03')";
      var edom=easyExecSql(StrSql1);
      if(edom==null||edom.length==0||edom=="")
      {
          document.getElementsByName("affirm")[0].disabled =  true;
          document.getElementsByName("keep")[0].disabled =  true;
      }
  }

	/**
	 *查看用户的权限是不是最高级别的,如果是禁用提交上级
	 */
	function initUserCheck()
	{
      var Oper="<%=OperatorCode%>";
      var StrSql1="SELECT PopEdom FROM LXUser where UserCode='"+Oper+"'";
      var edom=easyExecSql(StrSql1);
      var StrSql2="select COUNT(*) FROM LXUser where PopEdom<'"+edom+"'";
      var count=easyExecSql(StrSql2);
      if(count=="0"||count=='0'||count==0)
      {
          try
          {
              document.getElementsByName("upgrade")[0].disabled =  true;
          }
          catch(ex)
          {
              alert(ex);
          }
      }
      else
      {
      }
	}

  /**
   * 可选报文队列 MultiLine 的初始化
   */
  function initWaitForBeFileGrid()
  {
      var iArray = new Array();                           //总数组, 返回给 MultiLine 表格

      try
      {
           iArray[0] = new Array();
          iArray[0][0] = "序号";                          //列名(顺序号, 无意义)
          iArray[0][1] = "30px";                          //列宽
          iArray[0][2] = 30;                              //列最大值
          iArray[0][3] = 0;                               //是否允许输入: 0表示不允许; 1表示允许。

          iArray[1] = new Array();
          iArray[1][0] = "交易编号";
          iArray[1][1] = "110px";
          iArray[1][2] = 150;
          iArray[1][3] = 0;

          iArray[2] = new Array();
          iArray[2][0] = "可疑特征";
          iArray[2][1] = "60px";
          iArray[2][2] = 100;
          iArray[2][3] = 2;
          iArray[2][4] = "amlshadinessstamp";

          iArray[3] = new Array();
          iArray[3][0] = "可疑程度";
          iArray[3][1] = "60px";
          iArray[3][2] = 100;
          iArray[3][3] = 2;
          iArray[3][4] = "amlshadiness";

          iArray[4] = new Array();
          iArray[4][0] = "客户号";
          iArray[4][1] = "60px";
          iArray[4][2] = 100;
          iArray[4][3] = 0;

          iArray[5] = new Array();
          iArray[5][0] = "客户名";
          iArray[5][1] = "60px";
          iArray[5][2] = 100;
          iArray[5][3] = 0;

          iArray[6] = new Array();
          iArray[6][0] = "数据状态";
          iArray[6][1] = "0px";
          iArray[6][2] = 0;
          iArray[6][3] = 3;

          iArray[7] = new Array();
          iArray[7][0] = "数据状态";
          iArray[7][1] = "0px";
          iArray[7][2] = 0;
          iArray[7][3] = 3;

          iArray[8] = new Array();
          iArray[8][0] = "证件号码";
          iArray[8][1] = "70px";
          iArray[8][2] = 150;
          iArray[8][3] = 0;

          iArray[9] = new Array();
          iArray[9][0] = "交易日期";
          iArray[9][1] = "60px";
          iArray[9][2] = 100;
          iArray[9][3] = 0;
          iArray[9][21] = 3;

          iArray[10] = new Array();
          iArray[10][0] = "交易时间";
          iArray[10][1] = "0px";
          iArray[10][2] = 0;
          iArray[10][3] = 3;
          iArray[10][21] = 3;

          iArray[11] = new Array();
          iArray[11][0] = "操作员";
          iArray[11][1] = "60px";
          iArray[11][2] = 100;
          iArray[11][3] = 0;

          iArray[12] = new Array();
          iArray[12][0] = "规则信息";
          iArray[12][1] = "100px";
          iArray[12][2] = 800;
          iArray[12][3] = 0;

      }
      catch (ex)
      {
          alert("在 LXISAuditInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化数组错误！");
      }

      try
      {
          WaitForBeFileGrid = new MulLineEnter("fm", "WaitForBeFileGrid");
          WaitForBeFileGrid.mulLineCount = 3;
          WaitForBeFileGrid.displayTitle = 1;
          WaitForBeFileGrid.locked = 1;
          WaitForBeFileGrid.hiddenPlus = 1;
          WaitForBeFileGrid.hiddenSubtraction = 1;
          WaitForBeFileGrid.canChk = 0;
          WaitForBeFileGrid.canSel = 1;
          WaitForBeFileGrid.chkBoxEventFuncName = "";
          WaitForBeFileGrid.selBoxEventFuncName = "";
          //上面属性必须在 MulLineEnter loadMulLine 之前
          WaitForBeFileGrid.loadMulLine(iArray);
      }
      catch (ex)
      {
          alert("在 LXISAuditInit.jsp --> initWaitForBeFileGrid 函数中发生异常: 初始化界面错误！");
      }
  }


 </script>
 <!-- 调用 JSP Init 初始化页面 : 结束 -->

