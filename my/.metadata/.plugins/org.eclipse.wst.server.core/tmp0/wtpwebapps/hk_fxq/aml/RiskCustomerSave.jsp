<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�RiskCustomerSave.jsp
//�����ܣ�
//�������ڣ�2003-06-24
//������  ��
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<!--�û�У����-->
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="java.text.SimpleDateFormat"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
<%
  //������Ϣ������У�鴦��
  //�������
  System.out.println("����SAVEҳ��");
  RiskCustomerUI tRiskCustomerUI = new RiskCustomerUI();

  //�������
  CErrors tError = null;           
  String FlagStr = "Fail";
  String Content = "";
  GlobalInput tG = new GlobalInput();
  tG=(GlobalInput)session.getValue("GI");
  String startDate="";
  String endDate="";
  String backDate="";
   VData tVData = new VData();
  	tVData.add(tG);

  FlagStr="";

  try
  {
    tRiskCustomerUI.submitData(tVData,"");
  }
  catch(Exception ex)
  {
    Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
    FlagStr = "Fail";
  }
  
  if (!FlagStr.equals("Fail"))
  {
    tError = tRiskCustomerUI.mErrors;
    if (!tError.needDealError())
    {                          
       Content = " �����ɹ�! ";
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
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>

</html>

