<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<%
/*******************************************************************************
 * <p>Title: Lis 6.0</p>
 * <p>Description: �п���ϴǮϵͳ</p>
 * <p>Copyright: Copyright (c) 2005 Sinosoft, Co.,Ltd. All Rights Reserved</p>
 * <p>Company: �п���Ƽ��ɷ����޹�˾</p>
 * <p>WebSite: http://www.sinosoft.com.cn</p>
 ******************************************************************************/
%>

<%@ include file="../common/jsp/UsrCheck.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="com.sinosoft.lis.aml.*" %>
<%@ page import="com.sinosoft.lis.pubfun.*" %>
<%@ page import="com.sinosoft.lis.schema.*" %>
<%@ page import="com.sinosoft.lis.vschema.*" %>
<%@ page import="com.sinosoft.utility.*" %>


<%
    //�������ݱ���
    VData tVData = new VData();
		TransferData tTransferData = new TransferData();
		
    GlobalInput tGlobalInput = new GlobalInput();
    tGlobalInput = (GlobalInput)session.getValue("GI");
    tVData.add(tGlobalInput);
    
    String oper = request.getParameter("oper");
		if("update".equals(oper))
		{
				
        //String tChk[] = request.getParameterValues("InpCustmoerGridChk");
        String Ptype[]  = request.getParameterValues("CustmoerGrid1");
        String Pcode[]  = request.getParameterValues("CustmoerGrid3");
        String Pscore[] = request.getParameterValues("CustmoerGrid5");
        tTransferData.setNameAndValue("Ptype", Ptype);
        tTransferData.setNameAndValue("Pcode", Pcode);
        tTransferData.setNameAndValue("Pscore", Pscore);
        //if(tChk[i].equals("1")){}
		}
		if("cancelH".equals(oper))
		{
				
        //String tChk[] = request.getParameterValues("InpCustmoerGridChk");
        String Ptype[]  = request.getParameterValues("HCustmoerGrid1");
        String Pcode[]  = request.getParameterValues("HCustmoerGrid3");
        String Pscore[] = request.getParameterValues("HCustmoerGrid5");
        tTransferData.setNameAndValue("Ptype", Ptype);
        tTransferData.setNameAndValue("Pcode", Pcode);
        tTransferData.setNameAndValue("Pscore", Pscore);
        //if(tChk[i].equals("1")){}
		}
		if("cancelL".equals(oper))
		{
				
        //String tChk[] = request.getParameterValues("InpCustmoerGridChk");
        String Ptype[]  = request.getParameterValues("LCustmoerGrid1");
        String Pcode[]  = request.getParameterValues("LCustmoerGrid3");
        String Pscore[] = request.getParameterValues("LCustmoerGrid5");
        tTransferData.setNameAndValue("Ptype", Ptype);
        tTransferData.setNameAndValue("Pcode", Pcode);
        tTransferData.setNameAndValue("Pscore", Pscore);
        //if(tChk[i].equals("1")){}
		}
		if("Export".equals(oper))
		{
			tTransferData.setNameAndValue("SQL", request.getParameter("SQL"));
			tTransferData.setNameAndValue("COL", request.getParameter("COL"));
			tTransferData.setNameAndValue("SQLCHECK", request.getParameter("SQLCHECK"));
			System.out.println("SQL=="+request.getParameterValues("SQL"));
			System.out.println("COL=="+request.getParameterValues("COL"));
			System.out.println("SQLCHECK=="+request.getParameterValues("SQLCHECK"));
		}
    tTransferData.setNameAndValue("oper", oper);

    tVData.add(tTransferData);



    //��̨������
    String FlagStr = new String("");
    String Content = new String("");
    CErrors tErrors = new CErrors();

    //���ú�̨����

	  LXCustomerEvaluateUI tLXCustomerEvaluateUI = new LXCustomerEvaluateUI();
	  if (!tLXCustomerEvaluateUI.submitData(tVData, oper))
	  {
	      tErrors.copyAllErrors(tLXCustomerEvaluateUI.getErrors());
	  }
	  if("Export".equals(oper))
	  {
						response.reset();
						response.setContentType("application/msexcel");   
						//response.setContentType("application/octet-stream"); 
						response.setHeader("Content-disposition","attachment;filename="+new String("�ͻ����յȼ�".getBytes("gb2312"), "iso8859-1")+".xls"); 
						OutputStream ops = response.getOutputStream();
						tLXCustomerEvaluateUI.getHSSFWorkbook().write(ops);
						ops.flush();
						ops.close();
	  }
	  tLXCustomerEvaluateUI = null;
	  tVData = null;

    //ҳ�淴����Ϣ
    if (!tErrors.needDealError())
    {
        FlagStr = "Success";
        if("sync".equals(oper))
        {
        		Content = "ͬ���ɹ���";
        }
        else
        {
        		Content = "����ɹ���";
        }
    }
    else
    {
        FlagStr = "Fail";
        Content = "����ʧ�ܣ�ԭ���ǣ�" + tErrors.getFirstError();
    }
    tErrors = null;
%>


<html>
    <script language="JavaScript">
        try
        {
            parent.fraInterface.afterSubmit('<%=FlagStr%>', '<%=Content%>');
        }
        catch (ex)
        {
            alert('<%=Content%>');
        }
    </script>
</html>
