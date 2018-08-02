<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.vschema.*" %>
<%@ page import="com.sinosoft.utility.*" %>
<%@ page import="com.sinosoft.workflow.aml.*" %>


<%
    //�������ݱ���
    String sFileNo = request.getParameter("FileNo");
    String sCorrectFileNo = new String("");
    String sDataType = request.getParameter("DataType");
    String sOperation = request.getParameter("Operation");
    String arrGridChk1[] = request.getParameterValues("InpWaitForBeFileGridChk");
    String arrDealNo1[] = request.getParameterValues("WaitForBeFileGrid1");
    String arrGridChk2[] = request.getParameterValues("InpAlreadyInFileGridChk");
    String arrDealNo2[] = request.getParameterValues("AlreadyInFileGrid1");
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();
    TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck();

    //�ļ�·����Ϣ
    String sXMLSavePath = application.getRealPath("/").replace('\\', '/');
    if (sXMLSavePath != null && !sXMLSavePath.endsWith("/"))
    {
        sXMLSavePath += "/";
    }
    sXMLSavePath += "aml/send/";

    //�ռ���������
    //GlobalInput
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    //TransferData
    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("DataType", sDataType);
    tTransferData.setNameAndValue("XMLSavePath", sXMLSavePath);
    //VData
    

    //DataState
    //if (sOperation != null && sOperation.trim().equalsIgnoreCase("MakeAllInFileMsg"))
    //{
    //    tTransferData.setNameAndValue("DataState", "11");
    //}
    //else if (sOperation != null && sOperation.trim().equalsIgnoreCase("DeleteInFileMsg"))
    //{
    //    tTransferData.setNameAndValue("DataState", "12");
    //}
    

    //LXISTradeMainSet

    LXISTradeMainSet tLXISTradeMainSet = new LXISTradeMainSet();
    for (int i = 0; i < arrGridChk1.length; i++)
    {
        if (arrGridChk1[i].equals("1"))
        {
            LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
            tLXISTradeMainSchema.setDealNo(arrDealNo1[i]);
            tLXISTradeMainSet.add(tLXISTradeMainSchema);
            if (!tTradeInfoCheck.checkInfo(arrDealNo1[i]))
		    {  
		        FlagStr = "Fail";
		        Content = "���׺�Ϊ" + arrDealNo1[i] + tTradeInfoCheck.mErrors.getErrContent();
		    }
            tLXISTradeMainSchema = null;
        }
    }

    if (sOperation != null && sOperation.trim().equalsIgnoreCase("DeleteInFileMsg") && arrGridChk2 != null)
    {
        LXReportDetailSet tLXReportDetailSet = new LXReportDetailSet();
        for (int i = 0; i < arrGridChk2.length; i++)
        {
            if (arrGridChk2[i].equals("1"))
            {
                LXReportDetailSchema tLXReportDetailSchema = new LXReportDetailSchema();
                tLXReportDetailSchema.setFileNo(sFileNo);
                tLXReportDetailSchema.setDealNo(arrDealNo2[i]);
                tLXReportDetailSet.add(tLXReportDetailSchema);
                tLXReportDetailSchema = null;
            }
        }
    }

    //��̨������


    if (!FlagStr.equals("Fail"))
    {
        
        for (int i = 1; i <= tLXISTradeMainSet.size(); i++)
        {
            DubitMsgMakeDealBL tDubitMsgMakeDealBL = new DubitMsgMakeDealBL();
            VData tVData = new VData();
            sFileNo = PubFun1.CreateMaxNo("AntiFileNo", 20);
            tTransferData.setNameAndValue("FileNo", sFileNo);
            tVData.add(tLXISTradeMainSet.get(i));
            tVData.add(tGlobalInput);
            tVData.add(tTransferData); 
            if (!tDubitMsgMakeDealBL.submitData(tVData, sOperation))
            {
                tErrors.copyAllErrors(tDubitMsgMakeDealBL.getErrors());
            }
            if (sDataType != null && sDataType.trim().equals("02"))
            {
                sCorrectFileNo = tDubitMsgMakeDealBL.getCorrectFileNo();
            }

            //ҳ�淴����Ϣ
            if (!tErrors.needDealError())
            {
                FlagStr = "Success";
                Content = "����ɹ���";
                tTransferData.removeByName("FileNo");
            }
            else
            {
                FlagStr = "Fail";
                Content = "����ʧ�ܣ�ԭ���ǣ�" + tErrors.getFirstError();
            }
         }
         tErrors = null;
     }
%>


<html>
    <script language="JavaScript">
        try
        {
            parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=(Content.replaceAll("\"","")).replaceAll("\n","")%>', '<%=sCorrectFileNo%>');
        }
        catch (ex)
        {
            alert('<%=(Content.replaceAll("\"","")).replaceAll("\n","")%>');
        }
    </script>
</html>
