<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK" %>
<%
//程序名称：RiskCustomerSave.jsp
//程序功能：
//创建日期：2003-06-24
//创建人  ：
//更新记录：  更新人    更新日期     更新原因/内容
%>
<!--用户校验类-->
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="java.text.SimpleDateFormat"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
<%
  //接收信息，并作校验处理。
  //输入参数
  System.out.println("进入SAVE页面");
  RiskCustomerUI tRiskCustomerUI = new RiskCustomerUI();

  //输出参数
  CErrors tError = null;           
  String FlagStr = "Fail";
  String Content = "";
  GlobalInput tG = new GlobalInput();
  tG=(GlobalInput)session.getValue("GI");
  String startDate="";
  String endDate="";
  String backDate="";
   VData tVData = new VData();
  	tVData.add(tG);

  FlagStr="";

  try
  {
    tRiskCustomerUI.submitData(tVData,"");
  }
  catch(Exception ex)
  {
    Content = "操作失败，原因是:" + ex.toString();
    FlagStr = "Fail";
  }
  
  if (!FlagStr.equals("Fail"))
  {
    tError = tRiskCustomerUI.mErrors;
    if (!tError.needDealError())
    {                          
       Content = " 操作成功! ";
       FlagStr = "Succ";
    }
    else                                                                           
    {
       Content = " 操作失败，原因是:" + tError.getFirstError();
       FlagStr = "Fail";
    }
  }

%>
<html>
<script language="javascript">
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>

</html>

