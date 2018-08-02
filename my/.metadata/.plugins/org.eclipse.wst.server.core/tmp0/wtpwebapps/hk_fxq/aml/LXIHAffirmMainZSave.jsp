<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.workflow.aml.*" %>
<%@page import="com.sinosoft.lis.db.*"%>
<%
    String FlagStr = "Succ";
    String Content = "";
    String updatestate="";
    CErrors tErrors = new CErrors();
    VData sVData = new VData();
    String dealno=request.getParameter("dealno");
    String datastate=request.getParameter("datastate");
    String oper=request.getParameter("oper");
    GlobalInput tG = new GlobalInput();
    tG=(GlobalInput)session.getValue("GI");
    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("DealNo", dealno);
    tTransferData.setNameAndValue("DataState1", datastate);
    tTransferData.setNameAndValue("Oper", oper);
    
  
    if (oper == null || oper.trim().equals(""))
    {
        tTransferData.setNameAndValue("DataState", "");
    }
    else if (oper.trim().equalsIgnoreCase("upgrade"))
    {
        tTransferData.setNameAndValue("DataState", "00");
    }
    else if (oper.trim().equalsIgnoreCase("affirm"))
    {
        tTransferData.setNameAndValue("DataState", "01");
        updatestate="01";
    }
    else if (oper.trim().equalsIgnoreCase("keep"))
    {
        tTransferData.setNameAndValue("DataState", "09");
        updatestate="09";
    }
   // sVData.add(tG);
   // sVData.add(tTransferData);
   // LXIHTradeMainDB tLXIHTradeMainDB=new LXIHTradeMainDB();
   // tLXIHTradeMainDB.setDealNo(dealno);
   // if(!tLXIHTradeMainDB.getInfo())
   // {
   //     FlagStr = "Fail";
   // }
   // sVData.add(tLXIHTradeMainDB.getSchema());
  //  AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
  //      if (!tAMLWorkFlowUI.submitData(sVData, "0000009113"))
  //      {
  //          tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
  //      }
  //  tAMLWorkFlowUI = null;
    
	//更新数据状态
	ExeSQL tExeSQL = new ExeSQL();
	tExeSQL.execUpdateSQL("update lxihtrademain set datastate = 'S"+updatestate+"' where dealno = '" + dealno + "'");	

          //页面反馈信息
    if (!tErrors.needDealError())
    {
        FlagStr = "Success";
        Content = "保存成功！";
    }
    else
    {
        FlagStr = "Fail";
        Content = "保存失败，原因是：" + tErrors.getFirstError();
    }
    tErrors = null;

%>
<html>
    <script language="javascript">
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>');
</script>
</html>