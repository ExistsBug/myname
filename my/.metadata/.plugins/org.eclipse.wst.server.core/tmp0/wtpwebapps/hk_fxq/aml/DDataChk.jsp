<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
  
<%
//�������ƣ�UWAutoChk.jsp;DDataChk.jsp;
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

  <%@page import="com.sinosoft.lis.pubfun.*"%>

<%
  //�������
  CErrors tError = null;
  //CErrors tErrors = new CErrors();
  String FlagStr = "Fail";
  String Content = " �������ȷ�ϳɹ�!";
  LXIHTradeMainSet tLXIHTradeMainSet = new LXIHTradeMainSet();  
 
  
	GlobalInput tG = new GlobalInput();  
	VData tVData = new VData();
  
	tG=(GlobalInput)session.getValue("GI");
    
	String tChk[] = request.getParameterValues("InpPolGridChk");
    
	String tDealNo[] = request.getParameterValues("PolGrid1");
	String tCSNM[]  =  request.getParameterValues("PolGrid2");
	String tCTNM[] = request.getParameterValues("PolGrid3");
	String tCITP[] = request.getParameterValues("PolGrid4");
	String tCTID[] = request.getParameterValues("PolGrid5");
	String tCTNT[] = request.getParameterValues("PolGrid6");
	String tHTDT[] = request.getParameterValues("PolGrid7");
	String tDataState[] = request.getParameterValues("PolGrid8");
	String tDealDate[] = request.getParameterValues("PolGrid9");
	String tDealTime[] = request.getParameterValues("PolGrid10");
	String tOperator[] = request.getParameterValues("PolGrid11");
	//System.out.println(request.getParameterValues("PolGrid1"));
     System.out.println("beging ing "); 
	boolean flag = false;
	int tcontCount = tChk.length;	 
    System.out.println(tcontCount);
    
  
    System.out.println("--------------------------------���ȷ��-----��ʼ--------------------------------");
        
	for (int i = 0; i < tcontCount; i++)
	{
        System.out.println("--------------------------------------------------------------------------");
		
         
        LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();
       // TransferData tTransferData = new TransferData();
		if (!tDealNo[i].equals("") && tChk[i].equals("1"))
		{
	    	 tLXIHTradeMainSchema.setDealNo(tDealNo[i]);
	    	 tLXIHTradeMainSchema.setCSNM(tCSNM[i]);
	    	 tLXIHTradeMainSchema.setCTNM(tCTNM[i]);
	    	 tLXIHTradeMainSchema.setCITP(tCITP[i]);
	    	 tLXIHTradeMainSchema.setCTID(tCTID[i]);
	    	 tLXIHTradeMainSchema.setCTNT(tCTNT[i]);
	    	 tLXIHTradeMainSchema.setHTDT(tHTDT[i]);
	    	 tLXIHTradeMainSchema.setDataState(tDataState[i]);
	    	 tLXIHTradeMainSchema.setDealDate(tDealDate[i]);
	    	 tLXIHTradeMainSchema.setDealTime(tDealTime[i]);
	    	 tLXIHTradeMainSchema.setOperator(tOperator[i]);
          
             System.out.println("DataState:"+tDataState[i]);
             tLXIHTradeMainSet.add(tLXIHTradeMainSchema);
            
		     flag = true;
		}
	}
		
	    try{
               System.out.println("flag=="+flag);
				//tVData.add( tTransferData );
				tVData.add(tLXIHTradeMainSet);
				tVData.add(tG); 
				// ���ݴ���
				System.out.println("�Ѿ���������� ");
                
			DDataChkBL	tDDataChkBL   = new DDataChkBL();
                
				if (tDDataChkBL.submitData(tVData,"update") == false)
				{
					int n = tDDataChkBL.mErrors.getErrorCount();
					System.out.println("n=="+n);
					for (int j = 0; j < n; j++)
					System.out.println("Error: "+tDDataChkBL.mErrors.getError(j).errorMessage);
					Content = " ��ʾ��Ϣ: " + tDDataChkBL.mErrors.getError(0).errorMessage;
					FlagStr = "Fail";
				} 

				//�����Catch�з����쳣���򲻴Ӵ���������ȡ������Ϣ
				if (FlagStr == "Fail")
				{
				    tError = tDDataChkBL.mErrors;
				    //tErrors = tDDataChkUI.mErrors;
				    Content = " ��ʾ��Ϣ�� ";
				    if (!tError.needDealError())
				    {                          
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

