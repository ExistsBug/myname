<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@ page import="com.sinosoft.workflow.aml.*" %>
<%@page import="com.sinosoft.lis.db.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%
    String FlagStr = "Succ";
    String Content = "";
    String mOperate = "";
    CErrors tErrors = new CErrors();
    VData sVData = new VData();
    String dealno=request.getParameter("dealno");
    String datastate=request.getParameter("datastate");
    String oper=request.getParameter("oper");
    GlobalInput tG = new GlobalInput();
    tG=(GlobalInput)session.getValue("GI");
    
    String reason=request.getParameter("reason");
        
    TransferData tTransferData = new TransferData();
//    tTransferData.setNameAndValue("DealNo", dealno);    
    tTransferData.setNameAndValue("DataState1", datastate);
    tTransferData.setNameAndValue("Oper", oper);
    if (oper == null || oper.trim().equals(""))
    {
        tTransferData.setNameAndValue("DataState", "");
    }
    else if (oper.trim().equalsIgnoreCase("upgrade"))
    {
        tTransferData.setNameAndValue("DataState", "00");
    }
    else if (oper.trim().equalsIgnoreCase("affirm"))
    {
        tTransferData.setNameAndValue("DataState", "01");
    }
    else if (oper.trim().equalsIgnoreCase("keep"))
    {
        tTransferData.setNameAndValue("DataState", "09");
    }
    else if (oper.trim().equalsIgnoreCase("back"))
    {
        tTransferData.setNameAndValue("DataState", "back");
    }
//    sVData.add(tG);
//    sVData.add(tTransferData);

    TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
    
    String arrGridChk[] = request.getParameterValues("InpWaitForBeFileGridChk");
    String arrGridNo[]  = request.getParameterValues("WaitForBeFileGrid1");
    int n = arrGridChk.length;
    for (int i = 0; i < n; i++)
    {
        if (arrGridChk[i].equals("1"))
        {
        	String tDealNo = arrGridNo[i];
        	System.out.println("===== tDealNo ====="+tDealNo);
        	System.out.println("====+ oper in refer+===="+oper.trim());
        	if(!oper.trim().equalsIgnoreCase("keep"))
        	{
        		  System.out.println("====START CHECK IN REFER===");
			        //增加对字段内容格式的校验 modify by huangchong
			        if (!tTradeInfoCheck.checkInfo(tDealNo))
			        {  
			            FlagStr = "Fail";
			            Content ="交易号"+ tDealNo;
			            
			            tErrors.copyAllErrors(tTradeInfoCheck.getErrors());
			            System.out.println("=========错误信息为"+Content+"===========");
			            break;
			        }
					
        	}
        	
					LXISTradeMainDB tLXISTradeMainDB=new LXISTradeMainDB();
					tLXISTradeMainDB.setDealNo(tDealNo);
					if(!tLXISTradeMainDB.getInfo())
					{
					    FlagStr = "Fail";
					    break;
					}
					sVData.clear();
					tTransferData.removeByName("DealNo");
					tTransferData.setNameAndValue("DealNo", tDealNo);    
			    sVData.add(tG);
			    sVData.add(tTransferData);
				sVData.add(tLXISTradeMainDB.getSchema());	
					
				if(oper.trim().equalsIgnoreCase("keep")||oper.trim().equalsIgnoreCase("back"))
				{
			    LXCancelreportSchema tLXCancelreportSchema = new LXCancelreportSchema();
			    tLXCancelreportSchema.setDealNo(tDealNo);
			    tLXCancelreportSchema.setCSNM(tLXISTradeMainDB.getSchema().getCSNM());
			    tLXCancelreportSchema.setCTNM(tLXISTradeMainDB.getSchema().getCTNM());
			    tLXCancelreportSchema.setHTDT(tLXISTradeMainDB.getSchema().getDealDate());
			    tLXCancelreportSchema.setMANAGECOM(tG.ManageCom);
			    tLXCancelreportSchema.setOPERATOR(tG.Operator);
			    if(oper.trim().equalsIgnoreCase("keep"))
			    {
			    	tLXCancelreportSchema.setDataType("01");
			    }
			    else
			    {
			    	tLXCancelreportSchema.setDataType("02");
			    }
			    tLXCancelreportSchema.setreason(reason);
			    tLXCancelreportSchema.setTradeType("IS");
			 //   LXCancelreportDB tLXCancelreportDB = new LXCancelreportDB();
			//    tLXCancelreportDB.setDealNo(tDealNo);
			//    tLXCancelreportDB.setCSNM(tLXIHTradeMainDB.getSchema().getCSNM());
			//    tLXCancelreportDB.setCTNM(tLXIHTradeMainDB.getSchema().getCTNM());
			//    tLXCancelreportDB.setHTDT(tLXIHTradeMainDB.getSchema().getHTDT());
			//    tLXCancelreportDB.setreason(reason);
			    VData tVData = new VData(); 
			//    tVData.add(tG);
			    
			    tVData.add(tLXCancelreportSchema);
			//    tVData.add(tLXCancelreportDB.getSchema());
			    
			    LXCancelreportBL tLXCancelreportBL = new LXCancelreportBL();
			    mOperate = "INSERT";
	  	  	    if (!tLXCancelreportBL.submitData(tVData, mOperate))
                 {
                 	tErrors.copyAllErrors(tLXCancelreportBL.getErrors());
			       break;
                 }
                 //tLXCancelreportBL = null;
				}					
					
					if(!oper.trim().equalsIgnoreCase("back"))
					{
				    AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
				    if (!tAMLWorkFlowUI.submitData(sVData, "0000009201"))
				    {
				        tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
				        break;
				    }
				    tAMLWorkFlowUI = null;
					}
 
        }
    }
    System.out.println("===== FlagStr ====="+FlagStr);

          //页面反馈信息
    if (!tErrors.needDealError())
    {
        FlagStr = "Success";
        Content = "保存成功！";
    }
    else
    {
        FlagStr = "Fail";
        Content = "保存失败，原因是："+ Content + tErrors.getFirstError();
    }
    tErrors = null;
%>
<html>
    <script language="javascript">
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>');
</script>
</html>