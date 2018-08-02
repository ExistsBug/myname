<%//程序名称：NetReSpreadSave.jsp
			//程序功能：
			//创建日期： 
			//创建人  ： liuyy
			//更新记录：  更新人    更新日期     更新原因/内容%>
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
	 	tGI = (GlobalInput) session.getValue("GI");
	 	String Operate = request.getParameter("hideOperate");
	 	VData tVData = new VData();

	 	if (tGI == null) {
	 		System.out.println("页面失效,请重新登陆");
	 		FlagStr = "Fail";
	 		Content = "页面失效,请重新登陆";
	 	}
	 	//页面有效
	 	else {
	 		System.out.println("1111111111111");
	 		// zhangyf add  
	 		 TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
	 		 //end 
	 		//客户处理
	 		LXISTradeMainUI tLXISTradeMainUI = new LXISTradeMainUI();
	 		//客户基本信息
	 		LXISTradeMainSchema tLXISTradeMainSchema = new LXISTradeMainSchema();
	 		tLXISTradeMainSchema.setDealNo(request.getParameter("DealNo"));
	 		tLXISTradeMainSchema.setSTCR(request.getParameter("STCR"));
	 		tLXISTradeMainSchema.setSDGR(request.getParameter("SDGR"));
	 		tLXISTradeMainSchema.setTKMS(request.getParameter("TKMS"));
	 		tLXISTradeMainSchema.setSSDS(request.getParameter("SSDS"));
	 		tLXISTradeMainSchema.setCSNM(request.getParameter("CSNM"));
	 		tLXISTradeMainSchema.setCTNM(request.getParameter("CTNM"));
	 		tLXISTradeMainSchema.setCITP(request.getParameter("CITP"));
	 		String citp = request.getParameter("CITP");
	 		System.out.println(citp+"========");
	 		if (citp != null && citp.substring(0, 1).equals("@")) {
	 			tLXISTradeMainSchema.setCTID(request.getParameter("CITP"));
	 		} else {
	 			tLXISTradeMainSchema.setCTID(request.getParameter("CTID"));
	 		}
	 		tLXISTradeMainSchema.setCTTP(request.getParameter("CTTP"));
	 		tLXISTradeMainSchema.setCCTL(request.getParameter("CCTL"));
	 		tLXISTradeMainSchema.setCTAR(request.getParameter("CTAR"));
	 		tLXISTradeMainSchema.setCCEI(request.getParameter("CCEI"));
	 		tLXISTradeMainSchema.setCTVC(request.getParameter("CTVC"));
	 		tLXISTradeMainSchema.setTRCD(request.getParameter("TRCD"));
	 		tLXISTradeMainSchema.setCRNM(request.getParameter("CRNM"));
	 		tLXISTradeMainSchema.setCRIT(request.getParameter("CRIT"));
	 		String crit = request.getParameter("CRIT");
	 		System.out.println(crit+"========");
	 		if (crit != null && crit.substring(0, 1).equals("@")) {
	 			tLXISTradeMainSchema.setCRID(request.getParameter("CRIT"));
	 		} else {
	 			tLXISTradeMainSchema.setCRID(request.getParameter("CRID"));
	 		}
	 		String tDataState = request.getParameter("DataState");
	 		if (tDataState == null || "".equals(tDataState)) {
	 			tLXISTradeMainSchema.setDataState(" ");
	 		} else {
	 			tLXISTradeMainSchema.setDataState(tDataState);
	 		}
	 		tLXISTradeMainSchema.setDealDate(request
	 		.getParameter("DealDate"));
	 		tLXISTradeMainSchema.setRPNM(request.getParameter("RPNM"));
	 		tLXISTradeMainSchema.setDealDate(request
	 		.getParameter("DealDate"));
	 		tLXISTradeMainSchema.setDealTime(request
	 		.getParameter("DealTime"));
     
	 		//客户股东信息
	 		
	 		LXISTradeCusPartnerSchema tLXISTradeCusPartnerSchema = new LXISTradeCusPartnerSchema();
	 		LXISTradeCusPartnerSet tLXISTradeCusPartnerSet = new LXISTradeCusPartnerSet();
	 		int mulcount = 0;
	 		String tHDNM[] = request.getParameterValues("StockGrid1");
	 		String tHITP[] = request.getParameterValues("StockGrid2");
	 		String tHDID[] = request.getParameterValues("StockGrid3");
	 		String tHDVC[] = request.getParameterValues("StockGrid4");
	 		String tHDRT[] = request.getParameterValues("StockGrid5");
	 		String tHEIF[] = request.getParameterValues("StockGrid6");
	 		if (tHDNM != null) {
	 			mulcount = tHDNM.length;
	 		}
	 		for (int i = 0; i < mulcount; i++) {
	 			if (tHDNM[i] != null && !tHDNM[i].equals("")) {
	 		tLXISTradeCusPartnerSchema = new LXISTradeCusPartnerSchema();
	 		tLXISTradeCusPartnerSchema.setDealNo(request
	 				.getParameter("DealNo"));
	 		tLXISTradeCusPartnerSchema.setHDKey(String
	 				.valueOf(i + 1));
	 		tLXISTradeCusPartnerSchema.setHDNM(tHDNM[i]);
	 		tLXISTradeCusPartnerSchema.setHITP(tHITP[i]);
	 		if (tHITP[i] != null && tHITP[i].substring(0, 1).equals("@")) {
	 			tLXISTradeCusPartnerSchema.setHDID(tHITP[i]);
	 		} else {
	 			tLXISTradeCusPartnerSchema.setHDID(tHDID[i]);
	 		}
	 		tLXISTradeCusPartnerSchema.setHDVC(tHDVC[i]);
	 		tLXISTradeCusPartnerSchema.setHDRT(tHDRT[i]);
	 		tLXISTradeCusPartnerSchema.setHEIF(tHEIF[i]);
	 		//zhangyf add 
	 		 if(!tTradeInfoCheck.checkInfo(tLXISTradeCusPartnerSchema)){
        	 
    	    FlagStr = "Fail";
          Content = "交易号为" + request.getParameter("DealNo") + tTradeInfoCheck.mErrors.getErrContent();
         
         }
         //end 
	 		tLXISTradeCusPartnerSet.add(tLXISTradeCusPartnerSchema);
	 			}
	 		}
	 		
   	   //zhangyf add 
		   		   
         if(!tTradeInfoCheck.checkInfo(tLXISTradeMainSchema)){
    	    FlagStr = "Fail";
          Content = "交易号为" + request.getParameter("DealNo") + tTradeInfoCheck.mErrors.getErrContent();
         
                  }
		  //end

	 		tVData.add(tGI);
	 		tVData.add(tLXISTradeMainSchema);
	 		tVData.add(tLXISTradeCusPartnerSet);

	 		try {
	 		//zhangyf modify  
	  	  	if (!FlagStr.equals("Fail")){
	 			tLXISTradeMainUI.submitData(tVData, Operate);
	 			}
	 		//end 
	 		} catch (Exception ex) {
	 			Content = "保存失败，原因是:" + ex.toString();
	 			FlagStr = "Fail";
	 		}
	 		if (!FlagStr.equals("Fail")) {
	 			tError = tLXISTradeMainUI.mErrors;
	 			if (!tError.needDealError()) {
	 		Content = " 保存成功! ";
	 		FlagStr = "Succ";
	 			} else {
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