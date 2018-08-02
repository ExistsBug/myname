<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %><%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00, 1.01
 * @date     : 2007-07-12, 2007-07-26
 * @direction: 可疑交易报文文件生成提交保存
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
    //接收数据变量
    String sFileNo = request.getParameter("FileNo");
    String sCorrectFileNo = new String("");
    String sDataType = request.getParameter("DataType");
    String sOperation = request.getParameter("Operation");
    String arrGridChk1[] = request.getParameterValues("InpWaitForBeFileGridChk");
    String arrDealNo1[] = request.getParameterValues("WaitForBeFileGrid1");
    String arrGridChk2[] = request.getParameterValues("InpAlreadyInFileGridChk");
    String arrDealNo2[] = request.getParameterValues("AlreadyInFileGrid1");
    TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
     //后台处理标记
    String FlagStr = "Succ";
    String Content = "";
    CErrors tErrors = new CErrors();

    //文件路径信息
    String sXMLSavePath = application.getRealPath("/").replace('\\', '/');
    if (sXMLSavePath != null && !sXMLSavePath.endsWith("/"))
    {
        sXMLSavePath += "/";
    }
    sXMLSavePath += "aml/send/";

    //收集整理数据
    //GlobalInput
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    //TransferData
    TransferData tTransferData = new TransferData();

    tTransferData.setNameAndValue("DataType", sDataType);
    tTransferData.setNameAndValue("XMLSavePath", sXMLSavePath);
    LXISTradeMainSet tLXISTradeMainSet = new LXISTradeMainSet(); //改为全局变量 modify by huangchong
    LXReportDetailSet tLXReportDetailSet = new LXReportDetailSet();//改为全局变量 modify by huangchong
 
    //不在添加交易进报文时校验，而是生成报文时校验 modify by huangchong
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
		        Content = "交易号为" + arrDealNo1[i] + tTradeInfoCheck.mErrors.getErrContent();
		        break;
	    }
       }
   }


    //LXReportDetailSet
    if (sOperation != null && sOperation.trim().equalsIgnoreCase("DeleteInFileMsg") && arrGridChk2 != null)
    {
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

    if (!FlagStr.equals("Fail"))
    {
        //调用后台处理
        for (int i = 1; i <= tLXISTradeMainSet.size(); i++)//循环生成报文 modify by huangchong
        {
            DubitMsgMakeDealBL tDubitMsgMakeDealBL = new DubitMsgMakeDealBL();
            //传递参数的方式改变 modify by huangchong
            VData tVData = new VData();
            tVData.add(tGlobalInput);
            tVData.add(tLXReportDetailSet);
            if (sDataType.equals("02"))
            {
            	String tSQL = "select fileno from lxreportdetail a where dealno = '" + tLXISTradeMainSet.get(i).getDealNo() + "' and exists (select 'X' from lxreportdatafile b where a.fileno = b.fileno and b.dealstate in ('03','06'))";
            	ExeSQL tExeSQL = new ExeSQL();
            	sFileNo = tExeSQL.getOneValue(tSQL);
            }
            else
            {
            	sFileNo = PubFun1.CreateMaxNo("AntiFileNo", 20);
            }
            tTransferData.setNameAndValue("FileNo", sFileNo);
            tVData.add(tTransferData);
            tVData.add(tLXISTradeMainSet.get(i));
            if (!tDubitMsgMakeDealBL.submitData(tVData, sOperation))
            {
                tErrors.copyAllErrors(tDubitMsgMakeDealBL.getErrors());
            }
            if (sDataType != null && sDataType.trim().equals("02"))
            {
                sCorrectFileNo = tDubitMsgMakeDealBL.getCorrectFileNo();
            }
            //页面反馈信息
           if (!tErrors.needDealError())
           {
                FlagStr = "Success";
                Content = "保存成功！";
                tTransferData.removeByName("FileNo");
           }
           else
           {
               FlagStr = "Fail";
               Content = "保存失败，原因是：" + tErrors.getFirstError();
           }
        }
    }
    tErrors = null;
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
