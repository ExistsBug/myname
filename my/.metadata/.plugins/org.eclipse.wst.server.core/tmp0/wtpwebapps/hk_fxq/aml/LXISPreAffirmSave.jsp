<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%@page import="com.sinosoft.lis.db.*"%>
<%
    String FlagStr = "Succ";
    String Content = "";
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
        tTransferData.setNameAndValue("DataState", "Z23");
    }
    else if (oper.trim().equalsIgnoreCase("keep"))
    {
        tTransferData.setNameAndValue("DataState", "09");
    }
    sVData.add(tG);
    sVData.add(tTransferData);
    
    LXISTradeMainDB tLXISTradeMainDB=new LXISTradeMainDB();
    tLXISTradeMainDB.setDealNo(dealno);
    if(!tLXISTradeMainDB.getInfo())
    {
        FlagStr = "Fail";
    }
    sVData.add(tLXISTradeMainDB.getSchema());
    
    AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
    if (!tAMLWorkFlowUI.submitData(sVData, "0000009213"))
    {
        tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
    }
    tAMLWorkFlowUI = null;

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