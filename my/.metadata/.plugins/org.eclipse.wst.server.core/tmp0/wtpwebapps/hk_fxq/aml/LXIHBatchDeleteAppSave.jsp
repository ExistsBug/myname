<%@include file="../common/jsp/UsrCheck.jsp"%>
<%
//�������ƣ�AgentAssessSave.jsp
//�����ܣ�
//�������ڣ�2002-11-21 
//������  ��
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.db.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page contentType="text/html;charset=GBK" %>
<%
  BDLargeTradeToXmlUI tBDLargeTradeToXmlUI = new BDLargeTradeToXmlUI();
  LXIHTradeMainSet tLXIHTradeMainSet=new LXIHTradeMainSet();
  LXIHTradeMainSchema tLXIHTradeMainSchema=new LXIHTradeMainSchema();
  LXIHTradeMainDB tLXIHTradeMainDB=new LXIHTradeMainDB();
  String dealType=request.getParameter("type");

  CErrors tError = null;
         
  String FlagStr = "";
  String Content = "";
  String tOperate="";
  String fileNo="";
	GlobalInput tG = new GlobalInput();
	AntiInit.filePath=application.getRealPath("/").replace('\\', '/') + "aml/send/";
	AntiInit.packagePath=application.getRealPath("/").replace('\\', '/') + "aml/send/";
  tG=(GlobalInput)session.getValue("GI");
  String tHTDT=request.getParameter("StartDate");
  String tDataType="04";
  String tReportType="01";
  VData tVData = new VData();
  tVData.add(tG);
  tVData.add(tDataType);
  tVData.add(tReportType);
  tVData.add(tHTDT);
  
  
  

    try
    {
      System.out.println("this will save the data!!!");
      tBDLargeTradeToXmlUI.submitData(tVData, tOperate);
      fileNo=tBDLargeTradeToXmlUI.fileNo;
    }
    catch(Exception ex)
    {
       Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
       FlagStr = "Fail";
    }
  
  if (!FlagStr.equals("Fail"))
  {
    tError = tBDLargeTradeToXmlUI.mErrors;
    if (!tError.needDealError())
    {
    	if(tOperate.equals("applyFileNo"))
    	{
    		Content = " ����ɹ�! ";
    	}
    else
    	{
    		Content = " ����ɹ�! ";
    	}                          
    	
    	FlagStr = "Succ";
    }
    else                                                                           
    {
    	Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
    	FlagStr = "Fail";
    }
  }
%>                      
<html>
<script language="javascript">
	parent.fraInterface.bdafterSubmit("<%=FlagStr%>","<%=Content%>","<%=fileNo%>");
</script>
</html>