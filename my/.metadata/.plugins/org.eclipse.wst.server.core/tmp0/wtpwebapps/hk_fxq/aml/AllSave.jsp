<%@page contentType="text/html;charset=GBK" %>

<!--�û�У����-->
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>
<%@page import="com.sinosoft.lis.db.LWMissionDB"%>
<%@page import="com.sinosoft.lis.aml.*"%>


<%
System.out.println("#########################Save.jsp start#################################");
//�������


//�������
CErrors tError = null;
String FlagStr = "Fail";
String Content = "";
GlobalInput tGI = new GlobalInput();
tGI = (GlobalInput)session.getValue("GI");

BackAllDeal tBackAllDeal = new BackAllDeal(); //

//ҳ����Ч���ж�
if(tGI == null)
{
    FlagStr = "Fail";
    Content = "ҳ��ʧЧ,�����µ�½";
    System.out.println("ҳ��ʧЧ,�����µ�½");
}
else
{
		String Operator  = tGI.Operator ; //�����½����Ա�˺�
    String ManageCom = tGI.ManageCom  ; //�����½��վ,ManageCom=�ڴ��е�½��վ����
    String BackFileNo=request.getParameter("BackFileNo");
		String cOperator = request.getParameter("cOperator");
    String DealType = request.getParameter("DealType");

		System.out.println("BackFileNo================"+BackFileNo);
		System.out.println("cOperator================"+cOperator);
		System.out.println("DealType================"+DealType);

    TransferData tTransferData = new TransferData();
   	tTransferData.setNameAndValue("BackFileNo", BackFileNo);
    tTransferData.setNameAndValue("cOperator", cOperator);
		tTransferData.setNameAndValue("DealType", DealType);


    VData tVData = new VData();
    tVData.add(tGI);
    tVData.add(tTransferData);




        try
        {
            //�����ύ

            if (!tBackAllDeal.submitData(tVData,cOperator))
            {
            		System.out.println("��������ʧ��");
                Content = " ��������ʧ�ܣ�ԭ����: " ;
                FlagStr = "Fail";
            }
            else
            {
                tVData.clear();
                Content = " �����ύ�ɹ���";
                FlagStr = "Succ";
            }
        }
        catch(Exception ex)
        {
            Content = "�����ύtTradeMissSaveBLʧ�ܣ�ԭ����:" + ex.toString();
            FlagStr = "Fail";
        }
    }

%>
<html>
<script language="javascript" >
    parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>
</html>
