<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
  
<%
//程序名称：UWAutoChk.jsp;DDataChk.jsp;
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

  <%@page import="com.sinosoft.lis.pubfun.*"%>

<%
  //输出参数
  CErrors tError = null;
  //CErrors tErrors = new CErrors();
  String FlagStr = "Fail";
  String Content = " 大额数据确认成功!";
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
    
  
    System.out.println("--------------------------------大额确认-----开始--------------------------------");
        
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
				// 数据传输
				System.out.println("已经保存好数据 ");
                
			DDataChkBL	tDDataChkBL   = new DDataChkBL();
                
				if (tDDataChkBL.submitData(tVData,"update") == false)
				{
					int n = tDDataChkBL.mErrors.getErrorCount();
					System.out.println("n=="+n);
					for (int j = 0; j < n; j++)
					System.out.println("Error: "+tDDataChkBL.mErrors.getError(j).errorMessage);
					Content = " 提示信息: " + tDDataChkBL.mErrors.getError(0).errorMessage;
					FlagStr = "Fail";
				} 

				//如果在Catch中发现异常，则不从错误类中提取错误信息
				if (FlagStr == "Fail")
				{
				    tError = tDDataChkBL.mErrors;
				    //tErrors = tDDataChkUI.mErrors;
				    Content = " 提示信息： ";
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

