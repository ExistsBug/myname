<%
//�������ƣ�NetReSpreadSave.jsp
//�����ܣ�
//�������ڣ� 
//������  �� liuyy
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
	 
<%
	// �������
	CErrors tError = null;
	String FlagStr = "";
	String Content = "";
  
	//�������
	GlobalInput tGI = new GlobalInput();
	tGI=(GlobalInput)session.getValue("GI");
	String Operate = request.getParameter("oper");
  	VData tVData = new VData();


	if(tGI==null)
	{
		System.out.println("ҳ��ʧЧ,�����µ�½");
		FlagStr = "Fail";
		Content = "ҳ��ʧЧ,�����µ�½";
	}
  	//ҳ����Ч
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
		    	Content = "����ʧ�ܣ�ԭ����:" + ex.toString();
		    	FlagStr = "Fail";
		  	}
		  	
		 if (!FlagStr.equals("Fail")){
		  	 
		    	tError = tLXCalModeDescribeBL.mErrors;
		    	if (!tError.needDealError()){
		    		Content = " ����ɹ�! ";
		    		FlagStr = "Succ";
		    	}else{
		    		Content = " ����ʧ�ܣ�ԭ����:" + tError.getFirstError();
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