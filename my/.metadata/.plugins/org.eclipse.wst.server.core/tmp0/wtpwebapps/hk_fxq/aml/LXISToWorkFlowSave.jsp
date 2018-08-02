<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 *
 * @author   : � <lichen@sinosoft.com.cn>
 * @version  : 1.00, 1.01
 * @date     : 2007-07-12, 2007-07-26
 * @direction: ���ɹ�������¼
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>

<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.utility.*" %>
<%
    //�������ݱ���
    String sStartDate = request.getParameter("StartDate");
    String sEndDate = request.getParameter("EndDate");

    //�ռ���������
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    VData tVData = new VData();
    tVData.add(sGlobalInput);
    tVData.add(tStartDate);
    tVData.add(sEndDate);

    //��̨������
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();

    //���ú�̨����
    LXISToWorkFlowBL tLXISToWorkFlowBL = new LXISToWorkFlowBL();
    if (!tLXISToWorkFlowBL.submitData(tVData, ""))
    {
       tErrors.copyAllErrors(tLXISToWorkFlowBL.getErrors());
    }
    tLXISToWorkFlowBL = null;
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
