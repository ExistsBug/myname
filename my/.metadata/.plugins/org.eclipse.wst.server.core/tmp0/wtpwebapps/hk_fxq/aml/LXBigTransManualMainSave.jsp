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
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.db.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%@page import="com.sinosoft.workflow.aml.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
	 
<%
       System.out.println("11111111111111");
	// �������
	CErrors tErrors = new CErrors();
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
		if (Operate.equalsIgnoreCase("Save")){
	  		//������
	  	  	LXAMLCustomerUI tLXAMLCustomerUI = new LXAMLCustomerUI();
	  	  	LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();
	  	  	String sDealNo = request.getParameter("DealNo1");
	  	  	tLXIHTradeMainSchema.setDealNo(sDealNo);
			tLXIHTradeMainSchema.setCSNM(request.getParameter("CSNM"));
			tLXIHTradeMainSchema.setCTNM(request.getParameter("CTNM"));
			tLXIHTradeMainSchema.setCITP(request.getParameter("CITP"));
		  String citp = request.getParameter("CITP").trim();
	    	if (citp != null && citp.substring(0, 1).equals("@")) {
	 		    tLXIHTradeMainSchema.setCTID(request.getParameter("CITP").trim());
	 	   } else {
	 		    tLXIHTradeMainSchema.setCTID(request.getParameter("CTID").trim());
	   	   }
			tLXIHTradeMainSchema.setCTNT(request.getParameter("CTNT"));
			tLXIHTradeMainSchema.setHTDT(request.getParameter("HTDT"));
			
			String sDataState = new String(request.getParameter("DataState"));
			if (sDataState == null || "".equals(sDataState))
				tLXIHTradeMainSchema.setDataState(" ");
			else 
			tLXIHTradeMainSchema.setDataState(sDataState);
			tLXIHTradeMainSchema.setDealDate(request.getParameter("DealDate"));
			tLXIHTradeMainSchema.setDealTime(request.getParameter("DealTime"));
			tLXIHTradeMainSchema.setOperator(request.getParameter("Operator"));
			
		       //zhangyf add begin 
         TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
         if(!tTradeInfoCheck.checkInfo(tLXIHTradeMainSchema)){
        	 
    	  FlagStr = "Fail";
          Content = "���׺�Ϊ" + sDealNo + tTradeInfoCheck.mErrors.getErrContent();
         
         }
    //end 
			
			
	  	  	tVData.add(tGI);
	  	  	tVData.add(tLXIHTradeMainSchema);
	  	  	System.out.println("���ݱ������");
	  	  	
			ExeSQL tExeSQL = new ExeSQL();
			int cnt = Integer.parseInt(tExeSQL.getOneValue("select count(1) from LXIHTradeMain where dealno = '" + sDealNo + "' "));
			if (cnt >= 1 ) {
				Operate = "UPDATE";
			}else if (cnt == 0){
				Operate = "INSERT";
			}
			try{  
			 		//zhangyf modify  
	  	  	if (!FlagStr.equals("Fail")){
	 			tLXAMLCustomerUI.submitData(tVData, Operate);
	 			}
	 		//end 
				
			}catch(Exception ex){
				Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
				FlagStr = "Fail";
			}
			if (!FlagStr.equals("Fail")){
				tErrors = tLXAMLCustomerUI.mErrors;
				if (!tErrors.needDealError()){
					Content = " ����ɹ�! ";
					FlagStr = "Succ";
				}else{
					Content = " ����ʧ�ܣ�ԭ����:" + tErrors.getFirstError();
					FlagStr = "Fail";
				}
			}
		} 
		else if (Operate.equalsIgnoreCase("WorkFlow")){
    		String sDealNo = new String(request.getParameter("DealNo1"));
    		
    		LXIHTradeDetailSet tLXIHTradeDetailSet =new LXIHTradeDetailSet();
    		LXIHTradeDetailDB tLXIHTradeDetailDB=new LXIHTradeDetailDB();
    		tLXIHTradeDetailDB.setDealNo(sDealNo);
    		tLXIHTradeDetailSet=tLXIHTradeDetailDB.query();
    		if(tLXIHTradeDetailSet.size()<=0){
    			FlagStr = "Fail";
    		Content = " ����ʧ�ܣ�ԭ����:û����ϸ��Ϣ";
    	}
    		
    	
    	
    		LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();
    		LXIHTradeMainDB tLXIHTradeMainDB = new LXIHTradeMainDB();
		  	tLXIHTradeMainDB.setDealNo(sDealNo);
	    	if (!tLXIHTradeMainDB.getInfo()){
	    
				Content = " ����ʧ�ܣ�ԭ����:" + tLXIHTradeMainDB.mErrors.getFirstError();
				
				FlagStr = "Fail";
				
	    	}
	    	
	    		OtherInfoCheck tOtherInfoCheck=new OtherInfoCheck();
              VData checkVData=new VData(); 
              checkVData.add(tLXIHTradeMainDB.getSchema());
              checkVData.add(tLXIHTradeDetailSet);
        if(!tOtherInfoCheck.submitIHData(checkVData)){
            	FlagStr = "Fail";
		          Content = "���׺�Ϊ" + sDealNo + tOtherInfoCheck.mErrors.getErrContent();
        }
	    	
	    	if(!"Fail".equals(FlagStr)){
	    		tLXIHTradeMainSchema.setSchema(tLXIHTradeMainDB.getSchema());
	    		tLXIHTradeMainSchema.setDataState("S00");
				//TransferData
	    		TransferData tTransferData = new TransferData();
	    		tTransferData.setNameAndValue("DealNo", sDealNo);
	    		tTransferData.setNameAndValue("DataType", "S00");
				tTransferData.setNameAndValue("DataState", "S00");    
		    	//VData
		    	tVData = new VData();
		    	tVData.add(tGI);
		    	tVData.add(tTransferData);
		    	tVData.add(tLXIHTradeMainSchema);   

		    
				//��������
				tGI = null;
				tTransferData = null;
				
    			//���ú�̨����
    			AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
    			if (!tAMLWorkFlowUI.submitData(tVData, "0000009102"))
    			{
       				tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
    			}
    			tAMLWorkFlowUI = null;
    			tVData = null;

				//��������״̬
				ExeSQL tExeSQL = new ExeSQL();
				
				
				tExeSQL.execUpdateSQL("update lxihtrademain set datastate = 'S00' where dealno = '" + sDealNo + "'");
	
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
			}
		}
	}

  //��Ӹ���Ԥ����
   System.out.println(Content);
//ҳ����Ч��

%>
<html>
<script language="javascript">
	<!--zhangyf modify ��content���ӽ�����-->
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>