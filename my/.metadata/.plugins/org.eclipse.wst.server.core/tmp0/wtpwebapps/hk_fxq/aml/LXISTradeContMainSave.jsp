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
		if (Operate.toUpperCase().indexOf("CUSTOM") > 0){
		  LXISTradeContUI tLXISTradeContUI=new LXISTradeContUI();
		  
		  LXISTradeContSchema tLXISTradeContSchema=new LXISTradeContSchema();
		  tLXISTradeContSchema.setDealNo(request.getParameter("DealNo").trim());
		  tLXISTradeContSchema.setCSNM(request.getParameter("CSNM").trim());
		  tLXISTradeContSchema.setISTP(request.getParameter("ISTP").trim());
		  tLXISTradeContSchema.setISNM(request.getParameter("ISNM").trim());
		  tLXISTradeContSchema.setRiskCode(request.getParameter("RiskCode").trim());
		  tLXISTradeContSchema.setISPS(request.getParameter("ISPS").trim());
//		  tLXISTradeContSchema.setITNM(request.getParameter("ITNM").trim());
		  tLXISTradeContSchema.setISOG(request.getParameter("ISOG").trim());
		  tLXISTradeContSchema.setISAT(request.getParameter("ISAT").trim());
		  tLXISTradeContSchema.setISFE(request.getParameter("ISFE").trim());
		  tLXISTradeContSchema.setISPT(request.getParameter("ISPT").trim());
		  tLXISTradeContSchema.setCTES(request.getParameter("CTES").trim());
		  
		 LXISTradeContSchema mLXISTradeContSchema=new LXISTradeContSchema();
		 mLXISTradeContSchema.setDealNo(request.getParameter("DealNo").trim());
		  mLXISTradeContSchema.setCSNM(request.getParameter("CSNM1").trim());
		   mLXISTradeContSchema.setRiskCode(request.getParameter("RiskCode1").trim());
		  
		   //zhangyf add 
		   	 TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
         if(!tTradeInfoCheck.checkInfo(tLXISTradeContSchema)){
        	     	  FlagStr = "Fail";
          Content = "交易号为" + request.getParameter("DealNo") + tTradeInfoCheck.mErrors.getErrContent();
                  }
		   		  //end
		
	  	  	tVData.add(tGI);
	  	  	tVData.add(tLXISTradeContSchema);
	  	  	tVData.add(mLXISTradeContSchema);
	  	  	
	  	  	try{ 
	  	  	
	  	  		//zhangyf modify 
	  	  	if (!FlagStr.equals("Fail")){
	  	  		Operate = Operate.substring(0,Operate.indexOf("|"));
	  	  		System.out.println("==================================================Operate:" + Operate);  	  	  		
	  	  		tLXISTradeContUI.submitData(tVData, Operate);
	  	  		}
	  	  		  		//end 	  			
		 	}catch(Exception ex){
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tLXISTradeContUI.mErrors;
		    	if (!tError.needDealError()){
		    		Content = " 保存成功! ";
		    		FlagStr = "Succ";
		    	}else{
		    		Content = " 保存失败，原因是:" + tError.getFirstError();
		    		FlagStr = "Fail";
		    	}
		  	}
		} // end of custom if 
	}// end of session if 

  //添加各种预处理
   System.out.println(Content);
//页面有效区

%>
<html>
<script language="javascript">
     	<!--zhangyf modify -->
	parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>