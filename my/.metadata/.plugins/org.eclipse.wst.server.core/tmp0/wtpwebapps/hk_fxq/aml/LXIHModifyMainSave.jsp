<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%  String FlagStr = "Succ";
    String Content = "";
    CErrors tErrors=new CErrors();
    GlobalInput tG = new GlobalInput();
    tG=(GlobalInput)session.getValue("GI");
    String dealno = request.getParameter("dealno");
    String datastate=request.getParameter("datastate");
        
    VData sVData = new VData();
    //更新LXIHTradeMain，更新lxreporttotrade相应状态
    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("DealNo", dealno);
    tTransferData.setNameAndValue("DataState", datastate);
    sVData.add(tG);
    sVData.add(tTransferData);
            
    System.out.println("==========datastate========="+datastate);
    if(datastate.equals("SendOut")||datastate.equals("Submit"))
    {
    	SendOut_Submit_Deal tSendOut_Submit_Deal = new SendOut_Submit_Deal();
    	if(!tSendOut_Submit_Deal.submitData(sVData, datastate))
    	{
    		tErrors.copyAllErrors(tSendOut_Submit_Deal.getErrors());
    	}
    }
    else
  	{
       AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
	     if (!tAMLWorkFlowUI.submitData(sVData, "0000009109"))
	     {
		     tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
	     }
	     tAMLWorkFlowUI = null;
  	}    


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