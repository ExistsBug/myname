<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�IHDataInterfaceUISave.jsp
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
  <%@page import="com.sinosoft.lis.calfactor.*"%>
<%
  //������Ϣ������У�鴦��
  //�������
  System.out.println("===================����IHDataInterfaceUISave.jspҳ��===================");
  DataInterfaceUI tDataInterfaceUI = new DataInterfaceUI();
  Tishu_IH_ResDeal tTishu_IH_ResDeal = new Tishu_IH_ResDeal();

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
  String tihoris = "";//�Ǵ���������ǿ���������־
  String calmngcom = "";
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
	tihoris = "IH";
	calmngcom = tG.ComCode;//д��86����Ϊ��ʱ����ʱд���������ύʱ�����ˡ�
	
	tVData.add(sFlag);
	tVData.add(startDate);
	tVData.add(endDate);
	tVData.add(tihoris);
    tVData.add(calmngcom);
	tVData.add(tG);
	System.out.println("====sFlag========"+sFlag);
	System.out.println("====startDate===="+startDate);
	System.out.println("====endDate======"+endDate);
	System.out.println("====tihoris======"+tihoris);
	System.out.println("====calmngcom===="+calmngcom);

  FlagStr="";

  try
  {
    tDataInterfaceUI.submitData(tVData,tOperate);
    sCount=tDataInterfaceUI.getSCount();
    fCount=tDataInterfaceUI.getFCount();
    System.out.println("�������DataInterfaceUI�з��ؽ��= "+FlagStr.equals("Fail"));
    /*if(sFlag.equals("fillcal")||sFlag.equals("recal")){
      if(tTishu_IH_ResDeal.submitData("recal",startDate,endDate,tihoris,calmngcom,tOperate,"ebao")){
          sCount=sCount+tTishu_IH_ResDeal.GetsCount();
      }
    }else{
     if(tTishu_IH_ResDeal.submitData("cal",startDate,endDate,tihoris,calmngcom,tOperate,"ebao"))
     {sCount=sCount+tTishu_IH_ResDeal.GetsCount();}
    }*/
    System.out.println("������������з��ؽ��");
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

