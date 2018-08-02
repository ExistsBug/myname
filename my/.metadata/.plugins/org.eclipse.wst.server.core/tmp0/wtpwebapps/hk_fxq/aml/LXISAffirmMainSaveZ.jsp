<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%@page import="com.sinosoft.lis.db.*"%>
<%@page import="com.sinosoft.lis.aml.LXISAffirmBL"%>
<%
    String FlagStr = "Succ";
    String Content = "";
    CErrors tErrors = new CErrors();
    VData sVData = new VData();
    String dealno=request.getParameter("dealno");
    String datastate=request.getParameter("datastate");
    String oper=request.getParameter("oper");
    String ReMark=request.getParameter("ReMark");
    System.out.println("ReMark :"+ReMark);
    GlobalInput tG = new GlobalInput();
    tG=(GlobalInput)session.getValue("GI");
    TransferData tTransferData = new TransferData();
    tTransferData.setNameAndValue("DealNo", dealno);    
    tTransferData.setNameAndValue("DataState1", datastate);
    tTransferData.setNameAndValue("Oper", oper);
    tTransferData.setNameAndValue("ReMark", ReMark);
    if (oper == null || oper.trim().equals(""))
    {
        tTransferData.setNameAndValue("DataState", "");
    }
    else if (oper.trim().equalsIgnoreCase("reject"))//�ܹ�˾ ����
    {
        tTransferData.setNameAndValue("DataState", "04");
    }
    else if (oper.trim().equalsIgnoreCase("confirm"))//�ܹ�˾ ȷ��
    {
        tTransferData.setNameAndValue("DataState", "01");
    }
    else if (oper.trim().equalsIgnoreCase("keep"))//�ܹ�˾�����ϱ�
    {
        tTransferData.setNameAndValue("DataState", "09");
    }
    sVData.add(tG);
    sVData.add(tTransferData);
    LXISTradeMainDB tLXISTradeMainDB=new LXISTradeMainDB();
    tLXISTradeMainDB.setDealNo(dealno);
    if(!tLXISTradeMainDB.getInfo())
    {
        FlagStr = "Fail";
    }
    sVData.add(tLXISTradeMainDB.getSchema());
    //AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
     //   if (!tAMLWorkFlowUI.submitData(sVData, "0000009201"))
     //   {
      //      tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
      //  }
   // tAMLWorkFlowUI = null;

    LXISAffirmBL tLXISAffirmBL = new LXISAffirmBL();
  if (!tLXISAffirmBL.submitData(sVData, "confirm"))
  {
      tErrors.copyAllErrors(tLXISAffirmBL.getErrors());
  }
  tLXISAffirmBL = null;

    //update by chenrongjun 2014-09-28  ---- end 
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
    <script language="javascript">
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>');
</script>
</html>