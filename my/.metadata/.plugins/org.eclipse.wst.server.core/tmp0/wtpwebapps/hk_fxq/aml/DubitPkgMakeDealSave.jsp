<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 辛玉强 <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-14
 * @direction: 可疑交易报文包生成提交保存
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.vschema.*" %>
<%@ page import="com.sinosoft.utility.*" %>


<%
    //接收数据变量
    String sPackageNo = request.getParameter("PackageNo");
    String sResendPackageNo = new String("");
    String sDataType = request.getParameter("DataType");
    String sOperation = request.getParameter("Operation");
    String arrGridChk1[] = request.getParameterValues("InpWaitForBePackageGridChk");
    String arrFileNo1[] = request.getParameterValues("WaitForBePackageGrid1");
    String arrGridChk2[] = request.getParameterValues("InpAlreadyInPackageGridChk");
    String arrFileNo2[] = request.getParameterValues("AlreadyInPackageGrid1");

    //文件路径信息
    String sZIPSavePath = application.getRealPath("/").replace('\\', '/');
    if (sZIPSavePath != null && !sZIPSavePath.endsWith("/"))
    {
        sZIPSavePath += "/";
    }
    sZIPSavePath += "aml/send/";

    //静态类的变量
    AntiInit.filePath = sZIPSavePath;
    AntiInit.packagePath = sZIPSavePath;

    //收集整理数据
    //GlobalInput
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    //TransferData
    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("PackageNo", sPackageNo);
    tTransferData.setNameAndValue("DataType", sDataType);
    tTransferData.setNameAndValue("ZIPSavePath", sZIPSavePath);
    //LXReportDataFileSet
    LXReportDataFileSet tLXReportDataFileSet = new LXReportDataFileSet();
    //VData
    VData tVData = new VData();
    tVData.add(tGlobalInput);
    tVData.add(tTransferData);

    if (sOperation != null && sOperation.trim().equalsIgnoreCase("AddToInPackageFile") && arrGridChk1 != null)
    {
        for (int i = 0; i < arrGridChk1.length; i++)
        {
            if (arrGridChk1[i].equals("1"))
            {
                LXReportDataFileSchema tLXReportDataFileSchema = new LXReportDataFileSchema();
                tLXReportDataFileSchema.setFileNo(arrFileNo1[i]);
                tLXReportDataFileSet.add(tLXReportDataFileSchema);
                tLXReportDataFileSchema = null;
            }
        }
        tVData.add(tLXReportDataFileSet);
    }

    if (sOperation != null && sOperation.trim().equalsIgnoreCase("DeleteInPackageFile") && arrGridChk2 != null)
    {
        for (int i = 0; i < arrGridChk2.length; i++)
        {
            if (arrGridChk2[i].equals("1"))
            {
                LXReportDataFileSchema tLXReportDataFileSchema = new LXReportDataFileSchema();
                tLXReportDataFileSchema.setFileNo(arrFileNo2[i]);
                tLXReportDataFileSet.add(tLXReportDataFileSchema);
                tLXReportDataFileSchema = null;
            }
        }
        tVData.add(tLXReportDataFileSet);
    }

    //垃圾处理
    tGlobalInput = null;
    tTransferData = null;
    tLXReportDataFileSet = null;

    //后台处理标记
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();

    //调用后台处理
    DubitPkgMakeDealBL tDubitPkgMakeDealBL = new DubitPkgMakeDealBL();
    if (!tDubitPkgMakeDealBL.submitData(tVData, sOperation))
    {
        tErrors.copyAllErrors(tDubitPkgMakeDealBL.getErrors());
    }
    if (sDataType != null && sDataType.trim().equals("02"))
    {
        sResendPackageNo = tDubitPkgMakeDealBL.getResendPkgNo();
    }
    tDubitPkgMakeDealBL = null;
    tVData = null;

    //页面反馈信息
    if (!tErrors.needDealError())
    {
        FlagStr = "Success";
        Content = "保存成功！";
    }
    else
    {
        FlagStr = "Fail";
        Content = "保存失败，原因是：" + tErrors.getFirstError();
    }
    tErrors = null;
%>


<html>
    <script language="JavaScript">
        try
        {
            parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>', '<%=sResendPackageNo%>');
        }
        catch (ex)
        {
            alert('<%=Content%>');
        }
    </script>
</html>
