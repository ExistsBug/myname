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
	String Operate = request.getParameter("hideOperate");
  	VData tVData = new VData();
	
	if(tGI==null)
	{
		System.out.println("ҳ��ʧЧ,�����µ�½");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�½";
	}
  	//ҳ����Ч
	else {
	  	  	LXISTradeDetailUI tLXISTradeDetailUI = new LXISTradeDetailUI();			
			try{
	  	  	//���ɽ�����ϸ��Ϣ
			LXISTradeDetailSchema tLXISTradeDetailSchema = new LXISTradeDetailSchema();
			tLXISTradeDetailSchema.setDealNo(request.getParameter("DealNo"));
			tLXISTradeDetailSchema.setListNo(request.getParameter("ListNo"));
			tLXISTradeDetailSchema.setCSNM(request.getParameter("CSNM"));
			tLXISTradeDetailSchema.setTICD(request.getParameter("TICD"));
			tLXISTradeDetailSchema.setTSTM(request.getParameter("TSTM"));
			tLXISTradeDetailSchema.setTSTP(request.getParameter("TSTP"));
			tLXISTradeDetailSchema.setCRTP(request.getParameter("CRTP"));
			tLXISTradeDetailSchema.setCRAT(request.getParameter("CRAT"));
			tLXISTradeDetailSchema.setCRDR(request.getParameter("CRDR"));
			tLXISTradeDetailSchema.setCSTP(request.getParameter("CSTP"));
			tLXISTradeDetailSchema.setCAOI(request.getParameter("CAOI"));
			tLXISTradeDetailSchema.setTCAN(request.getParameter("TCAN"));
			tLXISTradeDetailSchema.setTBNM(request.getParameter("TBNM"));
			tLXISTradeDetailSchema.setTBIT(request.getParameter("TBIT"));
			tLXISTradeDetailSchema.setTBID(request.getParameter("TBID"));
			//zhangyf add 
			
			   TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
         if(!tTradeInfoCheck.checkInfo(tLXISTradeDetailSchema)){
        	    	    FlagStr = "Fail";
          Content = "���׺�Ϊ" + request.getParameter("DealNo") + tTradeInfoCheck.mErrors.getErrContent();
                  }
			
		 //end 
			tVData.add(tGI); 	  	  									   
	  	  	tVData.add(tLXISTradeDetailSchema);
	  	  	}catch(Exception ex){
	  	  		System.out.println("=============================");
	  	  	}
	  	  	try{ 
	  	  	//zhangyf modify 
	  	  	if (!FlagStr.equals("Fail")){
	  	  		Operate = Operate.substring(0,Operate.indexOf("|"));
	  	  		tLXISTradeDetailUI.submitData(tVData, Operate);
	  	  		}
	  	  		  		//end 
		 	}catch(Exception ex){
		    	Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	if (!FlagStr.equals("Fail")){
		    	tError = tLXISTradeDetailUI.mErrors;
		    	if (!tError.needDealError()){
		    		Content = " ����ɹ�! ";
		    		FlagStr = "Succ";
		    	}else{
		    		Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
		    		FlagStr = "Fail";
		    	}
		  	}
	}// end of session if 

  //��Ӹ���Ԥ����
   System.out.println(Content);
//ҳ����Ч��

%>
<html>
<script language="javascript">
	<!--zhangyf modify-->
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>