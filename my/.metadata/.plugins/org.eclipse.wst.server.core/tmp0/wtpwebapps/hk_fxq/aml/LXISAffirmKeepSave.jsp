<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%@page import="com.sinosoft.lis.db.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%
    String FlagStr = "succ";
    String Content = "";
    CErrors tErrors = new CErrors();
    VData sVData = new VData();
    String dealno=request.getParameter("dealno");
    String datastate=request.getParameter("datastate");
    String oper=request.getParameter("oper");
    GlobalInput tG = new GlobalInput();
    tG=(GlobalInput)session.getValue("GI");
    TransferData tTransferData = new TransferData();  
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
    }
    else if (oper.trim().equalsIgnoreCase("keep"))
    {
        tTransferData.setNameAndValue("DataState", "09");
    }

    TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
    
    String arrGridChk[] = request.getParameterValues("InpWaitForBeFileGridChk");
    String arrGridNo[]  = request.getParameterValues("WaitForBeFileGrid1");
    int n = arrGridChk.length;
    for (int i = 0; i < n; i++)
    {
        if (arrGridChk[i].equals("1"))
        {
        	String tDealNo = arrGridNo[i];
        	System.out.println("===== tDealNo ====="+tDealNo);
        	System.out.println("====+ oper in refer+===="+oper.trim());
					LXISTradeMainDB tLXISTradeMainDB=new LXISTradeMainDB();
					tLXISTradeMainDB.setDealNo(tDealNo);
					if(!tLXISTradeMainDB.getInfo())
					{
					    FlagStr = "fail";
					    tErrors.addOneError("没有查到"+tDealNo+"交易信息！");
					    break;
					}
					sVData.clear();
					tTransferData.removeByName("DealNo");
					tTransferData.setNameAndValue("DealNo", tDealNo);    
			    sVData.add(tG);
			    sVData.add(tTransferData);
					sVData.add(tLXISTradeMainDB.getSchema());
			    AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
			    if (!tAMLWorkFlowUI.submitData(sVData, "0000009202"))
			    {
			        tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
			        break;
			    }
			    tAMLWorkFlowUI = null; 
        }
    }
    System.out.println("===== FlagStr ====="+FlagStr);

          //页面反馈信息
    if (!tErrors.needDealError())
    {
        FlagStr = "success";
        Content = "保存成功！";
    }
    else
    {
        FlagStr = "fail";
        Content = "保存失败，原因是："+ Content + tErrors.getFirstError();
    }
    tErrors = null;
%>
<html>
    <script language="javascript">
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>','');
</script>
</html>