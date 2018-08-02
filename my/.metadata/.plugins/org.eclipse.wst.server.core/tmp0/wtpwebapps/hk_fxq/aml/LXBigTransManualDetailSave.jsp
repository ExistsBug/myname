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
			System.out.println("======================================" + Operate);
	  	  	LXAMLBigTransDetailUI tLXAMLBigTransDetailUI = new LXAMLBigTransDetailUI();
	  	  	//大额交易主表信息
	  	  	LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();
			tLXIHTradeMainSchema.setDealNo(request.getParameter("DealNo"));
			tLXIHTradeMainSchema.setCSNM(request.getParameter("CustomerNo"));
			//tLXIHTradeMainSchema.setCSNM("111");
			tLXIHTradeMainSchema.setHTDT(request.getParameter("cDate"));
            tLXIHTradeMainSchema.setDataState("S00");			
			
	  	  	//大额交易明细信息
			LXIHTradeDetailSchema tLXIHTradeDetailSchema = new LXIHTradeDetailSchema();
			LXIHTradeDetailSchema pLXIHTradeDetailSchema = new LXIHTradeDetailSchema();
			//zhangyf modify 
			// 原来 tLXIHTradeDetailSchema.setDealNo(request.getParameter("DealNo"));
			String dealno=request.getParameter("DealNo");
			tLXIHTradeDetailSchema.setDealNo(dealno);
			//end 
			System.out.println("------------" + tLXIHTradeDetailSchema.getDealNo());
			tLXIHTradeDetailSchema.setCRCD(request.getParameter("CRCD"));
			tLXIHTradeDetailSchema.setTSDT(request.getParameter("TSDT"));
			tLXIHTradeDetailSchema.setFINN(request.getParameter("FINN"));
			tLXIHTradeDetailSchema.setFIRC(request.getParameter("FIRC"));
			tLXIHTradeDetailSchema.setRLTP(request.getParameter("RLTP"));
			tLXIHTradeDetailSchema.setFICT(request.getParameter("FICT"));
			tLXIHTradeDetailSchema.setFINC(request.getParameter("FINC"));
			tLXIHTradeDetailSchema.setCATP(request.getParameter("CATP"));
			tLXIHTradeDetailSchema.setCTAC(request.getParameter("CTAC"));
			tLXIHTradeDetailSchema.setTBNM(request.getParameter("TBNM"));
			tLXIHTradeDetailSchema.setTBIT(request.getParameter("TBIT"));
			tLXIHTradeDetailSchema.setTBID(request.getParameter("TBID"));
			tLXIHTradeDetailSchema.setTBNT(request.getParameter("TBNT"));
			tLXIHTradeDetailSchema.setTSTM(request.getParameter("TSTM"));
			tLXIHTradeDetailSchema.setTICD(request.getParameter("TICD"));
			tLXIHTradeDetailSchema.setTSTP(request.getParameter("TSTP"));
			tLXIHTradeDetailSchema.setTSCT(request.getParameter("TSCT"));
			tLXIHTradeDetailSchema.setTSDR(request.getParameter("TSDR"));
			tLXIHTradeDetailSchema.setTDRC(request.getParameter("TDRC"));
			String tTRCD = request.getParameter("TRCD");
			if (tTRCD == null || "".equals(tTRCD))
				tTRCD = "@N";
			tLXIHTradeDetailSchema.setTRCD(tTRCD);
			tLXIHTradeDetailSchema.setCRPP(request.getParameter("CRPP"));
			tLXIHTradeDetailSchema.setCRTP(request.getParameter("CRTP"));
			tLXIHTradeDetailSchema.setCRAT(request.getParameter("CRAT"));
			tLXIHTradeDetailSchema.setCFIN(request.getParameter("CFIN"));
			tLXIHTradeDetailSchema.setCFCT(request.getParameter("CFCT"));
			tLXIHTradeDetailSchema.setCFIC(request.getParameter("CFIC"));
			tLXIHTradeDetailSchema.setTCNM(request.getParameter("TCNM"));
			tLXIHTradeDetailSchema.setTCIT(request.getParameter("TCIT"));
			tLXIHTradeDetailSchema.setTCID(request.getParameter("TCID"));
			tLXIHTradeDetailSchema.setTCAT(request.getParameter("TCAT"));
			tLXIHTradeDetailSchema.setTCAC(request.getParameter("TCAC"));
			tLXIHTradeDetailSchema.setDataSource(request.getParameter("DataSource"));
			//原明细
			pLXIHTradeDetailSchema.setDealNo(request.getParameter("DealNo"));
			pLXIHTradeDetailSchema.setCRCD(request.getParameter("CRCD1"));
			pLXIHTradeDetailSchema.setTICD(request.getParameter("TICD"));
			String tTSDT = request.getParameter("TSDT1");	
			if (tTSDT == null || "".equals(tTSDT) || "null".equals(tTSDT))
				pLXIHTradeDetailSchema.setTSDT(0);
			else 
				pLXIHTradeDetailSchema.setTSDT(Integer.parseInt(tTSDT));
			
			//zhangyf add begin
			 TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
	         if(!tTradeInfoCheck.checkInfo(tLXIHTradeDetailSchema)){
	    	  FlagStr = "Fail";
	         Content = "交易号为" + dealno + tTradeInfoCheck.mErrors.getErrContent();
	         }
			//end
			
			tVData.add(tGI); 	  	  									   
	  	  	tVData.add(tLXIHTradeDetailSchema);
	  	  	tVData.add(tLXIHTradeMainSchema);
	  	  	tVData.add(pLXIHTradeDetailSchema);
	  	  	try{ 
	  	  		Operate = Operate.substring(0,Operate.indexOf("|"));
	  	  		
	  	  			//zhangyf modify  
	  	  	if (!FlagStr.equals("Fail")){
	 				tLXAMLBigTransDetailUI.submitData(tVData, Operate);
	 			  }
	 		         //end 
	  	  	
		 	}catch(Exception ex){
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	if (!FlagStr.equals("Fail")){
		    	tError = tLXAMLBigTransDetailUI.mErrors;
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
	<!--zhangyf modify 给content增加结束符-->
       parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>