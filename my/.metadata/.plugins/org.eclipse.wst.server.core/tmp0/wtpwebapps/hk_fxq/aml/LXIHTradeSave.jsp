<%
//�������ƣ�NetReSpreadSave.jsp
//�����ܣ�
//�������ڣ� 
//������  �� liuyy
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>

<!--�û�У����-->
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.db.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
	 
<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";
  
	//�������
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
	String Operate = request.getParameter("operate");
	System.out.println("operate : "+ Operate);
  	VData tVData = new VData();


	if(tGI==null)
	{
		System.out.println("ҳ��ʧЧ,�����µ�½");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�½";
	}
  	//ҳ����Ч
	else {
		if (Operate != null && !Operate.equals("")){
				LXIHTradeBL tLXIHTradeBL = new LXIHTradeBL();
		LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();
		tLXIHTradeMainSchema.setDealNo(request.getParameter("DealNo1").trim());
		tLXIHTradeMainSchema.setCSNM(request.getParameter("CSNM").trim());
		tLXIHTradeMainSchema.setCTNM(request.getParameter("CTNM").trim());
		tLXIHTradeMainSchema.setCITP(request.getParameter("CITP").trim());
		String citp = request.getParameter("CITP").trim();
	 	if (citp != null && citp.substring(0, 1).equals("@")) {
	 		tLXIHTradeMainSchema.setCTID(request.getParameter("CITP").trim());
	 	} else {
	 		tLXIHTradeMainSchema.setCTID(request.getParameter("CTID").trim());
	 	}
		tLXIHTradeMainSchema.setCTNT(request.getParameter("CTNT").trim());
		tLXIHTradeMainSchema.setHTDT(request.getParameter("HTDT").trim());
		tLXIHTradeMainSchema.setDataState(request.getParameter("DataState").trim());
		tLXIHTradeMainSchema.setDealDate(request.getParameter("DealDate").trim());
		tLXIHTradeMainSchema.setDealTime(request.getParameter("DealTime").trim());
		tLXIHTradeMainSchema.setOperator(request.getParameter("Operator").trim());
		tVData.add(tGI);
		tVData.add(tLXIHTradeMainSchema);	
	  	  	try{ 
	  	  		tLXIHTradeBL.submitData(tVData, Operate);
		 	}catch(Exception ex){
		    	Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tLXIHTradeBL.mErrors;
		    	if (!tError.needDealError()){
		    		Content = " ����ɹ�! ";
		    		FlagStr = "Succ";
		    	}else{
		    		Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
		    		FlagStr = "Fail";
		    	}
		  	}
		} // end of custom if 
	}// end of session if 

  //��Ӹ���Ԥ����
   System.out.println(Content);
//ҳ����Ч��

%>
<html>
<script language="javascript">
        parent.fraInterface.afterSubmit1("<%=FlagStr%>","<%=Content%>");
</script>
</html>