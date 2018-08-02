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
		     String AppID=request.getParameter("AppId");         
         String hideAppID=request.getParameter("hideAppId");
         if(hideAppID==null||hideAppID.equals("")){
         hideAppID=AppID;
         }
         tLXCalModeSchema.setAppId(AppID);
		     hideLXCalModeSchema.setAppId(hideAppID);
		     if(Operate.equals("main")||Operate.equals("deletemain")){
		         tLXCalModeSchema.setType(request.getParameter("Type"));
		         tLXCalModeSchema.setURI(request.getParameter("URI"));
		         tLXCalModeSchema.setCalCode(request.getParameter("CalCode"));
		         tLXCalModeSchema.setCalFactor(request.getParameter("CalFactor"));
		         tLXCalModeSchema.setParameter(request.getParameter("Parameter"));
		         tLXCalModeSchema.setCRCD(request.getParameter("CRCD"));
		         tLXCalModeSchema.setTableName(request.getParameter("TableName"));
		         tLXCalModeSchema.setNo("0");
		         tLXCalModeSchema.setReMark(request.getParameter("ReMark"));
		         tLXCalModeSchema.setValidity(request.getParameter("Validity"));	
		         String hideCalCode=request.getParameter("hideCalCode");
		         if(hideCalCode==null||hideCalCode.equals("")){
		         hideCalCode=request.getParameter("CalCode");
		         }
		         hideLXCalModeSchema.setCalCode(hideCalCode);	 
		         System.out.println(hideCalCode+"====================");
		         hideLXCalModeSchema.setNo("0");        
		    }else{
		    	   tLXCalModeSchema.setType(request.getParameter("TypeC"));
		         tLXCalModeSchema.setURI(request.getParameter("URIC"));
		         tLXCalModeSchema.setCalCode(request.getParameter("CalCode"));
		         tLXCalModeSchema.setCalFactor(request.getParameter("CalFactorC"));
		         tLXCalModeSchema.setCRCD(request.getParameter("CRCD"));
		         tLXCalModeSchema.setNo(request.getParameter("NoC"));
		         tLXCalModeSchema.setTableName(request.getParameter("TableNameC"));
		         tLXCalModeSchema.setReMark(request.getParameter("ReMarkC"));
		         tLXCalModeSchema.setParameter(request.getParameter("ParameterC"));
		         tLXCalModeSchema.setValidity(request.getParameter("ValidityC"));
		         hideLXCalModeSchema.setCalCode(request.getParameter("CalCode"));	  
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
	      var oper=  '<%=Operate%>';
	      if(oper==  "deletemain"){
	      	parent.fraInterface.afterSubmit1("<%=FlagStr%>","<%=Content%>"); 
	      	}else
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
</script>
</html>