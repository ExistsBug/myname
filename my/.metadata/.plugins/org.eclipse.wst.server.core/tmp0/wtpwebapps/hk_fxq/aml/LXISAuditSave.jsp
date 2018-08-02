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
        tTransferData.setNameAndValue("CheckState", "");//add by jinsh 2009-11-19
    }
    else if (oper.trim().equalsIgnoreCase("upgrade"))
    {
        tTransferData.setNameAndValue("DataState", "00");
        tTransferData.setNameAndValue("CheckState", "");//add by jinsh 2009-11-19
    }
    else if (oper.trim().equalsIgnoreCase("affirm"))
    {
        tTransferData.setNameAndValue("DataState", "Z21");
        tTransferData.setNameAndValue("CheckState", "Z21");//add by jinsh 2009-11-19
    }
    else if (oper.trim().equalsIgnoreCase("keep"))
    {
        //tTransferData.setNameAndValue("DataState", "09");
        tTransferData.setNameAndValue("DataState", "Z21");
        tTransferData.setNameAndValue("CheckState", "09");//add by jinsh 2009-11-19
    }
    
    TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
    
    String arrGridChk[] = request.getParameterValues("InpWaitForBeFileGridChk");
    String arrGridNo[]  = request.getParameterValues("WaitForBeFileGrid1");
    int n = arrGridChk.length;
    for (int i = 0; i < n; i++)
    {
      if (arrGridChk[i].equals("1"))
      {
      	System.out.println("====+ oper +===="+oper.trim());
      	if(!oper.trim().equalsIgnoreCase("keep"))
      	{//放弃上报不做检验
		        //增加对字段内容格式的校验 modify by huangchong
		        System.out.println("====START CHECK ===");
		        if (!tTradeInfoCheck.checkInfo(arrGridNo[i]))
		        {  
		            FlagStr = "Fail";
		            Content = "交易号为" + arrGridNo[i];
		            tErrors.copyAllErrors(tTradeInfoCheck.getErrors());
		            System.out.println("=========错误信息为"+Content+"===========");
		            break;
		        }
	
      	}

      	String tDealNo = arrGridNo[i];
      	System.out.println("===== tDealNo ====="+tDealNo);
				LXISTradeMainDB tLXISTradeMainDB=new LXISTradeMainDB();
				tLXISTradeMainDB.setDealNo(tDealNo);
				if(!tLXISTradeMainDB.getInfo())
				{
				    FlagStr = "Fail";
				    break;
				}
				sVData.clear();
		    sVData.add(tG);
		    sVData.add(tTransferData);
		    sVData.add(tLXISTradeMainDB.getSchema());
		    
		    if(oper.trim().equalsIgnoreCase("keep"))
		    {
		      	LXCancelreportSchema tLXCancelreportSchema = new LXCancelreportSchema();
			    tLXCancelreportSchema.setDealNo(tDealNo);
			    tLXCancelreportSchema.setCSNM(tLXISTradeMainDB.getSchema().getCSNM());
			    tLXCancelreportSchema.setCTNM(tLXISTradeMainDB.getSchema().getCTNM());
			    tLXCancelreportSchema.setHTDT(tLXISTradeMainDB.getSchema().getDealDate());
			    tLXCancelreportSchema.setMANAGECOM(tG.ManageCom);
			    tLXCancelreportSchema.setOPERATOR(tG.Operator);
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
				
			
				
		    AMLWorkFlowUI tAMLWorkFlowUI = new AMLWorkFlowUI();
		    if (!tAMLWorkFlowUI.submitData(sVData, "0000009211"))
		    {
		        tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
		        break;
		    }
		    tAMLWorkFlowUI = null;  
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
        Content = "保存失败，原因是："+ Content  + tErrors.getFirstError();
    }
    tErrors = null;
%>
<html>
    <script language="javascript">
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>');
</script>
</html>