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
        // add by jinsh �������¼ӵ�
        if(dealType.equals("AddToInFileMsg"))
        {
		        //�������ҵ�ѡ�˶��ٽ�����Ϣ,Ȼ�������ļ���,Ȼ�����ɱ���
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
						        //�����ļ���
						        String tDataType=request.getParameter("dataType");
						        String tReportType=request.getParameter("reportType");
						        System.out.println("dataType:"+tDataType);
						        System.out.println("tReportType:"+tReportType);
						        tVData =new VData();
						        tVData.add(tG);
						        tVData.add(tDataType);
						        tVData.add(tReportType);
						        tOperate="applyFileNo";
						        //�����ļ���
						        try
						        {
								        System.out.println("this will save the data!!!");
								        tLargeTradeToXmlUI.submitData(tVData, tOperate);
						        }
						        catch(Exception ex1)
						        {
								        Content = "����ʧ�ܣ�ԭ����:" + ex1.toString();
								        FlagStr = "Fail";
								        break;
						        }
						        String jFileNo = mExeSQL.getOneValue("select MAX(FileNo) from LXReportDataFile where DealState='00' and ReportType='01' and MakeDate='"+PubFun.getCurrentDate()+"' and Operator='"+tG.Operator+"'");
						        System.out.println("jFileNo="+jFileNo);
						        if(null==jFileNo||"".equals(jFileNo))
						        {
								        Content = "����ʧ�ܣ�ԭ����:�����ļ���ʧ��!";
								        FlagStr = "Fail";
								        break;
						        }
						        //�����ɵ��ļ�����ӽ���
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
								        Content = "����ʧ�ܣ�ԭ����:" + ex2.toString();
								        FlagStr = "Fail";
								        break;
						        }
						        //�����ɵ��ļ�����ӽ���
						        //���ɱ���
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
								        Content = "����ʧ�ܣ�ԭ����:" + ex3.toString();
								        FlagStr = "Fail";
										   	ExeSQL jjExeSQL = new ExeSQL();
										    jjExeSQL.execUpdateSQL("update LWMission set ActivityID = '0000009102' where 1 = 1 and MissionProp3 = '"+temptDealNo+"'");
										    jjExeSQL.execUpdateSQL("delete from LXReportDetail where FileNo='"+jFileNo+"'");
										    jjExeSQL.execUpdateSQL("delete from LXReportDataFile where FileNo='"+jFileNo+"'");
								        break;
						        }
						        dealType = "AddToInFileMsg";
		        				//���ɱ���
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
    parent.fraInterface.afterSubmit("<%=FlagStr%>", "<%=Content%>");
</script>
</html>