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
  LargeTradeReSentToXmlUI tLargeTradeReSentToXmlUI = new LargeTradeReSentToXmlUI();
  LXIHTradeMainSet tLXIHTradeMainSet=new LXIHTradeMainSet();
  LXIHTradeMainSchema tLXIHTradeMainSchema=new LXIHTradeMainSchema();
  LXIHTradeMainDB tLXIHTradeMainDB=new LXIHTradeMainDB();
  LXIHTradeDetailDB tLXIHTradeDetailDB = new LXIHTradeDetailDB();
  LXIHTradeDetailSet tLXIHTradeDetailSet = new LXIHTradeDetailSet(); 
  TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck();
  String dealType=request.getParameter("type");

  CErrors tErrors = null;
         
  String FlagStr = "Succ";
  String Content = "";
  String tOperate="";
	GlobalInput tG = new GlobalInput();
	String sXMLSavePath = application.getRealPath("/").replace('\\', '/');
    if (sXMLSavePath != null && !sXMLSavePath.endsWith("/"))
    {
        sXMLSavePath += "/";
    }
         sXMLSavePath += "aml/send/";
	AntiInit.filePath=sXMLSavePath;
	AntiInit.packagePath=sXMLSavePath;
    tG=(GlobalInput)session.getValue("GI");
    VData tVData = new VData();
  if(dealType.equals("applyFileNo"))
  {
  	String tDataType=request.getParameter("dataType");
  	String tReportType=request.getParameter("reportType");
  	System.out.println("dataType:"+tDataType);
  	System.out.println("tReportType:"+tReportType);
  	tVData =new VData();
  	tVData.add(tG);
  	tVData.add(tDataType);
  	tVData.add(tReportType);
  	tOperate=dealType;
  }

  if(dealType.equals("MakeAllInFileMsg"))
  {
  	//  String tFileNo=request.getParameter("FileNo");
  	  int lineCount = 0;
	  String tChk[] = request.getParameterValues("InpWaitForBeFileGridChk"); 
	  String arrCount[] = request.getParameterValues("WaitForBeFileGridNo");
	  String tDealNo[] = request.getParameterValues("WaitForBeFileGrid1");
	  lineCount = arrCount.length; 
	  for(int i=0;i<lineCount;i++)
	  { 
	   	  if(tChk[i].equals("1"))
	  	  {
	  	      tLXIHTradeMainDB.setDealNo(tDealNo[i]);
		      tLXIHTradeMainSchema = tLXIHTradeMainDB.query().get(1);
		      tLXIHTradeMainSet.add(tLXIHTradeMainSchema);
		      //�����˶��ֶ����ݵ�У�� modify by huangchong
		      if (!tTradeInfoCheck.checkInfo(tLXIHTradeMainSchema)) 
		      {
		          FlagStr = "Fail";
		          Content = "���׺�Ϊ" + tLXIHTradeMainSchema.getDealNo() + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      //end
	  	  }
      }
	  System.out.println("FlagStr1========"+FlagStr);
      for(int i=0;i<lineCount;i++)
      {
          if(tChk[i].equals("1"))
	  	  {
	  	      tLXIHTradeDetailDB.setDealNo(tDealNo[i]);
	  	    LXIHTradeDetailSchema tLXIHTradeDetailSchema = tLXIHTradeDetailDB.query().get(1);
		      for(int j=0;j<tLXIHTradeDetailSet.size();j++){
		      //���Ӷ��ֶ����ݵ�У�� modify by huangchong
		      if (!tTradeInfoCheck.checkInfo(tLXIHTradeDetailSchema))
		      {
		          FlagStr = "Fail";
		          Content = "���׺�Ϊ" + tLXIHTradeDetailSchema.getDealNo() + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      //end
	  	  }
	  	  }
      }
      System.out.println("FlagStr2========"+FlagStr);
  	  tVData =new VData();
  	  tVData.add(tG);
  	 // tVData.add(tFileNo);
  	  tVData.add(tLXIHTradeMainSet);
  	  tOperate=dealType;

  }

  if(dealType.equals("DeleteInFileMsg"))
  {
      String tFileNo=request.getParameter("FileNo");
  	  int lineCount = 0;
	  String tChk[] = request.getParameterValues("InpAlreadyInFileGridChk"); 
	  String arrCount[] = request.getParameterValues("AlreadyInFileGridNo");
	  String tDealNo[] = request.getParameterValues("AlreadyInFileGrid1");
	  lineCount = arrCount.length; 
	  System.out.println("for:"+lineCount);
	  for(int i=0;i<lineCount;i++)
	  { 
	   	if(tChk[i].equals("1"))
	  	{
		    	tLXIHTradeMainSchema = new LXIHTradeMainSchema();
		    	tLXIHTradeMainSchema.setDealNo(tDealNo[i]);
		 		tLXIHTradeMainSet.add(tLXIHTradeMainSchema);
	  	}

	  }
  	tVData =new VData();
  	tVData.add(tG);
  	tVData.add(tFileNo);
  	tVData.add(tLXIHTradeMainSet);
  	tOperate=dealType;

  }
  

  
  
    if (!FlagStr.equals("Fail"))
    {
        try
        {
            tLargeTradeReSentToXmlUI.submitData(tVData, tOperate);
        }
        catch(Exception ex)
        {
            Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
            FlagStr = "Fail";
        }
        if (!FlagStr.equals("Fail"))
        {
            tErrors = tLargeTradeToXmlUI.mErrors;
            if (!tErrors.needDealError())
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
    	        Content = " ����ʧ�ܣ�ԭ����:" + tErrors.getFirstError();
    	        FlagStr = "Fail";
            }
        }
    }
%>                      
<html>
<script language="javascript">
        <!--�޸��˳�����Ϣ�ķ��ط�ʽ��modify by huangchong-->
	parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>