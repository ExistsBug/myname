<%@include file="../common/jsp/UsrCheck.jsp"%>
<%
//程序名称：AgentAssessSave.jsp
//程序功能：
//创建日期：2002-11-21 
//创建人  ：
//更新记录：  更新人    更新日期     更新原因/内容
%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.db.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page contentType="text/html;charset=GBK" %>
<%
  LargeTradeToPackageUI tLargeTradeToPackageUI = new LargeTradeToPackageUI();
  LXReportDataFileSet tLXReportDataFileSet=new LXReportDataFileSet();
  LXReportDataFileSchema tLXReportDataFileSchema=new LXReportDataFileSchema();
  LXReportDataFileDB tLXReportDataFileDB=new LXReportDataFileDB();
  String dealType=request.getParameter("type");

  CErrors tError = null;
  AntiInit.filePath=application.getRealPath("/").replace('\\', '/') + "aml/send/";
	AntiInit.packagePath=application.getRealPath("/").replace('\\', '/') + "aml/send/";       
  String FlagStr = "";
  String Content = "";
  String tOperate="";
	GlobalInput tG = new GlobalInput();

  tG=(GlobalInput)session.getValue("GI");
  VData tVData = new VData();
  if(dealType.equals("applyPackageNo"))
  {
    System.out.println("in applyPackageNo");
  	String tDataType=request.getParameter("dataType");
  	String tReportType=request.getParameter("reportType");
  	String tNPackageNo=request.getParameter("nPackageNo");
  	session.setAttribute("npackageno",tNPackageNo);
  	System.out.println("dataType:"+tDataType);
  	System.out.println("tReportType:"+tReportType);
  	tVData =new VData();
  	tVData.add(tG);
  	tVData.add(tDataType);
  	tVData.add(tReportType);
  	tVData.add(tNPackageNo);
  	tOperate=dealType;
  	
  }

  if(dealType.equals("AddToInFileMsg"))
  {

  	String tPackageNo=request.getParameter("PackageNo");
  	int lineCount = 0;
	  String tChk[] = request.getParameterValues("InpWaitForBeFileGridChk"); 
	  String arrCount[] = request.getParameterValues("WaitForBeFileGridNo");
	  String tFileNo[] = request.getParameterValues("WaitForBeFileGrid1");
	  lineCount = arrCount.length; 
	  System.out.println("for:"+lineCount);
	  for(int i=0;i<lineCount;i++)
	  { 
	   	if(tChk[i].equals("1"))
	  	{
		    	tLXReportDataFileSchema = new LXReportDataFileSchema();
		    	tLXReportDataFileSchema.setFileNo(tFileNo[i]);
		 			tLXReportDataFileSet.add(tLXReportDataFileSchema);
	  	}

	  }

  	tVData =new VData();
  	tVData.add(tG);
  	tVData.add(tPackageNo);
  	tVData.add(tLXReportDataFileSet);
  	tOperate=dealType;

  }

  if(dealType.equals("DeleteInFileMsg"))
  {

  	String tPackageNo=request.getParameter("PackageNo");
  	int lineCount = 0;
	  String tChk[] = request.getParameterValues("InpAlreadyInFileGridChk"); 
	  String arrCount[] = request.getParameterValues("AlreadyInFileGridNo");
	  String tFileNo[] = request.getParameterValues("AlreadyInFileGrid1");
	  lineCount = arrCount.length; 
	  System.out.println("for:"+lineCount);
	  for(int i=0;i<lineCount;i++)
	  { 
	   	if(tChk[i].equals("1"))
	  	{
		    	tLXReportDataFileSchema = new LXReportDataFileSchema();
		    	tLXReportDataFileSchema.setFileNo(tFileNo[i]);
		 			tLXReportDataFileSet.add(tLXReportDataFileSchema);
	  	}

	  }
  	tVData =new VData();
  	tVData.add(tG);
  	tVData.add(tPackageNo);
  	tVData.add(tLXReportDataFileSet);
  	tOperate=dealType;

  }
  
  if(dealType.equals("MakeAllInFileMsg"))
  {

  	String tPackageNo=request.getParameter("PackageNo");
  	tVData =new VData();
  	tVData.add(tG);
  	tVData.add(tPackageNo);
  	tOperate=dealType;

  }
  
  
		String packagePath="";
		String rPackageNo="";
    try
    {
      System.out.println("this will save the data!!!");
      tLargeTradeToPackageUI.submitData(tVData, tOperate);
      packagePath=tLargeTradeToPackageUI.packagePath;
      rPackageNo=tLargeTradeToPackageUI.rPackageNo;
      session.setAttribute("rpackageno",rPackageNo);
    }
    catch(Exception ex)
    {
       Content = "保存失败，原因是:" + ex.toString();
       FlagStr = "Fail";
    }
  System.out.println("packagePath : "+packagePath);
  if (!FlagStr.equals("Fail"))
  {
    tError = tLargeTradeToPackageUI.mErrors;
    if (!tError.needDealError())
    {
    	if(tOperate.equals("applyFileNo"))
    	{
    		Content = " 保存成功! ";
    	}
    else
    	{
    		Content = " 保存成功! ";
    	}                          
    	
    	FlagStr = "Succ";
    }
    else                                                                           
    {
    	Content = " 保存失败，原因是:" + tError.getFirstError();
    	FlagStr = "Fail";
    }
  }
%>                      
<html>
<script language="javascript">
	parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>","<%=packagePath%>","<%=rPackageNo%>");
</script>
</html>