<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%
//程序名称：UWAutoChk.jsp;KDataChk.jsp;
//程序功能：个人自动核保
//创建日期：2007-07-03 17:10:36
//创建人  ：WHN
//更新记录：  更新人    更新日期     更新原因/内容
%>

<!--用户校验类-->
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.tb.*"%>
  <%@page import="com.sinosoft.lis.qr.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>

<%
  //输出参数
  CErrors tError = null;
  //CErrors tErrors = new CErrors();
  String FlagStr = "Fail";
  String Content = " 大额数据确认成功!";
  LXISTradeMainSet tLXISTradeMainSet = new LXISTradeMainSet();  
 
  
	GlobalInput tG = new GlobalInput();  
	VData tVData = new VData();
  
	tG=(GlobalInput)session.getValue("GI");
  
  	
	
  
  //校验处理
  //内容待填充
  
  	//接收信息
  	// 投保单列表
	
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

    System.out.println("--------------------------------大额确认-----开始--------------------------------");
        
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
		  	
				// 准备传输数据 VData
				System.out.println("开始传输数据");
				
				
				//tVData.add( tTransferData );
				tVData.add(tLXISTradeMainSet);
				tVData.add(tG); 
				// 数据传输
				System.out.println("已经保存好数据 ");
                
			KDataChkBL	tKDataChkBL   = new KDataChkBL();
                
				if (tKDataChkBL.submitData(tVData,"update") == false)
				{
					int n = tKDataChkBL.mErrors.getErrorCount();
					System.out.println("n=="+n);
					for (int j = 0; j < n; j++)
					System.out.println("Error: "+tKDataChkBL.mErrors.getError(j).errorMessage);
					Content = " 提示信息: " + tKDataChkBL.mErrors.getError(0).errorMessage;
					FlagStr = "Fail";
				} 

				//如果在Catch中发现异常，则不从错误类中提取错误信息
				if (FlagStr == "Fail")
				{
				    tError = tKDataChkBL.mErrors;
				    //tErrors = tDDataChkUI.mErrors;
				    Content = " 提示信息： ";
				    if (!tError.needDealError())
				    {                          
				    	//Content = "自动核保成功!";
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
				    	//Content = "自动核保失败!";
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
			Content = Content.trim() +" 提示:异常退出.";
		}
     
	
    System.out.println("--------------------------------大额交易数据确认-----结束--------------------------------");

%>                      
<html>
<script language="javascript">  
  parent.fraInterface.afterAutoChk("<%=FlagStr%>","<%=Content%>");
</script>
</html>

