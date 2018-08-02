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
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.db.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
	 
<%
	// 输出参数
	CErrors tError = null;
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
	  	  	LXISTradeDetailUI tLXISTradeDetailUI = new LXISTradeDetailUI();			
			try{
	  	  	//可疑交易明细信息
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
          Content = "交易号为" + request.getParameter("DealNo") + tTradeInfoCheck.mErrors.getErrContent();
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
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	if (!FlagStr.equals("Fail")){
		    	tError = tLXISTradeDetailUI.mErrors;
		    	if (!tError.needDealError()){
		    		Content = " 保存成功! ";
		    		FlagStr = "Succ";
		    	}else{
		    		Content = " 保存失败，原因是:" + tError.getFirstError();
		    		FlagStr = "Fail";
		    	}
		  	}
	}// end of session if 

  //添加各种预处理
   System.out.println(Content);
//页面有效区

%>
<html>
<script language="javascript">
	<!--zhangyf modify-->
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>