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

		  LXISTradeInsuredBL tLXISTradeInsuredUI=new LXISTradeInsuredBL();
	  
		  LXISTradeInsuredSchema tLXISTradeInsuredSchema=new LXISTradeInsuredSchema();
		  tLXISTradeInsuredSchema.setDealNo(request.getParameter("DealNo").trim());
		  tLXISTradeInsuredSchema.setCSNM(request.getParameter("CSNM").trim());

		  tLXISTradeInsuredSchema.setISNM(request.getParameter("ISNM").trim());
		  tLXISTradeInsuredSchema.setRiskCode(request.getParameter("RiskCode").trim());
		  tLXISTradeInsuredSchema.setInsuredNo(request.getParameter("InsuredNo").trim());
		  tLXISTradeInsuredSchema.setISTN(request.getParameter("ISTN").trim());
		  tLXISTradeInsuredSchema.setIITP(request.getParameter("IITP").trim());
		  String iitp=request.getParameter("IITP").trim();
	 	  if (iitp != null && iitp.substring(0, 1).equals("@")) {
	 			tLXISTradeInsuredSchema.setISID(iitp);
	 		} else {
	 			tLXISTradeInsuredSchema.setISID(request.getParameter("ISID").trim());
	 	  }		  
		  tLXISTradeInsuredSchema.setRLTP(request.getParameter("RLTP").trim());
		  
		  System.out.println("======Operate====="+Operate);

		    //zhangyf add 
				     TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
		  if(!Operate.equals("DELETE||CUSTOM"))
		  {
             if(!tTradeInfoCheck.checkInfo(tLXISTradeInsuredSchema)){
         	   FlagStr = "Fail";
             Content = "交易号为" + request.getParameter("DealNo") + tTradeInfoCheck.mErrors.getErrContent();
           }
           //end 
		  }
		  LXISTradeInsuredSchema mLXISTradeInsuredSchema=new LXISTradeInsuredSchema();
		  mLXISTradeInsuredSchema.setDealNo(request.getParameter("DealNo").trim());
		  mLXISTradeInsuredSchema.setCSNM(request.getParameter("CSNM").trim());
		  mLXISTradeInsuredSchema.setRiskCode(request.getParameter("RiskCode").trim());
		  mLXISTradeInsuredSchema.setInsuredNo(request.getParameter("InsuredNo1").trim());
		  	     
	 
		  LXISTradeBnfSet tLXISTradeBnfSet=new LXISTradeBnfSet();
		  LXISTradeBnfSchema tLXISTradeBnfSchema=new LXISTradeBnfSchema();
		 
	
			        String tBnfNo[] = request.getParameterValues("TasksGrid1");

			        String tBNNM[] = request.getParameterValues("TasksGrid2");

			        String tBITP[] = request.getParameterValues("TasksGrid3");

			        String tBNID[] = request.getParameterValues("TasksGrid4");

		    if(tBnfNo!=null){
		       

      		
      		for(int i=0; i<tBnfNo.length; i++){
      		  if(tBnfNo[i] != null && !tBnfNo[i].equals("")){

				      tLXISTradeBnfSchema = new LXISTradeBnfSchema();
				      tLXISTradeBnfSchema.setDealNo(request.getParameter("DealNo").trim());
				      tLXISTradeBnfSchema.setCSNM(request.getParameter("CSNM").trim());
				      tLXISTradeBnfSchema.setRiskCode(request.getParameter("RiskCode").trim());
				      tLXISTradeBnfSchema.setInsuredNo(request.getParameter("InsuredNo").trim());
				         
				      tLXISTradeBnfSchema.setBnfNo(tBnfNo[i]);
				      tLXISTradeBnfSchema.setBNNM(tBNNM[i]);
				      tLXISTradeBnfSchema.setBITP(tBITP[i]);
				      if (tBITP[i] != null && tBITP[i].substring(0, 1).equals("@")) {
	 			         tLXISTradeBnfSchema.setBNID(tBITP[i]);
	 		           } else {
	 			         tLXISTradeBnfSchema.setBNID(tBNID[i]);
	 		          }
				      tLXISTradeBnfSet.add(tLXISTradeBnfSchema);
				      
				   //zhangyf add 
				    // TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
		  if(!Operate.equals("DELETE||CUSTOM"))
		  {
             if(!tTradeInfoCheck.checkInfo(tLXISTradeBnfSchema)){
         	   FlagStr = "Fail";
             Content = "交易号为" + request.getParameter("DealNo") + tTradeInfoCheck.mErrors.getErrContent();
           }
           //end 
			}	      
              }
			}
			}
		  
		   
		
		
	  	  	tVData.add(tGI);
	  	  	tVData.add(tLXISTradeInsuredSchema);
	  	  	tVData.add(tLXISTradeBnfSet);
	  	  	tVData.add(mLXISTradeInsuredSchema);
	  	  	
	  	  	try{ 
	  	  		//zhangyf modify 
	  	  	if (!FlagStr.equals("Fail")){
	  	  		Operate = Operate.substring(0,Operate.indexOf("|"));
	  	  		System.out.println("==================================================Operate:" + Operate);  
	  	  		
	  	  		tLXISTradeInsuredUI.submitData(tVData, Operate);
	  	  		}
	  	  	//end 		  	  	  	  		
		 	}catch(Exception ex){
		    	Content = "保存失败，原因是:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tLXISTradeInsuredUI.mErrors;
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
    	<!--zhangyf modify-->
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>