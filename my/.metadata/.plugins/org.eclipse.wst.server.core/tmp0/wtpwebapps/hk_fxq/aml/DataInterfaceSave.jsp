<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�DataInterfaceUISave.jsp
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
  DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();

  //�������
  CErrors tError = null;
  String tOperate=request.getParameter("sFlag");
  tOperate = tOperate.trim();             
  String FlagStr = "Fail";
  String Content = "";
  GlobalInput tG = new GlobalInput();
  tG=(GlobalInput)session.getValue("GI");
  String sFlag=request.getParameter("sFlag");
  String startDate="";
  String endDate="";
  String backDate="";
  int sCount=0;
  int fCount=0;
  VData tVData = new VData();
  	startDate=request.getParameter("StartDate");
  	endDate=request.getParameter("EndDate");
  	if(startDate.length()==8)
    	{
    		startDate=startDate.substring(0,4)+"-"+startDate.substring(4,6)+"-"+startDate.substring(6,8);
    	}
    	if(endDate.length()==8)
    	{
    		endDate=endDate.substring(0,4)+"-"+endDate.substring(4,6)+"-"+endDate.substring(6,8);
    	}
    	tVData.add(sFlag);
    	tVData.add(startDate);
    	tVData.add(endDate);
  	tVData.add(tG);
		System.out.println(sFlag);
		System.out.println(startDate);
		System.out.println(endDate);

  FlagStr="";

  try
  {
    tDataInterfaceUI.submitData(tVData,tOperate);
    sCount=tDataInterfaceUI.getSCount();
    fCount=tDataInterfaceUI.getFCount();
    System.out.println("22222222222222222"+FlagStr.equals("Fail"));
  }
  catch(Exception ex)
  {
    System.out.println("1111111111111");
    Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
    FlagStr = "Fail";
  }
  
  if (!FlagStr.equals("Fail"))
  {
    tError = tDataInterfaceUI.mErrors;
    if (!tError.needDealError()&&sFlag.equals("cal"))
    {                          
       Content = " �����ɹ�! <font color=red>��ȡ�ͻ���Ϣ�ɹ���Ŀ��"+sCount+"������ȡ�ͻ���Ϣʧ����Ŀ��"+fCount+"��</font>";
       FlagStr = "Succ";
    }
  else if (!tError.needDealError()&&sFlag.equals("recal"))
    {                          
       Content = " �����ɹ�! <font color=red>������ȡ�ͻ���Ϣ�ɹ���Ŀ��"+sCount+"����������ȡ�ͻ���Ϣʧ����Ŀ��"+fCount+"��</font>";
       FlagStr = "Succ";
    }
    else if (!tError.needDealError()&&sFlag.equals("fillcal"))
    {                          
       Content = " ����ͻ���Ϣ�ɹ�! <font color=red>�ͻ���Ϣ�ɹ�����Ŀ��"+sCount+"��������ͻ���Ϣʧ������Ŀ��"+fCount+"��</font>";
       FlagStr = "Succ";
    }
  else if (!tError.needDealError()&&sFlag.equals("delete"))
    {                          
       Content = " �����ɹ�! <font color=red>ɾ��������Ŀ��"+(sCount+fCount)+"��</font>";
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

