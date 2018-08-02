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
	String Operate = request.getParameter("oper");
  	VData tVData = new VData();


	if(tGI==null)
	{
		System.out.println("页面失效,请重新登陆");
		FlagStr = "Fail";
		Content = "页面失效,请重新登陆";
	}
  	//页面有效
	else {
		  LXCalModeDescribeBL tLXCalModeDescribeBL=new LXCalModeDescribeBL();	  
		  LXCalModeSchema tLXCalModeSchema = new LXCalModeSchema();
		  LXCalModeSchema hideLXCalModeSchema = new LXCalModeSchema();
         tLXCalModeSchema.setAppId(request.getParameter("CRCD"));
         tLXCalModeSchema.setType("R");
		     tLXCalModeSchema.setURI("local");
		     hideLXCalModeSchema.setAppId(request.getParameter("CRCD"));
		     if(Operate.equals("main")||Operate.equals("deletemain")){
		         tLXCalModeSchema.setCalCode(request.getParameter("CalCode"));
		         tLXCalModeSchema.setCalFactor(request.getParameter("CalFactor"));
		         tLXCalModeSchema.setParameter(request.getParameter("Parameter"));
		         tLXCalModeSchema.setCRCD(request.getParameter("CRCD"));
		         tLXCalModeSchema.setNo("0");
		         tLXCalModeSchema.setReMark(request.getParameter("ReMark"));
		         tLXCalModeSchema.setValidity(request.getParameter("Validity"));	
		         hideLXCalModeSchema.setCalCode(request.getParameter("hideCalCode"));	 
		         System.out.println(request.getParameter("hideCalCode")+"====================");
		         hideLXCalModeSchema.setNo("0");        
		    }else{
		         tLXCalModeSchema.setCalCode(request.getParameter("CalCodeC"));
		         tLXCalModeSchema.setCalFactor(request.getParameter("CalFactorC"));
		         tLXCalModeSchema.setCRCD(request.getParameter("CRCD"));
		         tLXCalModeSchema.setNo(request.getParameter("NoC"));
		         tLXCalModeSchema.setReMark(request.getParameter("ReMarkC"));
		         tLXCalModeSchema.setValidity("1");
		         hideLXCalModeSchema.setCalCode(request.getParameter("hideCalCodeC"));	  
		         hideLXCalModeSchema.setNo(request.getParameter("hideNoC"));	 
				}
	  	tVData.add(tGI);
	  	tVData.add(tLXCalModeSchema);	 
	  	tVData.add(hideLXCalModeSchema);	
	  	try{ 
	  	  	tLXCalModeDescribeBL.submitData(tVData, Operate);
		 	}catch(Exception ex){
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	
		 if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tLXCalModeDescribeBL.mErrors;
		    	if (!tError.needDealError()){
		    		Content = " 保存成功! ";
		    		FlagStr = "Succ";
		    	}else{
		    		Content = " 保存失败，原因是:" + tError.getFirstError();
		    		FlagStr = "Fail";
		    	}
		  	}
}
%>
<html>
<script language="javascript">
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>
</html>