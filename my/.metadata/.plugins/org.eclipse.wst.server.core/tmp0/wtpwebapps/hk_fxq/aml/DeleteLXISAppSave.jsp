<%
//程序名称：ReportOMRInput.jsp
//程序功能：
//创建日期：2006-03-17
//创建人 ：simon
//更新记录： 更新人  更新日期   更新原因/内容
%>
<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.VData"%>
<%@page import="com.sinosoft.utility.CErrors"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%  String FlagStr = "Succ";
    String Content = "";
    VData sVData = new VData();
    MMap mapDel = new MMap();
		ArrayList list = new ArrayList();
		CErrors tErrors=new CErrors();
		GlobalInput tG = new GlobalInput();
    tG=(GlobalInput)session.getValue("GI");
    String tChk[] = request.getParameterValues("InpWaitForBeFileGridChk"); 
    String tGrid1[] = request.getParameterValues("WaitForBeFileGrid1"); //得到第1列的所有值

        for(int index=0;index<tChk.length;index++)
        {
          if(tChk[index].equals("1")) 
          {     
             mapDel.put("update LXISTradeMain set datastate = 'D01' where dealno = '" + tGrid1 [index] + "'", "UPDATE");
             sVData.add(mapDel);
							TransferData tTransferData = new TransferData();
							tTransferData.setNameAndValue("DealNo", tGrid1 [index]);
							sVData.add(tTransferData);
							sVData.add(tG);
							AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
					        if (!tAMLWorkFlowUI.submitData(sVData, "0000009207"))
					        {
					            tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
					        }
					        tAMLWorkFlowUI = null;
           }  
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