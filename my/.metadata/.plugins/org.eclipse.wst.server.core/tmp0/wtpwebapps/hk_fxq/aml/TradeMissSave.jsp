<%@page contentType="text/html;charset=GBK" %>

<!--�û�У����-->
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>

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

TradeMissSaveBL tTradeMissSaveBL = new TradeMissSaveBL(); //

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

//    String BackInfoNo = request.getParameter("BackInfoNo");
//
//    String SelfPackageGridNO[] = request.getParameterValues("InpSelfPackageGridChk");
//    String DealNo[] = request.getParameterValues("SelfPackageGrid7");

    LXReportToTradeSet tLXReportToTradeSet=new LXReportToTradeSet();
    //LXReportToTradeSchema tLXReportToTradeSchema=new LXReportToTradeSchema();
    
    ExeSQL mExeSQL = new ExeSQL();
    //��ѯBackInfoNo
    String tSQL_Info = " select BackInfoNo from LXReceiptDetail "
                     + " where BackFileNo = '"+BackFileNo+"' group by BackInfoNo ";
    SSRS iSSRS = new SSRS();
    iSSRS = mExeSQL.execSQL(tSQL_Info);
    int iMax = iSSRS.getMaxRow();                             
    //��ѯdealno
    String tSQL = " select b.dealno from lxreportdatafile a, lxreportdetail b "
                + " where a.fileno = b.fileno  and a.dealstate = '02' and a.filename in "
                + " (select ErrFileName from LXReceiptDetail where BackFileNo = '"+BackFileNo+"') "     
                + " and a.fileno in (select MAX(fileno) from lxreportdatafile where filename in "
                + " (select ErrFileName from LXReceiptDetail where BackFileNo = '"+BackFileNo+"')) ";
            
    SSRS tSSRS = new SSRS();
    tSSRS = mExeSQL.execSQL(tSQL);  
    int tMax = tSSRS.getMaxRow(); 

    for(int i=1;i<=iMax;i++)
    {
	    	String tBackInfoNo = iSSRS.GetText(i,1);
		    for(int t=1;t<=tMax;t++)
		    {
		    	  String tDealNo = tSSRS.GetText(t,1);
	          LXReportToTradeSchema tLXReportToTradeSchema = new LXReportToTradeSchema();
	          tLXReportToTradeSchema.setBackFileNo(BackFileNo);
	          tLXReportToTradeSchema.setBackInfoNo(tBackInfoNo);
	          tLXReportToTradeSchema.setDealNo(tDealNo);
	          tLXReportToTradeSchema.setState("00");
	          tLXReportToTradeSet.add(tLXReportToTradeSchema);
		     }     	
     }

     System.out.println("====================== TradeMissSave.jsp ������׼����ϣ� ===========================");

 





//    if (SelfPackageGridNO != null)
//    {
//        for (int i = 0; i < SelfPackageGridNO.length; i++)
//        {
//          if(SelfPackageGridNO[i].toString()=="1"||SelfPackageGridNO[i].toString().equals("1"))
//          {
//            System.out.println("DealNo[i]========"+DealNo[i]);
//            LXReportToTradeSchema tLXReportToTradeSchema=new LXReportToTradeSchema();
//            tLXReportToTradeSchema.setBackFileNo(BackFileNo);
//            tLXReportToTradeSchema.setBackInfoNo(BackInfoNo);
//            tLXReportToTradeSchema.setDealNo(DealNo[i]);
//            tLXReportToTradeSchema.setState("00");
//            tLXReportToTradeSet.add(tLXReportToTradeSchema);
//          }
//        }
//      }





    VData tVData = new VData();
    tVData.add(tGI);
    tVData.add(tLXReportToTradeSet);




        try
        {
            //�����ύ
            System.out.println("---LLReportUI submitData and transact=");
            if (!tTradeMissSaveBL.submitData(tVData,""))
            {
                Content = " tTradeMissSaveBL��������ʧ�ܣ�ԭ����: " + tTradeMissSaveBL.mErrors.getError(0).errorMessage;
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
if(FlagStr.equalsIgnoreCase("Succ"))
{
%>
<html>
<script language="javascript">
    
    alert("�����ύ�ɹ�������ȫ������");
//    try
//    {
//        top.close();
//        top.opener.focus();
//    }
//    catch (ex) {}
</script>
</html>
<%
}
else
{%>
<html>
<script language="javascript">
    alert("�����ύʧ�ܣ�");
</script>
</html>
<%
}
%>