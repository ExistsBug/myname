<%
//程序名称：NetReSpreadSave.jsp
//程序功能：
//创建日期： 
//创建人  ： liuyy
//更新记录：  更新人    更新日期     更新原因/内容
%>
<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>

<!--用户校验类-->
<%@page import="com.sinosoft.utility.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.db.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%@page import="com.sinosoft.workflow.aml.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
	 
<%
       System.out.println("11111111111111");
	// 输出参数
	CErrors tErrors = new CErrors();
	String FlagStr = "";
	String Content = "";
  
	//输入参数
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
	String Operate = request.getParameter("hideOperate");
  	VData tVData = new VData();


	if(tGI==null)
	{
		System.out.println("页面失效,请重新登陆");
		FlagStr = "Fail";
		Content = "页面失效,请重新登陆";
	}
  	//页面有效
	else {
		if (Operate.equalsIgnoreCase("Save")){
	  		//主表处理
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
          Content = "交易号为" + sDealNo + tTradeInfoCheck.mErrors.getErrContent();
         
         }
    //end 
			
			
	  	  	tVData.add(tGI);
	  	  	tVData.add(tLXIHTradeMainSchema);
	  	  	System.out.println("数据保存完毕");
	  	  	
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
				Content = "保存失败，原因是:" + ex.toString();
				FlagStr = "Fail";
			}
			if (!FlagStr.equals("Fail")){
				tErrors = tLXAMLCustomerUI.mErrors;
				if (!tErrors.needDealError()){
					Content = " 保存成功! ";
					FlagStr = "Succ";
				}else{
					Content = " 保存失败，原因是:" + tErrors.getFirstError();
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
    		Content = " 保存失败，原因是:没有明细信息";
    	}
    		
    	
    	
    		LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();
    		LXIHTradeMainDB tLXIHTradeMainDB = new LXIHTradeMainDB();
		  	tLXIHTradeMainDB.setDealNo(sDealNo);
	    	if (!tLXIHTradeMainDB.getInfo()){
	    
				Content = " 保存失败，原因是:" + tLXIHTradeMainDB.mErrors.getFirstError();
				
				FlagStr = "Fail";
				
	    	}
	    	
	    		OtherInfoCheck tOtherInfoCheck=new OtherInfoCheck();
              VData checkVData=new VData(); 
              checkVData.add(tLXIHTradeMainDB.getSchema());
              checkVData.add(tLXIHTradeDetailSet);
        if(!tOtherInfoCheck.submitIHData(checkVData)){
            	FlagStr = "Fail";
		          Content = "交易号为" + sDealNo + tOtherInfoCheck.mErrors.getErrContent();
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

		    
				//垃圾处理
				tGI = null;
				tTransferData = null;
				
    			//调用后台处理
    			AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
    			if (!tAMLWorkFlowUI.submitData(tVData, "0000009102"))
    			{
       				tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
    			}
    			tAMLWorkFlowUI = null;
    			tVData = null;

				//更新数据状态
				ExeSQL tExeSQL = new ExeSQL();
				
				
				tExeSQL.execUpdateSQL("update lxihtrademain set datastate = 'S00' where dealno = '" + sDealNo + "'");
	
    			//页面反馈信息
    			if (!tErrors.needDealError())
   	 			{
        			FlagStr = "Success";
        			Content = "保存成功！";
    			}
    			else
    			{
        			FlagStr = "Fail";
        			Content = "保存失败，原因是：" + tErrors.getFirstError();
    			}
    			tErrors = null;		
			}
		}
	}

  //添加各种预处理
   System.out.println(Content);
//页面有效区

%>
<html>
<script language="javascript">
	<!--zhangyf modify 给content增加结束符-->
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>