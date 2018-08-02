<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: 中科软反洗钱系统</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: 中科软科技股份有限公司</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : 李晨 <lichen@sinosoft.com.cn>
 * @version  : 1.00, 1.01
 * @date     : 2007-07-12, 2007-07-26
 * @direction: 可疑工作流补录
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.utility.*" %>
<%
    //接收数据变量
    String sStartDate = request.getParameter("StartDate");
    String sEndDate = request.getParameter("EndDate");

    //收集整理数据
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    VData tVData = new VData();
    tVData.add(sGlobalInput);
    tVData.add(tStartDate);
    tVData.add(sEndDate);

    //后台处理标记
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();

    //调用后台处理
    LXISToWorkFlowBL tLXISToWorkFlowBL = new LXISToWorkFlowBL();
    if (!tLXISToWorkFlowBL.submitData(tVData, ""))
    {
       tErrors.copyAllErrors(tLXISToWorkFlowBL.getErrors());
    }
    tLXISToWorkFlowBL = null;
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
