<%
//�������ƣ�LXISTradeManualMainSave.jsp
//�����ܣ�
//�������ڣ�
//������  �� 
//���¼�¼��  ������    ��������     ����ԭ��/����
%>
<%@page contentType="text/html;charset=GBK" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>

<!--�û�У����-->
  <%@page import="java.lang.*"%>
  <%@page import="java.util.*"%>
  <%@page import="com.sinosoft.utility.*"%>
  <%@page import="com.sinosoft.lis.schema.*"%>
  <%@page import="com.sinosoft.lis.db.*"%>
  <%@page import="com.sinosoft.lis.vschema.*"%>
  <%@page import="com.sinosoft.lis.pubfun.*"%>
  <%@page import="com.sinosoft.lis.aml.*"%>
  <%@page import="com.sinosoft.workflow.aml.*"%>

<%
    // �������
    CErrors tError = null;
    String FlagStr = "";
    String Content = "";
    ExeSQL mExeSQL = new ExeSQL();
    //�������
    GlobalInput tGI = new GlobalInput();
    tGI=(GlobalInput)session.getValue("GI");
    String Operate = request.getParameter("hideOperate");
    String strSQL = new String();

    String cDealNo = new String(request.getParameter("hideDealNo"));
    VData tVData = new VData();
    LXISTradeMainDelBL tLXISTradeMainDelBL = new LXISTradeMainDelBL();
    tVData.add(tGI);
    tVData.add(cDealNo);


    if(tGI==null)
    {
        System.out.println("ҳ��ʧЧ,�����µ�½");
        FlagStr = "Fail";
        Content = "ҳ��ʧЧ,�����µ�½";
    }
    //ҳ����Ч
    else 
    {
        System.out.println("========= In LXISTradeManualMainSave.jsp ========== =Operate=" + Operate);
        try
        {
            GlobalInput tGlobalInput = new GlobalInput();
            tGlobalInput = (GlobalInput)session.getValue("GI");
            AMLWorkFlowUI tAMLWorkFlowUI=new AMLWorkFlowUI();
            TransferData tTransferData = new TransferData();
            
            tTransferData.setNameAndValue("DealNo",cDealNo);
            tTransferData.setNameAndValue("DataState","D1");
            
            LXISTradeMainSchema tLXISTradeMainSchema=new LXISTradeMainSchema();
            LXISTradeMainSet tLXISTradeMainSet=new LXISTradeMainSet();
            LXISTradeMainDB tLXISTradeMainDB=new LXISTradeMainDB();
            tLXISTradeMainDB.setDealNo(cDealNo);
            tLXISTradeMainSet=tLXISTradeMainDB.query();
            tLXISTradeMainSchema=tLXISTradeMainSet.get(1);
           //zhangyf add begin  LXISTradeMain  LXISTradeCusPartner  LXISTradeDetail  LXISTradeInsured LXISTradeCont LXISTradeBnf
           TradeInfoCheck tTradeInfoCheck=new TradeInfoCheck();
           LXISTradeBnfDB tLXISTradeBnfDB = new LXISTradeBnfDB();
   		  LXISTradeContDB tLXISTradeContDB = new LXISTradeContDB();
   		  LXISTradeCusPartnerDB tLXISTradeCusPartnerDB = new LXISTradeCusPartnerDB();
   		  LXISTradeDetailDB tLXISTradeDetailDB = new LXISTradeDetailDB();
   		  LXISTradeInsuredDB tLXISTradeInsuredDB = new LXISTradeInsuredDB();
   		
   		 tLXISTradeBnfDB.setDealNo(cDealNo);
   		 tLXISTradeContDB.setDealNo(cDealNo);
   		 tLXISTradeCusPartnerDB.setDealNo(cDealNo);
   		 tLXISTradeDetailDB.setDealNo(cDealNo);
   		 tLXISTradeInsuredDB.setDealNo(cDealNo);
   		 tLXISTradeMainDB.setDealNo(cDealNo);
   		
   		LXISTradeBnfSet tLXISTradeBnfSet = tLXISTradeBnfDB.query();
   		LXISTradeContSet tLXISTradeContSet =  tLXISTradeContDB.query();
   		LXISTradeCusPartnerSet tLXISTradeCusPartnerSet = tLXISTradeCusPartnerDB.query();
   		LXISTradeDetailSet tLXISTradeDetailSet = tLXISTradeDetailDB.query();
   		LXISTradeInsuredSet tLXISTradeInsuredSet = tLXISTradeInsuredDB.query();
           
           
           
             tLXISTradeMainSet.add(tLXISTradeMainSchema);
		      if (!tTradeInfoCheck.checkInfo(tLXISTradeMainSchema)) 
		      {
		          FlagStr = "Fail";
		          Content = "[��������Ϣ]���׺�Ϊ" + cDealNo + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      
	
		      if (!tTradeInfoCheck.checkInfo(tLXISTradeBnfSet))
		      {
		          FlagStr = "Fail";
		          Content = "[������������Ϣ]���׺�Ϊ" + cDealNo + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      
		      if (!tTradeInfoCheck.checkInfo(tLXISTradeContSet))
		      {
		          FlagStr = "Fail";
		          Content = "[���׺�ͬ��Ϣ]���׺�Ϊ" + cDealNo + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      
		      if (!tTradeInfoCheck.checkInfo(tLXISTradeCusPartnerSet))
		      {
		          FlagStr = "Fail";
		          Content = "[���׹ɶ���Ϣ]���׺�Ϊ" + cDealNo + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      
		      if (!tTradeInfoCheck.checkInfo(tLXISTradeDetailSet))
		      {
		          FlagStr = "Fail";
		          Content = "[������ϸ��Ϣ]���׺�Ϊ" + cDealNo + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      
		      if (!tTradeInfoCheck.checkInfo(tLXISTradeInsuredSet))
		      {
		          FlagStr = "Fail";
		          Content = "[���ױ�������Ϣ]���׺�Ϊ" + cDealNo + tTradeInfoCheck.mErrors.getErrContent();
		      }
		      // add by jinsh 20110225 
					if (tLXISTradeMainSet != null && tLXISTradeMainSet.size() > 0)
					{
						for (int k = 1; k <= tLXISTradeMainSet.size(); k++)
						{
							if(tLXISTradeMainSet.get(k).getCTTP()!=null&&tLXISTradeMainSet.get(k).getCTTP().equals("07"))
							{
								if((tLXISTradeMainSet.get(k).getCRNM()!=null&&(!tLXISTradeMainSet.get(k).getCRNM().equals("@N")))
										||(tLXISTradeMainSet.get(k).getCRIT()!=null&&(!tLXISTradeMainSet.get(k).getCRIT().equals("@N")))
										||(tLXISTradeMainSet.get(k).getCRID()!=null&&(!tLXISTradeMainSet.get(k).getCRID().equals("@N"))))
								{
									
									FlagStr = "Fail";
									Content += "���˿ͻ���������Ϣ����д@N !";
								}
								for(int m = 1;m<=tLXISTradeCusPartnerSet.size();m++)
								{
									if((tLXISTradeCusPartnerSet.get(m).getHDNM()!=null&&tLXISTradeCusPartnerSet.get(m).getHDNM().equals("@I"))
											||(tLXISTradeCusPartnerSet.get(m).getHITP()!=null&&tLXISTradeCusPartnerSet.get(m).getHITP().equals("@I"))
											||(tLXISTradeCusPartnerSet.get(m).getHDID()!=null&&tLXISTradeCusPartnerSet.get(m).getHDID().equals("@I"))
											||(tLXISTradeCusPartnerSet.get(m).getHDVC()!=null&&tLXISTradeCusPartnerSet.get(m).getHDVC().equals("@I"))
											||(tLXISTradeCusPartnerSet.get(m).getHDRT()!=null&&tLXISTradeCusPartnerSet.get(m).getHDRT().equals("@I"))
											||(tLXISTradeCusPartnerSet.get(m).getHEIF()!=null&&tLXISTradeCusPartnerSet.get(m).getHEIF().equals("@I")))
									{
										FlagStr = "Fail";
										Content += "���˿ͻ��ɶ�֤������ֻ����д@N !";
									}
								}
							}
							else
							{
								if((tLXISTradeMainSet.get(k).getCRNM()!=null&&(tLXISTradeMainSet.get(k).getCRNM().equals("@N")))
										||(tLXISTradeMainSet.get(k).getCRIT()!=null&&(tLXISTradeMainSet.get(k).getCRIT().equals("@N")))
										||(tLXISTradeMainSet.get(k).getCRID()!=null&&(tLXISTradeMainSet.get(k).getCRID().equals("@N"))))
								{
									
									FlagStr = "Fail";
									Content += "�Ǹ��˿ͻ���������Ϣ�벻Ҫ��д@N !";
								}
							}
						}
					}
					
					if (tLXISTradeDetailSet != null && tLXISTradeDetailSet.size() > 0)
					{
						for (int k = 1; k <= tLXISTradeDetailSet.size(); k++)
						{
							if(tLXISTradeDetailSet.get(k).getCSTP()!=null&&tLXISTradeDetailSet.get(k).getCSTP().equals("02"))
							{
								if((tLXISTradeDetailSet.get(k).getCAOI()!=null&&tLXISTradeDetailSet.get(k).getCAOI().equals("@N"))
										||(tLXISTradeDetailSet.get(k).getTCAN()!=null&&tLXISTradeDetailSet.get(k).getTCAN().equals("@N")))
								{
									FlagStr = "Fail";
									Content += "���ʽ������ʽΪת��ʱ�ʽ��˻������к�����ת���ʽ��˺Ų�����д�����!";
								}
							}
							else
							{
								if((tLXISTradeDetailSet.get(k).getCAOI()!=null&&tLXISTradeDetailSet.get(k).getCAOI().equals("@N"))
										||(tLXISTradeDetailSet.get(k).getTCAN()!=null&&tLXISTradeDetailSet.get(k).getTCAN().equals("@N")))
								{
									if(!tLXISTradeDetailSet.get(k).getCAOI().equals(tLXISTradeDetailSet.get(k).getTCAN()))
									{
										FlagStr = "Fail";
										Content += "�ʽ��˻������к�����ת���ʽ��˺������һ��Ϊ�����,���鶼��@N�����!";
									}
			
								}
							}
							if((tLXISTradeDetailSet.get(k).getCAOI()!=null&&(tLXISTradeDetailSet.get(k).getCAOI().indexOf(" ")!=-1))
									||(tLXISTradeDetailSet.get(k).getTCAN()!=null&&(tLXISTradeDetailSet.get(k).getTCAN().indexOf(" ")!=-1)))
							{
								FlagStr = "Fail";
								Content += "�ʽ��˻������к�����ת���ʽ��˺Ų����пո�!";
							}
						}
					}
			
					if (tLXISTradeBnfSet != null && tLXISTradeBnfSet.size() > 0)
					{
						for (int k = 1; k <= tLXISTradeBnfSet.size(); k++)
						{
							if ((tLXISTradeBnfSet.get(k).getBnfNo() != null && tLXISTradeBnfSet.get(k).getBnfNo().equals("@N"))
									||(tLXISTradeBnfSet.get(k).getBNNM() != null && tLXISTradeBnfSet.get(k).getBNNM().equals("@N"))
									||(tLXISTradeBnfSet.get(k).getBITP() != null && tLXISTradeBnfSet.get(k).getBITP().equals("@N"))
									||(tLXISTradeBnfSet.get(k).getBNID() != null && tLXISTradeBnfSet.get(k).getBNID().equals("@N")))
							{
								FlagStr = "Fail";
								Content += "�����˵���Ϣ���û�н�����д@I";
							}
						}
					}
		   		// add by jinsh 20110225 over
            //end 
            tVData.add(tLXISTradeMainSchema);
            tVData.add(tTransferData);
            tVData.add(tGlobalInput);
            
          
            OtherInfoCheck tOtherInfoCheck=new OtherInfoCheck();
              VData checkVData=new VData();
              checkVData.add(tLXISTradeMainSchema);
              checkVData.add(tLXISTradeBnfSet);
              checkVData.add(tLXISTradeContSet);
              checkVData.add(tLXISTradeCusPartnerSet);
              checkVData.add(tLXISTradeDetailSet);
              checkVData.add(tLXISTradeInsuredSet);
            if(!tOtherInfoCheck.submitISData(checkVData)){
            	FlagStr = "Fail";
		          Content = "���׺�Ϊ" + cDealNo + tOtherInfoCheck.mErrors.getErrContent();
            }
              //zhangyf modify     
        if (!FlagStr.equals("Fail"))
        {
	 		if (!tAMLWorkFlowUI.submitData(tVData, "0000009211"))
            {
               tError.copyAllErrors(tAMLWorkFlowUI.getErrors());
            }
            mExeSQL.execUpdateSQL("update LWMission set ActivityID = '0000009225' where 1 = 1 and MissionProp3 = '"+cDealNo+"'");
										       
	 		tLXISTradeMainDelBL.submitData(tVData, Operate);
	 	}
	 	    //end 
        
        }
        catch(Exception ex)
        {
            Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
            FlagStr = "Fail";
        }
        if (!FlagStr.equals("Fail"))
        {
            tError = tLXISTradeMainDelBL.mErrors;
            if (!tError.needDealError())
            {
                Content = " ����ɹ�! ";
                FlagStr = "Succ";
            }
            else
            {
                Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
                FlagStr = "Fail";
            }
        }
    }

  //��Ӹ���Ԥ����
   System.out.println(Content);
//ҳ����Ч��

%>
<html>
<script language="javascript">
<!--zhangyf modify ��content���ӽ�����-->
        parent.fraInterface.afterSubmit("<%=FlagStr%>","<%=(Content.replaceAll("\"","'")).replaceAll("\n","")%>");
</script>
</html>