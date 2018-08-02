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
       Content = "保存失败，原因是:" + ex.toString();
       FlagStr = "Fail";
    }
  
  if (!FlagStr.equals("Fail"))
  {
    tError = tBDLargeTradeToXmlUI.mErrors;
    if (!tError.needDealError())
    {
    	if(tOperate.equals("applyFileNo"))
    	{
    		Content = " 申请成功! ";
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
	parent.fraInterface.bdafterSubmit("<%=FlagStr%>","<%=Content%>","<%=fileNo%>");
</script>
</html>