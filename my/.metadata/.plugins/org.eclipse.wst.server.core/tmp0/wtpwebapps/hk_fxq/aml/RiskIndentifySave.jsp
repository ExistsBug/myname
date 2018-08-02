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
		  RiskIndentifyBL tRiskIndentifyBL=new RiskIndentifyBL();	  
		  LDCodeSchema tLDCodeSchema = new LDCodeSchema();
		  LDCodeSchema hideLDCodeSchema = new LDCodeSchema();
		  LDCodeSchema detailLDCodeSchema = new LDCodeSchema();
		  System.out.println(request.getParameter("code")+"=="+request.getParameter("codename")+"=="+request.getParameter("codealias"));
		  System.out.println(request.getParameter("hideCode")+"hidden");
		     tLDCodeSchema.setCode(request.getParameter("code"));
         tLDCodeSchema.setCodeName(request.getParameter("codename"));
         tLDCodeSchema.setCodeAlias(request.getParameter("codealias"));
         detailLDCodeSchema.setCode(request.getParameter("code"));
         detailLDCodeSchema.setCodeName(request.getParameter("codename"));
         detailLDCodeSchema.setCodeAlias(request.getParameter("codealiasD"));
         hideLDCodeSchema.setCode(request.getParameter("hideCode"));
	  	tVData.add(tGI);
	  	tVData.add(tLDCodeSchema);
	  	tVData.add(hideLDCodeSchema);
	  	tVData.add(detailLDCodeSchema);
	  	try{ 
	  	  	tRiskIndentifyBL.submitData(tVData, Operate);
		 	}catch(Exception ex){
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	
		 if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tRiskIndentifyBL.mErrors;
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
	var oper='<%=Operate%>';
	if(oper=="DELETE"){
		parent.fraInterface.afterSubmit1("<%=FlagStr%>","<%=Content%>");
		}else{
			parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=Content%>");
			}
        
</script>
</html>