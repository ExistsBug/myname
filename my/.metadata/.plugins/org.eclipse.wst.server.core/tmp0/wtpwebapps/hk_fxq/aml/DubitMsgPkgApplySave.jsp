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
 * @date     : 2007-07-13
 * @direction: 可疑交易报文文件申请提交保存
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
    String sOperation = request.getParameter("Operation");
    String sDataType = request.getParameter("DataType");
    String sPackageNo = request.getParameter("PackageNo");

    //收集整理数据
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
    //垃圾处理
    tGlobalInput = null;
    tTransferData = null;


    //后台处理标记
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();

    //调用后台处理
    DubitMsgPkgApplyBL tDubitMsgPkgApplyBL = new DubitMsgPkgApplyBL();
    if (!tDubitMsgPkgApplyBL.submitData(tVData, sOperation))
    {
        tErrors.copyAllErrors(tDubitMsgPkgApplyBL.getErrors());
    }
    tDubitMsgPkgApplyBL = null;
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
            parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>');
        }
        catch (ex)
        {
            alert('<%=Content%>');
        }
    </script>
</html>
