<%
//�������ƣ�ReportOMRInput.jsp
//�����ܣ�
//�������ڣ�2006-03-17
//������ ��simon
//���¼�¼�� ������  ��������   ����ԭ��/����
%>
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
    String dealno=request.getParameter("dealno");
     String datastate=request.getParameter("datastate");
    VData sVData = new VData();
    MMap mapDel = new MMap();
	//mapDel.put("update lxistrademain set DataState='C01' where dealno='" + dealno + "' ", "UPDATE");
	//mapDel.put("update lxreporttotrade set state = '1' where dealno = '" + dealno + "' ", "UPDATE"); 
	//sVData.add(mapDel);
    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("DealNo", dealno);
    tTransferData.setNameAndValue("DataState", datastate);
    sVData.add(dealno);
    sVData.add(datastate);
    sVData.add(tG);
    sVData.add(tTransferData);

    System.out.println("==========datastate========="+datastate);
    if(datastate.equals("SendOut")||datastate.equals("Submit"))
    {
    	ExeSQL tExeSQL = new ExeSQL();
    	tExeSQL.execUpdateSQL("update lxistrademain set  DataState='C01' where dealno = '" + dealno + "'");	
    	tExeSQL.execUpdateSQL("update lxreporttotrade set state = '1' where dealno = '" + dealno + "'");	

    	SendOut_Submit_Deal tSendOut_Submit_Deal = new SendOut_Submit_Deal();
    	if(!tSendOut_Submit_Deal.submitData(sVData, datastate))
    	{
    		tErrors.copyAllErrors(tSendOut_Submit_Deal.getErrors());
    	}
    }
    else
  	{
		 //   AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
		 //   if (!tAMLWorkFlowUI.submitData(sVData, "0000009209"))
		 //   {
		//		    tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
		//	   }
		//	   tAMLWorkFlowUI = null;
  	}



		  //ҳ�淴����Ϣ
    if (!tErrors.needDealError())
    {
        FlagStr = "Success";
        Content = "����ɹ���";
    }
    else
    {
        FlagStr = "Fail";
        Content = "����ʧ�ܣ�ԭ���ǣ�" + tErrors.getFirstError();
    }
    tErrors = null;

%>
<html>
	<script language="javascript">
	parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>');
</script>
</html>
