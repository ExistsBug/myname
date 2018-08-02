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
	VData tVData = new VData(); 
	MMap map=new MMap();
  PubSubmit tPubSubmit = new PubSubmit();

	if(tGI==null)
	{
		System.out.println("页面失效,请重新登陆");
		FlagStr = "Fail";
		Content = "页面失效,请重新登陆";
	}
  	//页面有效
	else {
		  String sRINM="update ldsysvar set sysvarvalue='"+request.getParameter("RINM")+"' where sysvar='amlRINM'";
		  String sRICD="update ldsysvar set sysvarvalue='"+request.getParameter("RICD")+"' where sysvar='amlRICD'";
		  String sFIRC="update ldsysvar set sysvarvalue='"+request.getParameter("FIRC")+"' where sysvar='amlFIRC'";
		  String sFICT="update ldsysvar set sysvarvalue='"+request.getParameter("FICT")+"' where sysvar='amlFICT'";
		  String sFICD="update ldsysvar set sysvarvalue='"+request.getParameter("FICD")+"' where sysvar='amlFICD'";
		  String sCPNM="update ldsysvar set sysvarvalue='"+request.getParameter("CPNM")+"' where sysvar='amlCPNM'";
		  String sCTTL="update ldsysvar set sysvarvalue='"+request.getParameter("CTTL")+"' where sysvar='amlCTTL'";
		  String sFIAR="update ldsysvar set sysvarvalue='"+request.getParameter("FIAR")+"' where sysvar='amlFIAR'";
		  String sFCEI="update ldsysvar set sysvarvalue='"+request.getParameter("FCEI")+"' where sysvar='amlFCEI'";
		  
		  map.put(sRINM,"UPDATE");
		  map.put(sRICD,"UPDATE");
		  map.put(sFIRC,"UPDATE");
		  map.put(sFICT,"UPDATE");
		  map.put(sFICD,"UPDATE");
		  map.put(sCPNM,"UPDATE");
		  map.put(sCTTL,"UPDATE");
		  map.put(sFIAR,"UPDATE");
		  map.put(sFCEI,"UPDATE");
		  
	  	tVData.add(map);
	  	try{ 
	  	  	tPubSubmit.submitData(tVData, "");
		 	}catch(Exception ex){
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	
		 if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tPubSubmit.mErrors;
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