<%
//�������ƣ�ReportOMRInput.jsp
//�����ܣ�
//�������ڣ�2006-03-17
//������ ��simon
//���¼�¼�� ������  ��������   ����ԭ��/����
%>
<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%  
	String FlagStr = "Succ";
    String Content = "";
    VData sVData = new VData();
    MMap mapDel = new MMap();
	CErrors tErrors=new CErrors();
	GlobalInput tG = new GlobalInput();
    tG=(GlobalInput)session.getValue("GI");
    String tChk[] = request.getParameterValues("InpWaitForBeFileGridChk"); 
    String tGrid1[] = request.getParameterValues("WaitForBeFileGrid1"); //�õ���1�е�����ֵ

	for(int index=0;index<tChk.length;index++)
	{
		if(tChk[index].equals("1")) 
		{
			mapDel=new MMap();         
			mapDel.put("update LXIHTradeMain set datastate = 'C04' where dealno = '" + tGrid1 [index] + "'", "UPDATE");
			TransferData tTransferData = new TransferData();
			tTransferData.setNameAndValue("DealNo", tGrid1 [index]);
			tTransferData.setNameAndValue("DataState", "04");
			sVData =  new VData();
			sVData.add(tTransferData);
			sVData.add(tG);
			sVData.add(mapDel);			
			AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
			if (!tAMLWorkFlowUI.submitData(sVData, "0000009107"))
			{
				tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
			}
			tAMLWorkFlowUI = null;
		}  
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