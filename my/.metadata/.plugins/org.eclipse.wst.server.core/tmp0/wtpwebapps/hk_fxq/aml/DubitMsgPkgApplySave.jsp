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
 * @date     : 2007-07-13
 * @direction: ���ɽ��ױ����ļ������ύ����
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
    String sOperation = request.getParameter("Operation");
    String sDataType = request.getParameter("DataType");
    String sPackageNo = request.getParameter("PackageNo");

    //�ռ���������
    //GlobalInput
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    //TransferData
    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("DataType", sDataType);
    tTransferData.setNameAndValue("PackageNo", sPackageNo);
    //VData
    VData tVData = new VData();
    tVData.add(tGlobalInput);
    tVData.add(tTransferData);
    //��������
    tGlobalInput = null;
    tTransferData = null;


    //��̨������
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();

    //���ú�̨����
    DubitMsgPkgApplyBL tDubitMsgPkgApplyBL = new DubitMsgPkgApplyBL();
    if (!tDubitMsgPkgApplyBL.submitData(tVData, sOperation))
    {
        tErrors.copyAllErrors(tDubitMsgPkgApplyBL.getErrors());
    }
    tDubitMsgPkgApplyBL = null;
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
            parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>');
        }
        catch (ex)
        {
            alert('<%=Content%>');
        }
    </script>
</html>
