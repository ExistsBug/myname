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
	String Operate = request.getParameter("operate");
	System.out.println("operate : "+ Operate);
  	VData tVData = new VData();


	if(tGI==null)
	{
		System.out.println("页面失效,请重新登陆");
		FlagStr = "Fail";
		Content = "页面失效,请重新登陆";
	}
  	//页面有效
	else {
		if (Operate != null && !Operate.equals("")){
				LXIHTradeBL tLXIHTradeBL = new LXIHTradeBL();
		LXIHTradeMainSchema tLXIHTradeMainSchema = new LXIHTradeMainSchema();
		tLXIHTradeMainSchema.setDealNo(request.getParameter("DealNo1").trim());
		tLXIHTradeMainSchema.setCSNM(request.getParameter("CSNM").trim());
		tLXIHTradeMainSchema.setCTNM(request.getParameter("CTNM").trim());
		tLXIHTradeMainSchema.setCITP(request.getParameter("CITP").trim());
		String citp = request.getParameter("CITP").trim();
	 	if (citp != null && citp.substring(0, 1).equals("@")) {
	 		tLXIHTradeMainSchema.setCTID(request.getParameter("CITP").trim());
	 	} else {
	 		tLXIHTradeMainSchema.setCTID(request.getParameter("CTID").trim());
	 	}
		tLXIHTradeMainSchema.setCTNT(request.getParameter("CTNT").trim());
		tLXIHTradeMainSchema.setHTDT(request.getParameter("HTDT").trim());
		tLXIHTradeMainSchema.setDataState(request.getParameter("DataState").trim());
		tLXIHTradeMainSchema.setDealDate(request.getParameter("DealDate").trim());
		tLXIHTradeMainSchema.setDealTime(request.getParameter("DealTime").trim());
		tLXIHTradeMainSchema.setOperator(request.getParameter("Operator").trim());
		tVData.add(tGI);
		tVData.add(tLXIHTradeMainSchema);	
	  	  	try{ 
	  	  		tLXIHTradeBL.submitData(tVData, Operate);
		 	}catch(Exception ex){
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tLXIHTradeBL.mErrors;
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
        parent.fraInterface.afterSubmit1("<%=FlagStr%>","<%=Content%>");
</script>
</html>