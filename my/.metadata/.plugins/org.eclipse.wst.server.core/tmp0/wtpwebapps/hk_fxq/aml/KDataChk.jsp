<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%
//�������ƣ�UWAutoChk.jsp;KDataChk.jsp;
//�����ܣ������Զ��˱�
//�������ڣ�2007-07-03 17:10:36
//������  ��WHN
//���¼�¼��  ������    ��������     ����ԭ��/����
%>

<!--�û�У����-->
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.tb.*"%>
  <%@page import="com.sinosoft.lis.qr.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>

<%
  //�������
  CErrors tError = null;
  //CErrors tErrors = new CErrors();
  String FlagStr = "Fail";
  String Content = " �������ȷ�ϳɹ�!";
  LXISTradeMainSet tLXISTradeMainSet = new LXISTradeMainSet();  
 
  
	GlobalInput tG = new GlobalInput();  
	VData tVData = new VData();
  
	tG=(GlobalInput)session.getValue("GI");
  
  	
	
  
  //У�鴦��
  //���ݴ����
  
  	//������Ϣ
  	// Ͷ�����б�
	
	//LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();

    String tChk[] = request.getParameterValues("InpPolGridChk");
    
	String tDealNo[] = request.getParameterValues("PolGrid1");
	String tSTCR[]  =  request.getParameterValues("PolGrid2");
	String tSDGR[] = request.getParameterValues("PolGrid3");
	String tTKMS[] = request.getParameterValues("PolGrid4");
	String tSSDS[] = request.getParameterValues("PolGrid5");
	String tCSNM[] = request.getParameterValues("PolGrid6");
	String tCTNM[] = request.getParameterValues("PolGrid7");
	String tCITP[] = request.getParameterValues("PolGrid8");
	String tCTID[] = request.getParameterValues("PolGrid9");
	String tCTTP[] = request.getParameterValues("PolGrid10");
	String tCCTL[] = request.getParameterValues("PolGrid11");
	String tCTAR[] = request.getParameterValues("PolGrid12");
	String tCCEI[] = request.getParameterValues("PolGrid13");
	String tCTVC[] = request.getParameterValues("PolGrid14");
	String tCRNM[] = request.getParameterValues("PolGrid15");
	String tCRIT[] = request.getParameterValues("PolGrid16");
	String tCRID[] = request.getParameterValues("PolGrid17");
	String tDataState[] = request.getParameterValues("PolGrid18");
	String tDealDate[] = request.getParameterValues("PolGrid19");
	String tDealTime[] = request.getParameterValues("PolGrid20");
	String tOperator[] = request.getParameterValues("PolGrid21");
	
	
	//System.out.println(request.getParameterValues("PolGrid1"));
     System.out.println("beging ing "); 
	boolean flag = false;
	int tcontCount = tChk.length;	 
    System.out.println(tcontCount);

    System.out.println("--------------------------------���ȷ��-----��ʼ--------------------------------");
        
	for (int i = 0; i < tcontCount; i++)
	{
        System.out.println("--------------------------------------------------------------------------");
		
         
        LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
       // TransferData tTransferData = new TransferData();
		if (!tDealNo[i].equals("") && tChk[i].equals("1"))
		{

           // tTransferData.setNameAndValue("DealNo",tDealNo[i]);
           // tTransferData.setNameAndValue("CSNM",tCSNM[i]);
           // tTransferData.setNameAndValue("CTNM",tCTNM[i]);
           // tTransferData.setNameAndValue("CITP",tCITP[i]);
           // tTransferData.setNameAndValue("CTID",tCTID[i]);
           // tTransferData.setNameAndValue("CTNT",tCTNT[i]);
           // tTransferData.setNameAndValue("HTDT",tHTDT[i]);
           // tTransferData.setNameAndValue("DataState",tDataState[i]);
           // tTransferData.setNameAndValue("DealTime",tDealTime[i]);
           // tTransferData.setNameAndValue("DealDate",tDealDate[i]);
            
	    	 tLXISTradeMainSchema.setDealNo(tDealNo[i]);
	    	 tLXISTradeMainSchema.setCSNM(tCSNM[i]);
	    	 tLXISTradeMainSchema.setCTNM(tCTNM[i]);
	    	 tLXISTradeMainSchema.setCITP(tCITP[i]);
	    	 tLXISTradeMainSchema.setCTID(tCTID[i]);
	    	 tLXISTradeMainSchema.setSDGR(tSDGR[i]);
	    	 tLXISTradeMainSchema.setSTCR(tSTCR[i]);
	    	 tLXISTradeMainSchema.setTKMS(tTKMS[i]);
	    	 tLXISTradeMainSchema.setSSDS(tSSDS[i]);
	    	 tLXISTradeMainSchema.setCCTL(tCCTL[i]);
	    	 
	    	tLXISTradeMainSchema.setCTTP(tCTTP[i]);
	    	 //tLXISTradeMainSchema.setCCTL(tCCTL[i]);
	    	 tLXISTradeMainSchema.setCTAR(tCTAR[i]);
	    	 tLXISTradeMainSchema.setCCEI(tCCEI[i]);
	    	 
	    	 tLXISTradeMainSchema.setCTVC(tCTVC[i]);
	    	 tLXISTradeMainSchema.setCRNM(tCRNM[i]);
	    	 
	    	 tLXISTradeMainSchema.setCRIT(tCRIT[i]);
	    	 tLXISTradeMainSchema.setCRID(tCRID[i]);
	    	 tLXISTradeMainSchema.setDataState(tDataState[i]);
	    	 tLXISTradeMainSchema.setDealDate(tDealDate[i]);
	    	 tLXISTradeMainSchema.setDealTime(tDealTime[i]);
	    	 tLXISTradeMainSchema.setOperator(tOperator[i]);
          
           System.out.println("DataState:"+tDataState[i]);
            tLXISTradeMainSet.add(tLXISTradeMainSchema);
            
		    flag = true;
		}
	}
		
	try
		{
            System.out.println("flag=="+flag);
		  	
				// ׼���������� VData
				System.out.println("��ʼ��������");
				
				
				//tVData.add( tTransferData );
				tVData.add(tLXISTradeMainSet);
				tVData.add(tG); 
				// ���ݴ���
				System.out.println("�Ѿ���������� ");
                
			KDataChkBL	tKDataChkBL   = new KDataChkBL();
                
				if (tKDataChkBL.submitData(tVData,"update") == false)
				{
					int n = tKDataChkBL.mErrors.getErrorCount();
					System.out.println("n=="+n);
					for (int j = 0; j < n; j++)
					System.out.println("Error: "+tKDataChkBL.mErrors.getError(j).errorMessage);
					Content = " ��ʾ��Ϣ: " + tKDataChkBL.mErrors.getError(0).errorMessage;
					FlagStr = "Fail";
				} 

				//�����Catch�з����쳣���򲻴Ӵ���������ȡ������Ϣ
				if (FlagStr == "Fail")
				{
				    tError = tKDataChkBL.mErrors;
				    //tErrors = tDDataChkUI.mErrors;
				    Content = " ��ʾ��Ϣ�� ";
				    if (!tError.needDealError())
				    {                          
				    	//Content = "�Զ��˱��ɹ�!";
				    	int n = tError.getErrorCount();
		    			if (n > 0)
		    			{    			      
					      for(int j = 0;j < n;j++)
					      {
					        //tError = tErrors.getError(j);
					        Content = Content.trim() +j+". "+ tError.getError(j).errorMessage.trim()+".";
					      }
					    }
		
				    	FlagStr = "Succ"; 
				    }
				    else                                                                           
				    {
				    	int n = tError.getErrorCount();
				    	//Content = "�Զ��˱�ʧ��!";
		    			if (n > 0) 
		    			{
					      for(int j = 0;j < n;j++)
					      {
					        //tError = tErrors.getError(j);
					        Content = Content.trim() +j+". "+ tError.getError(j).errorMessage.trim()+".";
					      }
							}
				    	FlagStr = "Fail";
				    } 
				}
			
		}//try end
		catch(Exception e)
		{
			e.printStackTrace();
			Content = Content.trim() +" ��ʾ:�쳣�˳�.";
		}
     
	
    System.out.println("--------------------------------��������ȷ��-----����--------------------------------");

%>                      
<html>
<script language="javascript">  
  parent.fraInterface.afterAutoChk("<%=FlagStr%>","<%=Content%>");
</script>
</html>

