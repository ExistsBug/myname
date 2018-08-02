<%@page contentType="text/html;charset=gb2312" %>
<%@page import="com.sinosoft.utility.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.sinosoft.lis.pubfun.*"%>
<%@page import="com.sinosoft.workflow.aml.*" %>
<%@page import="com.sinosoft.lis.db.*"%>
<%@page import="com.sinosoft.lis.schema.*"%>
<%@page import="com.sinosoft.lis.vschema.*"%>
<%@page import="com.sinosoft.lis.aml.*"%>
<%
    String FlagStr = "Succ";
    String Content = "";
    String tOperate = "";
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
        tTransferData.setNameAndValue("DataState", "");//
        tTransferData.setNameAndValue("CheckState", "");//add by jinsh 2009-11-19
    }
    else if (oper.trim().equalsIgnoreCase("upgrade"))//提交上级审核
    {
        tTransferData.setNameAndValue("DataState", "00");
        tTransferData.setNameAndValue("CheckState", "00");//add by jinsh 2009-11-19
    }
    else if (oper.trim().equalsIgnoreCase("affirm"))//确定上报
    {
        tTransferData.setNameAndValue("DataState", "Z11");
        tTransferData.setNameAndValue("CheckState", "Z11");//add by jinsh 2009-11-19
    }
    else if (oper.trim().equalsIgnoreCase("keep"))//放弃上报
    {
        //tTransferData.setNameAndValue("DataState", "09");
        tTransferData.setNameAndValue("DataState", "Z11");
        tTransferData.setNameAndValue("CheckState", "09");//add by jinsh 2009-11-19
    }
  
    String arrGridChk[] = request.getParameterValues("InpWaitForBeFileGridChk");
    String arrGridNo[]  = request.getParameterValues("WaitForBeFileGrid1");
    int n = arrGridChk.length;
    for (int i = 0; i < n; i++)
    {
        if (arrGridChk[i].equals("1"))
        {
        	String tDealNo = arrGridNo[i];      	
        	System.out.println("===== tDealNo ====="+tDealNo);
        	        	
        	if(!oper.trim().equalsIgnoreCase("keep"))
        	{
					    //zhangyf add begin 
					    TradeInfoCheck tTradeInfoCheck = new TradeInfoCheck(); 
					    if (!tTradeInfoCheck.checkInfoIH(tDealNo))
					    {  
					        FlagStr = "Fail";
			            Content ="交易号"+ tDealNo;
			            
			            tErrors.copyAllErrors(tTradeInfoCheck.getErrors());
					        //Content = "交易号为" + tDealNo + tTradeInfoCheck.mErrors.getErrContent();
					        break;
					    } 

        	}
 
        	
				tTransferData.removeByName("DealNo");
				tTransferData.setNameAndValue("DealNo", tDealNo); 
			    tOperate = "0000009111";
			    sVData.clear();
			    sVData.add(tG);
			    sVData.add(tTransferData);
			    LXIHTradeMainDB tLXIHTradeMainDB=new LXIHTradeMainDB();
			    tLXIHTradeMainDB.setDealNo(tDealNo);
			    if(!tLXIHTradeMainDB.getInfo())
			    {
			        FlagStr = "Fail";
			        break;
			    }
			    sVData.add(tLXIHTradeMainDB.getSchema());

			    if(oper.trim().equalsIgnoreCase("keep"))
			    {
				LXCancelreportSchema tLXCancelreportSchema = new LXCancelreportSchema();
			    tLXCancelreportSchema.setDealNo(tDealNo);
			    tLXCancelreportSchema.setCSNM(tLXIHTradeMainDB.getSchema().getCSNM());
			    tLXCancelreportSchema.setCTNM(tLXIHTradeMainDB.getSchema().getCTNM());
			    tLXCancelreportSchema.setHTDT(tLXIHTradeMainDB.getSchema().getHTDT());
			    tLXCancelreportSchema.setMANAGECOM(tG.ManageCom);
			    tLXCancelreportSchema.setOPERATOR(tG.Operator);
			    tLXCancelreportSchema.setreason(reason);
			    tLXCancelreportSchema.setTradeType("IH");
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
			    if (!tAMLWorkFlowUI.submitData(sVData, tOperate))
			    {
			        tErrors.copyAllErrors(tAMLWorkFlowUI.getErrors());
			        break;
			    }
			    tAMLWorkFlowUI = null;
        }
    }        

          //页面反馈信息
    if (!tErrors.needDealError()&&FlagStr.equals("Succ"))
    {
        FlagStr = "Success";
        Content = "保存成功！";
    }
    else
    {
        FlagStr = "Fail";
        Content = "保存失败，原因是：" + Content + tErrors.getFirstError();
        System.out.println("===== Content ====="+Content);
    }
    tErrors = null;

%>
<html>
    <script language="javascript">
    parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content.replaceAll("%", " ")%>');
</script>
</html>