<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : ����ǿ <XinYQ@sinosoft.com.cn>
 * @version  : 1.00
 * @date     : 2007-07-14
 * @direction: ���ɽ��ױ��İ������ύ����
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.vschema.*" %>
<%@ page import="com.sinosoft.utility.*" %>


<%
    //�������ݱ���
    String sPackageNo = request.getParameter("PackageNo");
    String sResendPackageNo = new String("");
    String sDataType = request.getParameter("DataType");
    String sOperation = request.getParameter("Operation");
    String arrGridChk1[] = request.getParameterValues("InpWaitForBePackageGridChk");
    String arrFileNo1[] = request.getParameterValues("WaitForBePackageGrid1");
    String arrGridChk2[] = request.getParameterValues("InpAlreadyInPackageGridChk");
    String arrFileNo2[] = request.getParameterValues("AlreadyInPackageGrid1");

    //�ļ�·����Ϣ
    String sZIPSavePath = application.getRealPath("/").replace('\\', '/');
    if (sZIPSavePath != null && !sZIPSavePath.endsWith("/"))
    {
        sZIPSavePath += "/";
    }
    sZIPSavePath += "aml/send/";

    //��̬��ı���
    AntiInit.filePath = sZIPSavePath;
    AntiInit.packagePath = sZIPSavePath;

    //�ռ���������
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

    //��������
    tGlobalInput = null;
    tTransferData = null;
    tLXReportDataFileSet = null;

    //��̨������
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();

    //���ú�̨����
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
