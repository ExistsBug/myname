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
        ExeSQL mExeSQL = new ExeSQL();
        LargeTradeToXmlUI tLargeTradeToXmlUI = new LargeTradeToXmlUI();
        LXIHTradeMainSet tLXIHTradeMainSet=new LXIHTradeMainSet();
        LXIHTradeMainSchema tLXIHTradeMainSchema=new LXIHTradeMainSchema();
        LXIHTradeMainDB tLXIHTradeMainDB=new LXIHTradeMainDB();
        String dealType=request.getParameter("type");
        String mFDRC = request.getParameter("FDRC");
				System.out.println("mFDRC============================"+mFDRC);
        CErrors tError = null;

        String FlagStr = "";
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

        if(dealType.equals("AddToInFileMsg3333"))
        {

        String tFileNo=request.getParameter("FileNo");
        int lineCount = 0;
        String tChk[] = request.getParameterValues("InpWaitForBeFileGridChk");
        String arrCount[] = request.getParameterValues("WaitForBeFileGridNo");
        String tDealNo[] = request.getParameterValues("WaitForBeFileGrid1");
        lineCount = arrCount.length;
        System.out.println("for:"+lineCount);
        for(int i=0;i<lineCount;i++)
        {
        if(tChk[i].equals("1"))
        {
        tLXIHTradeMainSchema = new LXIHTradeMainSchema();
        tLXIHTradeMainSchema.setDealNo(tDealNo[i]);
        System.out.println(tLXIHTradeMainSchema.getDealNo());
        tLXIHTradeMainSet.add(tLXIHTradeMainSchema);
        }

        }

        tVData =new VData();
        tVData.add(tG);
        tVData.add(tFileNo);
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
        if(dealType.equals("MakeAllInFileMsg"))
        {
        String tFileNo=request.getParameter("FileNo");
        tVData =new VData();
        tVData.add(tG);
        tVData.add(tFileNo);
        tOperate=dealType;
        }
        // add by jinsh 这里是新加的
        if(dealType.equals("AddToInFileMsg"))
        {
		        //首先是找到选了多少交易信息,然后申请文件号,然后生成报文
		        int lineCount = 0;
		        String tChk[] = request.getParameterValues("InpWaitForBeFileGridChk");
		        String arrCount[] = request.getParameterValues("WaitForBeFileGridNo");
		        String tDealNo[] = request.getParameterValues("WaitForBeFileGrid1");
		        lineCount = arrCount.length;
		        System.out.println("for000000000000000000000000:"+lineCount);
		        for(int i=0;i<lineCount;i++)
		        {
		        		if(tChk[i].equals("1"))
		        		{
						        String temptDealNo = tDealNo[i];
						        System.out.println("temptDealNo====================="+temptDealNo);
						        //申请文件号
						        String tDataType=request.getParameter("dataType");
						        String tReportType=request.getParameter("reportType");
						        System.out.println("dataType:"+tDataType);
						        System.out.println("tReportType:"+tReportType);
						        tVData =new VData();
						        tVData.add(tG);
						        tVData.add(tDataType);
						        tVData.add(tReportType);
						        tOperate="applyFileNo";
						        //申请文件号
						        try
						        {
								        System.out.println("this will save the data!!!");
								        tLargeTradeToXmlUI.submitData(tVData, tOperate);
						        }
						        catch(Exception ex1)
						        {
								        Content = "保存失败，原因是:" + ex1.toString();
								        FlagStr = "Fail";
								        break;
						        }
						        String jFileNo = mExeSQL.getOneValue("select MAX(FileNo) from LXReportDataFile where DealState='00' and ReportType='01' and MakeDate='"+PubFun.getCurrentDate()+"' and Operator='"+tG.Operator+"'");
						        System.out.println("jFileNo="+jFileNo);
						        if(null==jFileNo||"".equals(jFileNo))
						        {
								        Content = "保存失败，原因是:生成文件号失败!";
								        FlagStr = "Fail";
								        break;
						        }
						        //向生成的文件中添加交易
						        tLXIHTradeMainSchema = new LXIHTradeMainSchema();
						        tLXIHTradeMainSchema.setDealNo(temptDealNo);
						        System.out.println(tLXIHTradeMainSchema.getDealNo());
						        tLXIHTradeMainSet = new LXIHTradeMainSet();
						        tLXIHTradeMainSet.add(tLXIHTradeMainSchema);
						        tVData =new VData();
						        tVData.add(tG);
						        tVData.add(jFileNo);
						        tVData.add(tLXIHTradeMainSet);
						        tOperate="AddToInFileMsg";
						        try
						        {
								        System.out.println("this will save the data!!!");
								        tLargeTradeToXmlUI.submitData(tVData, tOperate);
						        }
						        catch(Exception ex2)
						        {
								        Content = "保存失败，原因是:" + ex2.toString();
								        FlagStr = "Fail";
								        break;
						        }
						        //向生成的文件中添加交易
						        //生成报文
						        tVData =new VData();
						        tVData.add(tG);
						        tVData.add(jFileNo);
						        if("FDRC".equals(mFDRC))
						        {
						        		tOperate="MakeAllInFileMsgFDRC";
						        }
						        else
						        {
						        		tOperate="MakeAllInFileMsg";
						        }
						        try
						        {
								        System.out.println("this will save the data!!!");
								        if(!tLargeTradeToXmlUI.submitData(tVData, tOperate))
						        		{
										        ExeSQL jjExeSQL = new ExeSQL();
										        jjExeSQL.execUpdateSQL("update LWMission set ActivityID = '0000009102' where 1 = 1 and MissionProp3 = '"+temptDealNo+"'");
										        jjExeSQL.execUpdateSQL("delete from LXReportDetail where FileNo='"+jFileNo+"'");
										        jjExeSQL.execUpdateSQL("delete from LXReportDataFile where FileNo='"+jFileNo+"'");
						        		}
						        }
						        catch(Exception ex3)
						        {
								        Content = "保存失败，原因是:" + ex3.toString();
								        FlagStr = "Fail";
										   	ExeSQL jjExeSQL = new ExeSQL();
										    jjExeSQL.execUpdateSQL("update LWMission set ActivityID = '0000009102' where 1 = 1 and MissionProp3 = '"+temptDealNo+"'");
										    jjExeSQL.execUpdateSQL("delete from LXReportDetail where FileNo='"+jFileNo+"'");
										    jjExeSQL.execUpdateSQL("delete from LXReportDataFile where FileNo='"+jFileNo+"'");
								        break;
						        }
						        dealType = "AddToInFileMsg";
		        				//生成报文
		        		}
		
		        }

        }


        if (!FlagStr.equals("Fail"))
        {
        tError = tLargeTradeToXmlUI.mErrors;
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
    parent.fraInterface.afterSubmit("<%=FlagStr%>", "<%=Content%>");
</script>
</html>